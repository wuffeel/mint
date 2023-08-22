import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart' as ui;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/bloc/audio_record/audio_record_bloc.dart';
import 'package:mint/bloc/chat/chat_bloc.dart';
import 'package:mint/domain/entity/specialist_model/specialist_model.dart';
import 'package:mint/injector/injector.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/chat/widgets/chat_app_bar.dart';
import 'package:mint/presentation/pages/main/chat/widgets/chat_attach_bottom_sheet.dart';
import 'package:mint/presentation/pages/main/chat/widgets/chat_audio_message.dart';
import 'package:mint/presentation/pages/main/chat/widgets/chat_bottom_bar.dart';
import 'package:mint/presentation/pages/main/chat/widgets/chat_date_header.dart';
import 'package:mint/presentation/pages/main/chat/widgets/chat_emoji_picker.dart';
import 'package:mint/presentation/pages/main/chat/widgets/message_bubble.dart';
import 'package:mint/presentation/pages/main/chat/widgets/mint_chat_theme.dart';
import 'package:mint/presentation/pages/main/chat/widgets/permission_denied_dialog.dart';
import 'package:mint/presentation/widgets/error_try_again_text.dart';
import 'package:mint/utils/chat_utils.dart';

@RoutePage()
class ChatPage extends StatelessWidget {
  const ChatPage({
    super.key,
    required this.room,
    required this.specialistModel,
  });

  final types.Room room;
  final SpecialistModel specialistModel;

  void _showPermissionDeniedDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => const PermissionDeniedDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<ChatBloc>()..add(ChatInitializeRequested(room)),
        ),
        BlocProvider(create: (context) => getIt<AudioRecordBloc>()),
      ],
      child: BlocListener<ChatBloc, ChatState>(
        listener: (context, state) {
          if (state is ChatFilePickPermissionDenied) {
            _showPermissionDeniedDialog(context);
          }
        },
        child: _ChatView(specialistModel: specialistModel, room: room),
      ),
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
  var _emojiPanelHidden = true;
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
    final shouldOpen = message is types.FileMessage;
    if (message is types.FileMessage || message is types.AudioMessage) {
      return context.read<ChatBloc>().add(
            ChatFileLoadRequested(
              message,
              shouldOpen: shouldOpen,
            ),
          );
    }
  }

  /// Shows pop-up menu on [_tapPosition] with 'Edit' and 'Delete' actions
  void _showMessageActionsMenu(BuildContext context, types.Message message) {
    return ChatUtils.showMessageActionsMenu(
      context,
      message,
      _tapPosition,
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

  void _onEmojiBackspace() {
    _messageController
      ..text = _messageController.text.characters.toString()
      ..selection = TextSelection.fromPosition(
        TextPosition(offset: _messageController.text.length),
      );
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
  void dispose() {
    super.dispose();
    _messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: _emojiPanelHidden,
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
            return Column(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTapDown: _storeTapPosition,
                    child: ui.Chat(
                      audioMessageBuilder: (
                        audio, {
                        required int messageWidth,
                      }) {
                        return Padding(
                          padding: EdgeInsets.all(8.w),
                          child: ChatAudioMessage(
                            audioMessage: audio,
                            isSender: _user.id == audio.author.id,
                          ),
                        );
                      },
                      bubbleBuilder: _bubbleBuilder,
                      customBottomWidget: ChatBottomBar(
                        controller: _messageController,
                        onSend: _handleSendPressed,
                        onEmoji: () {
                          setState(() {
                            _emojiPanelHidden = !_emojiPanelHidden;
                          });
                          // Removes keyboard if it is shown
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        onAttach: _handleAttachmentPressed,
                        onAudioStop: (audioMessage) {
                          context
                              .read<ChatBloc>()
                              .add(ChatSaveAudioRequested(audioMessage));
                        },
                        isEmojiSelected: !_emojiPanelHidden,
                        onTextFieldTap: () => setState(
                          () => _emojiPanelHidden = true,
                        ),
                      ),
                      dateLocale: context.l10n.localeName,
                      dateHeaderBuilder: (date) {
                        return ChatDateHeader(
                          date: date.dateTime,
                          text: date.text,
                        );
                      },
                      // 24 hours
                      dateHeaderThreshold: 86400000,
                      emojiEnlargementBehavior: _emojiEnlargementBehavior,
                      hideBackgroundOnEmojiMessages:
                          _hideBackgroundOnEmojiMessages,
                      messages: state.messages,
                      onBackgroundTap: () {
                        if (!_emojiPanelHidden) {
                          setState(
                            () => _emojiPanelHidden = true,
                          );
                        }
                      },
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
                  ),
                ),
                if (!_emojiPanelHidden)
                  SizedBox(
                    height: 300.h,
                    child: ChatEmojiPicker(
                      controller: _messageController,
                      onBackSpace: _onEmojiBackspace,
                    ),
                  ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
