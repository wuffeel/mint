import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mint/domain/entity/booking_data/booking_data.dart';
import 'package:mint/domain/usecase/fetch_session_data_use_case.dart';
import 'package:mint/domain/usecase/initialize_notifications_use_case.dart';
import 'package:mint_core/mint_bloc.dart';
import 'package:mint_core/mint_core.dart';
import 'package:mint_core/mint_module.dart';

import '../../domain/usecase/get_booking_notifications_stream_use_case.dart';
import '../../domain/usecase/get_chat_notifications_stream_use_case.dart';

part 'notifications_event.dart';

part 'notifications_state.dart';

@injectable
class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc(
    this._initializeNotificationsUseCase,
    this._userController,
    this._fetchChatRoomUseCase,
    this._fetchSessionDataUseCase,
    this._getChatNotificationsStreamUseCase,
    this._getBookingNotificationsStreamUseCase,
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
  final FetchSessionDataUseCase _fetchSessionDataUseCase;
  final GetChatNotificationsStreamUseCase _getChatNotificationsStreamUseCase;
  final GetBookingNotificationsStreamUseCase
      _getBookingNotificationsStreamUseCase;

  PatientUser? _currentUser;
  final UserController<PatientUser?> _userController;

  late final StreamSubscription<PatientUser?> _userSubscription;
  late final StreamSubscription<String> _chatRoomSubscription;
  late final StreamSubscription<String> _sessionSubscription;

  void _subscribeToDataEvents() {
    _userSubscription = _userController.user.listen((user) {
      _currentUser = user;
    });
    _chatRoomSubscription =
        _getChatNotificationsStreamUseCase.onChatRoomId.listen((roomId) {
      add(NotificationsChatRoomRequested(roomId));
    });
    _sessionSubscription =
        _getBookingNotificationsStreamUseCase.onBookingId.listen((bookingId) {
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

      emit(NotificationsFetchChatRoomSuccess(room, user.id));
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
