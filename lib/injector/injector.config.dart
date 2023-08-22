// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i93;

import 'package:flutter_chat_types/flutter_chat_types.dart' as _i18;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mint/assembly/entity/booking_data_from_dto.dart' as _i125;
import 'package:mint/assembly/entity/chat_room_from_map.dart' as _i23;
import 'package:mint/assembly/entity/chat_user_data_from_map.dart' as _i19;
import 'package:mint/assembly/entity/credit_card_model_from_dto.dart' as _i37;
import 'package:mint/assembly/entity/pick_up_filter_from_dto.dart' as _i34;
import 'package:mint/assembly/entity/review_model_from_dto.dart' as _i114;
import 'package:mint/assembly/entity/specialist_filter_from_dto.dart' as _i22;
import 'package:mint/assembly/entity/specialist_model_from_dto.dart' as _i99;
import 'package:mint/assembly/entity/specialist_work_info_from_dto.dart'
    as _i40;
import 'package:mint/assembly/entity/user_model_from_dto.dart' as _i95;
import 'package:mint/assembly/factory.dart' as _i11;
import 'package:mint/assembly/model/booking_data_to_dto.dart' as _i17;
import 'package:mint/assembly/model/filter_preferences_to_dto.dart' as _i26;
import 'package:mint/assembly/model/review_model_to_dto.dart' as _i29;
import 'package:mint/assembly/model/transaction_data_to_dto.dart' as _i14;
import 'package:mint/assembly/model/user_model_to_dto.dart' as _i96;
import 'package:mint/assembly/modified_user_dto_to_map.dart' as _i31;
import 'package:mint/bloc/audio_message/audio_message_cubit.dart' as _i81;
import 'package:mint/bloc/audio_record/audio_record_bloc.dart' as _i82;
import 'package:mint/bloc/auth/auth_bloc.dart' as _i83;
import 'package:mint/bloc/booking/booking_bloc.dart' as _i151;
import 'package:mint/bloc/chat/chat_bloc.dart' as _i112;
import 'package:mint/bloc/credit_card/credit_card_bloc.dart' as _i113;
import 'package:mint/bloc/favorite/favorite_bloc.dart' as _i139;
import 'package:mint/bloc/notifications/notifications_bloc.dart' as _i143;
import 'package:mint/bloc/pick_up_specialist/pick_up_specialist_bloc.dart'
    as _i105;
import 'package:mint/bloc/pin_code/pin_code_bloc.dart' as _i131;
import 'package:mint/bloc/previous_sessions/previous_sessions_bloc.dart'
    as _i144;
import 'package:mint/bloc/review/review_bloc.dart' as _i133;
import 'package:mint/bloc/specialist_catalogue/specialist_catalogue_bloc.dart'
    as _i134;
import 'package:mint/bloc/specialist_filter/specialist_filter_bloc.dart'
    as _i108;
import 'package:mint/bloc/specialist_online/specialist_online_bloc.dart'
    as _i135;
import 'package:mint/bloc/transaction/transaction_bloc.dart' as _i109;
import 'package:mint/bloc/upcoming_sessions/upcoming_sessions_bloc.dart'
    as _i146;
import 'package:mint/bloc/user/user_bloc.dart' as _i136;
import 'package:mint/bloc/work_info/work_info_bloc.dart' as _i147;
import 'package:mint/data/model/booking_data_dto/booking_data_dto.dart' as _i15;
import 'package:mint/data/model/credit_card_model_dto/credit_card_model_dto.dart'
    as _i36;
import 'package:mint/data/model/filter_preferences_dto/filter_preferences_dto.dart'
    as _i24;
import 'package:mint/data/model/pick_up_filter_dto/pick_up_filter_dto.dart'
    as _i33;
import 'package:mint/data/model/review_model_dto/review_model_dto.dart' as _i27;
import 'package:mint/data/model/specialist_filter_dto/specialist_filter_dto.dart'
    as _i21;
import 'package:mint/data/model/specialist_model_dto/specialist_model_dto.dart'
    as _i98;
import 'package:mint/data/model/specialist_work_info_dto/specialist_work_info_dto.dart'
    as _i39;
import 'package:mint/data/model/transaction_data_dto/transaction_data_dto.dart'
    as _i12;
import 'package:mint/data/model/user_model_dto/user_model_dto.dart' as _i30;
import 'package:mint/data/repository/abstract/audio_record_repository.dart'
    as _i4;
import 'package:mint/data/repository/abstract/booking_repository.dart' as _i9;
import 'package:mint/data/repository/abstract/chat_repository.dart' as _i84;
import 'package:mint/data/repository/abstract/filter_repository.dart' as _i43;
import 'package:mint/data/repository/abstract/notification_repository.dart'
    as _i49;
import 'package:mint/data/repository/abstract/payment_repository.dart' as _i54;
import 'package:mint/data/repository/abstract/phone_auth_repository.dart'
    as _i58;
import 'package:mint/data/repository/abstract/specialist_repository.dart'
    as _i67;
import 'package:mint/data/repository/abstract/storage_repository.dart' as _i71;
import 'package:mint/data/repository/abstract/user_repository.dart' as _i77;
import 'package:mint/data/repository/audio_record_repository_impl.dart' as _i5;
import 'package:mint/data/repository/firebase/firebase_auth_repository.dart'
    as _i59;
import 'package:mint/data/repository/firebase/firebase_booking_repository.dart'
    as _i10;
import 'package:mint/data/repository/firebase/firebase_chat_repository.dart'
    as _i85;
import 'package:mint/data/repository/firebase/firebase_filter_repository.dart'
    as _i44;
import 'package:mint/data/repository/firebase/firebase_notification_repository.dart'
    as _i50;
import 'package:mint/data/repository/firebase/firebase_payment_repository.dart'
    as _i55;
import 'package:mint/data/repository/firebase/firebase_specialist_repository.dart'
    as _i68;
import 'package:mint/data/repository/firebase/firebase_storage_repository.dart'
    as _i72;
import 'package:mint/data/repository/firebase/firebase_user_repository.dart'
    as _i78;
import 'package:mint/domain/controller/applied_filter_controller.dart' as _i3;
import 'package:mint/domain/controller/booking_controller.dart' as _i8;
import 'package:mint/domain/controller/notification_controller.dart' as _i48;
import 'package:mint/domain/controller/pick_up_filter_controller.dart' as _i64;
import 'package:mint/domain/controller/specialist_rating_controller.dart'
    as _i66;
import 'package:mint/domain/controller/user_controller.dart' as _i76;
import 'package:mint/domain/entity/booking_data/booking_data.dart' as _i16;
import 'package:mint/domain/entity/credit_card_model/credit_card_model.dart'
    as _i35;
import 'package:mint/domain/entity/filter_preferences/filter_preferences.dart'
    as _i25;
import 'package:mint/domain/entity/pick_up_filter/pick_up_filter.dart' as _i32;
import 'package:mint/domain/entity/review_model/review_model.dart' as _i28;
import 'package:mint/domain/entity/specialist_filter/specialist_filter.dart'
    as _i20;
import 'package:mint/domain/entity/specialist_model/specialist_model.dart'
    as _i97;
import 'package:mint/domain/entity/specialist_work_info/specialist_work_info.dart'
    as _i38;
import 'package:mint/domain/entity/transaction_data/transaction_data.dart'
    as _i13;
import 'package:mint/domain/entity/user_model/user_model.dart' as _i94;
import 'package:mint/domain/service/abstract/audio_record_service.dart' as _i6;
import 'package:mint/domain/service/abstract/booking_service.dart' as _i137;
import 'package:mint/domain/service/abstract/chat_service.dart' as _i86;
import 'package:mint/domain/service/abstract/file_picker_service.dart' as _i41;
import 'package:mint/domain/service/abstract/filter_service.dart' as _i45;
import 'package:mint/domain/service/abstract/notification_service.dart' as _i51;
import 'package:mint/domain/service/abstract/payment_service.dart' as _i56;
import 'package:mint/domain/service/abstract/phone_auth_service.dart' as _i60;
import 'package:mint/domain/service/abstract/specialist_service.dart' as _i118;
import 'package:mint/domain/service/abstract/storage_service.dart' as _i73;
import 'package:mint/domain/service/abstract/user_service.dart' as _i110;
import 'package:mint/domain/service/audio_record_service_impl.dart' as _i7;
import 'package:mint/domain/service/file_picker_service_impl.dart' as _i42;
import 'package:mint/domain/service/firebase/firebase_booking_service.dart'
    as _i138;
import 'package:mint/domain/service/firebase/firebase_chat_service.dart'
    as _i87;
import 'package:mint/domain/service/firebase/firebase_filter_service.dart'
    as _i46;
import 'package:mint/domain/service/firebase/firebase_notification_service.dart'
    as _i52;
import 'package:mint/domain/service/firebase/firebase_payment_service.dart'
    as _i57;
import 'package:mint/domain/service/firebase/firebase_phone_auth_service.dart'
    as _i61;
import 'package:mint/domain/service/firebase/firebase_specialist_service.dart'
    as _i119;
import 'package:mint/domain/service/firebase/firebase_storage_service.dart'
    as _i74;
import 'package:mint/domain/service/firebase/firebase_user_service.dart'
    as _i111;
import 'package:mint/domain/usecase/add_review_use_case.dart' as _i122;
import 'package:mint/domain/usecase/add_to_favorite_use_case.dart' as _i123;
import 'package:mint/domain/usecase/booking_book_use_case.dart' as _i148;
import 'package:mint/domain/usecase/booking_cancel_use_case.dart' as _i149;
import 'package:mint/domain/usecase/booking_reschedule_use_case.dart' as _i150;
import 'package:mint/domain/usecase/create_chat_room_use_case.dart' as _i88;
import 'package:mint/domain/usecase/credit_card_delete_use_case.dart' as _i89;
import 'package:mint/domain/usecase/credit_card_list_fetch_use_case.dart'
    as _i90;
import 'package:mint/domain/usecase/credit_card_save_use_case.dart' as _i91;
import 'package:mint/domain/usecase/delete_message_use_case.dart' as _i92;
import 'package:mint/domain/usecase/delete_review_use_case.dart' as _i124;
import 'package:mint/domain/usecase/fetch_chat_room_use_case.dart' as _i100;
import 'package:mint/domain/usecase/fetch_favorite_list_use_case.dart' as _i126;
import 'package:mint/domain/usecase/fetch_pick_up_filter_use_case.dart'
    as _i101;
import 'package:mint/domain/usecase/fetch_previous_sessions_use_case.dart'
    as _i140;
import 'package:mint/domain/usecase/fetch_session_data_use_case.dart' as _i141;
import 'package:mint/domain/usecase/fetch_specialist_catalogue_use_case.dart'
    as _i127;
import 'package:mint/domain/usecase/fetch_specialist_filter_use_case.dart'
    as _i102;
import 'package:mint/domain/usecase/fetch_specialist_reviews_use_case.dart'
    as _i128;
import 'package:mint/domain/usecase/fetch_specialist_use_case.dart' as _i129;
import 'package:mint/domain/usecase/fetch_specialists_online_use_case.dart'
    as _i130;
import 'package:mint/domain/usecase/fetch_upcoming_sessions_use_case.dart'
    as _i142;
import 'package:mint/domain/usecase/get_current_user_use_case.dart' as _i115;
import 'package:mint/domain/usecase/get_messages_use_case.dart' as _i103;
import 'package:mint/domain/usecase/initialize_notifications_use_case.dart'
    as _i104;
import 'package:mint/domain/usecase/load_file_use_case.dart' as _i47;
import 'package:mint/domain/usecase/log_out_use_case.dart' as _i116;
import 'package:mint/domain/usecase/open_file_use_case.dart' as _i53;
import 'package:mint/domain/usecase/pick_file_use_case.dart' as _i62;
import 'package:mint/domain/usecase/pick_image_use_case.dart' as _i63;
import 'package:mint/domain/usecase/pin_code_change_use_case.dart' as _i117;
import 'package:mint/domain/usecase/preview_data_fetched_use_case.dart'
    as _i106;
import 'package:mint/domain/usecase/remove_from_favorite_use_case.dart'
    as _i132;
import 'package:mint/domain/usecase/save_audio_use_case.dart' as _i65;
import 'package:mint/domain/usecase/send_message_use_case.dart' as _i107;
import 'package:mint/domain/usecase/specialist_work_info_fetch_use_case.dart'
    as _i145;
import 'package:mint/domain/usecase/start_audio_record_use_case.dart' as _i69;
import 'package:mint/domain/usecase/stop_audio_record_use_case.dart' as _i70;
import 'package:mint/domain/usecase/transaction_pay_use_case.dart' as _i75;
import 'package:mint/domain/usecase/update_review_use_case.dart' as _i120;
import 'package:mint/domain/usecase/user_data_update_use_case.dart' as _i121;
import 'package:mint/domain/usecase/verify_otp_use_case.dart' as _i79;
import 'package:mint/domain/usecase/verify_phone_use_case.dart' as _i80;

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
    gh.factory<_i11.Factory<_i12.TransactionDataDto, _i13.TransactionData>>(
        () => _i14.TransactionDataToDto());
    gh.factory<_i11.Factory<_i15.BookingDataDto, _i16.BookingData>>(
        () => _i17.BookingDataToDto());
    gh.factory<_i11.Factory<_i18.User, Map<String, dynamic>>>(
        () => _i19.ChatUserDataFromMap());
    gh.factory<_i11.Factory<_i20.SpecialistFilter, _i21.SpecialistFilterDto>>(
        () => _i22.SpecialistFilterFromDto());
    gh.factory<_i11.Factory<_i18.Room?, Map<String, dynamic>>>(
        () => _i23.ChatRoomFromMap());
    gh.factory<_i11.Factory<_i24.FilterPreferencesDto, _i25.FilterPreferences>>(
        () => _i26.FilterPreferencesToDto());
    gh.factory<_i11.Factory<_i27.ReviewModelDto, _i28.ReviewModel>>(
        () => _i29.ReviewModelToDto());
    gh.factory<_i11.Factory<Map<String, dynamic>, _i30.UserModelDto>>(
        () => _i31.ModifiedUserDtoToMap());
    gh.factory<_i11.Factory<_i32.PickUpFilter, _i33.PickUpFilterDto>>(
        () => _i34.PickUpFilterFromDto());
    gh.factory<_i11.Factory<_i35.CreditCardModel, _i36.CreditCardModelDto>>(
        () => _i37.CreditCardModelFromDto());
    gh.factory<
            _i11.Factory<_i38.SpecialistWorkInfo, _i39.SpecialistWorkInfoDto>>(
        () => _i40.SpecialistWorkInfoFromDto());
    gh.factory<_i41.FilePickerService>(() => _i42.FilePickerServiceImpl());
    gh.factory<_i43.FilterRepository>(() => _i44.FirebaseFilterRepository());
    gh.factory<_i45.FilterService>(() => _i46.FirebaseFilterService(
          gh<_i43.FilterRepository>(),
          gh<_i11.Factory<_i20.SpecialistFilter, _i21.SpecialistFilterDto>>(),
          gh<_i11.Factory<_i32.PickUpFilter, _i33.PickUpFilterDto>>(),
        ));
    gh.factory<_i47.LoadFileUseCase>(
        () => _i47.LoadFileUseCase(gh<_i41.FilePickerService>()));
    gh.lazySingleton<_i48.NotificationController>(
        () => _i48.NotificationController());
    gh.factory<_i49.NotificationRepository>(() =>
        _i50.FirebaseNotificationRepository(gh<_i48.NotificationController>()));
    gh.factory<_i51.NotificationService>(() =>
        _i52.FirebaseNotificationService(gh<_i49.NotificationRepository>()));
    gh.factory<_i53.OpenFileUseCase>(
        () => _i53.OpenFileUseCase(gh<_i41.FilePickerService>()));
    gh.factory<_i54.PaymentRepository>(() => _i55.FirebasePaymentRepository());
    gh.factory<_i56.PaymentService>(() => _i57.FirebasePaymentService(
          gh<_i54.PaymentRepository>(),
          gh<_i11.Factory<_i35.CreditCardModel, _i36.CreditCardModelDto>>(),
          gh<_i11.Factory<_i12.TransactionDataDto, _i13.TransactionData>>(),
        ));
    gh.factory<_i58.PhoneAuthRepository>(() => _i59.FirebaseAuthRepository());
    gh.factory<_i60.PhoneAuthService>(
        () => _i61.FirebasePhoneAuthService(gh<_i58.PhoneAuthRepository>()));
    gh.factory<_i62.PickFileUseCase>(
        () => _i62.PickFileUseCase(gh<_i41.FilePickerService>()));
    gh.factory<_i63.PickImageUseCase>(
        () => _i63.PickImageUseCase(gh<_i41.FilePickerService>()));
    gh.lazySingleton<_i64.PickUpFilterController>(
        () => _i64.PickUpFilterController());
    gh.factory<_i65.SaveAudioUseCase>(
        () => _i65.SaveAudioUseCase(gh<_i41.FilePickerService>()));
    gh.lazySingleton<_i66.SpecialistRatingController>(
        () => _i66.SpecialistRatingController());
    gh.factory<_i67.SpecialistRepository>(
        () => _i68.FirebaseSpecialistRepository());
    gh.factory<_i69.StartAudioRecordUseCase>(
        () => _i69.StartAudioRecordUseCase(gh<_i6.AudioRecordService>()));
    gh.factory<_i70.StopAudioRecordUseCase>(
        () => _i70.StopAudioRecordUseCase(gh<_i6.AudioRecordService>()));
    gh.factory<_i71.StorageRepository>(() => _i72.FirebaseStorageRepository());
    gh.factory<_i73.StorageService>(
        () => _i74.FirebaseStorageService(gh<_i71.StorageRepository>()));
    gh.factory<_i75.TransactionPayUseCase>(
        () => _i75.TransactionPayUseCase(gh<_i56.PaymentService>()));
    gh.lazySingleton<_i76.UserController>(() => _i76.UserController());
    gh.factory<_i77.UserRepository>(() => _i78.FirebaseUserRepository(
        gh<_i11.Factory<Map<String, dynamic>, _i30.UserModelDto>>()));
    gh.factory<_i79.VerifyOtpUseCase>(
        () => _i79.VerifyOtpUseCase(gh<_i60.PhoneAuthService>()));
    gh.factory<_i80.VerifyPhoneUseCase>(
        () => _i80.VerifyPhoneUseCase(gh<_i60.PhoneAuthService>()));
    gh.factory<_i81.AudioMessageCubit>(
        () => _i81.AudioMessageCubit(gh<_i47.LoadFileUseCase>()));
    gh.factory<_i82.AudioRecordBloc>(() => _i82.AudioRecordBloc(
          gh<_i69.StartAudioRecordUseCase>(),
          gh<_i70.StopAudioRecordUseCase>(),
        ));
    gh.factory<_i83.AuthBloc>(() => _i83.AuthBloc(
          gh<_i80.VerifyPhoneUseCase>(),
          gh<_i79.VerifyOtpUseCase>(),
          gh<_i76.UserController>(),
        ));
    gh.factory<_i84.ChatRepository>(() => _i85.FirebaseChatRepository(
        gh<_i11.Factory<_i18.User, Map<String, dynamic>>>()));
    gh.factory<_i86.ChatService>(() => _i87.FirebaseChatService(
          gh<_i84.ChatRepository>(),
          gh<_i73.StorageService>(),
          gh<_i11.Factory<_i18.Room?, Map<String, dynamic>>>(),
        ));
    gh.factory<_i88.CreateChatRoomUseCase>(
        () => _i88.CreateChatRoomUseCase(gh<_i86.ChatService>()));
    gh.factory<_i89.CreditCardDeleteUseCase>(
        () => _i89.CreditCardDeleteUseCase(gh<_i56.PaymentService>()));
    gh.factory<_i90.CreditCardListFetchUseCase>(
        () => _i90.CreditCardListFetchUseCase(gh<_i56.PaymentService>()));
    gh.factory<_i91.CreditCardSaveUseCase>(
        () => _i91.CreditCardSaveUseCase(gh<_i56.PaymentService>()));
    gh.factory<_i92.DeleteMessageUseCase>(
        () => _i92.DeleteMessageUseCase(gh<_i86.ChatService>()));
    gh.factory<_i11.Factory<_i93.Future<_i94.UserModel>, _i30.UserModelDto>>(
        () => _i95.UserModelFromDto(gh<_i73.StorageService>()));
    gh.factory<_i11.Factory<_i93.Future<_i30.UserModelDto>, _i94.UserModel>>(
        () => _i96.UserModelToDto(gh<_i73.StorageService>()));
    gh.factory<
            _i11.Factory<_i93.Future<_i97.SpecialistModel>,
                _i98.SpecialistModelDto>>(
        () => _i99.SpecialistModelFromDto(gh<_i73.StorageService>()));
    gh.factory<_i100.FetchChatRoomUseCase>(
        () => _i100.FetchChatRoomUseCase(gh<_i86.ChatService>()));
    gh.factory<_i101.FetchPickUpFilterUseCase>(
        () => _i101.FetchPickUpFilterUseCase(gh<_i45.FilterService>()));
    gh.factory<_i102.FetchSpecialistFilterUseCase>(
        () => _i102.FetchSpecialistFilterUseCase(gh<_i45.FilterService>()));
    gh.factory<_i103.GetMessagesUseCase>(
        () => _i103.GetMessagesUseCase(gh<_i86.ChatService>()));
    gh.factory<_i104.InitializeNotificationsUseCase>(() =>
        _i104.InitializeNotificationsUseCase(gh<_i51.NotificationService>()));
    gh.factory<_i105.PickUpSpecialistBloc>(() => _i105.PickUpSpecialistBloc(
          gh<_i101.FetchPickUpFilterUseCase>(),
          gh<_i64.PickUpFilterController>(),
        ));
    gh.factory<_i106.PreviewDataFetchedUseCase>(
        () => _i106.PreviewDataFetchedUseCase(gh<_i86.ChatService>()));
    gh.factory<_i107.SendMessageUseCase>(
        () => _i107.SendMessageUseCase(gh<_i86.ChatService>()));
    gh.factory<_i108.SpecialistFilterBloc>(() => _i108.SpecialistFilterBloc(
          gh<_i102.FetchSpecialistFilterUseCase>(),
          gh<_i3.AppliedFilterController>(),
          gh<_i64.PickUpFilterController>(),
        ));
    gh.factory<_i109.TransactionBloc>(() => _i109.TransactionBloc(
          gh<_i75.TransactionPayUseCase>(),
          gh<_i76.UserController>(),
        ));
    gh.factory<_i110.UserService>(() => _i111.FirebaseUserService(
          gh<_i77.UserRepository>(),
          gh<_i11.Factory<_i93.Future<_i94.UserModel>, _i30.UserModelDto>>(),
          gh<_i11.Factory<_i93.Future<_i30.UserModelDto>, _i94.UserModel>>(),
        ));
    gh.factory<_i112.ChatBloc>(() => _i112.ChatBloc(
          gh<_i76.UserController>(),
          gh<_i103.GetMessagesUseCase>(),
          gh<_i88.CreateChatRoomUseCase>(),
          gh<_i107.SendMessageUseCase>(),
          gh<_i92.DeleteMessageUseCase>(),
          gh<_i106.PreviewDataFetchedUseCase>(),
          gh<_i63.PickImageUseCase>(),
          gh<_i62.PickFileUseCase>(),
          gh<_i47.LoadFileUseCase>(),
          gh<_i53.OpenFileUseCase>(),
          gh<_i65.SaveAudioUseCase>(),
        ));
    gh.factory<_i113.CreditCardBloc>(() => _i113.CreditCardBloc(
          gh<_i90.CreditCardListFetchUseCase>(),
          gh<_i91.CreditCardSaveUseCase>(),
          gh<_i89.CreditCardDeleteUseCase>(),
          gh<_i76.UserController>(),
        ));
    gh.factory<
            _i11.Factory<_i93.Future<_i28.ReviewModel?>, _i27.ReviewModelDto>>(
        () => _i114.ReviewModelFromDto(gh<_i110.UserService>()));
    gh.factory<_i115.GetCurrentUserUseCase>(
        () => _i115.GetCurrentUserUseCase(gh<_i110.UserService>()));
    gh.factory<_i116.LogOutUseCase>(
        () => _i116.LogOutUseCase(gh<_i110.UserService>()));
    gh.factory<_i117.PinCodeChangeUseCase>(
        () => _i117.PinCodeChangeUseCase(gh<_i110.UserService>()));
    gh.factory<_i118.SpecialistService>(() => _i119.FirebaseSpecialistService(
          gh<_i67.SpecialistRepository>(),
          gh<
              _i11.Factory<_i93.Future<_i97.SpecialistModel>,
                  _i98.SpecialistModelDto>>(),
          gh<_i11.Factory<_i24.FilterPreferencesDto, _i25.FilterPreferences>>(),
          gh<
              _i11.Factory<_i93.Future<_i28.ReviewModel?>,
                  _i27.ReviewModelDto>>(),
          gh<_i11.Factory<_i27.ReviewModelDto, _i28.ReviewModel>>(),
        ));
    gh.factory<_i120.UpdateReviewUseCase>(
        () => _i120.UpdateReviewUseCase(gh<_i118.SpecialistService>()));
    gh.factory<_i121.UserDataUpdateUseCase>(
        () => _i121.UserDataUpdateUseCase(gh<_i110.UserService>()));
    gh.factory<_i122.AddReviewUseCase>(
        () => _i122.AddReviewUseCase(gh<_i118.SpecialistService>()));
    gh.factory<_i123.AddToFavoriteUseCase>(
        () => _i123.AddToFavoriteUseCase(gh<_i118.SpecialistService>()));
    gh.factory<_i124.DeleteReviewUseCase>(
        () => _i124.DeleteReviewUseCase(gh<_i118.SpecialistService>()));
    gh.factory<
            _i11.Factory<_i93.Future<_i16.BookingData?>, _i15.BookingDataDto>>(
        () => _i125.BookingDataFromDto(gh<_i118.SpecialistService>()));
    gh.factory<_i126.FetchFavoriteListUseCase>(
        () => _i126.FetchFavoriteListUseCase(gh<_i118.SpecialistService>()));
    gh.factory<_i127.FetchSpecialistCatalogueUseCase>(() =>
        _i127.FetchSpecialistCatalogueUseCase(gh<_i118.SpecialistService>()));
    gh.factory<_i128.FetchSpecialistReviewsUseCase>(() =>
        _i128.FetchSpecialistReviewsUseCase(gh<_i118.SpecialistService>()));
    gh.factory<_i129.FetchSpecialistUseCase>(
        () => _i129.FetchSpecialistUseCase(gh<_i118.SpecialistService>()));
    gh.factory<_i130.FetchSpecialistsOnlineUseCase>(() =>
        _i130.FetchSpecialistsOnlineUseCase(gh<_i118.SpecialistService>()));
    gh.factory<_i131.PinCodeBloc>(() => _i131.PinCodeBloc(
          gh<_i76.UserController>(),
          gh<_i117.PinCodeChangeUseCase>(),
        ));
    gh.factory<_i132.RemoveFromFavoriteUseCase>(
        () => _i132.RemoveFromFavoriteUseCase(gh<_i118.SpecialistService>()));
    gh.factory<_i133.ReviewBloc>(() => _i133.ReviewBloc(
          gh<_i128.FetchSpecialistReviewsUseCase>(),
          gh<_i122.AddReviewUseCase>(),
          gh<_i76.UserController>(),
          gh<_i66.SpecialistRatingController>(),
          gh<_i120.UpdateReviewUseCase>(),
          gh<_i124.DeleteReviewUseCase>(),
        ));
    gh.factory<_i134.SpecialistCatalogueBloc>(
        () => _i134.SpecialistCatalogueBloc(
              gh<_i127.FetchSpecialistCatalogueUseCase>(),
              gh<_i3.AppliedFilterController>(),
              gh<_i66.SpecialistRatingController>(),
            ));
    gh.factory<_i135.SpecialistOnlineBloc>(() => _i135.SpecialistOnlineBloc(
          gh<_i130.FetchSpecialistsOnlineUseCase>(),
          gh<_i66.SpecialistRatingController>(),
        ));
    gh.factory<_i136.UserBloc>(() => _i136.UserBloc(
          gh<_i115.GetCurrentUserUseCase>(),
          gh<_i116.LogOutUseCase>(),
          gh<_i121.UserDataUpdateUseCase>(),
          gh<_i76.UserController>(),
        ));
    gh.factory<_i137.BookingService>(() => _i138.FirebaseBookingService(
          gh<_i9.BookingRepository>(),
          gh<
              _i11.Factory<_i38.SpecialistWorkInfo,
                  _i39.SpecialistWorkInfoDto>>(),
          gh<_i11.Factory<_i15.BookingDataDto, _i16.BookingData>>(),
          gh<
              _i11.Factory<_i93.Future<_i16.BookingData?>,
                  _i15.BookingDataDto>>(),
        ));
    gh.factory<_i139.FavoriteBloc>(() => _i139.FavoriteBloc(
          gh<_i76.UserController>(),
          gh<_i126.FetchFavoriteListUseCase>(),
          gh<_i123.AddToFavoriteUseCase>(),
          gh<_i132.RemoveFromFavoriteUseCase>(),
        ));
    gh.factory<_i140.FetchPreviousSessionsUseCase>(
        () => _i140.FetchPreviousSessionsUseCase(gh<_i137.BookingService>()));
    gh.factory<_i141.FetchSessionDataUseCase>(
        () => _i141.FetchSessionDataUseCase(gh<_i137.BookingService>()));
    gh.factory<_i142.FetchUpcomingSessionsUseCase>(
        () => _i142.FetchUpcomingSessionsUseCase(gh<_i137.BookingService>()));
    gh.factory<_i143.NotificationsBloc>(() => _i143.NotificationsBloc(
          gh<_i104.InitializeNotificationsUseCase>(),
          gh<_i76.UserController>(),
          gh<_i48.NotificationController>(),
          gh<_i100.FetchChatRoomUseCase>(),
          gh<_i129.FetchSpecialistUseCase>(),
          gh<_i141.FetchSessionDataUseCase>(),
        ));
    gh.factory<_i144.PreviousSessionsBloc>(() => _i144.PreviousSessionsBloc(
          gh<_i140.FetchPreviousSessionsUseCase>(),
          gh<_i76.UserController>(),
        ));
    gh.factory<_i145.SpecialistWorkInfoFetchUseCase>(
        () => _i145.SpecialistWorkInfoFetchUseCase(gh<_i137.BookingService>()));
    gh.factory<_i146.UpcomingSessionsBloc>(() => _i146.UpcomingSessionsBloc(
          gh<_i142.FetchUpcomingSessionsUseCase>(),
          gh<_i76.UserController>(),
          gh<_i8.BookingController>(),
        ));
    gh.factory<_i147.WorkInfoBloc>(
        () => _i147.WorkInfoBloc(gh<_i145.SpecialistWorkInfoFetchUseCase>()));
    gh.factory<_i148.BookingBookUseCase>(
        () => _i148.BookingBookUseCase(gh<_i137.BookingService>()));
    gh.factory<_i149.BookingCancelUseCase>(
        () => _i149.BookingCancelUseCase(gh<_i137.BookingService>()));
    gh.factory<_i150.BookingRescheduleUseCase>(
        () => _i150.BookingRescheduleUseCase(gh<_i137.BookingService>()));
    gh.factory<_i151.BookingBloc>(() => _i151.BookingBloc(
          gh<_i148.BookingBookUseCase>(),
          gh<_i150.BookingRescheduleUseCase>(),
          gh<_i149.BookingCancelUseCase>(),
          gh<_i76.UserController>(),
          gh<_i8.BookingController>(),
        ));
    return this;
  }
}
