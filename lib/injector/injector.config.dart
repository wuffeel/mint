// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i83;

import 'package:flutter_chat_types/flutter_chat_types.dart' as _i17;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mint/assembly/entity/booking_data_from_dto.dart' as _i116;
import 'package:mint/assembly/entity/chat_room_from_map.dart' as _i31;
import 'package:mint/assembly/entity/chat_user_data_from_map.dart' as _i18;
import 'package:mint/assembly/entity/credit_card_model_from_dto.dart' as _i30;
import 'package:mint/assembly/entity/pick_up_filter_from_dto.dart' as _i21;
import 'package:mint/assembly/entity/review_model_from_dto.dart' as _i105;
import 'package:mint/assembly/entity/specialist_filter_from_dto.dart' as _i16;
import 'package:mint/assembly/entity/specialist_model_from_dto.dart' as _i86;
import 'package:mint/assembly/entity/specialist_work_info_from_dto.dart'
    as _i27;
import 'package:mint/assembly/entity/user_model_from_dto.dart' as _i89;
import 'package:mint/assembly/factory.dart' as _i7;
import 'package:mint/assembly/model/booking_data_to_dto.dart' as _i13;
import 'package:mint/assembly/model/filter_preferences_to_dto.dart' as _i24;
import 'package:mint/assembly/model/review_model_to_dto.dart' as _i34;
import 'package:mint/assembly/model/transaction_data_to_dto.dart' as _i10;
import 'package:mint/assembly/model/user_model_to_dto.dart' as _i90;
import 'package:mint/bloc/audio_message/audio_message_cubit.dart' as _i73;
import 'package:mint/bloc/auth/auth_bloc.dart' as _i74;
import 'package:mint/bloc/booking/booking_bloc.dart' as _i142;
import 'package:mint/bloc/chat/chat_bloc.dart' as _i103;
import 'package:mint/bloc/credit_card/credit_card_bloc.dart' as _i104;
import 'package:mint/bloc/favorite/favorite_bloc.dart' as _i130;
import 'package:mint/bloc/notifications/notifications_bloc.dart' as _i134;
import 'package:mint/bloc/pick_up_specialist/pick_up_specialist_bloc.dart'
    as _i96;
import 'package:mint/bloc/pin_code/pin_code_bloc.dart' as _i122;
import 'package:mint/bloc/previous_sessions/previous_sessions_bloc.dart'
    as _i135;
import 'package:mint/bloc/review/review_bloc.dart' as _i124;
import 'package:mint/bloc/specialist_catalogue/specialist_catalogue_bloc.dart'
    as _i125;
import 'package:mint/bloc/specialist_filter/specialist_filter_bloc.dart'
    as _i99;
import 'package:mint/bloc/specialist_online/specialist_online_bloc.dart'
    as _i126;
import 'package:mint/bloc/transaction/transaction_bloc.dart' as _i100;
import 'package:mint/bloc/upcoming_sessions/upcoming_sessions_bloc.dart'
    as _i137;
import 'package:mint/bloc/user/user_bloc.dart' as _i127;
import 'package:mint/bloc/work_info/work_info_bloc.dart' as _i138;
import 'package:mint/data/model/booking_data_dto/booking_data_dto.dart' as _i11;
import 'package:mint/data/model/credit_card_model_dto/credit_card_model_dto.dart'
    as _i29;
import 'package:mint/data/model/filter_preferences_dto/filter_preferences_dto.dart'
    as _i22;
import 'package:mint/data/model/pick_up_filter_dto/pick_up_filter_dto.dart'
    as _i20;
import 'package:mint/data/model/review_model_dto/review_model_dto.dart' as _i32;
import 'package:mint/data/model/specialist_filter_dto/specialist_filter_dto.dart'
    as _i15;
import 'package:mint/data/model/specialist_model_dto/specialist_model_dto.dart'
    as _i85;
import 'package:mint/data/model/specialist_work_info_dto/specialist_work_info_dto.dart'
    as _i26;
import 'package:mint/data/model/transaction_data_dto/transaction_data_dto.dart'
    as _i8;
import 'package:mint/data/model/user_model_dto/user_model_dto.dart' as _i88;
import 'package:mint/data/repository/abstract/booking_repository.dart' as _i5;
import 'package:mint/data/repository/abstract/chat_repository.dart' as _i75;
import 'package:mint/data/repository/abstract/filter_repository.dart' as _i37;
import 'package:mint/data/repository/abstract/notification_repository.dart'
    as _i43;
import 'package:mint/data/repository/abstract/payment_repository.dart' as _i48;
import 'package:mint/data/repository/abstract/phone_auth_repository.dart'
    as _i52;
import 'package:mint/data/repository/abstract/specialist_repository.dart'
    as _i61;
import 'package:mint/data/repository/abstract/storage_repository.dart' as _i63;
import 'package:mint/data/repository/abstract/user_repository.dart' as _i69;
import 'package:mint/data/repository/firebase/firebase_auth_repository.dart'
    as _i53;
import 'package:mint/data/repository/firebase/firebase_booking_repository.dart'
    as _i6;
import 'package:mint/data/repository/firebase/firebase_chat_repository.dart'
    as _i76;
import 'package:mint/data/repository/firebase/firebase_filter_repository.dart'
    as _i38;
import 'package:mint/data/repository/firebase/firebase_notification_repository.dart'
    as _i44;
import 'package:mint/data/repository/firebase/firebase_payment_repository.dart'
    as _i49;
import 'package:mint/data/repository/firebase/firebase_specialist_repository.dart'
    as _i62;
import 'package:mint/data/repository/firebase/firebase_storage_repository.dart'
    as _i64;
import 'package:mint/data/repository/firebase/firebase_user_repository.dart'
    as _i70;
import 'package:mint/domain/controller/applied_filter_controller.dart' as _i3;
import 'package:mint/domain/controller/booking_controller.dart' as _i4;
import 'package:mint/domain/controller/notification_controller.dart' as _i42;
import 'package:mint/domain/controller/pick_up_filter_controller.dart' as _i58;
import 'package:mint/domain/controller/specialist_rating_controller.dart'
    as _i60;
import 'package:mint/domain/controller/user_controller.dart' as _i68;
import 'package:mint/domain/entity/booking_data/booking_data.dart' as _i12;
import 'package:mint/domain/entity/credit_card_model/credit_card_model.dart'
    as _i28;
import 'package:mint/domain/entity/filter_preferences/filter_preferences.dart'
    as _i23;
import 'package:mint/domain/entity/pick_up_filter/pick_up_filter.dart' as _i19;
import 'package:mint/domain/entity/review_model/review_model.dart' as _i33;
import 'package:mint/domain/entity/specialist_filter/specialist_filter.dart'
    as _i14;
import 'package:mint/domain/entity/specialist_model/specialist_model.dart'
    as _i84;
import 'package:mint/domain/entity/specialist_work_info/specialist_work_info.dart'
    as _i25;
import 'package:mint/domain/entity/transaction_data/transaction_data.dart'
    as _i9;
import 'package:mint/domain/entity/user_model/user_model.dart' as _i87;
import 'package:mint/domain/service/abstract/booking_service.dart' as _i128;
import 'package:mint/domain/service/abstract/chat_service.dart' as _i77;
import 'package:mint/domain/service/abstract/file_picker_service.dart' as _i35;
import 'package:mint/domain/service/abstract/filter_service.dart' as _i39;
import 'package:mint/domain/service/abstract/notification_service.dart' as _i45;
import 'package:mint/domain/service/abstract/payment_service.dart' as _i50;
import 'package:mint/domain/service/abstract/phone_auth_service.dart' as _i54;
import 'package:mint/domain/service/abstract/specialist_service.dart' as _i109;
import 'package:mint/domain/service/abstract/storage_service.dart' as _i65;
import 'package:mint/domain/service/abstract/user_service.dart' as _i101;
import 'package:mint/domain/service/file_picker_service_impl.dart' as _i36;
import 'package:mint/domain/service/firebase/firebase_booking_service.dart'
    as _i129;
import 'package:mint/domain/service/firebase/firebase_chat_service.dart'
    as _i78;
import 'package:mint/domain/service/firebase/firebase_filter_service.dart'
    as _i40;
import 'package:mint/domain/service/firebase/firebase_notification_service.dart'
    as _i46;
import 'package:mint/domain/service/firebase/firebase_payment_service.dart'
    as _i51;
import 'package:mint/domain/service/firebase/firebase_phone_auth_service.dart'
    as _i55;
import 'package:mint/domain/service/firebase/firebase_specialist_service.dart'
    as _i110;
import 'package:mint/domain/service/firebase/firebase_storage_service.dart'
    as _i66;
import 'package:mint/domain/service/firebase/firebase_user_service.dart'
    as _i102;
import 'package:mint/domain/usecase/add_review_use_case.dart' as _i113;
import 'package:mint/domain/usecase/add_to_favorite_use_case.dart' as _i114;
import 'package:mint/domain/usecase/booking_book_use_case.dart' as _i139;
import 'package:mint/domain/usecase/booking_cancel_use_case.dart' as _i140;
import 'package:mint/domain/usecase/booking_reschedule_use_case.dart' as _i141;
import 'package:mint/domain/usecase/create_chat_room_use_case.dart' as _i79;
import 'package:mint/domain/usecase/credit_card_list_fetch_use_case.dart'
    as _i80;
import 'package:mint/domain/usecase/credit_card_save_use_case.dart' as _i81;
import 'package:mint/domain/usecase/delete_message_use_case.dart' as _i82;
import 'package:mint/domain/usecase/delete_review_use_case.dart' as _i115;
import 'package:mint/domain/usecase/fetch_chat_room_use_case.dart' as _i91;
import 'package:mint/domain/usecase/fetch_favorite_list_use_case.dart' as _i117;
import 'package:mint/domain/usecase/fetch_pick_up_filter_use_case.dart' as _i92;
import 'package:mint/domain/usecase/fetch_previous_sessions_use_case.dart'
    as _i131;
import 'package:mint/domain/usecase/fetch_session_data_use_case.dart' as _i132;
import 'package:mint/domain/usecase/fetch_specialist_catalogue_use_case.dart'
    as _i118;
import 'package:mint/domain/usecase/fetch_specialist_filter_use_case.dart'
    as _i93;
import 'package:mint/domain/usecase/fetch_specialist_reviews_use_case.dart'
    as _i119;
import 'package:mint/domain/usecase/fetch_specialist_use_case.dart' as _i120;
import 'package:mint/domain/usecase/fetch_specialists_online_use_case.dart'
    as _i121;
import 'package:mint/domain/usecase/fetch_upcoming_sessions_use_case.dart'
    as _i133;
import 'package:mint/domain/usecase/get_current_user_use_case.dart' as _i106;
import 'package:mint/domain/usecase/get_messages_use_case.dart' as _i94;
import 'package:mint/domain/usecase/initialize_notifications_use_case.dart'
    as _i95;
import 'package:mint/domain/usecase/load_file_use_case.dart' as _i41;
import 'package:mint/domain/usecase/log_out_use_case.dart' as _i107;
import 'package:mint/domain/usecase/open_file_use_case.dart' as _i47;
import 'package:mint/domain/usecase/pick_file_use_case.dart' as _i56;
import 'package:mint/domain/usecase/pick_image_use_case.dart' as _i57;
import 'package:mint/domain/usecase/pin_code_change_use_case.dart' as _i108;
import 'package:mint/domain/usecase/preview_data_fetched_use_case.dart' as _i97;
import 'package:mint/domain/usecase/remove_from_favorite_use_case.dart'
    as _i123;
import 'package:mint/domain/usecase/save_audio_use_case.dart' as _i59;
import 'package:mint/domain/usecase/send_message_use_case.dart' as _i98;
import 'package:mint/domain/usecase/specialist_work_info_fetch_use_case.dart'
    as _i136;
import 'package:mint/domain/usecase/transaction_pay_use_case.dart' as _i67;
import 'package:mint/domain/usecase/update_review_use_case.dart' as _i111;
import 'package:mint/domain/usecase/user_data_update_use_case.dart' as _i112;
import 'package:mint/domain/usecase/verify_otp_use_case.dart' as _i71;
import 'package:mint/domain/usecase/verify_phone_use_case.dart' as _i72;

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
    gh.lazySingleton<_i4.BookingController>(() => _i4.BookingController());
    gh.factory<_i5.BookingRepository>(() => _i6.FirebaseBookingRepository());
    gh.factory<_i7.Factory<_i8.TransactionDataDto, _i9.TransactionData>>(
        () => _i10.TransactionDataToDto());
    gh.factory<_i7.Factory<_i11.BookingDataDto, _i12.BookingData>>(
        () => _i13.BookingDataToDto());
    gh.factory<_i7.Factory<_i14.SpecialistFilter, _i15.SpecialistFilterDto>>(
        () => _i16.SpecialistFilterFromDto());
    gh.factory<_i7.Factory<_i17.User, Map<String, dynamic>>>(
        () => _i18.ChatUserDataFromMap());
    gh.factory<_i7.Factory<_i19.PickUpFilter, _i20.PickUpFilterDto>>(
        () => _i21.PickUpFilterFromDto());
    gh.factory<_i7.Factory<_i22.FilterPreferencesDto, _i23.FilterPreferences>>(
        () => _i24.FilterPreferencesToDto());
    gh.factory<
            _i7.Factory<_i25.SpecialistWorkInfo, _i26.SpecialistWorkInfoDto>>(
        () => _i27.SpecialistWorkInfoFromDto());
    gh.factory<_i7.Factory<_i28.CreditCardModel, _i29.CreditCardModelDto>>(
        () => _i30.CreditCardModelFromDto());
    gh.factory<_i7.Factory<_i17.Room?, Map<String, dynamic>>>(
        () => _i31.ChatRoomFromMap());
    gh.factory<_i7.Factory<_i32.ReviewModelDto, _i33.ReviewModel>>(
        () => _i34.ReviewModelToDto());
    gh.factory<_i35.FilePickerService>(() => _i36.FilePickerServiceImpl());
    gh.factory<_i37.FilterRepository>(() => _i38.FirebaseFilterRepository());
    gh.factory<_i39.FilterService>(() => _i40.FirebaseFilterService(
          gh<_i37.FilterRepository>(),
          gh<_i7.Factory<_i14.SpecialistFilter, _i15.SpecialistFilterDto>>(),
          gh<_i7.Factory<_i19.PickUpFilter, _i20.PickUpFilterDto>>(),
        ));
    gh.factory<_i41.LoadFileUseCase>(
        () => _i41.LoadFileUseCase(gh<_i35.FilePickerService>()));
    gh.lazySingleton<_i42.NotificationController>(
        () => _i42.NotificationController());
    gh.factory<_i43.NotificationRepository>(() =>
        _i44.FirebaseNotificationRepository(gh<_i42.NotificationController>()));
    gh.factory<_i45.NotificationService>(() =>
        _i46.FirebaseNotificationService(gh<_i43.NotificationRepository>()));
    gh.factory<_i47.OpenFileUseCase>(
        () => _i47.OpenFileUseCase(gh<_i35.FilePickerService>()));
    gh.factory<_i48.PaymentRepository>(() => _i49.FirebasePaymentRepository());
    gh.factory<_i50.PaymentService>(() => _i51.FirebasePaymentService(
          gh<_i48.PaymentRepository>(),
          gh<_i7.Factory<_i28.CreditCardModel, _i29.CreditCardModelDto>>(),
          gh<_i7.Factory<_i8.TransactionDataDto, _i9.TransactionData>>(),
        ));
    gh.factory<_i52.PhoneAuthRepository>(() => _i53.FirebaseAuthRepository());
    gh.factory<_i54.PhoneAuthService>(
        () => _i55.FirebasePhoneAuthService(gh<_i52.PhoneAuthRepository>()));
    gh.factory<_i56.PickFileUseCase>(
        () => _i56.PickFileUseCase(gh<_i35.FilePickerService>()));
    gh.factory<_i57.PickImageUseCase>(
        () => _i57.PickImageUseCase(gh<_i35.FilePickerService>()));
    gh.lazySingleton<_i58.PickUpFilterController>(
        () => _i58.PickUpFilterController());
    gh.factory<_i59.SaveAudioUseCase>(
        () => _i59.SaveAudioUseCase(gh<_i35.FilePickerService>()));
    gh.lazySingleton<_i60.SpecialistRatingController>(
        () => _i60.SpecialistRatingController());
    gh.factory<_i61.SpecialistRepository>(
        () => _i62.FirebaseSpecialistRepository());
    gh.factory<_i63.StorageRepository>(() => _i64.FirebaseStorageRepository());
    gh.factory<_i65.StorageService>(
        () => _i66.FirebaseStorageService(gh<_i63.StorageRepository>()));
    gh.factory<_i67.TransactionPayUseCase>(
        () => _i67.TransactionPayUseCase(gh<_i50.PaymentService>()));
    gh.lazySingleton<_i68.UserController>(() => _i68.UserController());
    gh.factory<_i69.UserRepository>(() => _i70.FirebaseUserRepository());
    gh.factory<_i71.VerifyOtpUseCase>(
        () => _i71.VerifyOtpUseCase(gh<_i54.PhoneAuthService>()));
    gh.factory<_i72.VerifyPhoneUseCase>(
        () => _i72.VerifyPhoneUseCase(gh<_i54.PhoneAuthService>()));
    gh.factory<_i73.AudioMessageCubit>(
        () => _i73.AudioMessageCubit(gh<_i41.LoadFileUseCase>()));
    gh.factory<_i74.AuthBloc>(() => _i74.AuthBloc(
          gh<_i72.VerifyPhoneUseCase>(),
          gh<_i71.VerifyOtpUseCase>(),
          gh<_i68.UserController>(),
        ));
    gh.factory<_i75.ChatRepository>(() => _i76.FirebaseChatRepository(
        gh<_i7.Factory<_i17.User, Map<String, dynamic>>>()));
    gh.factory<_i77.ChatService>(() => _i78.FirebaseChatService(
          gh<_i75.ChatRepository>(),
          gh<_i65.StorageService>(),
          gh<_i7.Factory<_i17.Room?, Map<String, dynamic>>>(),
        ));
    gh.factory<_i79.CreateChatRoomUseCase>(
        () => _i79.CreateChatRoomUseCase(gh<_i77.ChatService>()));
    gh.factory<_i80.CreditCardListFetchUseCase>(
        () => _i80.CreditCardListFetchUseCase(gh<_i50.PaymentService>()));
    gh.factory<_i81.CreditCardSaveUseCase>(
        () => _i81.CreditCardSaveUseCase(gh<_i50.PaymentService>()));
    gh.factory<_i82.DeleteMessageUseCase>(
        () => _i82.DeleteMessageUseCase(gh<_i77.ChatService>()));
    gh.factory<
            _i7.Factory<_i83.Future<_i84.SpecialistModel>,
                _i85.SpecialistModelDto>>(
        () => _i86.SpecialistModelFromDto(gh<_i65.StorageService>()));
    gh.factory<_i7.Factory<_i83.Future<_i87.UserModel>, _i88.UserModelDto>>(
        () => _i89.UserModelFromDto(gh<_i65.StorageService>()));
    gh.factory<_i7.Factory<_i83.Future<_i88.UserModelDto>, _i87.UserModel>>(
        () => _i90.UserModelToDto(gh<_i65.StorageService>()));
    gh.factory<_i91.FetchChatRoomUseCase>(
        () => _i91.FetchChatRoomUseCase(gh<_i77.ChatService>()));
    gh.factory<_i92.FetchPickUpFilterUseCase>(
        () => _i92.FetchPickUpFilterUseCase(gh<_i39.FilterService>()));
    gh.factory<_i93.FetchSpecialistFilterUseCase>(
        () => _i93.FetchSpecialistFilterUseCase(gh<_i39.FilterService>()));
    gh.factory<_i94.GetMessagesUseCase>(
        () => _i94.GetMessagesUseCase(gh<_i77.ChatService>()));
    gh.factory<_i95.InitializeNotificationsUseCase>(() =>
        _i95.InitializeNotificationsUseCase(gh<_i45.NotificationService>()));
    gh.factory<_i96.PickUpSpecialistBloc>(() => _i96.PickUpSpecialistBloc(
          gh<_i92.FetchPickUpFilterUseCase>(),
          gh<_i58.PickUpFilterController>(),
        ));
    gh.factory<_i97.PreviewDataFetchedUseCase>(
        () => _i97.PreviewDataFetchedUseCase(gh<_i77.ChatService>()));
    gh.factory<_i98.SendMessageUseCase>(
        () => _i98.SendMessageUseCase(gh<_i77.ChatService>()));
    gh.factory<_i99.SpecialistFilterBloc>(() => _i99.SpecialistFilterBloc(
          gh<_i93.FetchSpecialistFilterUseCase>(),
          gh<_i3.AppliedFilterController>(),
          gh<_i58.PickUpFilterController>(),
        ));
    gh.factory<_i100.TransactionBloc>(() => _i100.TransactionBloc(
          gh<_i67.TransactionPayUseCase>(),
          gh<_i68.UserController>(),
        ));
    gh.factory<_i101.UserService>(() => _i102.FirebaseUserService(
          gh<_i69.UserRepository>(),
          gh<_i7.Factory<_i83.Future<_i87.UserModel>, _i88.UserModelDto>>(),
          gh<_i7.Factory<_i83.Future<_i88.UserModelDto>, _i87.UserModel>>(),
        ));
    gh.factory<_i103.ChatBloc>(() => _i103.ChatBloc(
          gh<_i68.UserController>(),
          gh<_i94.GetMessagesUseCase>(),
          gh<_i79.CreateChatRoomUseCase>(),
          gh<_i98.SendMessageUseCase>(),
          gh<_i82.DeleteMessageUseCase>(),
          gh<_i97.PreviewDataFetchedUseCase>(),
          gh<_i57.PickImageUseCase>(),
          gh<_i56.PickFileUseCase>(),
          gh<_i41.LoadFileUseCase>(),
          gh<_i47.OpenFileUseCase>(),
          gh<_i59.SaveAudioUseCase>(),
        ));
    gh.factory<_i104.CreditCardBloc>(() => _i104.CreditCardBloc(
          gh<_i81.CreditCardSaveUseCase>(),
          gh<_i80.CreditCardListFetchUseCase>(),
          gh<_i68.UserController>(),
        ));
    gh.factory<
            _i7.Factory<_i83.Future<_i33.ReviewModel?>, _i32.ReviewModelDto>>(
        () => _i105.ReviewModelFromDto(gh<_i101.UserService>()));
    gh.factory<_i106.GetCurrentUserUseCase>(
        () => _i106.GetCurrentUserUseCase(gh<_i101.UserService>()));
    gh.factory<_i107.LogOutUseCase>(
        () => _i107.LogOutUseCase(gh<_i101.UserService>()));
    gh.factory<_i108.PinCodeChangeUseCase>(
        () => _i108.PinCodeChangeUseCase(gh<_i101.UserService>()));
    gh.factory<_i109.SpecialistService>(() => _i110.FirebaseSpecialistService(
          gh<_i61.SpecialistRepository>(),
          gh<
              _i7.Factory<_i83.Future<_i84.SpecialistModel>,
                  _i85.SpecialistModelDto>>(),
          gh<_i7.Factory<_i22.FilterPreferencesDto, _i23.FilterPreferences>>(),
          gh<
              _i7.Factory<_i83.Future<_i33.ReviewModel?>,
                  _i32.ReviewModelDto>>(),
          gh<_i7.Factory<_i32.ReviewModelDto, _i33.ReviewModel>>(),
        ));
    gh.factory<_i111.UpdateReviewUseCase>(
        () => _i111.UpdateReviewUseCase(gh<_i109.SpecialistService>()));
    gh.factory<_i112.UserDataUpdateUseCase>(
        () => _i112.UserDataUpdateUseCase(gh<_i101.UserService>()));
    gh.factory<_i113.AddReviewUseCase>(
        () => _i113.AddReviewUseCase(gh<_i109.SpecialistService>()));
    gh.factory<_i114.AddToFavoriteUseCase>(
        () => _i114.AddToFavoriteUseCase(gh<_i109.SpecialistService>()));
    gh.factory<_i115.DeleteReviewUseCase>(
        () => _i115.DeleteReviewUseCase(gh<_i109.SpecialistService>()));
    gh.factory<
            _i7.Factory<_i83.Future<_i12.BookingData?>, _i11.BookingDataDto>>(
        () => _i116.BookingDataFromDto(gh<_i109.SpecialistService>()));
    gh.factory<_i117.FetchFavoriteListUseCase>(
        () => _i117.FetchFavoriteListUseCase(gh<_i109.SpecialistService>()));
    gh.factory<_i118.FetchSpecialistCatalogueUseCase>(() =>
        _i118.FetchSpecialistCatalogueUseCase(gh<_i109.SpecialistService>()));
    gh.factory<_i119.FetchSpecialistReviewsUseCase>(() =>
        _i119.FetchSpecialistReviewsUseCase(gh<_i109.SpecialistService>()));
    gh.factory<_i120.FetchSpecialistUseCase>(
        () => _i120.FetchSpecialistUseCase(gh<_i109.SpecialistService>()));
    gh.factory<_i121.FetchSpecialistsOnlineUseCase>(() =>
        _i121.FetchSpecialistsOnlineUseCase(gh<_i109.SpecialistService>()));
    gh.factory<_i122.PinCodeBloc>(() => _i122.PinCodeBloc(
          gh<_i68.UserController>(),
          gh<_i108.PinCodeChangeUseCase>(),
        ));
    gh.factory<_i123.RemoveFromFavoriteUseCase>(
        () => _i123.RemoveFromFavoriteUseCase(gh<_i109.SpecialistService>()));
    gh.factory<_i124.ReviewBloc>(() => _i124.ReviewBloc(
          gh<_i119.FetchSpecialistReviewsUseCase>(),
          gh<_i113.AddReviewUseCase>(),
          gh<_i68.UserController>(),
          gh<_i60.SpecialistRatingController>(),
          gh<_i111.UpdateReviewUseCase>(),
          gh<_i115.DeleteReviewUseCase>(),
        ));
    gh.factory<_i125.SpecialistCatalogueBloc>(
        () => _i125.SpecialistCatalogueBloc(
              gh<_i118.FetchSpecialistCatalogueUseCase>(),
              gh<_i3.AppliedFilterController>(),
              gh<_i60.SpecialistRatingController>(),
            ));
    gh.factory<_i126.SpecialistOnlineBloc>(() => _i126.SpecialistOnlineBloc(
          gh<_i121.FetchSpecialistsOnlineUseCase>(),
          gh<_i60.SpecialistRatingController>(),
        ));
    gh.factory<_i127.UserBloc>(() => _i127.UserBloc(
          gh<_i106.GetCurrentUserUseCase>(),
          gh<_i107.LogOutUseCase>(),
          gh<_i112.UserDataUpdateUseCase>(),
          gh<_i68.UserController>(),
        ));
    gh.factory<_i128.BookingService>(() => _i129.FirebaseBookingService(
          gh<_i5.BookingRepository>(),
          gh<
              _i7.Factory<_i25.SpecialistWorkInfo,
                  _i26.SpecialistWorkInfoDto>>(),
          gh<_i7.Factory<_i11.BookingDataDto, _i12.BookingData>>(),
          gh<
              _i7.Factory<_i83.Future<_i12.BookingData?>,
                  _i11.BookingDataDto>>(),
        ));
    gh.factory<_i130.FavoriteBloc>(() => _i130.FavoriteBloc(
          gh<_i68.UserController>(),
          gh<_i117.FetchFavoriteListUseCase>(),
          gh<_i114.AddToFavoriteUseCase>(),
          gh<_i123.RemoveFromFavoriteUseCase>(),
        ));
    gh.factory<_i131.FetchPreviousSessionsUseCase>(
        () => _i131.FetchPreviousSessionsUseCase(gh<_i128.BookingService>()));
    gh.factory<_i132.FetchSessionDataUseCase>(
        () => _i132.FetchSessionDataUseCase(gh<_i128.BookingService>()));
    gh.factory<_i133.FetchUpcomingSessionsUseCase>(
        () => _i133.FetchUpcomingSessionsUseCase(gh<_i128.BookingService>()));
    gh.factory<_i134.NotificationsBloc>(() => _i134.NotificationsBloc(
          gh<_i95.InitializeNotificationsUseCase>(),
          gh<_i68.UserController>(),
          gh<_i42.NotificationController>(),
          gh<_i91.FetchChatRoomUseCase>(),
          gh<_i120.FetchSpecialistUseCase>(),
          gh<_i132.FetchSessionDataUseCase>(),
        ));
    gh.factory<_i135.PreviousSessionsBloc>(() => _i135.PreviousSessionsBloc(
          gh<_i131.FetchPreviousSessionsUseCase>(),
          gh<_i68.UserController>(),
        ));
    gh.factory<_i136.SpecialistWorkInfoFetchUseCase>(
        () => _i136.SpecialistWorkInfoFetchUseCase(gh<_i128.BookingService>()));
    gh.factory<_i137.UpcomingSessionsBloc>(() => _i137.UpcomingSessionsBloc(
          gh<_i133.FetchUpcomingSessionsUseCase>(),
          gh<_i68.UserController>(),
          gh<_i4.BookingController>(),
        ));
    gh.factory<_i138.WorkInfoBloc>(
        () => _i138.WorkInfoBloc(gh<_i136.SpecialistWorkInfoFetchUseCase>()));
    gh.factory<_i139.BookingBookUseCase>(
        () => _i139.BookingBookUseCase(gh<_i128.BookingService>()));
    gh.factory<_i140.BookingCancelUseCase>(
        () => _i140.BookingCancelUseCase(gh<_i128.BookingService>()));
    gh.factory<_i141.BookingRescheduleUseCase>(
        () => _i141.BookingRescheduleUseCase(gh<_i128.BookingService>()));
    gh.factory<_i142.BookingBloc>(() => _i142.BookingBloc(
          gh<_i139.BookingBookUseCase>(),
          gh<_i141.BookingRescheduleUseCase>(),
          gh<_i140.BookingCancelUseCase>(),
          gh<_i68.UserController>(),
          gh<_i4.BookingController>(),
        ));
    return this;
  }
}
