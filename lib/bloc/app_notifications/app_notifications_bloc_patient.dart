import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/domain/entity/booking_data/booking_data.dart';
import 'package:mint/domain/usecase/fetch_session_data_use_case.dart';
import 'package:mint_core/mint_bloc.dart';
import 'package:mint_core/mint_core.dart';

part 'app_notifications_event.dart';

part 'app_notifications_state.dart';

@injectable
class AppNotificationsBlocPatient extends AppNotificationsBloc<PatientUser?> {
  AppNotificationsBlocPatient(
    super.getAppNotificationStreamUseCase,
    super.fetchChatRoomUseCase,
    super.userController,
    this._fetchBookingDataUseCase,
  ) {
    on<AppNotificationsFetchBookingDataRequested>(_onFetchBookingData);
  }

  final FetchSessionDataUseCase _fetchBookingDataUseCase;

  Future<void> _onFetchBookingData(
    AppNotificationsFetchBookingDataRequested event,
    Emitter<AppNotificationsState> emit,
  ) async {
    final state = this.state;
    if (state is! AppNotificationsFetchSuccess) return;

    try {
      final loadingState = AppNotificationsMessageLoading(
        state.todayNotifications,
        state.previousNotifications,
        event.notificationId,
      );
      emit(loadingState);
      final bookingData = await _fetchBookingDataUseCase(event.bookingId);
      if (bookingData == null) {
        emit(AppNotificationsFetchBookingDataFailure());
        return;
      }
      emit(AppNotificationsFetchBookingDataSuccess(bookingData));
    } catch (error) {
      log('AppNotificationsFetchBookingDataFailure: $error');
      emit(AppNotificationsFetchBookingDataFailure());
    }
  }
}
