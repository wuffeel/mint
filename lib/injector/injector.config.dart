// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i95;

import 'package:flutter_chat_types/flutter_chat_types.dart' as _i32;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mint/assembly/entity/booking_data_from_dto.dart' as _i129;
import 'package:mint/assembly/entity/chat_room_from_map.dart' as _i34;
import 'package:mint/assembly/entity/chat_user_data_from_map.dart' as _i33;
import 'package:mint/assembly/entity/credit_card_model_from_dto.dart' as _i14;
import 'package:mint/assembly/entity/pick_up_filter_from_dto.dart' as _i37;
import 'package:mint/assembly/entity/review_model_from_dto.dart' as _i118;
import 'package:mint/assembly/entity/specialist_filter_from_dto.dart' as _i17;
import 'package:mint/assembly/entity/specialist_model_from_dto.dart' as _i98;
import 'package:mint/assembly/entity/specialist_work_info_from_dto.dart'
    as _i40;
import 'package:mint/assembly/entity/user_model_from_dto.dart' as _i101;
import 'package:mint/assembly/factory.dart' as _i11;
import 'package:mint/assembly/model/booking_data_to_dto.dart' as _i31;
import 'package:mint/assembly/model/filter_preferences_to_dto.dart' as _i22;
import 'package:mint/assembly/model/review_model_to_dto.dart' as _i25;
import 'package:mint/assembly/model/transaction_data_to_dto.dart' as _i28;
import 'package:mint/assembly/model/user_model_to_dto.dart' as _i100;
import 'package:mint/assembly/modified_user_dto_to_map.dart' as _i19;
import 'package:mint/bloc/audio_message/audio_message_cubit.dart' as _i83;
import 'package:mint/bloc/audio_record/audio_record_bloc.dart' as _i84;
import 'package:mint/bloc/auth/auth_bloc.dart' as _i85;
import 'package:mint/bloc/booking/booking_bloc.dart' as _i155;
import 'package:mint/bloc/chat/chat_bloc.dart' as _i116;
import 'package:mint/bloc/credit_card/credit_card_bloc.dart' as _i117;
import 'package:mint/bloc/favorite/favorite_bloc.dart' as _i143;
import 'package:mint/bloc/notifications/notifications_bloc.dart' as _i147;
import 'package:mint/bloc/pick_up_specialist/pick_up_specialist_bloc.dart'
    as _i109;
import 'package:mint/bloc/pin_code/pin_code_bloc.dart' as _i135;
import 'package:mint/bloc/previous_sessions/previous_sessions_bloc.dart'
    as _i148;
import 'package:mint/bloc/review/review_bloc.dart' as _i137;
import 'package:mint/bloc/specialist_catalogue/specialist_catalogue_bloc.dart'
    as _i138;
import 'package:mint/bloc/specialist_filter/specialist_filter_bloc.dart'
    as _i112;
import 'package:mint/bloc/specialist_online/specialist_online_bloc.dart'
    as _i139;
import 'package:mint/bloc/transaction/transaction_bloc.dart' as _i113;
import 'package:mint/bloc/upcoming_sessions/upcoming_sessions_bloc.dart'
    as _i150;
import 'package:mint/bloc/user/user_bloc.dart' as _i140;
import 'package:mint/bloc/work_info/work_info_bloc.dart' as _i151;
import 'package:mint/data/model/booking_data_dto/booking_data_dto.dart' as _i29;
import 'package:mint/data/model/credit_card_model_dto/credit_card_model_dto.dart'
    as _i13;
import 'package:mint/data/model/filter_preferences_dto/filter_preferences_dto.dart'
    as _i20;
import 'package:mint/data/model/pick_up_filter_dto/pick_up_filter_dto.dart'
    as _i36;
import 'package:mint/data/model/review_model_dto/review_model_dto.dart' as _i23;
import 'package:mint/data/model/specialist_filter_dto/specialist_filter_dto.dart'
    as _i16;
import 'package:mint/data/model/specialist_model_dto/specialist_model_dto.dart'
    as _i97;
import 'package:mint/data/model/specialist_work_info_dto/specialist_work_info_dto.dart'
    as _i39;
import 'package:mint/data/model/transaction_data_dto/transaction_data_dto.dart'
    as _i26;
import 'package:mint/data/model/user_model_dto/user_model_dto.dart' as _i18;
import 'package:mint/data/repository/abstract/audio_record_repository.dart'
    as _i4;
import 'package:mint/data/repository/abstract/booking_repository.dart' as _i9;
import 'package:mint/data/repository/abstract/chat_repository.dart' as _i86;
import 'package:mint/data/repository/abstract/file_repository.dart' as _i41;
import 'package:mint/data/repository/abstract/filter_repository.dart' as _i45;
import 'package:mint/data/repository/abstract/notification_repository.dart'
    as _i51;
import 'package:mint/data/repository/abstract/payment_repository.dart' as _i56;
import 'package:mint/data/repository/abstract/phone_auth_repository.dart'
    as _i60;
import 'package:mint/data/repository/abstract/specialist_repository.dart'
    as _i69;
import 'package:mint/data/repository/abstract/storage_repository.dart' as _i73;
import 'package:mint/data/repository/abstract/user_repository.dart' as _i79;
import 'package:mint/data/repository/audio_record_repository_impl.dart' as _i5;
import 'package:mint/data/repository/file_repository_impl.dart' as _i42;
import 'package:mint/data/repository/firebase/firebase_auth_repository.dart'
    as _i61;
import 'package:mint/data/repository/firebase/firebase_booking_repository.dart'
    as _i10;
import 'package:mint/data/repository/firebase/firebase_chat_repository.dart'
    as _i87;
import 'package:mint/data/repository/firebase/firebase_filter_repository.dart'
    as _i46;
import 'package:mint/data/repository/firebase/firebase_notification_repository.dart'
    as _i52;
import 'package:mint/data/repository/firebase/firebase_payment_repository.dart'
    as _i57;
import 'package:mint/data/repository/firebase/firebase_specialist_repository.dart'
    as _i70;
import 'package:mint/data/repository/firebase/firebase_storage_repository.dart'
    as _i74;
import 'package:mint/data/repository/firebase/firebase_user_repository.dart'
    as _i80;
import 'package:mint/domain/controller/applied_filter_controller.dart' as _i3;
import 'package:mint/domain/controller/booking_controller.dart' as _i8;
import 'package:mint/domain/controller/pick_up_filter_controller.dart' as _i66;
import 'package:mint/domain/controller/specialist_rating_controller.dart'
    as _i68;
import 'package:mint/domain/controller/user_controller.dart' as _i78;
import 'package:mint/domain/entity/booking_data/booking_data.dart' as _i30;
import 'package:mint/domain/entity/credit_card_model/credit_card_model.dart'
    as _i12;
import 'package:mint/domain/entity/filter_preferences/filter_preferences.dart'
    as _i21;
import 'package:mint/domain/entity/pick_up_filter/pick_up_filter.dart' as _i35;
import 'package:mint/domain/entity/review_model/review_model.dart' as _i24;
import 'package:mint/domain/entity/specialist_filter/specialist_filter.dart'
    as _i15;
import 'package:mint/domain/entity/specialist_model/specialist_model.dart'
    as _i96;
import 'package:mint/domain/entity/specialist_work_info/specialist_work_info.dart'
    as _i38;
import 'package:mint/domain/entity/transaction_data/transaction_data.dart'
    as _i27;
import 'package:mint/domain/entity/user_model/user_model.dart' as _i99;
import 'package:mint/domain/service/abstract/audio_record_service.dart' as _i6;
import 'package:mint/domain/service/abstract/booking_service.dart' as _i141;
import 'package:mint/domain/service/abstract/chat_service.dart' as _i88;
import 'package:mint/domain/service/abstract/file_service.dart' as _i43;
import 'package:mint/domain/service/abstract/filter_service.dart' as _i47;
import 'package:mint/domain/service/abstract/notification_service.dart' as _i53;
import 'package:mint/domain/service/abstract/payment_service.dart' as _i58;
import 'package:mint/domain/service/abstract/phone_auth_service.dart' as _i62;
import 'package:mint/domain/service/abstract/specialist_service.dart' as _i122;
import 'package:mint/domain/service/abstract/storage_service.dart' as _i75;
import 'package:mint/domain/service/abstract/user_service.dart' as _i114;
import 'package:mint/domain/service/audio_record_service_impl.dart' as _i7;
import 'package:mint/domain/service/file_service_impl.dart' as _i44;
import 'package:mint/domain/service/firebase/firebase_booking_service.dart'
    as _i142;
import 'package:mint/domain/service/firebase/firebase_chat_service.dart'
    as _i89;
import 'package:mint/domain/service/firebase/firebase_filter_service.dart'
    as _i48;
import 'package:mint/domain/service/firebase/firebase_notification_service.dart'
    as _i54;
import 'package:mint/domain/service/firebase/firebase_payment_service.dart'
    as _i59;
import 'package:mint/domain/service/firebase/firebase_phone_auth_service.dart'
    as _i63;
import 'package:mint/domain/service/firebase/firebase_specialist_service.dart'
    as _i123;
import 'package:mint/domain/service/firebase/firebase_storage_service.dart'
    as _i76;
import 'package:mint/domain/service/firebase/firebase_user_service.dart'
    as _i115;
import 'package:mint/domain/usecase/add_review_use_case.dart' as _i126;
import 'package:mint/domain/usecase/add_to_favorite_use_case.dart' as _i127;
import 'package:mint/domain/usecase/booking_book_use_case.dart' as _i152;
import 'package:mint/domain/usecase/booking_cancel_use_case.dart' as _i153;
import 'package:mint/domain/usecase/booking_reschedule_use_case.dart' as _i154;
import 'package:mint/domain/usecase/create_chat_room_use_case.dart' as _i90;
import 'package:mint/domain/usecase/credit_card_delete_use_case.dart' as _i91;
import 'package:mint/domain/usecase/credit_card_list_fetch_use_case.dart'
    as _i92;
import 'package:mint/domain/usecase/credit_card_save_use_case.dart' as _i93;
import 'package:mint/domain/usecase/delete_message_use_case.dart' as _i94;
import 'package:mint/domain/usecase/delete_review_use_case.dart' as _i128;
import 'package:mint/domain/usecase/fetch_chat_room_use_case.dart' as _i102;
import 'package:mint/domain/usecase/fetch_favorite_list_use_case.dart' as _i130;
import 'package:mint/domain/usecase/fetch_pick_up_filter_use_case.dart'
    as _i103;
import 'package:mint/domain/usecase/fetch_previous_sessions_use_case.dart'
    as _i144;
import 'package:mint/domain/usecase/fetch_session_data_use_case.dart' as _i145;
import 'package:mint/domain/usecase/fetch_specialist_catalogue_use_case.dart'
    as _i131;
import 'package:mint/domain/usecase/fetch_specialist_filter_use_case.dart'
    as _i104;
import 'package:mint/domain/usecase/fetch_specialist_reviews_use_case.dart'
    as _i132;
import 'package:mint/domain/usecase/fetch_specialist_use_case.dart' as _i133;
import 'package:mint/domain/usecase/fetch_specialists_online_use_case.dart'
    as _i134;
import 'package:mint/domain/usecase/fetch_upcoming_sessions_use_case.dart'
    as _i146;
import 'package:mint/domain/usecase/get_booking_notifications_stream_use_case.dart'
    as _i105;
import 'package:mint/domain/usecase/get_chat_notifications_stream_use_case.dart'
    as _i106;
import 'package:mint/domain/usecase/get_current_user_use_case.dart' as _i119;
import 'package:mint/domain/usecase/get_messages_use_case.dart' as _i107;
import 'package:mint/domain/usecase/initialize_audio_recorder_use_case.dart'
    as _i49;
import 'package:mint/domain/usecase/initialize_notifications_use_case.dart'
    as _i108;
import 'package:mint/domain/usecase/load_file_use_case.dart' as _i50;
import 'package:mint/domain/usecase/log_out_use_case.dart' as _i120;
import 'package:mint/domain/usecase/open_file_use_case.dart' as _i55;
import 'package:mint/domain/usecase/pick_file_use_case.dart' as _i64;
import 'package:mint/domain/usecase/pick_image_use_case.dart' as _i65;
import 'package:mint/domain/usecase/pin_code_change_use_case.dart' as _i121;
import 'package:mint/domain/usecase/preview_data_fetched_use_case.dart'
    as _i110;
import 'package:mint/domain/usecase/remove_from_favorite_use_case.dart'
    as _i136;
import 'package:mint/domain/usecase/save_audio_use_case.dart' as _i67;
import 'package:mint/domain/usecase/send_message_use_case.dart' as _i111;
import 'package:mint/domain/usecase/specialist_work_info_fetch_use_case.dart'
    as _i149;
import 'package:mint/domain/usecase/start_audio_record_use_case.dart' as _i71;
import 'package:mint/domain/usecase/stop_audio_record_use_case.dart' as _i72;
import 'package:mint/domain/usecase/transaction_pay_use_case.dart' as _i77;
import 'package:mint/domain/usecase/update_review_use_case.dart' as _i124;
import 'package:mint/domain/usecase/user_data_update_use_case.dart' as _i125;
import 'package:mint/domain/usecase/verify_otp_use_case.dart' as _i81;
import 'package:mint/domain/usecase/verify_phone_use_case.dart' as _i82;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.AppliedFilterController>(
        () => _i3.AppliedFilterController());
    gh.factory<_i4.AudioRecordRepository>(
        () => _i5.AudioRecordRepositoryImpl());
    gh.factory<_i6.AudioRecordService>(
        () => _i7.AudioRecordServiceImpl(gh<_i4.AudioRecordRepository>()));
    gh.lazySingleton<_i8.BookingController>(() => _i8.BookingController());
    gh.factory<_i9.BookingRepository>(() => _i10.FirebaseBookingRepository());
    gh.factory<_i11.Factory<_i12.CreditCardModel, _i13.CreditCardModelDto>>(
        () => _i14.CreditCardModelFromDto());
    gh.factory<_i11.Factory<_i15.SpecialistFilter, _i16.SpecialistFilterDto>>(
        () => _i17.SpecialistFilterFromDto());
    gh.factory<_i11.Factory<Map<String, dynamic>, _i18.UserModelDto>>(
        () => _i19.ModifiedUserDtoToMap());
    gh.factory<_i11.Factory<_i20.FilterPreferencesDto, _i21.FilterPreferences>>(
        () => _i22.FilterPreferencesToDto());
    gh.factory<_i11.Factory<_i23.ReviewModelDto, _i24.ReviewModel>>(
        () => _i25.ReviewModelToDto());
    gh.factory<_i11.Factory<_i26.TransactionDataDto, _i27.TransactionData>>(
        () => _i28.TransactionDataToDto());
    gh.factory<_i11.Factory<_i29.BookingDataDto, _i30.BookingData>>(
        () => _i31.BookingDataToDto());
    gh.factory<_i11.Factory<_i32.User, Map<String, dynamic>>>(
        () => _i33.ChatUserDataFromMap());
    gh.factory<_i11.Factory<_i32.Room?, Map<String, dynamic>>>(
        () => _i34.ChatRoomFromMap());
    gh.factory<_i11.Factory<_i35.PickUpFilter, _i36.PickUpFilterDto>>(
        () => _i37.PickUpFilterFromDto());
    gh.factory<
            _i11.Factory<_i38.SpecialistWorkInfo, _i39.SpecialistWorkInfoDto>>(
        () => _i40.SpecialistWorkInfoFromDto());
    gh.factory<_i41.FileRepository>(() => _i42.FileRepositoryImpl());
    gh.factory<_i43.FileService>(
        () => _i44.FileServiceImpl(gh<_i41.FileRepository>()));
    gh.factory<_i45.FilterRepository>(() => _i46.FirebaseFilterRepository());
    gh.factory<_i47.FilterService>(() => _i48.FirebaseFilterService(
          gh<_i45.FilterRepository>(),
          gh<_i11.Factory<_i15.SpecialistFilter, _i16.SpecialistFilterDto>>(),
          gh<_i11.Factory<_i35.PickUpFilter, _i36.PickUpFilterDto>>(),
        ));
    gh.factory<_i49.InitializeAudioRecorderUseCase>(() =>
        _i49.InitializeAudioRecorderUseCase(gh<_i6.AudioRecordService>()));
    gh.factory<_i50.LoadFileUseCase>(
        () => _i50.LoadFileUseCase(gh<_i43.FileService>()));
    gh.lazySingleton<_i51.NotificationRepository>(
        () => _i52.FirebaseNotificationRepository());
    gh.factory<_i53.NotificationService>(() =>
        _i54.FirebaseNotificationService(gh<_i51.NotificationRepository>()));
    gh.factory<_i55.OpenFileUseCase>(
        () => _i55.OpenFileUseCase(gh<_i43.FileService>()));
    gh.factory<_i56.PaymentRepository>(() => _i57.FirebasePaymentRepository());
    gh.factory<_i58.PaymentService>(() => _i59.FirebasePaymentService(
          gh<_i56.PaymentRepository>(),
          gh<_i11.Factory<_i12.CreditCardModel, _i13.CreditCardModelDto>>(),
          gh<_i11.Factory<_i26.TransactionDataDto, _i27.TransactionData>>(),
        ));
    gh.factory<_i60.PhoneAuthRepository>(() => _i61.FirebaseAuthRepository());
    gh.factory<_i62.PhoneAuthService>(
        () => _i63.FirebasePhoneAuthService(gh<_i60.PhoneAuthRepository>()));
    gh.factory<_i64.PickFileUseCase>(
        () => _i64.PickFileUseCase(gh<_i43.FileService>()));
    gh.factory<_i65.PickImageUseCase>(
        () => _i65.PickImageUseCase(gh<_i43.FileService>()));
    gh.lazySingleton<_i66.PickUpFilterController>(
        () => _i66.PickUpFilterController());
    gh.factory<_i67.SaveAudioUseCase>(
        () => _i67.SaveAudioUseCase(gh<_i43.FileService>()));
    gh.lazySingleton<_i68.SpecialistRatingController>(
        () => _i68.SpecialistRatingController());
    gh.factory<_i69.SpecialistRepository>(
        () => _i70.FirebaseSpecialistRepository());
    gh.factory<_i71.StartAudioRecordUseCase>(
        () => _i71.StartAudioRecordUseCase(gh<_i6.AudioRecordService>()));
    gh.factory<_i72.StopAudioRecordUseCase>(
        () => _i72.StopAudioRecordUseCase(gh<_i6.AudioRecordService>()));
    gh.factory<_i73.StorageRepository>(() => _i74.FirebaseStorageRepository());
    gh.factory<_i75.StorageService>(
        () => _i76.FirebaseStorageService(gh<_i73.StorageRepository>()));
    gh.factory<_i77.TransactionPayUseCase>(
        () => _i77.TransactionPayUseCase(gh<_i58.PaymentService>()));
    gh.lazySingleton<_i78.UserController>(() => _i78.UserController());
    gh.factory<_i79.UserRepository>(() => _i80.FirebaseUserRepository(
        gh<_i11.Factory<Map<String, dynamic>, _i18.UserModelDto>>()));
    gh.factory<_i81.VerifyOtpUseCase>(
        () => _i81.VerifyOtpUseCase(gh<_i62.PhoneAuthService>()));
    gh.factory<_i82.VerifyPhoneUseCase>(
        () => _i82.VerifyPhoneUseCase(gh<_i62.PhoneAuthService>()));
    gh.factory<_i83.AudioMessageCubit>(
        () => _i83.AudioMessageCubit(gh<_i50.LoadFileUseCase>()));
    gh.factory<_i84.AudioRecordBloc>(() => _i84.AudioRecordBloc(
          gh<_i49.InitializeAudioRecorderUseCase>(),
          gh<_i71.StartAudioRecordUseCase>(),
          gh<_i72.StopAudioRecordUseCase>(),
        ));
    gh.factory<_i85.AuthBloc>(() => _i85.AuthBloc(
          gh<_i82.VerifyPhoneUseCase>(),
          gh<_i81.VerifyOtpUseCase>(),
          gh<_i78.UserController>(),
        ));
    gh.factory<_i86.ChatRepository>(() => _i87.FirebaseChatRepository(
        gh<_i11.Factory<_i32.User, Map<String, dynamic>>>()));
    gh.factory<_i88.ChatService>(() => _i89.FirebaseChatService(
          gh<_i86.ChatRepository>(),
          gh<_i75.StorageService>(),
          gh<_i43.FileService>(),
          gh<_i11.Factory<_i32.Room?, Map<String, dynamic>>>(),
        ));
    gh.factory<_i90.CreateChatRoomUseCase>(
        () => _i90.CreateChatRoomUseCase(gh<_i88.ChatService>()));
    gh.factory<_i91.CreditCardDeleteUseCase>(
        () => _i91.CreditCardDeleteUseCase(gh<_i58.PaymentService>()));
    gh.factory<_i92.CreditCardListFetchUseCase>(
        () => _i92.CreditCardListFetchUseCase(gh<_i58.PaymentService>()));
    gh.factory<_i93.CreditCardSaveUseCase>(
        () => _i93.CreditCardSaveUseCase(gh<_i58.PaymentService>()));
    gh.factory<_i94.DeleteMessageUseCase>(
        () => _i94.DeleteMessageUseCase(gh<_i88.ChatService>()));
    gh.factory<
            _i11.Factory<_i95.Future<_i96.SpecialistModel>,
                _i97.SpecialistModelDto>>(
        () => _i98.SpecialistModelFromDto(gh<_i75.StorageService>()));
    gh.factory<_i11.Factory<_i95.Future<_i18.UserModelDto>, _i99.UserModel>>(
        () => _i100.UserModelToDto(gh<_i75.StorageService>()));
    gh.factory<_i11.Factory<_i95.Future<_i99.UserModel>, _i18.UserModelDto>>(
        () => _i101.UserModelFromDto(gh<_i75.StorageService>()));
    gh.factory<_i102.FetchChatRoomUseCase>(
        () => _i102.FetchChatRoomUseCase(gh<_i88.ChatService>()));
    gh.factory<_i103.FetchPickUpFilterUseCase>(
        () => _i103.FetchPickUpFilterUseCase(gh<_i47.FilterService>()));
    gh.factory<_i104.FetchSpecialistFilterUseCase>(
        () => _i104.FetchSpecialistFilterUseCase(gh<_i47.FilterService>()));
    gh.factory<_i105.GetBookingNotificationsStreamUseCase>(() =>
        _i105.GetBookingNotificationsStreamUseCase(
            gh<_i53.NotificationService>()));
    gh.factory<_i106.GetChatNotificationsStreamUseCase>(() =>
        _i106.GetChatNotificationsStreamUseCase(
            gh<_i53.NotificationService>()));
    gh.factory<_i107.GetMessagesUseCase>(
        () => _i107.GetMessagesUseCase(gh<_i88.ChatService>()));
    gh.factory<_i108.InitializeNotificationsUseCase>(() =>
        _i108.InitializeNotificationsUseCase(gh<_i53.NotificationService>()));
    gh.factory<_i109.PickUpSpecialistBloc>(() => _i109.PickUpSpecialistBloc(
          gh<_i103.FetchPickUpFilterUseCase>(),
          gh<_i66.PickUpFilterController>(),
        ));
    gh.factory<_i110.PreviewDataFetchedUseCase>(
        () => _i110.PreviewDataFetchedUseCase(gh<_i88.ChatService>()));
    gh.factory<_i111.SendMessageUseCase>(
        () => _i111.SendMessageUseCase(gh<_i88.ChatService>()));
    gh.factory<_i112.SpecialistFilterBloc>(() => _i112.SpecialistFilterBloc(
          gh<_i104.FetchSpecialistFilterUseCase>(),
          gh<_i3.AppliedFilterController>(),
          gh<_i66.PickUpFilterController>(),
        ));
    gh.factory<_i113.TransactionBloc>(() => _i113.TransactionBloc(
          gh<_i77.TransactionPayUseCase>(),
          gh<_i78.UserController>(),
        ));
    gh.factory<_i114.UserService>(() => _i115.FirebaseUserService(
          gh<_i79.UserRepository>(),
          gh<_i11.Factory<_i95.Future<_i99.UserModel>, _i18.UserModelDto>>(),
          gh<_i11.Factory<_i95.Future<_i18.UserModelDto>, _i99.UserModel>>(),
          gh<_i53.NotificationService>(),
        ));
    gh.factory<_i116.ChatBloc>(() => _i116.ChatBloc(
          gh<_i78.UserController>(),
          gh<_i107.GetMessagesUseCase>(),
          gh<_i90.CreateChatRoomUseCase>(),
          gh<_i111.SendMessageUseCase>(),
          gh<_i94.DeleteMessageUseCase>(),
          gh<_i110.PreviewDataFetchedUseCase>(),
          gh<_i65.PickImageUseCase>(),
          gh<_i64.PickFileUseCase>(),
          gh<_i50.LoadFileUseCase>(),
          gh<_i55.OpenFileUseCase>(),
          gh<_i67.SaveAudioUseCase>(),
        ));
    gh.factory<_i117.CreditCardBloc>(() => _i117.CreditCardBloc(
          gh<_i92.CreditCardListFetchUseCase>(),
          gh<_i93.CreditCardSaveUseCase>(),
          gh<_i91.CreditCardDeleteUseCase>(),
          gh<_i78.UserController>(),
        ));
    gh.factory<
            _i11.Factory<_i95.Future<_i24.ReviewModel?>, _i23.ReviewModelDto>>(
        () => _i118.ReviewModelFromDto(gh<_i114.UserService>()));
    gh.factory<_i119.GetCurrentUserUseCase>(
        () => _i119.GetCurrentUserUseCase(gh<_i114.UserService>()));
    gh.factory<_i120.LogOutUseCase>(
        () => _i120.LogOutUseCase(gh<_i114.UserService>()));
    gh.factory<_i121.PinCodeChangeUseCase>(
        () => _i121.PinCodeChangeUseCase(gh<_i114.UserService>()));
    gh.factory<_i122.SpecialistService>(() => _i123.FirebaseSpecialistService(
          gh<_i69.SpecialistRepository>(),
          gh<
              _i11.Factory<_i95.Future<_i96.SpecialistModel>,
                  _i97.SpecialistModelDto>>(),
          gh<_i11.Factory<_i20.FilterPreferencesDto, _i21.FilterPreferences>>(),
          gh<
              _i11.Factory<_i95.Future<_i24.ReviewModel?>,
                  _i23.ReviewModelDto>>(),
          gh<_i11.Factory<_i23.ReviewModelDto, _i24.ReviewModel>>(),
        ));
    gh.factory<_i124.UpdateReviewUseCase>(
        () => _i124.UpdateReviewUseCase(gh<_i122.SpecialistService>()));
    gh.factory<_i125.UserDataUpdateUseCase>(
        () => _i125.UserDataUpdateUseCase(gh<_i114.UserService>()));
    gh.factory<_i126.AddReviewUseCase>(
        () => _i126.AddReviewUseCase(gh<_i122.SpecialistService>()));
    gh.factory<_i127.AddToFavoriteUseCase>(
        () => _i127.AddToFavoriteUseCase(gh<_i122.SpecialistService>()));
    gh.factory<_i128.DeleteReviewUseCase>(
        () => _i128.DeleteReviewUseCase(gh<_i122.SpecialistService>()));
    gh.factory<
            _i11.Factory<_i95.Future<_i30.BookingData?>, _i29.BookingDataDto>>(
        () => _i129.BookingDataFromDto(gh<_i122.SpecialistService>()));
    gh.factory<_i130.FetchFavoriteListUseCase>(
        () => _i130.FetchFavoriteListUseCase(gh<_i122.SpecialistService>()));
    gh.factory<_i131.FetchSpecialistCatalogueUseCase>(() =>
        _i131.FetchSpecialistCatalogueUseCase(gh<_i122.SpecialistService>()));
    gh.factory<_i132.FetchSpecialistReviewsUseCase>(() =>
        _i132.FetchSpecialistReviewsUseCase(gh<_i122.SpecialistService>()));
    gh.factory<_i133.FetchSpecialistUseCase>(
        () => _i133.FetchSpecialistUseCase(gh<_i122.SpecialistService>()));
    gh.factory<_i134.FetchSpecialistsOnlineUseCase>(() =>
        _i134.FetchSpecialistsOnlineUseCase(gh<_i122.SpecialistService>()));
    gh.factory<_i135.PinCodeBloc>(() => _i135.PinCodeBloc(
          gh<_i78.UserController>(),
          gh<_i121.PinCodeChangeUseCase>(),
        ));
    gh.factory<_i136.RemoveFromFavoriteUseCase>(
        () => _i136.RemoveFromFavoriteUseCase(gh<_i122.SpecialistService>()));
    gh.factory<_i137.ReviewBloc>(() => _i137.ReviewBloc(
          gh<_i132.FetchSpecialistReviewsUseCase>(),
          gh<_i126.AddReviewUseCase>(),
          gh<_i78.UserController>(),
          gh<_i68.SpecialistRatingController>(),
          gh<_i124.UpdateReviewUseCase>(),
          gh<_i128.DeleteReviewUseCase>(),
        ));
    gh.factory<_i138.SpecialistCatalogueBloc>(
        () => _i138.SpecialistCatalogueBloc(
              gh<_i131.FetchSpecialistCatalogueUseCase>(),
              gh<_i3.AppliedFilterController>(),
              gh<_i68.SpecialistRatingController>(),
            ));
    gh.factory<_i139.SpecialistOnlineBloc>(() => _i139.SpecialistOnlineBloc(
          gh<_i134.FetchSpecialistsOnlineUseCase>(),
          gh<_i68.SpecialistRatingController>(),
        ));
    gh.factory<_i140.UserBloc>(() => _i140.UserBloc(
          gh<_i119.GetCurrentUserUseCase>(),
          gh<_i120.LogOutUseCase>(),
          gh<_i125.UserDataUpdateUseCase>(),
          gh<_i78.UserController>(),
        ));
    gh.factory<_i141.BookingService>(() => _i142.FirebaseBookingService(
          gh<_i9.BookingRepository>(),
          gh<
              _i11.Factory<_i38.SpecialistWorkInfo,
                  _i39.SpecialistWorkInfoDto>>(),
          gh<_i11.Factory<_i29.BookingDataDto, _i30.BookingData>>(),
          gh<
              _i11.Factory<_i95.Future<_i30.BookingData?>,
                  _i29.BookingDataDto>>(),
        ));
    gh.factory<_i143.FavoriteBloc>(() => _i143.FavoriteBloc(
          gh<_i78.UserController>(),
          gh<_i130.FetchFavoriteListUseCase>(),
          gh<_i127.AddToFavoriteUseCase>(),
          gh<_i136.RemoveFromFavoriteUseCase>(),
        ));
    gh.factory<_i144.FetchPreviousSessionsUseCase>(
        () => _i144.FetchPreviousSessionsUseCase(gh<_i141.BookingService>()));
    gh.factory<_i145.FetchSessionDataUseCase>(
        () => _i145.FetchSessionDataUseCase(gh<_i141.BookingService>()));
    gh.factory<_i146.FetchUpcomingSessionsUseCase>(
        () => _i146.FetchUpcomingSessionsUseCase(gh<_i141.BookingService>()));
    gh.factory<_i147.NotificationsBloc>(() => _i147.NotificationsBloc(
          gh<_i108.InitializeNotificationsUseCase>(),
          gh<_i78.UserController>(),
          gh<_i102.FetchChatRoomUseCase>(),
          gh<_i133.FetchSpecialistUseCase>(),
          gh<_i145.FetchSessionDataUseCase>(),
          gh<_i106.GetChatNotificationsStreamUseCase>(),
          gh<_i105.GetBookingNotificationsStreamUseCase>(),
        ));
    gh.factory<_i148.PreviousSessionsBloc>(() => _i148.PreviousSessionsBloc(
          gh<_i144.FetchPreviousSessionsUseCase>(),
          gh<_i78.UserController>(),
        ));
    gh.factory<_i149.SpecialistWorkInfoFetchUseCase>(
        () => _i149.SpecialistWorkInfoFetchUseCase(gh<_i141.BookingService>()));
    gh.factory<_i150.UpcomingSessionsBloc>(() => _i150.UpcomingSessionsBloc(
          gh<_i146.FetchUpcomingSessionsUseCase>(),
          gh<_i78.UserController>(),
          gh<_i8.BookingController>(),
        ));
    gh.factory<_i151.WorkInfoBloc>(
        () => _i151.WorkInfoBloc(gh<_i149.SpecialistWorkInfoFetchUseCase>()));
    gh.factory<_i152.BookingBookUseCase>(
        () => _i152.BookingBookUseCase(gh<_i141.BookingService>()));
    gh.factory<_i153.BookingCancelUseCase>(
        () => _i153.BookingCancelUseCase(gh<_i141.BookingService>()));
    gh.factory<_i154.BookingRescheduleUseCase>(
        () => _i154.BookingRescheduleUseCase(gh<_i141.BookingService>()));
    gh.factory<_i155.BookingBloc>(() => _i155.BookingBloc(
          gh<_i152.BookingBookUseCase>(),
          gh<_i154.BookingRescheduleUseCase>(),
          gh<_i153.BookingCancelUseCase>(),
          gh<_i78.UserController>(),
          gh<_i8.BookingController>(),
        ));
    return this;
  }
}
