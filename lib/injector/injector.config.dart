// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i19;

import 'package:flutter_chat_types/flutter_chat_types.dart' as _i29;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mint/assembly/entity/booking_data_from_dto.dart' as _i101;
import 'package:mint/assembly/entity/chat_room_from_map.dart' as _i30;
import 'package:mint/assembly/entity/chat_user_data_from_map.dart' as _i34;
import 'package:mint/assembly/entity/credit_card_model_from_dto.dart' as _i33;
import 'package:mint/assembly/entity/pick_up_filter_from_dto.dart' as _i15;
import 'package:mint/assembly/entity/review_model_from_dto.dart' as _i22;
import 'package:mint/assembly/entity/specialist_filter_from_dto.dart' as _i28;
import 'package:mint/assembly/entity/specialist_work_info_from_dto.dart'
    as _i18;
import 'package:mint/assembly/model/booking_data_to_dto.dart' as _i37;
import 'package:mint/assembly/model/filter_preferences_to_dto.dart' as _i25;
import 'package:mint/assembly/model/review_model_to_dto.dart' as _i41;
import 'package:mint/assembly/model/transaction_data_to_dto.dart' as _i40;
import 'package:mint/bloc/audio_message/audio_message_cubit.dart' as _i88;
import 'package:mint/bloc/audio_record/audio_record_bloc.dart' as _i89;
import 'package:mint/bloc/auth/auth_bloc.dart' as _i90;
import 'package:mint/bloc/booking/booking_bloc.dart' as _i141;
import 'package:mint/bloc/chat/chat_bloc.dart' as _i127;
import 'package:mint/bloc/credit_card/credit_card_bloc.dart' as _i128;
import 'package:mint/bloc/favorite/favorite_bloc.dart' as _i129;
import 'package:mint/bloc/notifications/notifications_bloc.dart' as _i133;
import 'package:mint/bloc/pick_up_specialist/pick_up_specialist_bloc.dart'
    as _i114;
import 'package:mint/bloc/pin_code/pin_code_bloc.dart' as _i115;
import 'package:mint/bloc/previous_sessions/previous_sessions_bloc.dart'
    as _i134;
import 'package:mint/bloc/review/review_bloc.dart' as _i118;
import 'package:mint/bloc/specialist_catalogue/specialist_catalogue_bloc.dart'
    as _i120;
import 'package:mint/bloc/specialist_filter/specialist_filter_bloc.dart'
    as _i121;
import 'package:mint/bloc/specialist_online/specialist_online_bloc.dart'
    as _i122;
import 'package:mint/bloc/transaction/transaction_bloc.dart' as _i123;
import 'package:mint/bloc/upcoming_sessions/upcoming_sessions_bloc.dart'
    as _i136;
import 'package:mint/bloc/user/user_bloc.dart' as _i124;
import 'package:mint/bloc/work_info/work_info_bloc.dart' as _i137;
import 'package:mint/data/model/booking_data_dto/booking_data_dto.dart' as _i35;
import 'package:mint/data/model/credit_card_model_dto/credit_card_model_dto.dart'
    as _i32;
import 'package:mint/data/model/filter_preferences_dto/filter_preferences_dto.dart'
    as _i23;
import 'package:mint/data/model/pick_up_filter_dto/pick_up_filter_dto.dart'
    as _i14;
import 'package:mint/data/model/review_model_dto/review_model_dto.dart' as _i21;
import 'package:mint/data/model/specialist_filter_dto/specialist_filter_dto.dart'
    as _i27;
import 'package:mint/data/model/specialist_work_info_dto/specialist_work_info_dto.dart'
    as _i17;
import 'package:mint/data/model/transaction_data_dto/transaction_data_dto.dart'
    as _i38;
import 'package:mint/data/repository/abstract/audio_record_repository.dart'
    as _i5;
import 'package:mint/data/repository/abstract/booking_repository.dart' as _i10;
import 'package:mint/data/repository/abstract/chat_repository.dart' as _i91;
import 'package:mint/data/repository/abstract/file_repository.dart' as _i42;
import 'package:mint/data/repository/abstract/filter_repository.dart' as _i46;
import 'package:mint/data/repository/abstract/notification_repository.dart'
    as _i54;
import 'package:mint/data/repository/abstract/payment_repository.dart' as _i59;
import 'package:mint/data/repository/abstract/phone_auth_repository.dart'
    as _i63;
import 'package:mint/data/repository/abstract/specialist_repository.dart'
    as _i73;
import 'package:mint/data/repository/audio_record_repository_impl.dart' as _i6;
import 'package:mint/data/repository/file_repository_impl.dart' as _i43;
import 'package:mint/data/repository/firebase/firebase_auth_repository.dart'
    as _i64;
import 'package:mint/data/repository/firebase/firebase_booking_repository.dart'
    as _i11;
import 'package:mint/data/repository/firebase/firebase_chat_repository.dart'
    as _i92;
import 'package:mint/data/repository/firebase/firebase_filter_repository.dart'
    as _i47;
import 'package:mint/data/repository/firebase/firebase_notification_repository.dart'
    as _i55;
import 'package:mint/data/repository/firebase/firebase_payment_repository.dart'
    as _i60;
import 'package:mint/data/repository/firebase/firebase_specialist_repository.dart'
    as _i74;
import 'package:mint/domain/controller/applied_filter_controller.dart' as _i4;
import 'package:mint/domain/controller/booking_controller.dart' as _i9;
import 'package:mint/domain/controller/pick_up_filter_controller.dart' as _i69;
import 'package:mint/domain/controller/specialist_rating_controller.dart'
    as _i72;
import 'package:mint/domain/controller/user_controller.dart' as _i82;
import 'package:mint/domain/entity/booking_data/booking_data.dart' as _i36;
import 'package:mint/domain/entity/credit_card_model/credit_card_model.dart'
    as _i31;
import 'package:mint/domain/entity/filter_preferences/filter_preferences.dart'
    as _i24;
import 'package:mint/domain/entity/pick_up_filter/pick_up_filter.dart' as _i13;
import 'package:mint/domain/entity/review_model/review_model.dart' as _i20;
import 'package:mint/domain/entity/specialist_filter/specialist_filter.dart'
    as _i26;
import 'package:mint/domain/entity/specialist_work_info/specialist_work_info.dart'
    as _i16;
import 'package:mint/domain/entity/transaction_data/transaction_data.dart'
    as _i39;
import 'package:mint/domain/service/abstract/audio_record_service.dart' as _i7;
import 'package:mint/domain/service/abstract/booking_service.dart' as _i125;
import 'package:mint/domain/service/abstract/chat_service.dart' as _i93;
import 'package:mint/domain/service/abstract/file_service.dart' as _i44;
import 'package:mint/domain/service/abstract/filter_service.dart' as _i48;
import 'package:mint/domain/service/abstract/notification_service.dart' as _i56;
import 'package:mint/domain/service/abstract/payment_service.dart' as _i61;
import 'package:mint/domain/service/abstract/phone_auth_service.dart' as _i65;
import 'package:mint/domain/service/abstract/specialist_service.dart' as _i75;
import 'package:mint/domain/service/audio_record_service_impl.dart' as _i8;
import 'package:mint/domain/service/file_service_impl.dart' as _i45;
import 'package:mint/domain/service/firebase/firebase_booking_service.dart'
    as _i126;
import 'package:mint/domain/service/firebase/firebase_chat_service.dart'
    as _i94;
import 'package:mint/domain/service/firebase/firebase_filter_service.dart'
    as _i49;
import 'package:mint/domain/service/firebase/firebase_notification_service.dart'
    as _i57;
import 'package:mint/domain/service/firebase/firebase_payment_service.dart'
    as _i62;
import 'package:mint/domain/service/firebase/firebase_phone_auth_service.dart'
    as _i66;
import 'package:mint/domain/service/firebase/firebase_specialist_service.dart'
    as _i76;
import 'package:mint/domain/usecase/add_review_use_case.dart' as _i86;
import 'package:mint/domain/usecase/add_to_favorite_use_case.dart' as _i87;
import 'package:mint/domain/usecase/booking_book_use_case.dart' as _i138;
import 'package:mint/domain/usecase/booking_cancel_use_case.dart' as _i139;
import 'package:mint/domain/usecase/booking_reschedule_use_case.dart' as _i140;
import 'package:mint/domain/usecase/create_chat_room_use_case.dart' as _i95;
import 'package:mint/domain/usecase/credit_card_delete_use_case.dart' as _i96;
import 'package:mint/domain/usecase/credit_card_list_fetch_use_case.dart'
    as _i97;
import 'package:mint/domain/usecase/credit_card_save_use_case.dart' as _i98;
import 'package:mint/domain/usecase/delete_message_use_case.dart' as _i99;
import 'package:mint/domain/usecase/delete_review_use_case.dart' as _i100;
import 'package:mint/domain/usecase/fetch_chat_room_use_case.dart' as _i102;
import 'package:mint/domain/usecase/fetch_favorite_list_use_case.dart' as _i103;
import 'package:mint/domain/usecase/fetch_pick_up_filter_use_case.dart'
    as _i104;
import 'package:mint/domain/usecase/fetch_previous_sessions_use_case.dart'
    as _i130;
import 'package:mint/domain/usecase/fetch_session_data_use_case.dart' as _i131;
import 'package:mint/domain/usecase/fetch_specialist_catalogue_use_case.dart'
    as _i105;
import 'package:mint/domain/usecase/fetch_specialist_filter_use_case.dart'
    as _i106;
import 'package:mint/domain/usecase/fetch_specialist_reviews_use_case.dart'
    as _i107;
import 'package:mint/domain/usecase/fetch_specialist_use_case.dart' as _i108;
import 'package:mint/domain/usecase/fetch_specialists_online_use_case.dart'
    as _i109;
import 'package:mint/domain/usecase/fetch_upcoming_sessions_use_case.dart'
    as _i132;
import 'package:mint/domain/usecase/get_booking_notifications_stream_use_case.dart'
    as _i110;
import 'package:mint/domain/usecase/get_chat_notifications_stream_use_case.dart'
    as _i111;
import 'package:mint/domain/usecase/get_current_user_use_case.dart' as _i50;
import 'package:mint/domain/usecase/get_messages_use_case.dart' as _i112;
import 'package:mint/domain/usecase/initialize_audio_recorder_use_case.dart'
    as _i51;
import 'package:mint/domain/usecase/initialize_notifications_use_case.dart'
    as _i113;
import 'package:mint/domain/usecase/load_file_use_case.dart' as _i52;
import 'package:mint/domain/usecase/log_out_use_case.dart' as _i53;
import 'package:mint/domain/usecase/open_file_use_case.dart' as _i58;
import 'package:mint/domain/usecase/pick_file_use_case.dart' as _i67;
import 'package:mint/domain/usecase/pick_image_use_case.dart' as _i68;
import 'package:mint/domain/usecase/pin_code_change_use_case.dart' as _i70;
import 'package:mint/domain/usecase/preview_data_fetched_use_case.dart'
    as _i116;
import 'package:mint/domain/usecase/remove_from_favorite_use_case.dart'
    as _i117;
import 'package:mint/domain/usecase/save_audio_use_case.dart' as _i71;
import 'package:mint/domain/usecase/send_message_use_case.dart' as _i119;
import 'package:mint/domain/usecase/specialist_work_info_fetch_use_case.dart'
    as _i135;
import 'package:mint/domain/usecase/start_audio_record_use_case.dart' as _i78;
import 'package:mint/domain/usecase/stop_audio_record_use_case.dart' as _i79;
import 'package:mint/domain/usecase/transaction_pay_use_case.dart' as _i80;
import 'package:mint/domain/usecase/update_review_use_case.dart' as _i81;
import 'package:mint/domain/usecase/user_data_update_use_case.dart' as _i83;
import 'package:mint/domain/usecase/verify_otp_use_case.dart' as _i84;
import 'package:mint/domain/usecase/verify_phone_use_case.dart' as _i85;
import 'package:mint_core/mint_assembly.dart' as _i12;
import 'package:mint_core/mint_core.dart' as _i77;
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
    gh.factory<_i5.AudioRecordRepository>(
        () => _i6.AudioRecordRepositoryImpl());
    gh.factory<_i7.AudioRecordService>(
        () => _i8.AudioRecordServiceImpl(gh<_i5.AudioRecordRepository>()));
    gh.lazySingleton<_i9.BookingController>(() => _i9.BookingController());
    gh.factory<_i10.BookingRepository>(
        () => _i11.FirebaseBookingRepository(gh<_i3.FirebaseInitializer>()));
    gh.factory<_i12.Factory<_i13.PickUpFilter, _i14.PickUpFilterDto>>(
        () => _i15.PickUpFilterFromDto());
    gh.factory<
            _i12.Factory<_i16.SpecialistWorkInfo, _i17.SpecialistWorkInfoDto>>(
        () => _i18.SpecialistWorkInfoFromDto());
    gh.factory<
            _i12.Factory<_i19.Future<_i20.ReviewModel?>, _i21.ReviewModelDto>>(
        () => _i22.ReviewModelFromDto(gh<_i3.UserService>()));
    gh.factory<_i12.Factory<_i23.FilterPreferencesDto, _i24.FilterPreferences>>(
        () => _i25.FilterPreferencesToDto());
    gh.factory<_i12.Factory<_i26.SpecialistFilter, _i27.SpecialistFilterDto>>(
        () => _i28.SpecialistFilterFromDto());
    gh.factory<_i12.Factory<_i29.Room?, Map<String, dynamic>>>(
        () => _i30.ChatRoomFromMap());
    gh.factory<_i12.Factory<_i31.CreditCardModel, _i32.CreditCardModelDto>>(
        () => _i33.CreditCardModelFromDto());
    gh.factory<_i12.Factory<_i29.User, Map<String, dynamic>>>(
        () => _i34.ChatUserDataFromMap());
    gh.factory<_i12.Factory<_i35.BookingDataDto, _i36.BookingData>>(
        () => _i37.BookingDataToDto());
    gh.factory<_i12.Factory<_i38.TransactionDataDto, _i39.TransactionData>>(
        () => _i40.TransactionDataToDto());
    gh.factory<_i12.Factory<_i21.ReviewModelDto, _i20.ReviewModel>>(
        () => _i41.ReviewModelToDto());
    gh.factory<_i42.FileRepository>(() => _i43.FileRepositoryImpl());
    gh.factory<_i44.FileService>(
        () => _i45.FileServiceImpl(gh<_i42.FileRepository>()));
    gh.factory<_i46.FilterRepository>(
        () => _i47.FirebaseFilterRepository(gh<_i3.FirebaseInitializer>()));
    gh.factory<_i48.FilterService>(() => _i49.FirebaseFilterService(
          gh<_i46.FilterRepository>(),
          gh<_i12.Factory<_i26.SpecialistFilter, _i27.SpecialistFilterDto>>(),
          gh<_i12.Factory<_i13.PickUpFilter, _i14.PickUpFilterDto>>(),
        ));
    gh.factory<_i50.GetCurrentUserUseCase>(
        () => _i50.GetCurrentUserUseCase(gh<_i3.UserService>()));
    gh.factory<_i51.InitializeAudioRecorderUseCase>(() =>
        _i51.InitializeAudioRecorderUseCase(gh<_i7.AudioRecordService>()));
    gh.factory<_i52.LoadFileUseCase>(
        () => _i52.LoadFileUseCase(gh<_i44.FileService>()));
    gh.factory<_i53.LogOutUseCase>(
        () => _i53.LogOutUseCase(gh<_i3.UserService>()));
    gh.lazySingleton<_i54.NotificationRepository>(() =>
        _i55.FirebaseNotificationRepository(gh<_i3.FirebaseInitializer>()));
    gh.factory<_i56.NotificationService>(() =>
        _i57.FirebaseNotificationService(gh<_i54.NotificationRepository>()));
    gh.factory<_i58.OpenFileUseCase>(
        () => _i58.OpenFileUseCase(gh<_i44.FileService>()));
    gh.factory<_i59.PaymentRepository>(
        () => _i60.FirebasePaymentRepository(gh<_i3.FirebaseInitializer>()));
    gh.factory<_i61.PaymentService>(() => _i62.FirebasePaymentService(
          gh<_i59.PaymentRepository>(),
          gh<_i12.Factory<_i31.CreditCardModel, _i32.CreditCardModelDto>>(),
          gh<_i12.Factory<_i38.TransactionDataDto, _i39.TransactionData>>(),
        ));
    gh.factory<_i63.PhoneAuthRepository>(
        () => _i64.FirebaseAuthRepository(gh<_i3.FirebaseInitializer>()));
    gh.factory<_i65.PhoneAuthService>(
        () => _i66.FirebasePhoneAuthService(gh<_i63.PhoneAuthRepository>()));
    gh.factory<_i67.PickFileUseCase>(
        () => _i67.PickFileUseCase(gh<_i44.FileService>()));
    gh.factory<_i68.PickImageUseCase>(
        () => _i68.PickImageUseCase(gh<_i44.FileService>()));
    gh.lazySingleton<_i69.PickUpFilterController>(
        () => _i69.PickUpFilterController());
    gh.factory<_i70.PinCodeChangeUseCase>(
        () => _i70.PinCodeChangeUseCase(gh<_i3.UserService>()));
    gh.factory<_i71.SaveAudioUseCase>(
        () => _i71.SaveAudioUseCase(gh<_i44.FileService>()));
    gh.lazySingleton<_i72.SpecialistRatingController>(
        () => _i72.SpecialistRatingController());
    gh.factory<_i73.SpecialistRepository>(
        () => _i74.FirebaseSpecialistRepository(gh<_i3.FirebaseInitializer>()));
    gh.factory<_i75.SpecialistService>(() => _i76.FirebaseSpecialistService(
          gh<_i73.SpecialistRepository>(),
          gh<
              _i12.Factory<_i19.Future<_i77.SpecialistModel>,
                  _i77.SpecialistModelDto>>(),
          gh<_i12.Factory<_i23.FilterPreferencesDto, _i24.FilterPreferences>>(),
          gh<
              _i12.Factory<_i19.Future<_i20.ReviewModel?>,
                  _i21.ReviewModelDto>>(),
          gh<_i12.Factory<_i21.ReviewModelDto, _i20.ReviewModel>>(),
        ));
    gh.factory<_i78.StartAudioRecordUseCase>(
        () => _i78.StartAudioRecordUseCase(gh<_i7.AudioRecordService>()));
    gh.factory<_i79.StopAudioRecordUseCase>(
        () => _i79.StopAudioRecordUseCase(gh<_i7.AudioRecordService>()));
    gh.factory<_i80.TransactionPayUseCase>(
        () => _i80.TransactionPayUseCase(gh<_i61.PaymentService>()));
    gh.factory<_i81.UpdateReviewUseCase>(
        () => _i81.UpdateReviewUseCase(gh<_i75.SpecialistService>()));
    gh.lazySingleton<_i82.UserController>(() => _i82.UserController());
    gh.factory<_i83.UserDataUpdateUseCase>(
        () => _i83.UserDataUpdateUseCase(gh<_i3.UserService>()));
    gh.factory<_i84.VerifyOtpUseCase>(
        () => _i84.VerifyOtpUseCase(gh<_i65.PhoneAuthService>()));
    gh.factory<_i85.VerifyPhoneUseCase>(
        () => _i85.VerifyPhoneUseCase(gh<_i65.PhoneAuthService>()));
    gh.factory<_i86.AddReviewUseCase>(
        () => _i86.AddReviewUseCase(gh<_i75.SpecialistService>()));
    gh.factory<_i87.AddToFavoriteUseCase>(
        () => _i87.AddToFavoriteUseCase(gh<_i75.SpecialistService>()));
    gh.factory<_i88.AudioMessageCubit>(
        () => _i88.AudioMessageCubit(gh<_i52.LoadFileUseCase>()));
    gh.factory<_i89.AudioRecordBloc>(() => _i89.AudioRecordBloc(
          gh<_i51.InitializeAudioRecorderUseCase>(),
          gh<_i78.StartAudioRecordUseCase>(),
          gh<_i79.StopAudioRecordUseCase>(),
        ));
    gh.factory<_i90.AuthBloc>(() => _i90.AuthBloc(
          gh<_i85.VerifyPhoneUseCase>(),
          gh<_i84.VerifyOtpUseCase>(),
          gh<_i82.UserController>(),
        ));
    gh.factory<_i91.ChatRepository>(() => _i92.FirebaseChatRepository(
          gh<_i3.FirebaseInitializer>(),
          gh<_i12.Factory<_i29.User, Map<String, dynamic>>>(),
        ));
    gh.factory<_i93.ChatService>(() => _i94.FirebaseChatService(
          gh<_i91.ChatRepository>(),
          gh<_i3.StorageService>(),
          gh<_i44.FileService>(),
          gh<_i12.Factory<_i29.Room?, Map<String, dynamic>>>(),
        ));
    gh.factory<_i95.CreateChatRoomUseCase>(
        () => _i95.CreateChatRoomUseCase(gh<_i93.ChatService>()));
    gh.factory<_i96.CreditCardDeleteUseCase>(
        () => _i96.CreditCardDeleteUseCase(gh<_i61.PaymentService>()));
    gh.factory<_i97.CreditCardListFetchUseCase>(
        () => _i97.CreditCardListFetchUseCase(gh<_i61.PaymentService>()));
    gh.factory<_i98.CreditCardSaveUseCase>(
        () => _i98.CreditCardSaveUseCase(gh<_i61.PaymentService>()));
    gh.factory<_i99.DeleteMessageUseCase>(
        () => _i99.DeleteMessageUseCase(gh<_i93.ChatService>()));
    gh.factory<_i100.DeleteReviewUseCase>(
        () => _i100.DeleteReviewUseCase(gh<_i75.SpecialistService>()));
    gh.factory<
            _i12.Factory<_i19.Future<_i36.BookingData?>, _i35.BookingDataDto>>(
        () => _i101.BookingDataFromDto(gh<_i75.SpecialistService>()));
    gh.factory<_i102.FetchChatRoomUseCase>(
        () => _i102.FetchChatRoomUseCase(gh<_i93.ChatService>()));
    gh.factory<_i103.FetchFavoriteListUseCase>(
        () => _i103.FetchFavoriteListUseCase(gh<_i75.SpecialistService>()));
    gh.factory<_i104.FetchPickUpFilterUseCase>(
        () => _i104.FetchPickUpFilterUseCase(gh<_i48.FilterService>()));
    gh.factory<_i105.FetchSpecialistCatalogueUseCase>(() =>
        _i105.FetchSpecialistCatalogueUseCase(gh<_i75.SpecialistService>()));
    gh.factory<_i106.FetchSpecialistFilterUseCase>(
        () => _i106.FetchSpecialistFilterUseCase(gh<_i48.FilterService>()));
    gh.factory<_i107.FetchSpecialistReviewsUseCase>(() =>
        _i107.FetchSpecialistReviewsUseCase(gh<_i75.SpecialistService>()));
    gh.factory<_i108.FetchSpecialistUseCase>(
        () => _i108.FetchSpecialistUseCase(gh<_i75.SpecialistService>()));
    gh.factory<_i109.FetchSpecialistsOnlineUseCase>(() =>
        _i109.FetchSpecialistsOnlineUseCase(gh<_i75.SpecialistService>()));
    gh.factory<_i110.GetBookingNotificationsStreamUseCase>(() =>
        _i110.GetBookingNotificationsStreamUseCase(
            gh<_i56.NotificationService>()));
    gh.factory<_i111.GetChatNotificationsStreamUseCase>(() =>
        _i111.GetChatNotificationsStreamUseCase(
            gh<_i56.NotificationService>()));
    gh.factory<_i112.GetMessagesUseCase>(
        () => _i112.GetMessagesUseCase(gh<_i93.ChatService>()));
    gh.factory<_i113.InitializeNotificationsUseCase>(() =>
        _i113.InitializeNotificationsUseCase(gh<_i56.NotificationService>()));
    gh.factory<_i114.PickUpSpecialistBloc>(() => _i114.PickUpSpecialistBloc(
          gh<_i104.FetchPickUpFilterUseCase>(),
          gh<_i69.PickUpFilterController>(),
        ));
    gh.factory<_i115.PinCodeBloc>(() => _i115.PinCodeBloc(
          gh<_i82.UserController>(),
          gh<_i70.PinCodeChangeUseCase>(),
        ));
    gh.factory<_i116.PreviewDataFetchedUseCase>(
        () => _i116.PreviewDataFetchedUseCase(gh<_i93.ChatService>()));
    gh.factory<_i117.RemoveFromFavoriteUseCase>(
        () => _i117.RemoveFromFavoriteUseCase(gh<_i75.SpecialistService>()));
    gh.factory<_i118.ReviewBloc>(() => _i118.ReviewBloc(
          gh<_i107.FetchSpecialistReviewsUseCase>(),
          gh<_i86.AddReviewUseCase>(),
          gh<_i82.UserController>(),
          gh<_i72.SpecialistRatingController>(),
          gh<_i81.UpdateReviewUseCase>(),
          gh<_i100.DeleteReviewUseCase>(),
        ));
    gh.factory<_i119.SendMessageUseCase>(
        () => _i119.SendMessageUseCase(gh<_i93.ChatService>()));
    gh.factory<_i120.SpecialistCatalogueBloc>(
        () => _i120.SpecialistCatalogueBloc(
              gh<_i105.FetchSpecialistCatalogueUseCase>(),
              gh<_i4.AppliedFilterController>(),
              gh<_i72.SpecialistRatingController>(),
            ));
    gh.factory<_i121.SpecialistFilterBloc>(() => _i121.SpecialistFilterBloc(
          gh<_i106.FetchSpecialistFilterUseCase>(),
          gh<_i4.AppliedFilterController>(),
          gh<_i69.PickUpFilterController>(),
        ));
    gh.factory<_i122.SpecialistOnlineBloc>(() => _i122.SpecialistOnlineBloc(
          gh<_i109.FetchSpecialistsOnlineUseCase>(),
          gh<_i72.SpecialistRatingController>(),
        ));
    gh.factory<_i123.TransactionBloc>(() => _i123.TransactionBloc(
          gh<_i80.TransactionPayUseCase>(),
          gh<_i82.UserController>(),
        ));
    gh.factory<_i124.UserBloc>(() => _i124.UserBloc(
          gh<_i50.GetCurrentUserUseCase>(),
          gh<_i53.LogOutUseCase>(),
          gh<_i83.UserDataUpdateUseCase>(),
          gh<_i82.UserController>(),
        ));
    gh.factory<_i125.BookingService>(() => _i126.FirebaseBookingService(
          gh<_i10.BookingRepository>(),
          gh<
              _i12.Factory<_i16.SpecialistWorkInfo,
                  _i17.SpecialistWorkInfoDto>>(),
          gh<_i12.Factory<_i35.BookingDataDto, _i36.BookingData>>(),
          gh<
              _i12.Factory<_i19.Future<_i36.BookingData?>,
                  _i35.BookingDataDto>>(),
        ));
    gh.factory<_i127.ChatBloc>(() => _i127.ChatBloc(
          gh<_i82.UserController>(),
          gh<_i112.GetMessagesUseCase>(),
          gh<_i95.CreateChatRoomUseCase>(),
          gh<_i119.SendMessageUseCase>(),
          gh<_i99.DeleteMessageUseCase>(),
          gh<_i116.PreviewDataFetchedUseCase>(),
          gh<_i68.PickImageUseCase>(),
          gh<_i67.PickFileUseCase>(),
          gh<_i52.LoadFileUseCase>(),
          gh<_i58.OpenFileUseCase>(),
          gh<_i71.SaveAudioUseCase>(),
        ));
    gh.factory<_i128.CreditCardBloc>(() => _i128.CreditCardBloc(
          gh<_i97.CreditCardListFetchUseCase>(),
          gh<_i98.CreditCardSaveUseCase>(),
          gh<_i96.CreditCardDeleteUseCase>(),
          gh<_i82.UserController>(),
        ));
    gh.factory<_i129.FavoriteBloc>(() => _i129.FavoriteBloc(
          gh<_i82.UserController>(),
          gh<_i103.FetchFavoriteListUseCase>(),
          gh<_i87.AddToFavoriteUseCase>(),
          gh<_i117.RemoveFromFavoriteUseCase>(),
        ));
    gh.factory<_i130.FetchPreviousSessionsUseCase>(
        () => _i130.FetchPreviousSessionsUseCase(gh<_i125.BookingService>()));
    gh.factory<_i131.FetchSessionDataUseCase>(
        () => _i131.FetchSessionDataUseCase(gh<_i125.BookingService>()));
    gh.factory<_i132.FetchUpcomingSessionsUseCase>(
        () => _i132.FetchUpcomingSessionsUseCase(gh<_i125.BookingService>()));
    gh.factory<_i133.NotificationsBloc>(() => _i133.NotificationsBloc(
          gh<_i113.InitializeNotificationsUseCase>(),
          gh<_i82.UserController>(),
          gh<_i102.FetchChatRoomUseCase>(),
          gh<_i108.FetchSpecialistUseCase>(),
          gh<_i131.FetchSessionDataUseCase>(),
          gh<_i111.GetChatNotificationsStreamUseCase>(),
          gh<_i110.GetBookingNotificationsStreamUseCase>(),
        ));
    gh.factory<_i134.PreviousSessionsBloc>(() => _i134.PreviousSessionsBloc(
          gh<_i130.FetchPreviousSessionsUseCase>(),
          gh<_i82.UserController>(),
        ));
    gh.factory<_i135.SpecialistWorkInfoFetchUseCase>(
        () => _i135.SpecialistWorkInfoFetchUseCase(gh<_i125.BookingService>()));
    gh.factory<_i136.UpcomingSessionsBloc>(() => _i136.UpcomingSessionsBloc(
          gh<_i132.FetchUpcomingSessionsUseCase>(),
          gh<_i82.UserController>(),
          gh<_i9.BookingController>(),
        ));
    gh.factory<_i137.WorkInfoBloc>(
        () => _i137.WorkInfoBloc(gh<_i135.SpecialistWorkInfoFetchUseCase>()));
    gh.factory<_i138.BookingBookUseCase>(
        () => _i138.BookingBookUseCase(gh<_i125.BookingService>()));
    gh.factory<_i139.BookingCancelUseCase>(
        () => _i139.BookingCancelUseCase(gh<_i125.BookingService>()));
    gh.factory<_i140.BookingRescheduleUseCase>(
        () => _i140.BookingRescheduleUseCase(gh<_i125.BookingService>()));
    gh.factory<_i141.BookingBloc>(() => _i141.BookingBloc(
          gh<_i138.BookingBookUseCase>(),
          gh<_i140.BookingRescheduleUseCase>(),
          gh<_i139.BookingCancelUseCase>(),
          gh<_i82.UserController>(),
          gh<_i9.BookingController>(),
        ));
    return this;
  }
}
