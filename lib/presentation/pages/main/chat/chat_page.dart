import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart' as ui;
import 'package:mint/bloc/chat/chat_bloc.dart';
import 'package:mint/domain/entity/specialist_model/specialist_model.dart';
import 'package:mint/injector/injector.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/chat/widgets/chat_app_bar.dart';
import 'package:mint/presentation/pages/main/chat/widgets/chat_attach_bottom_sheet.dart';
import 'package:mint/presentation/pages/main/chat/widgets/chat_bottom_bar.dart';
import 'package:mint/presentation/pages/main/chat/widgets/message_bubble.dart';
import 'package:mint/presentation/pages/main/chat/widgets/mint_chat_theme.dart';
import 'package:mint/presentation/widgets/error_try_again_text.dart';
import 'package:mint/utils/chat_utils.dart';

@RoutePage()
class ChatPage extends StatelessWidget {
  const ChatPage({
    super.key,
    required this.specialistModel,
    required this.room,
  });

  final SpecialistModel specialistModel;
  final types.Room room;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ChatBloc>()..add(ChatInitializeRequested(room)),
      child: _ChatView(specialistModel: specialistModel, room: room),
    );
  }
}

class _ChatView extends StatefulWidget {
  const _ChatView({required this.specialistModel, required this.room});

  final SpecialistModel specialistModel;
  final types.Room room;

  @override
  State<_ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<_ChatView> {
  final _messageController = TextEditingController();

  var _tapPosition = Offset.zero;
  final _emojiEnlargementBehavior = ui.EmojiEnlargementBehavior.single;
  final _hideBackgroundOnEmojiMessages = true;

  late final _user = widget.room.users.firstWhere(
    (e) => e.id != widget.specialistModel.id,
  );

  void _previewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    return context
        .read<ChatBloc>()
        .add(ChatPreviewDataFetched(message, previewData));
  }

  void _handleSendPressed() {
    final message = types.PartialText(text: _messageController.text.trim());
    context.read<ChatBloc>().add(ChatSendMessageRequested(message));
    _messageController.clear();
  }

  void _handleAttachmentPressed() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => ChatAttachBottomSheet(
        onImageAttach: _handleImageSelection,
        onFileAttach: _handleFileSelection,
      ),
    );
  }

  Future<void> _handleFileSelection() async {
    return context.read<ChatBloc>().add(ChatFilePickRequested());
  }

  Future<void> _handleImageSelection() async {
    return context.read<ChatBloc>().add(ChatImagePickRequested());
  }

  /// Used to handle file open attached to [message] with [types.FileMessage]
  /// type
  void _handleMessageTap(BuildContext _, types.Message message) {
    if (message is types.FileMessage) {
      return context.read<ChatBloc>().add(ChatFileLoadRequested(message));
    }
  }

  /// Shows pop-up menu on [_tapPosition] with 'Edit' and 'Delete' actions
  void _showMessageActionsMenu(BuildContext context, types.Message message) {
    return ChatUtils.showMessageActionsMenu(
      context,
      message,
      _tapPosition,
      onEdit: context.router.pop,
      onDelete: (message) {
        context.read<ChatBloc>().add(ChatDeleteMessageRequested(message));
        context.router.pop();
      },
    );
  }

  /// Stores [details] tap position in [_tapPosition] for further use by message
  /// actions pop-up menu
  void _storeTapPosition(TapDownDetails details) {
    _tapPosition = details.globalPosition;
  }

  void _refreshChat() {
    context.read<ChatBloc>().add(ChatInitializeRequested(widget.room));
  }

  Widget _bubbleBuilder(
    Widget child, {
    required types.Message message,
    required bool nextMessageInGroup,
  }) {
    final isLast = !nextMessageInGroup;
    final isSender = message.author.id == _user.id;
    final enlargeEmojis =
        _emojiEnlargementBehavior != ui.EmojiEnlargementBehavior.never &&
            message is types.TextMessage &&
            ui.isConsistsOfEmojis(_emojiEnlargementBehavior, message);

    return MessageBubble(
      isLast: isLast,
      message: message,
      isSender: isSender,
      enlargeEmojis: enlargeEmojis,
      hideBackgroundOnEmojiMessages: _hideBackgroundOnEmojiMessages,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatAppBar(specialistModel: widget.specialistModel),
      body: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          if (state is ChatLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ChatInitializeFailure) {
            return ErrorTryAgainText(onRefresh: _refreshChat);
          }
          if (state is ChatFetchMessagesSuccess) {
            return GestureDetector(
              onTapDown: _storeTapPosition,
              child: ui.Chat(
                bubbleBuilder: _bubbleBuilder,
                customBottomWidget: ChatBottomBar(
                  controller: _messageController,
                  onSend: _handleSendPressed,
                  onAttach: _handleAttachmentPressed,
                  onAudio: () {
                    // TODO(wuffeel): implement audio attachment
                  },
                ),
                dateLocale: context.l10n.localeName,
                dateHeaderBuilder: (_) => const SizedBox.shrink(),
                emojiEnlargementBehavior: _emojiEnlargementBehavior,
                hideBackgroundOnEmojiMessages: _hideBackgroundOnEmojiMessages,
                messages: state.messages,
                onMessageTap: _handleMessageTap,
                onMessageLongPress: _showMessageActionsMenu,
                onPreviewDataFetched: _previewDataFetched,
                onSendPressed: (_) {
                  // TODO(wuffel): implemented in customBottomWidget
                },
                theme: MintChatTheme(context),
                textMessageOptions: const ui.TextMessageOptions(
                  isTextSelectable: false,
                ),
                user: _user,
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
