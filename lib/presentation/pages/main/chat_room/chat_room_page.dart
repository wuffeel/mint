import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart' as ui;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/injector/injector.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/chat_room/widgets/chat_app_bar.dart';
import 'package:mint/presentation/pages/main/chat_room/widgets/chat_attach_bottom_sheet.dart';
import 'package:mint/presentation/pages/main/chat_room/widgets/chat_audio_message.dart';
import 'package:mint/presentation/pages/main/chat_room/widgets/chat_bottom_bar.dart';
import 'package:mint/presentation/pages/main/chat_room/widgets/chat_date_header.dart';
import 'package:mint/presentation/pages/main/chat_room/widgets/chat_emoji_picker.dart';
import 'package:mint/presentation/pages/main/chat_room/widgets/message_bubble.dart';
import 'package:mint/presentation/pages/main/chat_room/widgets/mint_chat_theme.dart';
import 'package:mint/presentation/pages/main/chat_room/widgets/permission_denied_dialog.dart';
import 'package:mint/presentation/widgets/error_try_again_text.dart';
import 'package:mint_core/mint_bloc.dart';
import 'package:mint_core/mint_core.dart';
import 'package:mint_core/mint_utils.dart';

import '../../../../bloc/audio_record/audio_record_bloc.dart';
import '../../../../bloc/permission/permission_bloc.dart';
import '../../../../theme/mint_text_styles.dart';

@RoutePage()
class ChatRoomPage extends StatelessWidget {
  const ChatRoomPage({
    super.key,
    required this.room,
    required this.senderId,
  });

  final types.Room room;
  final String senderId;

  void _showPermissionDeniedDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => PermissionDeniedDialog(
        onAction: () {
          context.read<PermissionBloc>().add(PermissionOpenSettingsRequested());
          dialogContext.router.pop();
        },
      ),
    );
  }

  void _permissionCubitListener(BuildContext context, PermissionState state) {
    if (state is PermissionPermanentlyDenied) {
      _showPermissionDeniedDialog(context);
    }
  }

  String get _otherUserId => room.users.firstWhere((e) => e.id != senderId).id;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<ChatBlocPatient>()..add(ChatInitializeRequested(room)),
        ),
        BlocProvider(
          create: (context) =>
              getIt<AudioRecordBloc>()..add(AudioRecordInitializeRequested()),
        ),
        BlocProvider(create: (context) => PermissionBloc()),
        BlocProvider(create: (context) => getIt<PresenceMessageBloc>()),
        BlocProvider(
          create: (context) => getIt<ChatTypingBloc>()
            ..add(ChatTypingInitializeRequested(senderId, room.id))
            ..add(ChatTypingInitializeRequested(_otherUserId, room.id)),
          lazy: false,
        ),
      ],
      child: BlocListener<PermissionBloc, PermissionState>(
        listener: _permissionCubitListener,
        child: _ChatView(room: room, senderId: senderId),
      ),
    );
  }
}

class _ChatView extends StatefulWidget {
  const _ChatView({required this.room, required this.senderId});

  final types.Room room;
  final String senderId;

  @override
  State<_ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<_ChatView> {
  final _messageController = TextEditingController();

  var _tapPosition = Offset.zero;
  var _emojiPanelHidden = true;

  types.User get _specialist => widget.room.users.firstWhere(
        (e) => e.id != widget.senderId,
      );

  /// Stores [details] tap position in [_tapPosition] for further use by message
  /// actions pop-up menu
  void _storeTapPosition(TapDownDetails details) {
    _tapPosition = details.globalPosition;
  }

  /// Callback for reloading chat on room fetch failure
  void _refreshChat() {
    context.read<ChatBlocPatient>().add(ChatInitializeRequested(widget.room));
  }

  void _onEmojiBackspace() {
    _messageController
      ..text = _messageController.text.characters.toString()
      ..selection = TextSelection.fromPosition(
        TextPosition(offset: _messageController.text.length),
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
      appBar: ChatAppBar(
        user: UserModel(
          id: _specialist.id,
          firstName: _specialist.firstName,
          lastName: _specialist.lastName,
          photoUrl: _specialist.imageUrl,
        ),
      ),
      body: BlocBuilder<ChatBlocPatient, ChatState>(
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
                    child: _ChatWidget(
                      state: state,
                      room: widget.room,
                      senderId: widget.senderId,
                      messageController: _messageController,
                      tapPosition: _tapPosition,
                      onBackgroundTap: () {
                        if (!_emojiPanelHidden) {
                          setState(
                            () => _emojiPanelHidden = true,
                          );
                        }
                      },
                      onEmojiTap: () {
                        setState(() {
                          _emojiPanelHidden = !_emojiPanelHidden;
                        });
                        // Removes keyboard if it is shown
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      onTextFieldTap: () => setState(
                        () => _emojiPanelHidden = true,
                      ),
                      emojiPanelHidden: _emojiPanelHidden,
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

class _ChatWidget extends StatefulWidget {
  const _ChatWidget({
    required this.state,
    required this.room,
    required this.senderId,
    required this.messageController,
    required this.tapPosition,
    required this.onBackgroundTap,
    required this.onEmojiTap,
    required this.onTextFieldTap,
    required this.emojiPanelHidden,
  });

  final ChatFetchMessagesSuccess state;
  final types.Room room;
  final String senderId;
  final TextEditingController messageController;
  final Offset tapPosition;
  final VoidCallback onBackgroundTap;
  final VoidCallback onEmojiTap;
  final VoidCallback onTextFieldTap;
  final bool emojiPanelHidden;

  @override
  State<_ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<_ChatWidget> {
  final _emojiEnlargementBehavior = ui.EmojiEnlargementBehavior.single;
  final _hideBackgroundOnEmojiMessages = true;

  types.User get _user => widget.room.users.firstWhere(
        (e) => e.id == widget.senderId,
      );

  types.User get _receiver => widget.room.users.firstWhere(
        (e) => e.id != widget.senderId,
      );

  void _previewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    return context
        .read<ChatBlocPatient>()
        .add(ChatPreviewDataFetched(message, previewData));
  }

  void _handleSendPressed() {
    final message = types.PartialText(
      text: widget.messageController.text.trim(),
    );
    context.read<ChatBlocPatient>().add(ChatSendMessageRequested(message));

    final typingEndEvent = ChatTypingEndRequested(_user.id, widget.room.id);
    context.read<ChatTypingBloc>().add(typingEndEvent);

    widget.messageController.clear();
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
    context.read<PermissionBloc>().add(PermissionCheckStorageRequested());
    return context.read<ChatBlocPatient>().add(ChatFilePickRequested());
  }

  Future<void> _handleImageSelection() async {
    return context.read<ChatBlocPatient>().add(ChatImagePickRequested());
  }

  /// Used to handle file open attached to [message] with [types.FileMessage]
  /// type
  void _handleMessageTap(BuildContext _, types.Message message) {
    final shouldOpen = message is types.FileMessage;
    if (message is types.FileMessage || message is types.AudioMessage) {
      return context.read<ChatBlocPatient>().add(
            ChatFileLoadRequested(
              message,
              shouldOpen: shouldOpen,
            ),
          );
    }
  }

  void _handleTypingStart(String text) {
    final typingStartEvent = ChatTypingStartRequested(_user.id, widget.room.id);
    context.read<ChatTypingBloc>().add(typingStartEvent);
  }

  /// Shows pop-up menu on tapPosition with 'Edit' and 'Delete' actions
  void _showMessageActionsMenu(BuildContext context, types.Message message) {
    if (_isSender(message.author.id)) {
      final l10n = context.l10n;
      return ChatUtils.showMessageActionsMenu(
        context,
        message,
        widget.tapPosition,
        items: <PopupMenuEntry<void>>[
          PopupMenuItem(
            onTap: () {
              context
                  .read<ChatBlocPatient>()
                  .add(ChatDeleteMessageRequested(message));
            },
            child: Text(l10n.delete, style: MintTextStyles.headline1),
          ),
        ],
      );
    }
  }

  void _markMessageAsRead(String messageId) {
    final markAsRead = PresenceMessageMarkAsRead(
      roomId: widget.room.id,
      messageId: messageId,
    );
    context.read<PresenceMessageBloc>().add(markAsRead);
  }

  /// Message bubble container
  Widget _bubbleBuilder(
    Widget child, {
    required types.Message message,
    required bool nextMessageInGroup,
  }) {
    final isLast = !nextMessageInGroup;
    final isSender = _isSender(message.author.id);
    final enlargeEmojis =
        _emojiEnlargementBehavior != ui.EmojiEnlargementBehavior.never &&
            message is types.TextMessage &&
            ui.isConsistsOfEmojis(_emojiEnlargementBehavior, message);

    final status = message.status;
    final seen = status != null && status == types.Status.seen;
    if (!isSender && !seen) _markMessageAsRead(message.id);

    return MessageBubble(
      isLast: isLast,
      message: message,
      isSender: isSender,
      enlargeEmojis: enlargeEmojis,
      hideBackgroundOnEmojiMessages: _hideBackgroundOnEmojiMessages,
      child: child,
    );
  }

  /// Builder that returns circular progress indicator while [message] is being
  /// uploaded to database
  Widget _messageLoadingBuilder(
    types.CustomMessage message, {
    // ignore: avoid-unused-parameters
    required int messageWidth,
  }) =>
      _MessageLoadingIndicator(
        isSender: _isSender(message.author.id),
      );

  /// Determines whether [userId] is current user
  bool _isSender(String userId) => _user.id == userId;

  types.User _getTypingUser(BuildContext context) {
    final firstName = _receiver.firstName;
    return firstName != null
        ? _receiver
        : _receiver.copyWith(firstName: context.l10n.patient);
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ChatTypingBloc, ChatTypingState, bool?>(
      selector: (typingState) =>
          typingState.typingMap[widget.room.id]?[_receiver.id],
      builder: (context, isReceiverTyping) {
        return ui.Chat(
          audioMessageBuilder: (
            audio, {
            required int messageWidth,
          }) {
            return Padding(
              padding: EdgeInsets.all(8.w),
              child: ChatAudioMessage(
                audioMessage: audio,
                isSender: _isSender(audio.author.id),
              ),
            );
          },
          bubbleBuilder: _bubbleBuilder,
          customBottomWidget: ChatBottomBar(
            controller: widget.messageController,
            onSend: _handleSendPressed,
            onEmoji: widget.onEmojiTap,
            onAttach: _handleAttachmentPressed,
            onAudioStop: (audioPath, duration) {
              context
                  .read<ChatBlocPatient>()
                  .add(ChatSaveAudioRequested(audioPath, duration));
            },
            isEmojiSelected: !widget.emojiPanelHidden,
            onTextFieldTap: widget.onTextFieldTap,
            onTextChanged: _handleTypingStart,
          ),
          customMessageBuilder: _messageLoadingBuilder,
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
          hideBackgroundOnEmojiMessages: _hideBackgroundOnEmojiMessages,
          messages: widget.state.messages,
          onBackgroundTap: widget.onBackgroundTap,
          onMessageTap: _handleMessageTap,
          onMessageLongPress: _showMessageActionsMenu,
          onPreviewDataFetched: _previewDataFetched,
          onSendPressed: (_) {
            // implemented in customBottomWidget
          },
          scrollToUnreadOptions: ui.ScrollToUnreadOptions(
            lastReadMessageId: widget.state.messages.lastWhereOrNull((msg) {
              final status = msg.status;
              if (msg.author.id == _user.id) return false;
              return status != null && status != types.Status.seen;
            })?.id,
            scrollDelay: const Duration(milliseconds: 20),
            scrollDuration: const Duration(milliseconds: 100),
            scrollOnOpen: true,
          ),
          theme: MintChatTheme(context),
          textMessageOptions: const ui.TextMessageOptions(
            isTextSelectable: false,
          ),
          typingIndicatorOptions: ui.TypingIndicatorOptions(
            animationSpeed: const Duration(seconds: 1),
            typingUsers: isReceiverTyping != null && isReceiverTyping
                ? [_getTypingUser(context)]
                : [],
          ),
          user: _user,
        );
      },
    );
  }
}

class _MessageLoadingIndicator extends StatelessWidget {
  const _MessageLoadingIndicator({required this.isSender});

  final bool isSender;

  bool _isThemeDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  Color _getProperOpaqueColor(BuildContext context) {
    return _isThemeDark(context)
        ? Colors.white
        : isSender
            ? Colors.white
            : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: SizedBox(
        height: 24.h,
        width: 24.w,
        child: CircularProgressIndicator(
          color: _getProperOpaqueColor(context),
          strokeWidth: 2,
        ),
      ),
    );
  }
}
