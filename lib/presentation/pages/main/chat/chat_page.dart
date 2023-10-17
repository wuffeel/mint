import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/injector/injector.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/chat/widgets/chat_page_app_bar.dart';
import 'package:mint/presentation/pages/main/chat/widgets/chat_room_list_widget.dart';
import 'package:mint/presentation/pages/main/chat/widgets/chat_room_tile.dart';
import 'package:mint/presentation/pages/main/chat/widgets/chat_room_tile_skeleton.dart';
import 'package:mint/presentation/widgets/error_try_again_text.dart';
import 'package:mint/routes/app_router.gr.dart';
import 'package:mint/theme/mint_text_styles.dart';
import 'package:mint_core/mint_bloc.dart';
import 'package:shimmer/shimmer.dart';

@RoutePage()
class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  // TODO(wuffeel): find a better solution, too many reads
  // UseCase: ChatRoomListFetchSuccess triggers too much, - room updates on
  // every sendMessage when updatedAt of room is updated, and then after
  // lastMessages fetched, room also updated.
  // That means, that unread messages fetch triggers for EVERY room in a list
  // for 2 times
  void _chatRoomBlocListener(BuildContext context, ChatRoomState state) {
    if (state is ChatRoomListFetchSuccess) {
      context.read<UnreadMessagesBloc>().add(
            UnreadMessagesFetchRequested(state.roomList, state.senderId),
          );
      for (final room in state.roomList) {
        final otherUserId =
            room.users.firstWhere((e) => e.id != state.senderId).id;
        context
            .read<ChatTypingBloc>()
            .add(ChatTypingInitializeRequested(otherUserId, room.id));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<ChatRoomBlocPatient>()),
        BlocProvider(create: (context) => getIt<UnreadMessagesBloc>()),
        BlocProvider(create: (context) => getIt<ChatTypingBloc>()),
      ],
      child: BlocListener<ChatRoomBlocPatient, ChatRoomState>(
        listener: _chatRoomBlocListener,
        child: const _ChatView(),
      ),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  void _onRefresh(BuildContext context) {
    context.read<ChatRoomBlocPatient>().add(ChatRoomListFetchRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChatPageAppBar(),
      body: BlocBuilder<ChatRoomBlocPatient, ChatRoomState>(
        builder: (context, state) {
          if (state is ChatRoomListLoading) {
            return const _LoadingChatRooms();
          }
          if (state is ChatRoomListFetchFailure) {
            return Center(
              child: ErrorTryAgainText(onRefresh: () => _onRefresh(context)),
            );
          }
          if (state is ChatRoomListFetchSuccess) {
            final senderId = state.senderId;
            final roomList = state.roomList;
            if (roomList.isEmpty) return const _NoChatRoomsWidget();

            return ChatRoomListWidget(
              itemCount: roomList.length,
              itemBuilder: (context, index) {
                final room = roomList[index];
                final user = room.users.firstWhere((e) => e.id != senderId);
                return _ChatRoomTile(room, user, senderId);
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class _LoadingChatRooms extends StatelessWidget {
  const _LoadingChatRooms();

  @override
  Widget build(BuildContext context) {
    return ChatRoomListWidget(
      itemCount: 8,
      itemBuilder: (_, __) => Shimmer.fromColors(
        baseColor: Theme.of(context).hintColor.withOpacity(0.6),
        highlightColor: Colors.white,
        child: const ChatRoomTileSkeleton(),
      ),
    );
  }
}

class _NoChatRoomsWidget extends StatefulWidget {
  const _NoChatRoomsWidget();

  @override
  State<_NoChatRoomsWidget> createState() => _NoChatRoomsWidgetState();
}

class _NoChatRoomsWidgetState extends State<_NoChatRoomsWidget> {
  final _tooltipKey = GlobalKey<TooltipState>();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(l10n.noChatsYet, style: MintTextStyles.body),
          SizedBox(width: 4.w),
          Tooltip(
            key: _tooltipKey,
            message: context.l10n.toStartNewChat,
            margin: EdgeInsets.symmetric(horizontal: 48.w),
            textAlign: TextAlign.center,
            triggerMode: TooltipTriggerMode.manual,
            child: GestureDetector(
              onTap: () => _tooltipKey.currentState?.ensureTooltipVisible(),
              child: const Icon(Icons.help),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatRoomTile extends StatelessWidget {
  const _ChatRoomTile(this.room, this.user, this.senderId);

  final types.Room room;
  final types.User user;
  final String senderId;

  void _navigateToChat(BuildContext context, types.Room room, String senderId) {
    context.router.push(ChatRoomRoute(room: room, senderId: senderId));
  }

  int _getUnreadCount(UnreadMessagesState state, String userId) {
    return state is UnreadMessagesFetchSuccess
        ? state.unreadMap[userId] ?? 0
        : 0;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UnreadMessagesBloc, UnreadMessagesState>(
      builder: (context, state) {
        return BlocSelector<ChatTypingBloc, ChatTypingState, bool?>(
          selector: (typingState) => typingState.typingMap[room.id]?[user.id],
          builder: (context, isTyping) {
            return ChatRoomTile(
              user: user,
              lastMessage: (room.lastMessages?.isNotEmpty ?? false)
                  ? room.lastMessages?.last
                  : null,
              onTap: () => _navigateToChat(context, room, senderId),
              unreadCount: _getUnreadCount(state, user.id),
              roomLastDate: room.updatedAt ?? room.updatedAt,
              isTyping: isTyping ?? false,
            );
          },
        );
      },
    );
  }
}
