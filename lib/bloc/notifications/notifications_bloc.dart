import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mint/domain/controller/notification_controller.dart';
import 'package:mint/domain/entity/booking_data/booking_data.dart';
import 'package:mint/domain/entity/specialist_model/specialist_model.dart';
import 'package:mint/domain/usecase/fetch_chat_room_use_case.dart';
import 'package:mint/domain/usecase/fetch_session_data_use_case.dart';
import 'package:mint/domain/usecase/fetch_specialist_use_case.dart';
import 'package:mint/domain/usecase/initialize_notifications_use_case.dart';

import '../../domain/controller/user_controller.dart';
import '../../domain/entity/user_model/user_model.dart';

part 'notifications_event.dart';

part 'notifications_state.dart';

@injectable
class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc(
    this._initializeNotificationsUseCase,
    this._userController,
    this._notificationController,
    this._fetchChatRoomUseCase,
    this._fetchSpecialistUseCase,
    this._fetchSessionDataUseCase,
  ) : super(NotificationsInitial()) {
    _subscribeToDataEvents();
    on<NotificationsInitializeRequested>(_onInitializeNotifications);
    on<NotificationsChatRoomRequested>(_onFetchChatRoom);
    on<NotificationsSessionDataRequested>(_onFetchSessionData);
    on<NotificationsStateResetRequested>(
      (event, emit) => emit(NotificationsInitial()),
    );
  }

  final InitializeNotificationsUseCase _initializeNotificationsUseCase;
  final FetchChatRoomUseCase _fetchChatRoomUseCase;
  final FetchSpecialistUseCase _fetchSpecialistUseCase;
  final FetchSessionDataUseCase _fetchSessionDataUseCase;

  UserModel? _currentUser;
  final UserController _userController;
  final NotificationController _notificationController;

  late final StreamSubscription<UserModel?> _userSubscription;
  late final StreamSubscription<String> _chatRoomSubscription;
  late final StreamSubscription<String> _sessionSubscription;

  void _subscribeToDataEvents() {
    _userSubscription = _userController.user.listen((user) {
      _currentUser = user;
    });
    _chatRoomSubscription = _notificationController.onChatRoom.listen((roomId) {
      add(NotificationsChatRoomRequested(roomId));
    });
    _sessionSubscription =
        _notificationController.onSessionData.listen((bookingId) {
      add(NotificationsSessionDataRequested(bookingId));
    });
  }

  @override
  Future<void> close() async {
    await _userSubscription.cancel();
    await _chatRoomSubscription.cancel();
    await _sessionSubscription.cancel();
    return super.close();
  }

  Future<void> _onInitializeNotifications(
    NotificationsInitializeRequested event,
    Emitter<NotificationsState> emit,
  ) async {
    final user = _currentUser;
    if (user == null) return;

    try {
      emit(NotificationsInitializeLoading());
      await _initializeNotificationsUseCase(user.id);
      emit(NotificationsInitializeSuccess());
    } catch (error) {
      log('NotificationsInitializeFailure: $error');
      emit(NotificationsInitializeFailure());
    }
  }

  Future<void> _onFetchChatRoom(
    NotificationsChatRoomRequested event,
    Emitter<NotificationsState> emit,
  ) async {
    try {
      final user = _currentUser;
      final room = await _fetchChatRoomUseCase(event.roomId);
      if (room == null || user == null) return;

      final specialist = room.users.singleWhere(
        (roomUser) => roomUser.id != user.id,
      );
      final specialistModel = await _fetchSpecialistUseCase(specialist.id);

      if (specialistModel == null) return;

      emit(NotificationsFetchChatRoomSuccess(room, specialistModel));
    } catch (error) {
      log('NotificationsFetchChatRoomFailure: $error');
      emit(NotificationsFetchChatRoomFailure());
    }
  }

  Future<void> _onFetchSessionData(
    NotificationsSessionDataRequested event,
    Emitter<NotificationsState> emit,
  ) async {
    try {
      final bookingData = await _fetchSessionDataUseCase(event.bookingId);
      if (bookingData == null) return;

      emit(NotificationsFetchSessionDataSuccess(bookingData));
    } catch (error) {
      log('NotificationsFetchSessionDataFailure: $error');
      emit(NotificationsFetchSessionDataFailure());
    }
  }
}
