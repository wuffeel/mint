// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i32;

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mint/assembly/entity/booking_data_from_dto.dart' as _i81;
import 'package:mint/assembly/entity/credit_card_model_from_dto.dart' as _i31;
import 'package:mint/assembly/entity/pick_up_filter_from_dto.dart' as _i19;
import 'package:mint/assembly/entity/review_model_from_dto.dart' as _i33;
import 'package:mint/assembly/entity/specialist_filter_from_dto.dart' as _i25;
import 'package:mint/assembly/model/booking_data_to_dto.dart' as _i36;
import 'package:mint/assembly/model/filter_preferences_to_dto.dart' as _i28;
import 'package:mint/assembly/model/review_model_to_dto.dart' as _i22;
import 'package:mint/assembly/model/transaction_data_to_dto.dart' as _i16;
import 'package:mint/bloc/audio_message/audio_message_cubit.dart' as _i5;
import 'package:mint/bloc/audio_record/audio_record_bloc.dart' as _i74;
import 'package:mint/bloc/auth/auth_bloc.dart' as _i75;
import 'package:mint/bloc/booking/booking_bloc.dart' as _i115;
import 'package:mint/bloc/credit_card/credit_card_bloc.dart' as _i104;
import 'package:mint/bloc/favorite/favorite_bloc.dart' as _i105;
import 'package:mint/bloc/notifications/notifications_bloc.dart' as _i109;
import 'package:mint/bloc/pick_up_specialist/pick_up_specialist_bloc.dart'
    as _i93;
import 'package:mint/bloc/pin_code/pin_code_bloc.dart' as _i94;
import 'package:mint/bloc/previous_sessions/previous_sessions_bloc.dart'
    as _i110;
import 'package:mint/bloc/review/review_bloc.dart' as _i96;
import 'package:mint/bloc/specialist_catalogue/specialist_catalogue_bloc.dart'
    as _i97;
import 'package:mint/bloc/specialist_filter/specialist_filter_bloc.dart'
    as _i98;
import 'package:mint/bloc/specialist_online/specialist_online_bloc.dart'
    as _i99;
import 'package:mint/bloc/transaction/transaction_bloc.dart' as _i100;
import 'package:mint/bloc/upcoming_sessions/upcoming_sessions_bloc.dart'
    as _i111;
import 'package:mint/bloc/user/user_bloc.dart' as _i101;
import 'package:mint/bloc/work_info/work_info_bloc.dart' as _i71;
import 'package:mint/data/model/booking_data_dto/booking_data_dto.dart' as _i34;
import 'package:mint/data/model/credit_card_model_dto/credit_card_model_dto.dart'
    as _i30;
import 'package:mint/data/model/filter_preferences_dto/filter_preferences_dto.dart'
    as _i26;
import 'package:mint/data/model/pick_up_filter_dto/pick_up_filter_dto.dart'
    as _i18;
import 'package:mint/data/model/review_model_dto/review_model_dto.dart' as _i20;
import 'package:mint/data/model/specialist_filter_dto/specialist_filter_dto.dart'
    as _i24;
import 'package:mint/data/model/transaction_data_dto/transaction_data_dto.dart'
    as _i14;
import 'package:mint/data/repository/abstract/audio_record_repository.dart'
    as _i6;
import 'package:mint/data/repository/abstract/booking_repository.dart' as _i11;
import 'package:mint/data/repository/abstract/filter_repository.dart' as _i37;
import 'package:mint/data/repository/abstract/notification_repository.dart'
    as _i44;
import 'package:mint/data/repository/abstract/payment_repository.dart' as _i48;
import 'package:mint/data/repository/abstract/phone_auth_repository.dart'
    as _i52;
import 'package:mint/data/repository/abstract/specialist_repository.dart'
    as _i59;
import 'package:mint/data/repository/audio_record_repository_impl.dart' as _i7;
import 'package:mint/data/repository/firebase/firebase_auth_repository.dart'
    as _i53;
import 'package:mint/data/repository/firebase/firebase_booking_repository.dart'
    as _i12;
import 'package:mint/data/repository/firebase/firebase_filter_repository.dart'
    as _i38;
import 'package:mint/data/repository/firebase/firebase_notification_repository.dart'
    as _i45;
import 'package:mint/data/repository/firebase/firebase_payment_repository.dart'
    as _i49;
import 'package:mint/data/repository/firebase/firebase_specialist_repository.dart'
    as _i60;
import 'package:mint/domain/controller/applied_filter_controller.dart' as _i4;
import 'package:mint/domain/controller/booking_controller.dart' as _i10;
import 'package:mint/domain/controller/pick_up_filter_controller.dart' as _i56;
import 'package:mint/domain/controller/specialist_rating_controller.dart'
    as _i58;
import 'package:mint/domain/entity/booking_data/booking_data.dart' as _i35;
import 'package:mint/domain/entity/credit_card_model/credit_card_model.dart'
    as _i29;
import 'package:mint/domain/entity/filter_preferences/filter_preferences.dart'
    as _i27;
import 'package:mint/domain/entity/pick_up_filter/pick_up_filter.dart' as _i17;
import 'package:mint/domain/entity/review_model/review_model.dart' as _i21;
import 'package:mint/domain/entity/specialist_filter/specialist_filter.dart'
    as _i23;
import 'package:mint/domain/entity/transaction_data/transaction_data.dart'
    as _i15;
import 'package:mint/domain/service/abstract/audio_record_service.dart' as _i8;
import 'package:mint/domain/service/abstract/booking_service.dart' as _i102;
import 'package:mint/domain/service/abstract/filter_service.dart' as _i39;
import 'package:mint/domain/service/abstract/notification_service.dart' as _i46;
import 'package:mint/domain/service/abstract/payment_service.dart' as _i50;
import 'package:mint/domain/service/abstract/phone_auth_service.dart' as _i54;
import 'package:mint/domain/service/abstract/specialist_service.dart' as _i61;
import 'package:mint/domain/service/audio_record_service_impl.dart' as _i9;
import 'package:mint/domain/service/firebase/firebase_booking_service.dart'
    as _i103;
import 'package:mint/domain/service/firebase/firebase_filter_service.dart'
    as _i40;
import 'package:mint/domain/service/firebase/firebase_notification_service.dart'
    as _i47;
import 'package:mint/domain/service/firebase/firebase_payment_service.dart'
    as _i51;
import 'package:mint/domain/service/firebase/firebase_phone_auth_service.dart'
    as _i55;
import 'package:mint/domain/service/firebase/firebase_specialist_service.dart'
    as _i62;
import 'package:mint/domain/usecase/add_review_use_case.dart' as _i72;
import 'package:mint/domain/usecase/add_to_favorite_use_case.dart' as _i73;
import 'package:mint/domain/usecase/booking_book_use_case.dart' as _i112;
import 'package:mint/domain/usecase/booking_cancel_use_case.dart' as _i113;
import 'package:mint/domain/usecase/booking_reschedule_use_case.dart' as _i114;
import 'package:mint/domain/usecase/credit_card_delete_use_case.dart' as _i77;
import 'package:mint/domain/usecase/credit_card_list_fetch_use_case.dart'
    as _i78;
import 'package:mint/domain/usecase/credit_card_save_use_case.dart' as _i79;
import 'package:mint/domain/usecase/delete_review_use_case.dart' as _i80;
import 'package:mint/domain/usecase/fetch_favorite_ids_use_case.dart' as _i82;
import 'package:mint/domain/usecase/fetch_favorite_specialists_use_case.dart'
    as _i83;
import 'package:mint/domain/usecase/fetch_pick_up_filter_use_case.dart' as _i84;
import 'package:mint/domain/usecase/fetch_previous_sessions_use_case.dart'
    as _i106;
import 'package:mint/domain/usecase/fetch_session_data_use_case.dart' as _i107;
import 'package:mint/domain/usecase/fetch_specialist_catalogue_use_case.dart'
    as _i85;
import 'package:mint/domain/usecase/fetch_specialist_filter_use_case.dart'
    as _i86;
import 'package:mint/domain/usecase/fetch_specialist_reviews_use_case.dart'
    as _i87;
import 'package:mint/domain/usecase/fetch_specialist_use_case.dart' as _i88;
import 'package:mint/domain/usecase/fetch_specialists_online_use_case.dart'
    as _i89;
import 'package:mint/domain/usecase/fetch_upcoming_sessions_use_case.dart'
    as _i108;
import 'package:mint/domain/usecase/get_booking_notifications_stream_use_case.dart'
    as _i90;
import 'package:mint/domain/usecase/get_chat_notifications_stream_use_case.dart'
    as _i91;
import 'package:mint/domain/usecase/get_current_user_use_case.dart' as _i41;
import 'package:mint/domain/usecase/initialize_audio_recorder_use_case.dart'
    as _i42;
import 'package:mint/domain/usecase/initialize_notifications_use_case.dart'
    as _i92;
import 'package:mint/domain/usecase/log_out_use_case.dart' as _i43;
import 'package:mint/domain/usecase/pin_code_change_use_case.dart' as _i57;
import 'package:mint/domain/usecase/remove_from_favorite_use_case.dart' as _i95;
import 'package:mint/domain/usecase/start_audio_record_use_case.dart' as _i64;
import 'package:mint/domain/usecase/stop_audio_record_use_case.dart' as _i65;
import 'package:mint/domain/usecase/transaction_pay_use_case.dart' as _i66;
import 'package:mint/domain/usecase/update_review_use_case.dart' as _i67;
import 'package:mint/domain/usecase/user_data_update_use_case.dart' as _i68;
import 'package:mint/domain/usecase/verify_otp_use_case.dart' as _i69;
import 'package:mint/domain/usecase/verify_phone_use_case.dart' as _i70;
import 'package:mint_core/mint_assembly.dart' as _i13;
import 'package:mint_core/mint_bloc.dart' as _i76;
import 'package:mint_core/mint_core.dart' as _i63;
import 'package:mint_core/mint_module.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    await _i3.MintCorePackageModule().init(gh);
    gh.lazySingleton<_i4.AppliedFilterController>(
        () => _i4.AppliedFilterController());
    gh.factory<_i5.AudioMessageCubit>(
        () => _i5.AudioMessageCubit(gh<_i3.LoadFileUseCase>()));
    gh.factory<_i6.AudioRecordRepository>(
        () => _i7.AudioRecordRepositoryImpl());
    gh.factory<_i8.AudioRecordService>(
        () => _i9.AudioRecordServiceImpl(gh<_i6.AudioRecordRepository>()));
    gh.lazySingleton<_i10.BookingController>(() => _i10.BookingController());
    gh.factory<_i11.BookingRepository>(
        () => _i12.FirebaseBookingRepository(gh<_i3.FirebaseInitializer>()));
    gh.factory<_i13.Factory<_i14.TransactionDataDto, _i15.TransactionData>>(
        () => _i16.TransactionDataToDto());
    gh.factory<_i13.Factory<_i17.PickUpFilter, _i18.PickUpFilterDto>>(
        () => _i19.PickUpFilterFromDto());
    gh.factory<_i13.Factory<_i20.ReviewModelDto, _i21.ReviewModel>>(
        () => _i22.ReviewModelToDto());
    gh.factory<_i13.Factory<_i23.SpecialistFilter, _i24.SpecialistFilterDto>>(
        () => _i25.SpecialistFilterFromDto());
    gh.factory<_i13.Factory<_i26.FilterPreferencesDto, _i27.FilterPreferences>>(
        () => _i28.FilterPreferencesToDto());
    gh.factory<_i13.Factory<_i29.CreditCardModel, _i30.CreditCardModelDto>>(
        () => _i31.CreditCardModelFromDto());
    gh.factory<
            _i13.Factory<_i32.Future<_i21.ReviewModel?>, _i20.ReviewModelDto>>(
        () => _i33.ReviewModelFromDto(gh<_i3.UserService>()));
    gh.factory<_i13.Factory<_i34.BookingDataDto, _i35.BookingData>>(
        () => _i36.BookingDataToDto());
    gh.factory<_i37.FilterRepository>(
        () => _i38.FirebaseFilterRepository(gh<_i3.FirebaseInitializer>()));
    gh.factory<_i39.FilterService>(() => _i40.FirebaseFilterService(
          gh<_i37.FilterRepository>(),
          gh<_i13.Factory<_i23.SpecialistFilter, _i24.SpecialistFilterDto>>(),
          gh<_i13.Factory<_i17.PickUpFilter, _i18.PickUpFilterDto>>(),
        ));
    gh.factory<_i41.GetCurrentUserUseCase>(
        () => _i41.GetCurrentUserUseCase(gh<_i3.UserService>()));
    gh.factory<_i42.InitializeAudioRecorderUseCase>(() =>
        _i42.InitializeAudioRecorderUseCase(gh<_i8.AudioRecordService>()));
    gh.factory<_i43.LogOutUseCase>(
        () => _i43.LogOutUseCase(gh<_i3.UserService>()));
    gh.lazySingleton<_i44.NotificationRepository>(() =>
        _i45.FirebaseNotificationRepository(gh<_i3.FirebaseInitializer>()));
    gh.factory<_i46.NotificationService>(() =>
        _i47.FirebaseNotificationService(gh<_i44.NotificationRepository>()));
    gh.factory<_i48.PaymentRepository>(
        () => _i49.FirebasePaymentRepository(gh<_i3.FirebaseInitializer>()));
    gh.factory<_i50.PaymentService>(() => _i51.FirebasePaymentService(
          gh<_i48.PaymentRepository>(),
          gh<_i13.Factory<_i29.CreditCardModel, _i30.CreditCardModelDto>>(),
          gh<_i13.Factory<_i14.TransactionDataDto, _i15.TransactionData>>(),
        ));
    gh.factory<_i52.PhoneAuthRepository>(
        () => _i53.FirebaseAuthRepository(gh<_i3.FirebaseInitializer>()));
    gh.factory<_i54.PhoneAuthService>(
        () => _i55.FirebasePhoneAuthService(gh<_i52.PhoneAuthRepository>()));
    gh.lazySingleton<_i56.PickUpFilterController>(
        () => _i56.PickUpFilterController());
    gh.factory<_i57.PinCodeChangeUseCase>(
        () => _i57.PinCodeChangeUseCase(gh<_i3.UserService>()));
    gh.lazySingleton<_i58.SpecialistRatingController>(
        () => _i58.SpecialistRatingController());
    gh.factory<_i59.SpecialistRepository>(
        () => _i60.FirebaseSpecialistRepository(gh<_i3.FirebaseInitializer>()));
    gh.factory<_i61.SpecialistService>(() => _i62.FirebaseSpecialistService(
          gh<_i59.SpecialistRepository>(),
          gh<
              _i13.Factory<_i32.Future<_i63.SpecialistModel>,
                  _i63.SpecialistModelDto>>(),
          gh<_i13.Factory<_i26.FilterPreferencesDto, _i27.FilterPreferences>>(),
          gh<
              _i13.Factory<_i32.Future<_i21.ReviewModel?>,
                  _i20.ReviewModelDto>>(),
          gh<_i13.Factory<_i20.ReviewModelDto, _i21.ReviewModel>>(),
        ));
    gh.factory<_i64.StartAudioRecordUseCase>(
        () => _i64.StartAudioRecordUseCase(gh<_i8.AudioRecordService>()));
    gh.factory<_i65.StopAudioRecordUseCase>(
        () => _i65.StopAudioRecordUseCase(gh<_i8.AudioRecordService>()));
    gh.factory<_i66.TransactionPayUseCase>(
        () => _i66.TransactionPayUseCase(gh<_i50.PaymentService>()));
    gh.factory<_i67.UpdateReviewUseCase>(
        () => _i67.UpdateReviewUseCase(gh<_i61.SpecialistService>()));
    gh.factory<_i68.UserDataUpdateUseCase>(
        () => _i68.UserDataUpdateUseCase(gh<_i3.UserService>()));
    gh.factory<_i69.VerifyOtpUseCase>(
        () => _i69.VerifyOtpUseCase(gh<_i54.PhoneAuthService>()));
    gh.factory<_i70.VerifyPhoneUseCase>(
        () => _i70.VerifyPhoneUseCase(gh<_i54.PhoneAuthService>()));
    gh.factory<_i71.WorkInfoBloc>(
        () => _i71.WorkInfoBloc(gh<_i3.SpecialistWorkInfoFetchUseCase>()));
    gh.factory<_i72.AddReviewUseCase>(
        () => _i72.AddReviewUseCase(gh<_i61.SpecialistService>()));
    gh.factory<_i73.AddToFavoriteUseCase>(
        () => _i73.AddToFavoriteUseCase(gh<_i61.SpecialistService>()));
    gh.factory<_i74.AudioRecordBloc>(() => _i74.AudioRecordBloc(
          gh<_i42.InitializeAudioRecorderUseCase>(),
          gh<_i64.StartAudioRecordUseCase>(),
          gh<_i65.StopAudioRecordUseCase>(),
        ));
    gh.factory<_i75.AuthBloc>(() => _i75.AuthBloc(
          gh<_i70.VerifyPhoneUseCase>(),
          gh<_i69.VerifyOtpUseCase>(),
          gh<_i76.UserController<_i63.PatientUser?>>(),
        ));
    gh.factory<_i77.CreditCardDeleteUseCase>(
        () => _i77.CreditCardDeleteUseCase(gh<_i50.PaymentService>()));
    gh.factory<_i78.CreditCardListFetchUseCase>(
        () => _i78.CreditCardListFetchUseCase(gh<_i50.PaymentService>()));
    gh.factory<_i79.CreditCardSaveUseCase>(
        () => _i79.CreditCardSaveUseCase(gh<_i50.PaymentService>()));
    gh.factory<_i80.DeleteReviewUseCase>(
        () => _i80.DeleteReviewUseCase(gh<_i61.SpecialistService>()));
    gh.factory<
            _i13.Factory<_i32.Future<_i35.BookingData?>, _i34.BookingDataDto>>(
        () => _i81.BookingDataFromDto(gh<_i61.SpecialistService>()));
    gh.factory<_i82.FetchFavoriteIdsUseCase>(
        () => _i82.FetchFavoriteIdsUseCase(gh<_i61.SpecialistService>()));
    gh.factory<_i83.FetchFavoriteSpecialistsUseCase>(() =>
        _i83.FetchFavoriteSpecialistsUseCase(gh<_i61.SpecialistService>()));
    gh.factory<_i84.FetchPickUpFilterUseCase>(
        () => _i84.FetchPickUpFilterUseCase(gh<_i39.FilterService>()));
    gh.factory<_i85.FetchSpecialistCatalogueUseCase>(() =>
        _i85.FetchSpecialistCatalogueUseCase(gh<_i61.SpecialistService>()));
    gh.factory<_i86.FetchSpecialistFilterUseCase>(
        () => _i86.FetchSpecialistFilterUseCase(gh<_i39.FilterService>()));
    gh.factory<_i87.FetchSpecialistReviewsUseCase>(
        () => _i87.FetchSpecialistReviewsUseCase(gh<_i61.SpecialistService>()));
    gh.factory<_i88.FetchSpecialistUseCase>(
        () => _i88.FetchSpecialistUseCase(gh<_i61.SpecialistService>()));
    gh.factory<_i89.FetchSpecialistsOnlineUseCase>(
        () => _i89.FetchSpecialistsOnlineUseCase(gh<_i61.SpecialistService>()));
    gh.factory<_i90.GetBookingNotificationsStreamUseCase>(() =>
        _i90.GetBookingNotificationsStreamUseCase(
            gh<_i46.NotificationService>()));
    gh.factory<_i91.GetChatNotificationsStreamUseCase>(() =>
        _i91.GetChatNotificationsStreamUseCase(gh<_i46.NotificationService>()));
    gh.factory<_i92.InitializeNotificationsUseCase>(() =>
        _i92.InitializeNotificationsUseCase(gh<_i46.NotificationService>()));
    gh.factory<_i93.PickUpSpecialistBloc>(() => _i93.PickUpSpecialistBloc(
          gh<_i84.FetchPickUpFilterUseCase>(),
          gh<_i56.PickUpFilterController>(),
        ));
    gh.factory<_i94.PinCodeBloc>(() => _i94.PinCodeBloc(
          gh<_i76.UserController<_i63.PatientUser?>>(),
          gh<_i57.PinCodeChangeUseCase>(),
        ));
    gh.factory<_i95.RemoveFromFavoriteUseCase>(
        () => _i95.RemoveFromFavoriteUseCase(gh<_i61.SpecialistService>()));
    gh.factory<_i96.ReviewBloc>(() => _i96.ReviewBloc(
          gh<_i87.FetchSpecialistReviewsUseCase>(),
          gh<_i72.AddReviewUseCase>(),
          gh<_i76.UserController<_i63.PatientUser?>>(),
          gh<_i58.SpecialistRatingController>(),
          gh<_i67.UpdateReviewUseCase>(),
          gh<_i80.DeleteReviewUseCase>(),
        ));
    gh.factory<_i97.SpecialistCatalogueBloc>(() => _i97.SpecialistCatalogueBloc(
          gh<_i85.FetchSpecialistCatalogueUseCase>(),
          gh<_i4.AppliedFilterController>(),
          gh<_i58.SpecialistRatingController>(),
        ));
    gh.factory<_i98.SpecialistFilterBloc>(() => _i98.SpecialistFilterBloc(
          gh<_i86.FetchSpecialistFilterUseCase>(),
          gh<_i4.AppliedFilterController>(),
          gh<_i56.PickUpFilterController>(),
        ));
    gh.factory<_i99.SpecialistOnlineBloc>(() => _i99.SpecialistOnlineBloc(
          gh<_i89.FetchSpecialistsOnlineUseCase>(),
          gh<_i58.SpecialistRatingController>(),
        ));
    gh.factory<_i100.TransactionBloc>(() => _i100.TransactionBloc(
          gh<_i66.TransactionPayUseCase>(),
          gh<_i76.UserController<_i63.PatientUser?>>(),
        ));
    gh.factory<_i101.UserBloc>(() => _i101.UserBloc(
          gh<_i41.GetCurrentUserUseCase>(),
          gh<_i43.LogOutUseCase>(),
          gh<_i68.UserDataUpdateUseCase>(),
          gh<_i3.InitializeUserPresenceUseCase>(),
          gh<_i76.UserController<_i63.PatientUser?>>(),
        ));
    gh.factory<_i102.BookingService>(() => _i103.FirebaseBookingService(
          gh<_i11.BookingRepository>(),
          gh<
              _i13.Factory<_i63.SpecialistWorkInfo,
                  _i63.SpecialistWorkInfoDto>>(),
          gh<_i13.Factory<_i34.BookingDataDto, _i35.BookingData>>(),
          gh<
              _i13.Factory<_i32.Future<_i35.BookingData?>,
                  _i34.BookingDataDto>>(),
        ));
    gh.factory<_i104.CreditCardBloc>(() => _i104.CreditCardBloc(
          gh<_i78.CreditCardListFetchUseCase>(),
          gh<_i79.CreditCardSaveUseCase>(),
          gh<_i77.CreditCardDeleteUseCase>(),
          gh<_i76.UserController<_i63.PatientUser?>>(),
        ));
    gh.factory<_i105.FavoriteBloc>(() => _i105.FavoriteBloc(
          gh<_i76.UserController<_i63.PatientUser?>>(),
          gh<_i82.FetchFavoriteIdsUseCase>(),
          gh<_i83.FetchFavoriteSpecialistsUseCase>(),
          gh<_i73.AddToFavoriteUseCase>(),
          gh<_i95.RemoveFromFavoriteUseCase>(),
        ));
    gh.factory<_i106.FetchPreviousSessionsUseCase>(
        () => _i106.FetchPreviousSessionsUseCase(gh<_i102.BookingService>()));
    gh.factory<_i107.FetchSessionDataUseCase>(
        () => _i107.FetchSessionDataUseCase(gh<_i102.BookingService>()));
    gh.factory<_i108.FetchUpcomingSessionsUseCase>(
        () => _i108.FetchUpcomingSessionsUseCase(gh<_i102.BookingService>()));
    gh.factory<_i109.NotificationsBloc>(() => _i109.NotificationsBloc(
          gh<_i92.InitializeNotificationsUseCase>(),
          gh<_i76.UserController<_i63.PatientUser?>>(),
          gh<_i3.FetchChatRoomUseCase>(),
          gh<_i107.FetchSessionDataUseCase>(),
          gh<_i91.GetChatNotificationsStreamUseCase>(),
          gh<_i90.GetBookingNotificationsStreamUseCase>(),
        ));
    gh.factory<_i110.PreviousSessionsBloc>(() => _i110.PreviousSessionsBloc(
          gh<_i106.FetchPreviousSessionsUseCase>(),
          gh<_i76.UserController<_i63.PatientUser?>>(),
        ));
    gh.factory<_i111.UpcomingSessionsBloc>(() => _i111.UpcomingSessionsBloc(
          gh<_i108.FetchUpcomingSessionsUseCase>(),
          gh<_i76.UserController<_i63.PatientUser?>>(),
          gh<_i10.BookingController>(),
        ));
    gh.factory<_i112.BookingBookUseCase>(
        () => _i112.BookingBookUseCase(gh<_i102.BookingService>()));
    gh.factory<_i113.BookingCancelUseCase>(
        () => _i113.BookingCancelUseCase(gh<_i102.BookingService>()));
    gh.factory<_i114.BookingRescheduleUseCase>(
        () => _i114.BookingRescheduleUseCase(gh<_i102.BookingService>()));
    gh.factory<_i115.BookingBloc>(() => _i115.BookingBloc(
          gh<_i112.BookingBookUseCase>(),
          gh<_i114.BookingRescheduleUseCase>(),
          gh<_i113.BookingCancelUseCase>(),
          gh<_i76.UserController<_i63.PatientUser?>>(),
          gh<_i10.BookingController>(),
        ));
    return this;
  }
}
