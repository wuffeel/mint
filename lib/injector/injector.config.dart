// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i77;

import 'package:flutter_chat_types/flutter_chat_types.dart' as _i14;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mint/assembly/entity/booking_data_from_dto.dart' as _i107;
import 'package:mint/assembly/entity/chat_user_data_from_map.dart' as _i15;
import 'package:mint/assembly/entity/credit_card_model_from_dto.dart' as _i27;
import 'package:mint/assembly/entity/pick_up_filter_from_dto.dart' as _i18;
import 'package:mint/assembly/entity/review_model_from_dto.dart' as _i96;
import 'package:mint/assembly/entity/specialist_filter_from_dto.dart' as _i13;
import 'package:mint/assembly/entity/specialist_model_from_dto.dart' as _i80;
import 'package:mint/assembly/entity/specialist_work_info_from_dto.dart'
    as _i24;
import 'package:mint/assembly/entity/user_model_from_dto.dart' as _i83;
import 'package:mint/assembly/factory.dart' as _i7;
import 'package:mint/assembly/model/booking_data_to_dto.dart' as _i33;
import 'package:mint/assembly/model/filter_preferences_to_dto.dart' as _i21;
import 'package:mint/assembly/model/review_model_to_dto.dart' as _i30;
import 'package:mint/assembly/model/transaction_data_to_dto.dart' as _i10;
import 'package:mint/bloc/audio_message/audio_message_cubit.dart' as _i67;
import 'package:mint/bloc/auth/auth_bloc.dart' as _i68;
import 'package:mint/bloc/booking/booking_bloc.dart' as _i129;
import 'package:mint/bloc/chat/chat_bloc.dart' as _i94;
import 'package:mint/bloc/credit_card/credit_card_bloc.dart' as _i95;
import 'package:mint/bloc/favorite/favorite_bloc.dart' as _i119;
import 'package:mint/bloc/pick_up_specialist/pick_up_specialist_bloc.dart'
    as _i87;
import 'package:mint/bloc/pin_code/pin_code_bloc.dart' as _i112;
import 'package:mint/bloc/previous_sessions/previous_sessions_bloc.dart'
    as _i122;
import 'package:mint/bloc/review/review_bloc.dart' as _i114;
import 'package:mint/bloc/specialist_catalogue/specialist_catalogue_bloc.dart'
    as _i115;
import 'package:mint/bloc/specialist_filter/specialist_filter_bloc.dart'
    as _i90;
import 'package:mint/bloc/specialist_online/specialist_online_bloc.dart'
    as _i116;
import 'package:mint/bloc/transaction/transaction_bloc.dart' as _i91;
import 'package:mint/bloc/upcoming_sessions/upcoming_sessions_bloc.dart'
    as _i124;
import 'package:mint/bloc/user/user_bloc.dart' as _i103;
import 'package:mint/bloc/work_info/work_info_bloc.dart' as _i125;
import 'package:mint/data/model/booking_data_dto/booking_data_dto.dart' as _i31;
import 'package:mint/data/model/credit_card_model_dto/credit_card_model_dto.dart'
    as _i26;
import 'package:mint/data/model/filter_preferences_dto/filter_preferences_dto.dart'
    as _i19;
import 'package:mint/data/model/pick_up_filter_dto/pick_up_filter_dto.dart'
    as _i17;
import 'package:mint/data/model/review_model_dto/review_model_dto.dart' as _i28;
import 'package:mint/data/model/specialist_filter_dto/specialist_filter_dto.dart'
    as _i12;
import 'package:mint/data/model/specialist_model_dto/specialist_model_dto.dart'
    as _i79;
import 'package:mint/data/model/specialist_work_info_dto/specialist_work_info_dto.dart'
    as _i23;
import 'package:mint/data/model/transaction_data_dto/transaction_data_dto.dart'
    as _i8;
import 'package:mint/data/model/user_model_dto/user_model_dto.dart' as _i82;
import 'package:mint/data/repository/abstract/booking_repository.dart' as _i5;
import 'package:mint/data/repository/abstract/chat_repository.dart' as _i69;
import 'package:mint/data/repository/abstract/filter_repository.dart' as _i36;
import 'package:mint/data/repository/abstract/payment_repository.dart' as _i42;
import 'package:mint/data/repository/abstract/phone_auth_repository.dart'
    as _i46;
import 'package:mint/data/repository/abstract/specialist_repository.dart'
    as _i55;
import 'package:mint/data/repository/abstract/storage_repository.dart' as _i57;
import 'package:mint/data/repository/abstract/user_repository.dart' as _i63;
import 'package:mint/data/repository/firebase/firebase_auth_repository.dart'
    as _i47;
import 'package:mint/data/repository/firebase/firebase_booking_repository.dart'
    as _i6;
import 'package:mint/data/repository/firebase/firebase_chat_repository.dart'
    as _i70;
import 'package:mint/data/repository/firebase/firebase_filter_repository.dart'
    as _i37;
import 'package:mint/data/repository/firebase/firebase_payment_repository.dart'
    as _i43;
import 'package:mint/data/repository/firebase/firebase_specialist_repository.dart'
    as _i56;
import 'package:mint/data/repository/firebase/firebase_storage_repository.dart'
    as _i58;
import 'package:mint/data/repository/firebase/firebase_user_repository.dart'
    as _i64;
import 'package:mint/domain/controller/applied_filter_controller.dart' as _i3;
import 'package:mint/domain/controller/booking_controller.dart' as _i4;
import 'package:mint/domain/controller/pick_up_filter_controller.dart' as _i52;
import 'package:mint/domain/controller/specialist_rating_controller.dart'
    as _i54;
import 'package:mint/domain/controller/user_controller.dart' as _i62;
import 'package:mint/domain/entity/booking_data/booking_data.dart' as _i32;
import 'package:mint/domain/entity/credit_card_model/credit_card_model.dart'
    as _i25;
import 'package:mint/domain/entity/filter_preferences/filter_preferences.dart'
    as _i20;
import 'package:mint/domain/entity/pick_up_filter/pick_up_filter.dart' as _i16;
import 'package:mint/domain/entity/review_model/review_model.dart' as _i29;
import 'package:mint/domain/entity/specialist_filter/specialist_filter.dart'
    as _i11;
import 'package:mint/domain/entity/specialist_model/specialist_model.dart'
    as _i78;
import 'package:mint/domain/entity/specialist_work_info/specialist_work_info.dart'
    as _i22;
import 'package:mint/domain/entity/transaction_data/transaction_data.dart'
    as _i9;
import 'package:mint/domain/entity/user_model/user_model.dart' as _i81;
import 'package:mint/domain/service/abstract/booking_service.dart' as _i117;
import 'package:mint/domain/service/abstract/chat_service.dart' as _i71;
import 'package:mint/domain/service/abstract/file_picker_service.dart' as _i34;
import 'package:mint/domain/service/abstract/filter_service.dart' as _i38;
import 'package:mint/domain/service/abstract/payment_service.dart' as _i44;
import 'package:mint/domain/service/abstract/phone_auth_service.dart' as _i48;
import 'package:mint/domain/service/abstract/specialist_service.dart' as _i100;
import 'package:mint/domain/service/abstract/storage_service.dart' as _i59;
import 'package:mint/domain/service/abstract/user_service.dart' as _i92;
import 'package:mint/domain/service/file_picker_service_impl.dart' as _i35;
import 'package:mint/domain/service/firebase/firebase_booking_service.dart'
    as _i118;
import 'package:mint/domain/service/firebase/firebase_chat_service.dart'
    as _i72;
import 'package:mint/domain/service/firebase/firebase_filter_service.dart'
    as _i39;
import 'package:mint/domain/service/firebase/firebase_payment_service.dart'
    as _i45;
import 'package:mint/domain/service/firebase/firebase_phone_auth_service.dart'
    as _i49;
import 'package:mint/domain/service/firebase/firebase_specialist_service.dart'
    as _i101;
import 'package:mint/domain/service/firebase/firebase_storage_service.dart'
    as _i60;
import 'package:mint/domain/service/firebase/firebase_user_service.dart'
    as _i93;
import 'package:mint/domain/usecase/add_review_use_case.dart' as _i104;
import 'package:mint/domain/usecase/add_to_favorite_use_case.dart' as _i105;
import 'package:mint/domain/usecase/booking_book_use_case.dart' as _i126;
import 'package:mint/domain/usecase/booking_cancel_use_case.dart' as _i127;
import 'package:mint/domain/usecase/booking_reschedule_use_case.dart' as _i128;
import 'package:mint/domain/usecase/create_chat_room_use_case.dart' as _i73;
import 'package:mint/domain/usecase/credit_card_list_fetch_use_case.dart'
    as _i74;
import 'package:mint/domain/usecase/credit_card_save_use_case.dart' as _i75;
import 'package:mint/domain/usecase/delete_message_use_case.dart' as _i76;
import 'package:mint/domain/usecase/delete_review_use_case.dart' as _i106;
import 'package:mint/domain/usecase/fetch_favorite_list_use_case.dart' as _i108;
import 'package:mint/domain/usecase/fetch_pick_up_filter_use_case.dart' as _i84;
import 'package:mint/domain/usecase/fetch_previous_sessions_use_case.dart'
    as _i120;
import 'package:mint/domain/usecase/fetch_specialist_catalogue_use_case.dart'
    as _i109;
import 'package:mint/domain/usecase/fetch_specialist_filter_use_case.dart'
    as _i85;
import 'package:mint/domain/usecase/fetch_specialist_reviews_use_case.dart'
    as _i110;
import 'package:mint/domain/usecase/fetch_specialists_online_use_case.dart'
    as _i111;
import 'package:mint/domain/usecase/fetch_upcoming_sessions_use_case.dart'
    as _i121;
import 'package:mint/domain/usecase/get_current_user_use_case.dart' as _i97;
import 'package:mint/domain/usecase/get_messages_use_case.dart' as _i86;
import 'package:mint/domain/usecase/load_file_use_case.dart' as _i40;
import 'package:mint/domain/usecase/log_out_use_case.dart' as _i98;
import 'package:mint/domain/usecase/open_file_use_case.dart' as _i41;
import 'package:mint/domain/usecase/pick_file_use_case.dart' as _i50;
import 'package:mint/domain/usecase/pick_image_use_case.dart' as _i51;
import 'package:mint/domain/usecase/pin_code_change_use_case.dart' as _i99;
import 'package:mint/domain/usecase/preview_data_fetched_use_case.dart' as _i88;
import 'package:mint/domain/usecase/remove_from_favorite_use_case.dart'
    as _i113;
import 'package:mint/domain/usecase/save_audio_use_case.dart' as _i53;
import 'package:mint/domain/usecase/send_message_use_case.dart' as _i89;
import 'package:mint/domain/usecase/specialist_work_info_fetch_use_case.dart'
    as _i123;
import 'package:mint/domain/usecase/transaction_pay_use_case.dart' as _i61;
import 'package:mint/domain/usecase/update_review_use_case.dart' as _i102;
import 'package:mint/domain/usecase/verify_otp_use_case.dart' as _i65;
import 'package:mint/domain/usecase/verify_phone_use_case.dart' as _i66;

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
    gh.factory<_i7.Factory<_i11.SpecialistFilter, _i12.SpecialistFilterDto>>(
        () => _i13.SpecialistFilterFromDto());
    gh.factory<_i7.Factory<_i14.User, Map<String, dynamic>>>(
        () => _i15.ChatUserDataFromMap());
    gh.factory<_i7.Factory<_i16.PickUpFilter, _i17.PickUpFilterDto>>(
        () => _i18.PickUpFilterFromDto());
    gh.factory<_i7.Factory<_i19.FilterPreferencesDto, _i20.FilterPreferences>>(
        () => _i21.FilterPreferencesToDto());
    gh.factory<
            _i7.Factory<_i22.SpecialistWorkInfo, _i23.SpecialistWorkInfoDto>>(
        () => _i24.SpecialistWorkInfoFromDto());
    gh.factory<_i7.Factory<_i25.CreditCardModel, _i26.CreditCardModelDto>>(
        () => _i27.CreditCardModelFromDto());
    gh.factory<_i7.Factory<_i28.ReviewModelDto, _i29.ReviewModel>>(
        () => _i30.ReviewModelToDto());
    gh.factory<_i7.Factory<_i31.BookingDataDto, _i32.BookingData>>(
        () => _i33.BookingDataToDto());
    gh.factory<_i34.FilePickerService>(() => _i35.FilePickerServiceImpl());
    gh.factory<_i36.FilterRepository>(() => _i37.FirebaseFilterRepository());
    gh.factory<_i38.FilterService>(() => _i39.FirebaseFilterService(
          gh<_i36.FilterRepository>(),
          gh<_i7.Factory<_i11.SpecialistFilter, _i12.SpecialistFilterDto>>(),
          gh<_i7.Factory<_i16.PickUpFilter, _i17.PickUpFilterDto>>(),
        ));
    gh.factory<_i40.LoadFileUseCase>(
        () => _i40.LoadFileUseCase(gh<_i34.FilePickerService>()));
    gh.factory<_i41.OpenFileUseCase>(
        () => _i41.OpenFileUseCase(gh<_i34.FilePickerService>()));
    gh.factory<_i42.PaymentRepository>(() => _i43.FirebasePaymentRepository());
    gh.factory<_i44.PaymentService>(() => _i45.FirebasePaymentService(
          gh<_i42.PaymentRepository>(),
          gh<_i7.Factory<_i25.CreditCardModel, _i26.CreditCardModelDto>>(),
          gh<_i7.Factory<_i8.TransactionDataDto, _i9.TransactionData>>(),
        ));
    gh.factory<_i46.PhoneAuthRepository>(() => _i47.FirebaseAuthRepository());
    gh.factory<_i48.PhoneAuthService>(
        () => _i49.FirebasePhoneAuthService(gh<_i46.PhoneAuthRepository>()));
    gh.factory<_i50.PickFileUseCase>(
        () => _i50.PickFileUseCase(gh<_i34.FilePickerService>()));
    gh.factory<_i51.PickImageUseCase>(
        () => _i51.PickImageUseCase(gh<_i34.FilePickerService>()));
    gh.lazySingleton<_i52.PickUpFilterController>(
        () => _i52.PickUpFilterController());
    gh.factory<_i53.SaveAudioUseCase>(
        () => _i53.SaveAudioUseCase(gh<_i34.FilePickerService>()));
    gh.lazySingleton<_i54.SpecialistRatingController>(
        () => _i54.SpecialistRatingController());
    gh.factory<_i55.SpecialistRepository>(
        () => _i56.FirebaseSpecialistRepository());
    gh.factory<_i57.StorageRepository>(() => _i58.FirebaseStorageRepository());
    gh.factory<_i59.StorageService>(
        () => _i60.FirebaseStorageService(gh<_i57.StorageRepository>()));
    gh.factory<_i61.TransactionPayUseCase>(
        () => _i61.TransactionPayUseCase(gh<_i44.PaymentService>()));
    gh.lazySingleton<_i62.UserController>(() => _i62.UserController());
    gh.factory<_i63.UserRepository>(() => _i64.FirebaseUserRepository());
    gh.factory<_i65.VerifyOtpUseCase>(
        () => _i65.VerifyOtpUseCase(gh<_i48.PhoneAuthService>()));
    gh.factory<_i66.VerifyPhoneUseCase>(
        () => _i66.VerifyPhoneUseCase(gh<_i48.PhoneAuthService>()));
    gh.factory<_i67.AudioMessageCubit>(
        () => _i67.AudioMessageCubit(gh<_i40.LoadFileUseCase>()));
    gh.factory<_i68.AuthBloc>(() => _i68.AuthBloc(
          gh<_i66.VerifyPhoneUseCase>(),
          gh<_i65.VerifyOtpUseCase>(),
          gh<_i62.UserController>(),
        ));
    gh.factory<_i69.ChatRepository>(() => _i70.FirebaseChatRepository(
        gh<_i7.Factory<_i14.User, Map<String, dynamic>>>()));
    gh.factory<_i71.ChatService>(() => _i72.FirebaseChatService(
          gh<_i69.ChatRepository>(),
          gh<_i59.StorageService>(),
        ));
    gh.factory<_i73.CreateChatRoomUseCase>(
        () => _i73.CreateChatRoomUseCase(gh<_i71.ChatService>()));
    gh.factory<_i74.CreditCardListFetchUseCase>(
        () => _i74.CreditCardListFetchUseCase(gh<_i44.PaymentService>()));
    gh.factory<_i75.CreditCardSaveUseCase>(
        () => _i75.CreditCardSaveUseCase(gh<_i44.PaymentService>()));
    gh.factory<_i76.DeleteMessageUseCase>(
        () => _i76.DeleteMessageUseCase(gh<_i71.ChatService>()));
    gh.factory<
            _i7.Factory<_i77.Future<_i78.SpecialistModel>,
                _i79.SpecialistModelDto>>(
        () => _i80.SpecialistModelFromDto(gh<_i59.StorageService>()));
    gh.factory<_i7.Factory<_i77.Future<_i81.UserModel>, _i82.UserModelDto>>(
        () => _i83.UserModelFromDto(gh<_i59.StorageService>()));
    gh.factory<_i84.FetchPickUpFilterUseCase>(
        () => _i84.FetchPickUpFilterUseCase(gh<_i38.FilterService>()));
    gh.factory<_i85.FetchSpecialistFilterUseCase>(
        () => _i85.FetchSpecialistFilterUseCase(gh<_i38.FilterService>()));
    gh.factory<_i86.GetMessagesUseCase>(
        () => _i86.GetMessagesUseCase(gh<_i71.ChatService>()));
    gh.factory<_i87.PickUpSpecialistBloc>(() => _i87.PickUpSpecialistBloc(
          gh<_i84.FetchPickUpFilterUseCase>(),
          gh<_i52.PickUpFilterController>(),
        ));
    gh.factory<_i88.PreviewDataFetchedUseCase>(
        () => _i88.PreviewDataFetchedUseCase(gh<_i71.ChatService>()));
    gh.factory<_i89.SendMessageUseCase>(
        () => _i89.SendMessageUseCase(gh<_i71.ChatService>()));
    gh.factory<_i90.SpecialistFilterBloc>(() => _i90.SpecialistFilterBloc(
          gh<_i85.FetchSpecialistFilterUseCase>(),
          gh<_i3.AppliedFilterController>(),
          gh<_i52.PickUpFilterController>(),
        ));
    gh.factory<_i91.TransactionBloc>(() => _i91.TransactionBloc(
          gh<_i61.TransactionPayUseCase>(),
          gh<_i62.UserController>(),
        ));
    gh.factory<_i92.UserService>(() => _i93.FirebaseUserService(
          gh<_i63.UserRepository>(),
          gh<_i7.Factory<_i77.Future<_i81.UserModel>, _i82.UserModelDto>>(),
        ));
    gh.factory<_i94.ChatBloc>(() => _i94.ChatBloc(
          gh<_i62.UserController>(),
          gh<_i86.GetMessagesUseCase>(),
          gh<_i73.CreateChatRoomUseCase>(),
          gh<_i89.SendMessageUseCase>(),
          gh<_i76.DeleteMessageUseCase>(),
          gh<_i88.PreviewDataFetchedUseCase>(),
          gh<_i51.PickImageUseCase>(),
          gh<_i50.PickFileUseCase>(),
          gh<_i40.LoadFileUseCase>(),
          gh<_i41.OpenFileUseCase>(),
          gh<_i53.SaveAudioUseCase>(),
        ));
    gh.factory<_i95.CreditCardBloc>(() => _i95.CreditCardBloc(
          gh<_i75.CreditCardSaveUseCase>(),
          gh<_i74.CreditCardListFetchUseCase>(),
          gh<_i62.UserController>(),
        ));
    gh.factory<
            _i7.Factory<_i77.Future<_i29.ReviewModel?>, _i28.ReviewModelDto>>(
        () => _i96.ReviewModelFromDto(gh<_i92.UserService>()));
    gh.factory<_i97.GetCurrentUserUseCase>(
        () => _i97.GetCurrentUserUseCase(gh<_i92.UserService>()));
    gh.factory<_i98.LogOutUseCase>(
        () => _i98.LogOutUseCase(gh<_i92.UserService>()));
    gh.factory<_i99.PinCodeChangeUseCase>(
        () => _i99.PinCodeChangeUseCase(gh<_i92.UserService>()));
    gh.factory<_i100.SpecialistService>(() => _i101.FirebaseSpecialistService(
          gh<_i55.SpecialistRepository>(),
          gh<
              _i7.Factory<_i77.Future<_i78.SpecialistModel>,
                  _i79.SpecialistModelDto>>(),
          gh<_i7.Factory<_i19.FilterPreferencesDto, _i20.FilterPreferences>>(),
          gh<
              _i7.Factory<_i77.Future<_i29.ReviewModel?>,
                  _i28.ReviewModelDto>>(),
          gh<_i7.Factory<_i28.ReviewModelDto, _i29.ReviewModel>>(),
        ));
    gh.factory<_i102.UpdateReviewUseCase>(
        () => _i102.UpdateReviewUseCase(gh<_i100.SpecialistService>()));
    gh.factory<_i103.UserBloc>(() => _i103.UserBloc(
          gh<_i97.GetCurrentUserUseCase>(),
          gh<_i98.LogOutUseCase>(),
          gh<_i62.UserController>(),
        ));
    gh.factory<_i104.AddReviewUseCase>(
        () => _i104.AddReviewUseCase(gh<_i100.SpecialistService>()));
    gh.factory<_i105.AddToFavoriteUseCase>(
        () => _i105.AddToFavoriteUseCase(gh<_i100.SpecialistService>()));
    gh.factory<_i106.DeleteReviewUseCase>(
        () => _i106.DeleteReviewUseCase(gh<_i100.SpecialistService>()));
    gh.factory<
            _i7.Factory<_i77.Future<_i32.BookingData?>, _i31.BookingDataDto>>(
        () => _i107.BookingDataFromDto(gh<_i100.SpecialistService>()));
    gh.factory<_i108.FetchFavoriteListUseCase>(
        () => _i108.FetchFavoriteListUseCase(gh<_i100.SpecialistService>()));
    gh.factory<_i109.FetchSpecialistCatalogueUseCase>(() =>
        _i109.FetchSpecialistCatalogueUseCase(gh<_i100.SpecialistService>()));
    gh.factory<_i110.FetchSpecialistReviewsUseCase>(() =>
        _i110.FetchSpecialistReviewsUseCase(gh<_i100.SpecialistService>()));
    gh.factory<_i111.FetchSpecialistsOnlineUseCase>(() =>
        _i111.FetchSpecialistsOnlineUseCase(gh<_i100.SpecialistService>()));
    gh.factory<_i112.PinCodeBloc>(() => _i112.PinCodeBloc(
          gh<_i62.UserController>(),
          gh<_i99.PinCodeChangeUseCase>(),
        ));
    gh.factory<_i113.RemoveFromFavoriteUseCase>(
        () => _i113.RemoveFromFavoriteUseCase(gh<_i100.SpecialistService>()));
    gh.factory<_i114.ReviewBloc>(() => _i114.ReviewBloc(
          gh<_i110.FetchSpecialistReviewsUseCase>(),
          gh<_i104.AddReviewUseCase>(),
          gh<_i62.UserController>(),
          gh<_i54.SpecialistRatingController>(),
          gh<_i102.UpdateReviewUseCase>(),
          gh<_i106.DeleteReviewUseCase>(),
        ));
    gh.factory<_i115.SpecialistCatalogueBloc>(
        () => _i115.SpecialistCatalogueBloc(
              gh<_i109.FetchSpecialistCatalogueUseCase>(),
              gh<_i3.AppliedFilterController>(),
              gh<_i54.SpecialistRatingController>(),
            ));
    gh.factory<_i116.SpecialistOnlineBloc>(() => _i116.SpecialistOnlineBloc(
          gh<_i111.FetchSpecialistsOnlineUseCase>(),
          gh<_i54.SpecialistRatingController>(),
        ));
    gh.factory<_i117.BookingService>(() => _i118.FirebaseBookingService(
          gh<_i5.BookingRepository>(),
          gh<
              _i7.Factory<_i22.SpecialistWorkInfo,
                  _i23.SpecialistWorkInfoDto>>(),
          gh<_i7.Factory<_i31.BookingDataDto, _i32.BookingData>>(),
          gh<
              _i7.Factory<_i77.Future<_i32.BookingData?>,
                  _i31.BookingDataDto>>(),
        ));
    gh.factory<_i119.FavoriteBloc>(() => _i119.FavoriteBloc(
          gh<_i62.UserController>(),
          gh<_i108.FetchFavoriteListUseCase>(),
          gh<_i105.AddToFavoriteUseCase>(),
          gh<_i113.RemoveFromFavoriteUseCase>(),
        ));
    gh.factory<_i120.FetchPreviousSessionsUseCase>(
        () => _i120.FetchPreviousSessionsUseCase(gh<_i117.BookingService>()));
    gh.factory<_i121.FetchUpcomingSessionsUseCase>(
        () => _i121.FetchUpcomingSessionsUseCase(gh<_i117.BookingService>()));
    gh.factory<_i122.PreviousSessionsBloc>(() => _i122.PreviousSessionsBloc(
          gh<_i120.FetchPreviousSessionsUseCase>(),
          gh<_i62.UserController>(),
        ));
    gh.factory<_i123.SpecialistWorkInfoFetchUseCase>(
        () => _i123.SpecialistWorkInfoFetchUseCase(gh<_i117.BookingService>()));
    gh.factory<_i124.UpcomingSessionsBloc>(() => _i124.UpcomingSessionsBloc(
          gh<_i121.FetchUpcomingSessionsUseCase>(),
          gh<_i62.UserController>(),
          gh<_i4.BookingController>(),
        ));
    gh.factory<_i125.WorkInfoBloc>(
        () => _i125.WorkInfoBloc(gh<_i123.SpecialistWorkInfoFetchUseCase>()));
    gh.factory<_i126.BookingBookUseCase>(
        () => _i126.BookingBookUseCase(gh<_i117.BookingService>()));
    gh.factory<_i127.BookingCancelUseCase>(
        () => _i127.BookingCancelUseCase(gh<_i117.BookingService>()));
    gh.factory<_i128.BookingRescheduleUseCase>(
        () => _i128.BookingRescheduleUseCase(gh<_i117.BookingService>()));
    gh.factory<_i129.BookingBloc>(() => _i129.BookingBloc(
          gh<_i126.BookingBookUseCase>(),
          gh<_i128.BookingRescheduleUseCase>(),
          gh<_i127.BookingCancelUseCase>(),
          gh<_i62.UserController>(),
          gh<_i4.BookingController>(),
        ));
    return this;
  }
}
