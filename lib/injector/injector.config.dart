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
import 'package:mint/assembly/entity/booking_data_from_dto.dart' as _i84;
import 'package:mint/assembly/entity/credit_card_model_from_dto.dart' as _i39;
import 'package:mint/assembly/entity/pick_up_filter_from_dto.dart' as _i28;
import 'package:mint/assembly/entity/review_model_from_dto.dart' as _i33;
import 'package:mint/assembly/entity/specialist_filter_from_dto.dart' as _i31;
import 'package:mint/assembly/entity/specialist_work_info_from_dto.dart'
    as _i36;
import 'package:mint/assembly/model/booking_data_to_dto.dart' as _i16;
import 'package:mint/assembly/model/filter_preferences_to_dto.dart' as _i22;
import 'package:mint/assembly/model/review_model_to_dto.dart' as _i25;
import 'package:mint/assembly/model/transaction_data_to_dto.dart' as _i19;
import 'package:mint/bloc/audio_message/audio_message_cubit.dart' as _i5;
import 'package:mint/bloc/audio_record/audio_record_bloc.dart' as _i77;
import 'package:mint/bloc/auth/auth_bloc.dart' as _i78;
import 'package:mint/bloc/booking/booking_bloc.dart' as _i119;
import 'package:mint/bloc/credit_card/credit_card_bloc.dart' as _i106;
import 'package:mint/bloc/favorite/favorite_bloc.dart' as _i107;
import 'package:mint/bloc/notifications/notifications_bloc.dart' as _i111;
import 'package:mint/bloc/pick_up_specialist/pick_up_specialist_bloc.dart'
    as _i95;
import 'package:mint/bloc/pin_code/pin_code_bloc.dart' as _i96;
import 'package:mint/bloc/previous_sessions/previous_sessions_bloc.dart'
    as _i112;
import 'package:mint/bloc/review/review_bloc.dart' as _i98;
import 'package:mint/bloc/specialist_catalogue/specialist_catalogue_bloc.dart'
    as _i99;
import 'package:mint/bloc/specialist_filter/specialist_filter_bloc.dart'
    as _i100;
import 'package:mint/bloc/specialist_online/specialist_online_bloc.dart'
    as _i101;
import 'package:mint/bloc/transaction/transaction_bloc.dart' as _i102;
import 'package:mint/bloc/upcoming_sessions/upcoming_sessions_bloc.dart'
    as _i114;
import 'package:mint/bloc/user/user_bloc.dart' as _i103;
import 'package:mint/bloc/work_info/work_info_bloc.dart' as _i115;
import 'package:mint/data/model/booking_data_dto/booking_data_dto.dart' as _i14;
import 'package:mint/data/model/credit_card_model_dto/credit_card_model_dto.dart'
    as _i38;
import 'package:mint/data/model/filter_preferences_dto/filter_preferences_dto.dart'
    as _i20;
import 'package:mint/data/model/pick_up_filter_dto/pick_up_filter_dto.dart'
    as _i27;
import 'package:mint/data/model/review_model_dto/review_model_dto.dart' as _i23;
import 'package:mint/data/model/specialist_filter_dto/specialist_filter_dto.dart'
    as _i30;
import 'package:mint/data/model/specialist_work_info_dto/specialist_work_info_dto.dart'
    as _i35;
import 'package:mint/data/model/transaction_data_dto/transaction_data_dto.dart'
    as _i17;
import 'package:mint/data/repository/abstract/audio_record_repository.dart'
    as _i6;
import 'package:mint/data/repository/abstract/booking_repository.dart' as _i11;
import 'package:mint/data/repository/abstract/filter_repository.dart' as _i41;
import 'package:mint/data/repository/abstract/notification_repository.dart'
    as _i48;
import 'package:mint/data/repository/abstract/payment_repository.dart' as _i52;
import 'package:mint/data/repository/abstract/phone_auth_repository.dart'
    as _i56;
import 'package:mint/data/repository/abstract/specialist_repository.dart'
    as _i63;
import 'package:mint/data/repository/audio_record_repository_impl.dart' as _i7;
import 'package:mint/data/repository/firebase/firebase_auth_repository.dart'
    as _i57;
import 'package:mint/data/repository/firebase/firebase_booking_repository.dart'
    as _i12;
import 'package:mint/data/repository/firebase/firebase_filter_repository.dart'
    as _i42;
import 'package:mint/data/repository/firebase/firebase_notification_repository.dart'
    as _i49;
import 'package:mint/data/repository/firebase/firebase_payment_repository.dart'
    as _i53;
import 'package:mint/data/repository/firebase/firebase_specialist_repository.dart'
    as _i64;
import 'package:mint/domain/controller/applied_filter_controller.dart' as _i4;
import 'package:mint/domain/controller/booking_controller.dart' as _i10;
import 'package:mint/domain/controller/pick_up_filter_controller.dart' as _i60;
import 'package:mint/domain/controller/specialist_rating_controller.dart'
    as _i62;
import 'package:mint/domain/entity/booking_data/booking_data.dart' as _i15;
import 'package:mint/domain/entity/credit_card_model/credit_card_model.dart'
    as _i37;
import 'package:mint/domain/entity/filter_preferences/filter_preferences.dart'
    as _i21;
import 'package:mint/domain/entity/pick_up_filter/pick_up_filter.dart' as _i26;
import 'package:mint/domain/entity/review_model/review_model.dart' as _i24;
import 'package:mint/domain/entity/specialist_filter/specialist_filter.dart'
    as _i29;
import 'package:mint/domain/entity/specialist_work_info/specialist_work_info.dart'
    as _i34;
import 'package:mint/domain/entity/transaction_data/transaction_data.dart'
    as _i18;
import 'package:mint/domain/service/abstract/audio_record_service.dart' as _i8;
import 'package:mint/domain/service/abstract/booking_service.dart' as _i104;
import 'package:mint/domain/service/abstract/filter_service.dart' as _i43;
import 'package:mint/domain/service/abstract/notification_service.dart' as _i50;
import 'package:mint/domain/service/abstract/payment_service.dart' as _i54;
import 'package:mint/domain/service/abstract/phone_auth_service.dart' as _i58;
import 'package:mint/domain/service/abstract/specialist_service.dart' as _i65;
import 'package:mint/domain/service/audio_record_service_impl.dart' as _i9;
import 'package:mint/domain/service/firebase/firebase_booking_service.dart'
    as _i105;
import 'package:mint/domain/service/firebase/firebase_filter_service.dart'
    as _i44;
import 'package:mint/domain/service/firebase/firebase_notification_service.dart'
    as _i51;
import 'package:mint/domain/service/firebase/firebase_payment_service.dart'
    as _i55;
import 'package:mint/domain/service/firebase/firebase_phone_auth_service.dart'
    as _i59;
import 'package:mint/domain/service/firebase/firebase_specialist_service.dart'
    as _i66;
import 'package:mint/domain/usecase/add_review_use_case.dart' as _i75;
import 'package:mint/domain/usecase/add_to_favorite_use_case.dart' as _i76;
import 'package:mint/domain/usecase/booking_book_use_case.dart' as _i116;
import 'package:mint/domain/usecase/booking_cancel_use_case.dart' as _i117;
import 'package:mint/domain/usecase/booking_reschedule_use_case.dart' as _i118;
import 'package:mint/domain/usecase/credit_card_delete_use_case.dart' as _i80;
import 'package:mint/domain/usecase/credit_card_list_fetch_use_case.dart'
    as _i81;
import 'package:mint/domain/usecase/credit_card_save_use_case.dart' as _i82;
import 'package:mint/domain/usecase/delete_review_use_case.dart' as _i83;
import 'package:mint/domain/usecase/fetch_chat_room_use_case.dart' as _i40;
import 'package:mint/domain/usecase/fetch_favorite_list_use_case.dart' as _i85;
import 'package:mint/domain/usecase/fetch_pick_up_filter_use_case.dart' as _i86;
import 'package:mint/domain/usecase/fetch_previous_sessions_use_case.dart'
    as _i108;
import 'package:mint/domain/usecase/fetch_session_data_use_case.dart' as _i109;
import 'package:mint/domain/usecase/fetch_specialist_catalogue_use_case.dart'
    as _i87;
import 'package:mint/domain/usecase/fetch_specialist_filter_use_case.dart'
    as _i88;
import 'package:mint/domain/usecase/fetch_specialist_reviews_use_case.dart'
    as _i89;
import 'package:mint/domain/usecase/fetch_specialist_use_case.dart' as _i90;
import 'package:mint/domain/usecase/fetch_specialists_online_use_case.dart'
    as _i91;
import 'package:mint/domain/usecase/fetch_upcoming_sessions_use_case.dart'
    as _i110;
import 'package:mint/domain/usecase/get_booking_notifications_stream_use_case.dart'
    as _i92;
import 'package:mint/domain/usecase/get_chat_notifications_stream_use_case.dart'
    as _i93;
import 'package:mint/domain/usecase/get_current_user_use_case.dart' as _i45;
import 'package:mint/domain/usecase/initialize_audio_recorder_use_case.dart'
    as _i46;
import 'package:mint/domain/usecase/initialize_notifications_use_case.dart'
    as _i94;
import 'package:mint/domain/usecase/log_out_use_case.dart' as _i47;
import 'package:mint/domain/usecase/pin_code_change_use_case.dart' as _i61;
import 'package:mint/domain/usecase/remove_from_favorite_use_case.dart' as _i97;
import 'package:mint/domain/usecase/specialist_work_info_fetch_use_case.dart'
    as _i113;
import 'package:mint/domain/usecase/start_audio_record_use_case.dart' as _i68;
import 'package:mint/domain/usecase/stop_audio_record_use_case.dart' as _i69;
import 'package:mint/domain/usecase/transaction_pay_use_case.dart' as _i70;
import 'package:mint/domain/usecase/update_review_use_case.dart' as _i71;
import 'package:mint/domain/usecase/user_data_update_use_case.dart' as _i72;
import 'package:mint/domain/usecase/verify_otp_use_case.dart' as _i73;
import 'package:mint/domain/usecase/verify_phone_use_case.dart' as _i74;
import 'package:mint_core/mint_assembly.dart' as _i13;
import 'package:mint_core/mint_bloc.dart' as _i79;
import 'package:mint_core/mint_core.dart' as _i67;
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
    gh.factory<_i13.Factory<_i14.BookingDataDto, _i15.BookingData>>(
        () => _i16.BookingDataToDto());
    gh.factory<_i13.Factory<_i17.TransactionDataDto, _i18.TransactionData>>(
        () => _i19.TransactionDataToDto());
    gh.factory<_i13.Factory<_i20.FilterPreferencesDto, _i21.FilterPreferences>>(
        () => _i22.FilterPreferencesToDto());
    gh.factory<_i13.Factory<_i23.ReviewModelDto, _i24.ReviewModel>>(
        () => _i25.ReviewModelToDto());
    gh.factory<_i13.Factory<_i26.PickUpFilter, _i27.PickUpFilterDto>>(
        () => _i28.PickUpFilterFromDto());
    gh.factory<_i13.Factory<_i29.SpecialistFilter, _i30.SpecialistFilterDto>>(
        () => _i31.SpecialistFilterFromDto());
    gh.factory<
            _i13.Factory<_i32.Future<_i24.ReviewModel?>, _i23.ReviewModelDto>>(
        () => _i33.ReviewModelFromDto(gh<_i3.UserService>()));
    gh.factory<
            _i13.Factory<_i34.SpecialistWorkInfo, _i35.SpecialistWorkInfoDto>>(
        () => _i36.SpecialistWorkInfoFromDto());
    gh.factory<_i13.Factory<_i37.CreditCardModel, _i38.CreditCardModelDto>>(
        () => _i39.CreditCardModelFromDto());
    gh.factory<_i40.FetchChatRoomUseCase>(
        () => _i40.FetchChatRoomUseCase(gh<_i3.ChatService>()));
    gh.factory<_i41.FilterRepository>(
        () => _i42.FirebaseFilterRepository(gh<_i3.FirebaseInitializer>()));
    gh.factory<_i43.FilterService>(() => _i44.FirebaseFilterService(
          gh<_i41.FilterRepository>(),
          gh<_i13.Factory<_i29.SpecialistFilter, _i30.SpecialistFilterDto>>(),
          gh<_i13.Factory<_i26.PickUpFilter, _i27.PickUpFilterDto>>(),
        ));
    gh.factory<_i45.GetCurrentUserUseCase>(
        () => _i45.GetCurrentUserUseCase(gh<_i3.UserService>()));
    gh.factory<_i46.InitializeAudioRecorderUseCase>(() =>
        _i46.InitializeAudioRecorderUseCase(gh<_i8.AudioRecordService>()));
    gh.factory<_i47.LogOutUseCase>(
        () => _i47.LogOutUseCase(gh<_i3.UserService>()));
    gh.lazySingleton<_i48.NotificationRepository>(() =>
        _i49.FirebaseNotificationRepository(gh<_i3.FirebaseInitializer>()));
    gh.factory<_i50.NotificationService>(() =>
        _i51.FirebaseNotificationService(gh<_i48.NotificationRepository>()));
    gh.factory<_i52.PaymentRepository>(
        () => _i53.FirebasePaymentRepository(gh<_i3.FirebaseInitializer>()));
    gh.factory<_i54.PaymentService>(() => _i55.FirebasePaymentService(
          gh<_i52.PaymentRepository>(),
          gh<_i13.Factory<_i37.CreditCardModel, _i38.CreditCardModelDto>>(),
          gh<_i13.Factory<_i17.TransactionDataDto, _i18.TransactionData>>(),
        ));
    gh.factory<_i56.PhoneAuthRepository>(
        () => _i57.FirebaseAuthRepository(gh<_i3.FirebaseInitializer>()));
    gh.factory<_i58.PhoneAuthService>(
        () => _i59.FirebasePhoneAuthService(gh<_i56.PhoneAuthRepository>()));
    gh.lazySingleton<_i60.PickUpFilterController>(
        () => _i60.PickUpFilterController());
    gh.factory<_i61.PinCodeChangeUseCase>(
        () => _i61.PinCodeChangeUseCase(gh<_i3.UserService>()));
    gh.lazySingleton<_i62.SpecialistRatingController>(
        () => _i62.SpecialistRatingController());
    gh.factory<_i63.SpecialistRepository>(
        () => _i64.FirebaseSpecialistRepository(gh<_i3.FirebaseInitializer>()));
    gh.factory<_i65.SpecialistService>(() => _i66.FirebaseSpecialistService(
          gh<_i63.SpecialistRepository>(),
          gh<
              _i13.Factory<_i32.Future<_i67.SpecialistModel>,
                  _i67.SpecialistModelDto>>(),
          gh<_i13.Factory<_i20.FilterPreferencesDto, _i21.FilterPreferences>>(),
          gh<
              _i13.Factory<_i32.Future<_i24.ReviewModel?>,
                  _i23.ReviewModelDto>>(),
          gh<_i13.Factory<_i23.ReviewModelDto, _i24.ReviewModel>>(),
        ));
    gh.factory<_i68.StartAudioRecordUseCase>(
        () => _i68.StartAudioRecordUseCase(gh<_i8.AudioRecordService>()));
    gh.factory<_i69.StopAudioRecordUseCase>(
        () => _i69.StopAudioRecordUseCase(gh<_i8.AudioRecordService>()));
    gh.factory<_i70.TransactionPayUseCase>(
        () => _i70.TransactionPayUseCase(gh<_i54.PaymentService>()));
    gh.factory<_i71.UpdateReviewUseCase>(
        () => _i71.UpdateReviewUseCase(gh<_i65.SpecialistService>()));
    gh.factory<_i72.UserDataUpdateUseCase>(
        () => _i72.UserDataUpdateUseCase(gh<_i3.UserService>()));
    gh.factory<_i73.VerifyOtpUseCase>(
        () => _i73.VerifyOtpUseCase(gh<_i58.PhoneAuthService>()));
    gh.factory<_i74.VerifyPhoneUseCase>(
        () => _i74.VerifyPhoneUseCase(gh<_i58.PhoneAuthService>()));
    gh.factory<_i75.AddReviewUseCase>(
        () => _i75.AddReviewUseCase(gh<_i65.SpecialistService>()));
    gh.factory<_i76.AddToFavoriteUseCase>(
        () => _i76.AddToFavoriteUseCase(gh<_i65.SpecialistService>()));
    gh.factory<_i77.AudioRecordBloc>(() => _i77.AudioRecordBloc(
          gh<_i46.InitializeAudioRecorderUseCase>(),
          gh<_i68.StartAudioRecordUseCase>(),
          gh<_i69.StopAudioRecordUseCase>(),
        ));
    gh.factory<_i78.AuthBloc>(() => _i78.AuthBloc(
          gh<_i74.VerifyPhoneUseCase>(),
          gh<_i73.VerifyOtpUseCase>(),
          gh<_i79.UserController<_i67.PatientUser?>>(),
        ));
    gh.factory<_i80.CreditCardDeleteUseCase>(
        () => _i80.CreditCardDeleteUseCase(gh<_i54.PaymentService>()));
    gh.factory<_i81.CreditCardListFetchUseCase>(
        () => _i81.CreditCardListFetchUseCase(gh<_i54.PaymentService>()));
    gh.factory<_i82.CreditCardSaveUseCase>(
        () => _i82.CreditCardSaveUseCase(gh<_i54.PaymentService>()));
    gh.factory<_i83.DeleteReviewUseCase>(
        () => _i83.DeleteReviewUseCase(gh<_i65.SpecialistService>()));
    gh.factory<
            _i13.Factory<_i32.Future<_i15.BookingData?>, _i14.BookingDataDto>>(
        () => _i84.BookingDataFromDto(gh<_i65.SpecialistService>()));
    gh.factory<_i85.FetchFavoriteListUseCase>(
        () => _i85.FetchFavoriteListUseCase(gh<_i65.SpecialistService>()));
    gh.factory<_i86.FetchPickUpFilterUseCase>(
        () => _i86.FetchPickUpFilterUseCase(gh<_i43.FilterService>()));
    gh.factory<_i87.FetchSpecialistCatalogueUseCase>(() =>
        _i87.FetchSpecialistCatalogueUseCase(gh<_i65.SpecialistService>()));
    gh.factory<_i88.FetchSpecialistFilterUseCase>(
        () => _i88.FetchSpecialistFilterUseCase(gh<_i43.FilterService>()));
    gh.factory<_i89.FetchSpecialistReviewsUseCase>(
        () => _i89.FetchSpecialistReviewsUseCase(gh<_i65.SpecialistService>()));
    gh.factory<_i90.FetchSpecialistUseCase>(
        () => _i90.FetchSpecialistUseCase(gh<_i65.SpecialistService>()));
    gh.factory<_i91.FetchSpecialistsOnlineUseCase>(
        () => _i91.FetchSpecialistsOnlineUseCase(gh<_i65.SpecialistService>()));
    gh.factory<_i92.GetBookingNotificationsStreamUseCase>(() =>
        _i92.GetBookingNotificationsStreamUseCase(
            gh<_i50.NotificationService>()));
    gh.factory<_i93.GetChatNotificationsStreamUseCase>(() =>
        _i93.GetChatNotificationsStreamUseCase(gh<_i50.NotificationService>()));
    gh.factory<_i94.InitializeNotificationsUseCase>(() =>
        _i94.InitializeNotificationsUseCase(gh<_i50.NotificationService>()));
    gh.factory<_i95.PickUpSpecialistBloc>(() => _i95.PickUpSpecialistBloc(
          gh<_i86.FetchPickUpFilterUseCase>(),
          gh<_i60.PickUpFilterController>(),
        ));
    gh.factory<_i96.PinCodeBloc>(() => _i96.PinCodeBloc(
          gh<_i79.UserController<_i67.PatientUser?>>(),
          gh<_i61.PinCodeChangeUseCase>(),
        ));
    gh.factory<_i97.RemoveFromFavoriteUseCase>(
        () => _i97.RemoveFromFavoriteUseCase(gh<_i65.SpecialistService>()));
    gh.factory<_i98.ReviewBloc>(() => _i98.ReviewBloc(
          gh<_i89.FetchSpecialistReviewsUseCase>(),
          gh<_i75.AddReviewUseCase>(),
          gh<_i79.UserController<_i67.PatientUser?>>(),
          gh<_i62.SpecialistRatingController>(),
          gh<_i71.UpdateReviewUseCase>(),
          gh<_i83.DeleteReviewUseCase>(),
        ));
    gh.factory<_i99.SpecialistCatalogueBloc>(() => _i99.SpecialistCatalogueBloc(
          gh<_i87.FetchSpecialistCatalogueUseCase>(),
          gh<_i4.AppliedFilterController>(),
          gh<_i62.SpecialistRatingController>(),
        ));
    gh.factory<_i100.SpecialistFilterBloc>(() => _i100.SpecialistFilterBloc(
          gh<_i88.FetchSpecialistFilterUseCase>(),
          gh<_i4.AppliedFilterController>(),
          gh<_i60.PickUpFilterController>(),
        ));
    gh.factory<_i101.SpecialistOnlineBloc>(() => _i101.SpecialistOnlineBloc(
          gh<_i91.FetchSpecialistsOnlineUseCase>(),
          gh<_i62.SpecialistRatingController>(),
        ));
    gh.factory<_i102.TransactionBloc>(() => _i102.TransactionBloc(
          gh<_i70.TransactionPayUseCase>(),
          gh<_i79.UserController<_i67.PatientUser?>>(),
        ));
    gh.factory<_i103.UserBloc>(() => _i103.UserBloc(
          gh<_i45.GetCurrentUserUseCase>(),
          gh<_i47.LogOutUseCase>(),
          gh<_i72.UserDataUpdateUseCase>(),
          gh<_i79.UserController<_i67.PatientUser?>>(),
        ));
    gh.factory<_i104.BookingService>(() => _i105.FirebaseBookingService(
          gh<_i11.BookingRepository>(),
          gh<
              _i13.Factory<_i34.SpecialistWorkInfo,
                  _i35.SpecialistWorkInfoDto>>(),
          gh<_i13.Factory<_i14.BookingDataDto, _i15.BookingData>>(),
          gh<
              _i13.Factory<_i32.Future<_i15.BookingData?>,
                  _i14.BookingDataDto>>(),
        ));
    gh.factory<_i106.CreditCardBloc>(() => _i106.CreditCardBloc(
          gh<_i81.CreditCardListFetchUseCase>(),
          gh<_i82.CreditCardSaveUseCase>(),
          gh<_i80.CreditCardDeleteUseCase>(),
          gh<_i79.UserController<_i67.PatientUser?>>(),
        ));
    gh.factory<_i107.FavoriteBloc>(() => _i107.FavoriteBloc(
          gh<_i79.UserController<_i67.PatientUser?>>(),
          gh<_i85.FetchFavoriteListUseCase>(),
          gh<_i76.AddToFavoriteUseCase>(),
          gh<_i97.RemoveFromFavoriteUseCase>(),
        ));
    gh.factory<_i108.FetchPreviousSessionsUseCase>(
        () => _i108.FetchPreviousSessionsUseCase(gh<_i104.BookingService>()));
    gh.factory<_i109.FetchSessionDataUseCase>(
        () => _i109.FetchSessionDataUseCase(gh<_i104.BookingService>()));
    gh.factory<_i110.FetchUpcomingSessionsUseCase>(
        () => _i110.FetchUpcomingSessionsUseCase(gh<_i104.BookingService>()));
    gh.factory<_i111.NotificationsBloc>(() => _i111.NotificationsBloc(
          gh<_i94.InitializeNotificationsUseCase>(),
          gh<_i79.UserController<_i67.PatientUser?>>(),
          gh<_i3.FetchChatRoomUseCase>(),
          gh<_i90.FetchSpecialistUseCase>(),
          gh<_i109.FetchSessionDataUseCase>(),
          gh<_i93.GetChatNotificationsStreamUseCase>(),
          gh<_i92.GetBookingNotificationsStreamUseCase>(),
        ));
    gh.factory<_i112.PreviousSessionsBloc>(() => _i112.PreviousSessionsBloc(
          gh<_i108.FetchPreviousSessionsUseCase>(),
          gh<_i79.UserController<_i67.PatientUser?>>(),
        ));
    gh.factory<_i113.SpecialistWorkInfoFetchUseCase>(
        () => _i113.SpecialistWorkInfoFetchUseCase(gh<_i104.BookingService>()));
    gh.factory<_i114.UpcomingSessionsBloc>(() => _i114.UpcomingSessionsBloc(
          gh<_i110.FetchUpcomingSessionsUseCase>(),
          gh<_i79.UserController<_i67.PatientUser?>>(),
          gh<_i10.BookingController>(),
        ));
    gh.factory<_i115.WorkInfoBloc>(
        () => _i115.WorkInfoBloc(gh<_i113.SpecialistWorkInfoFetchUseCase>()));
    gh.factory<_i116.BookingBookUseCase>(
        () => _i116.BookingBookUseCase(gh<_i104.BookingService>()));
    gh.factory<_i117.BookingCancelUseCase>(
        () => _i117.BookingCancelUseCase(gh<_i104.BookingService>()));
    gh.factory<_i118.BookingRescheduleUseCase>(
        () => _i118.BookingRescheduleUseCase(gh<_i104.BookingService>()));
    gh.factory<_i119.BookingBloc>(() => _i119.BookingBloc(
          gh<_i116.BookingBookUseCase>(),
          gh<_i118.BookingRescheduleUseCase>(),
          gh<_i117.BookingCancelUseCase>(),
          gh<_i79.UserController<_i67.PatientUser?>>(),
          gh<_i10.BookingController>(),
        ));
    return this;
  }
}
