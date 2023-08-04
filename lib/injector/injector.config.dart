// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i67;

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mint/assembly/entity/booking_data_from_dto.dart' as _i94;
import 'package:mint/assembly/entity/credit_card_model_from_dto.dart' as _i27;
import 'package:mint/assembly/entity/pick_up_filter_from_dto.dart' as _i30;
import 'package:mint/assembly/entity/review_model_from_dto.dart' as _i83;
import 'package:mint/assembly/entity/specialist_filter_from_dto.dart' as _i12;
import 'package:mint/assembly/entity/specialist_model_from_dto.dart' as _i73;
import 'package:mint/assembly/entity/specialist_work_info_from_dto.dart'
    as _i33;
import 'package:mint/assembly/entity/user_model_from_dto.dart' as _i70;
import 'package:mint/assembly/factory.dart' as _i9;
import 'package:mint/assembly/model/booking_data_to_dto.dart' as _i24;
import 'package:mint/assembly/model/filter_preferences_to_dto.dart' as _i15;
import 'package:mint/assembly/model/review_model_to_dto.dart' as _i18;
import 'package:mint/assembly/model/transaction_data_to_dto.dart' as _i21;
import 'package:mint/bloc/auth/auth_bloc.dart' as _i62;
import 'package:mint/bloc/booking/booking_bloc.dart' as _i116;
import 'package:mint/bloc/chat/chat_bloc.dart' as _i81;
import 'package:mint/bloc/credit_card/credit_card_bloc.dart' as _i82;
import 'package:mint/bloc/favorite/favorite_bloc.dart' as _i106;
import 'package:mint/bloc/pick_up_specialist/pick_up_specialist_bloc.dart'
    as _i76;
import 'package:mint/bloc/pin_code/pin_code_bloc.dart' as _i99;
import 'package:mint/bloc/previous_sessions/previous_sessions_bloc.dart'
    as _i109;
import 'package:mint/bloc/review/review_bloc.dart' as _i101;
import 'package:mint/bloc/specialist_catalogue/specialist_catalogue_bloc.dart'
    as _i102;
import 'package:mint/bloc/specialist_filter/specialist_filter_bloc.dart'
    as _i77;
import 'package:mint/bloc/specialist_online/specialist_online_bloc.dart'
    as _i103;
import 'package:mint/bloc/transaction/transaction_bloc.dart' as _i78;
import 'package:mint/bloc/upcoming_sessions/upcoming_sessions_bloc.dart'
    as _i111;
import 'package:mint/bloc/user/user_bloc.dart' as _i90;
import 'package:mint/bloc/work_info/work_info_bloc.dart' as _i112;
import 'package:mint/data/model/booking_data_dto/booking_data_dto.dart' as _i22;
import 'package:mint/data/model/credit_card_model_dto/credit_card_model_dto.dart'
    as _i26;
import 'package:mint/data/model/filter_preferences_dto/filter_preferences_dto.dart'
    as _i13;
import 'package:mint/data/model/pick_up_filter_dto/pick_up_filter_dto.dart'
    as _i29;
import 'package:mint/data/model/review_model_dto/review_model_dto.dart' as _i16;
import 'package:mint/data/model/specialist_filter_dto/specialist_filter_dto.dart'
    as _i11;
import 'package:mint/data/model/specialist_model_dto/specialist_model_dto.dart'
    as _i72;
import 'package:mint/data/model/specialist_work_info_dto/specialist_work_info_dto.dart'
    as _i32;
import 'package:mint/data/model/transaction_data_dto/transaction_data_dto.dart'
    as _i19;
import 'package:mint/data/model/user_model_dto/user_model_dto.dart' as _i69;
import 'package:mint/data/repository/abstract/booking_repository.dart' as _i5;
import 'package:mint/data/repository/abstract/chat_repository.dart' as _i7;
import 'package:mint/data/repository/abstract/filter_repository.dart' as _i36;
import 'package:mint/data/repository/abstract/payment_repository.dart' as _i40;
import 'package:mint/data/repository/abstract/phone_auth_repository.dart'
    as _i44;
import 'package:mint/data/repository/abstract/specialist_repository.dart'
    as _i50;
import 'package:mint/data/repository/abstract/storage_repository.dart' as _i52;
import 'package:mint/data/repository/abstract/user_repository.dart' as _i58;
import 'package:mint/data/repository/firebase/firebase_auth_repository.dart'
    as _i45;
import 'package:mint/data/repository/firebase/firebase_booking_repository.dart'
    as _i6;
import 'package:mint/data/repository/firebase/firebase_chat_repository.dart'
    as _i8;
import 'package:mint/data/repository/firebase/firebase_filter_repository.dart'
    as _i37;
import 'package:mint/data/repository/firebase/firebase_payment_repository.dart'
    as _i41;
import 'package:mint/data/repository/firebase/firebase_specialist_repository.dart'
    as _i51;
import 'package:mint/data/repository/firebase/firebase_storage_repository.dart'
    as _i53;
import 'package:mint/data/repository/firebase/firebase_user_repository.dart'
    as _i59;
import 'package:mint/domain/controller/applied_filter_controller.dart' as _i3;
import 'package:mint/domain/controller/booking_controller.dart' as _i4;
import 'package:mint/domain/controller/pick_up_filter_controller.dart' as _i48;
import 'package:mint/domain/controller/specialist_rating_controller.dart'
    as _i49;
import 'package:mint/domain/controller/user_controller.dart' as _i57;
import 'package:mint/domain/entity/booking_data/booking_data.dart' as _i23;
import 'package:mint/domain/entity/credit_card_model/credit_card_model.dart'
    as _i25;
import 'package:mint/domain/entity/filter_preferences/filter_preferences.dart'
    as _i14;
import 'package:mint/domain/entity/pick_up_filter/pick_up_filter.dart' as _i28;
import 'package:mint/domain/entity/review_model/review_model.dart' as _i17;
import 'package:mint/domain/entity/specialist_filter/specialist_filter.dart'
    as _i10;
import 'package:mint/domain/entity/specialist_model/specialist_model.dart'
    as _i71;
import 'package:mint/domain/entity/specialist_work_info/specialist_work_info.dart'
    as _i31;
import 'package:mint/domain/entity/transaction_data/transaction_data.dart'
    as _i20;
import 'package:mint/domain/entity/user_model/user_model.dart' as _i68;
import 'package:mint/domain/service/abstract/booking_service.dart' as _i104;
import 'package:mint/domain/service/abstract/chat_service.dart' as _i63;
import 'package:mint/domain/service/abstract/file_picker_service.dart' as _i34;
import 'package:mint/domain/service/abstract/filter_service.dart' as _i38;
import 'package:mint/domain/service/abstract/payment_service.dart' as _i42;
import 'package:mint/domain/service/abstract/phone_auth_service.dart' as _i46;
import 'package:mint/domain/service/abstract/specialist_service.dart' as _i87;
import 'package:mint/domain/service/abstract/storage_service.dart' as _i54;
import 'package:mint/domain/service/abstract/user_service.dart' as _i79;
import 'package:mint/domain/service/file_picker_service_impl.dart' as _i35;
import 'package:mint/domain/service/firebase/firebase_booking_service.dart'
    as _i105;
import 'package:mint/domain/service/firebase/firebase_chat_service.dart'
    as _i64;
import 'package:mint/domain/service/firebase/firebase_filter_service.dart'
    as _i39;
import 'package:mint/domain/service/firebase/firebase_payment_service.dart'
    as _i43;
import 'package:mint/domain/service/firebase/firebase_phone_auth_service.dart'
    as _i47;
import 'package:mint/domain/service/firebase/firebase_specialist_service.dart'
    as _i88;
import 'package:mint/domain/service/firebase/firebase_storage_service.dart'
    as _i55;
import 'package:mint/domain/service/firebase/firebase_user_service.dart'
    as _i80;
import 'package:mint/domain/usecase/add_review_use_case.dart' as _i91;
import 'package:mint/domain/usecase/add_to_favorite_use_case.dart' as _i92;
import 'package:mint/domain/usecase/booking_book_use_case.dart' as _i113;
import 'package:mint/domain/usecase/booking_cancel_use_case.dart' as _i114;
import 'package:mint/domain/usecase/booking_reschedule_use_case.dart' as _i115;
import 'package:mint/domain/usecase/credit_card_list_fetch_use_case.dart'
    as _i65;
import 'package:mint/domain/usecase/credit_card_save_use_case.dart' as _i66;
import 'package:mint/domain/usecase/delete_review_use_case.dart' as _i93;
import 'package:mint/domain/usecase/fetch_favorite_list_use_case.dart' as _i95;
import 'package:mint/domain/usecase/fetch_pick_up_filter_use_case.dart' as _i74;
import 'package:mint/domain/usecase/fetch_previous_sessions_use_case.dart'
    as _i107;
import 'package:mint/domain/usecase/fetch_specialist_catalogue_use_case.dart'
    as _i96;
import 'package:mint/domain/usecase/fetch_specialist_filter_use_case.dart'
    as _i75;
import 'package:mint/domain/usecase/fetch_specialist_reviews_use_case.dart'
    as _i97;
import 'package:mint/domain/usecase/fetch_specialists_online_use_case.dart'
    as _i98;
import 'package:mint/domain/usecase/fetch_upcoming_sessions_use_case.dart'
    as _i108;
import 'package:mint/domain/usecase/get_current_user_use_case.dart' as _i84;
import 'package:mint/domain/usecase/log_out_use_case.dart' as _i85;
import 'package:mint/domain/usecase/pin_code_change_use_case.dart' as _i86;
import 'package:mint/domain/usecase/remove_from_favorite_use_case.dart'
    as _i100;
import 'package:mint/domain/usecase/specialist_work_info_fetch_use_case.dart'
    as _i110;
import 'package:mint/domain/usecase/transaction_pay_use_case.dart' as _i56;
import 'package:mint/domain/usecase/update_review_use_case.dart' as _i89;
import 'package:mint/domain/usecase/verify_otp_use_case.dart' as _i60;
import 'package:mint/domain/usecase/verify_phone_use_case.dart' as _i61;

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
    gh.factory<_i7.ChatRepository>(() => _i8.FirebaseChatRepository());
    gh.factory<_i9.Factory<_i10.SpecialistFilter, _i11.SpecialistFilterDto>>(
        () => _i12.SpecialistFilterFromDto());
    gh.factory<_i9.Factory<_i13.FilterPreferencesDto, _i14.FilterPreferences>>(
        () => _i15.FilterPreferencesToDto());
    gh.factory<_i9.Factory<_i16.ReviewModelDto, _i17.ReviewModel>>(
        () => _i18.ReviewModelToDto());
    gh.factory<_i9.Factory<_i19.TransactionDataDto, _i20.TransactionData>>(
        () => _i21.TransactionDataToDto());
    gh.factory<_i9.Factory<_i22.BookingDataDto, _i23.BookingData>>(
        () => _i24.BookingDataToDto());
    gh.factory<_i9.Factory<_i25.CreditCardModel, _i26.CreditCardModelDto>>(
        () => _i27.CreditCardModelFromDto());
    gh.factory<_i9.Factory<_i28.PickUpFilter, _i29.PickUpFilterDto>>(
        () => _i30.PickUpFilterFromDto());
    gh.factory<
            _i9.Factory<_i31.SpecialistWorkInfo, _i32.SpecialistWorkInfoDto>>(
        () => _i33.SpecialistWorkInfoFromDto());
    gh.factory<_i34.FilePickerService>(() => _i35.FilePickerServiceImpl());
    gh.factory<_i36.FilterRepository>(() => _i37.FirebaseFilterRepository());
    gh.factory<_i38.FilterService>(() => _i39.FirebaseFilterService(
          gh<_i36.FilterRepository>(),
          gh<_i9.Factory<_i10.SpecialistFilter, _i11.SpecialistFilterDto>>(),
          gh<_i9.Factory<_i28.PickUpFilter, _i29.PickUpFilterDto>>(),
        ));
    gh.factory<_i40.PaymentRepository>(() => _i41.FirebasePaymentRepository());
    gh.factory<_i42.PaymentService>(() => _i43.FirebasePaymentService(
          gh<_i40.PaymentRepository>(),
          gh<_i9.Factory<_i25.CreditCardModel, _i26.CreditCardModelDto>>(),
          gh<_i9.Factory<_i19.TransactionDataDto, _i20.TransactionData>>(),
        ));
    gh.factory<_i44.PhoneAuthRepository>(() => _i45.FirebaseAuthRepository());
    gh.factory<_i46.PhoneAuthService>(
        () => _i47.FirebasePhoneAuthService(gh<_i44.PhoneAuthRepository>()));
    gh.lazySingleton<_i48.PickUpFilterController>(
        () => _i48.PickUpFilterController());
    gh.lazySingleton<_i49.SpecialistRatingController>(
        () => _i49.SpecialistRatingController());
    gh.factory<_i50.SpecialistRepository>(
        () => _i51.FirebaseSpecialistRepository());
    gh.factory<_i52.StorageRepository>(() => _i53.FirebaseStorageRepository());
    gh.factory<_i54.StorageService>(
        () => _i55.FirebaseStorageService(gh<_i52.StorageRepository>()));
    gh.factory<_i56.TransactionPayUseCase>(
        () => _i56.TransactionPayUseCase(gh<_i42.PaymentService>()));
    gh.lazySingleton<_i57.UserController>(() => _i57.UserController());
    gh.factory<_i58.UserRepository>(() => _i59.FirebaseUserRepository());
    gh.factory<_i60.VerifyOtpUseCase>(
        () => _i60.VerifyOtpUseCase(gh<_i46.PhoneAuthService>()));
    gh.factory<_i61.VerifyPhoneUseCase>(
        () => _i61.VerifyPhoneUseCase(gh<_i46.PhoneAuthService>()));
    gh.factory<_i62.AuthBloc>(() => _i62.AuthBloc(
          gh<_i61.VerifyPhoneUseCase>(),
          gh<_i60.VerifyOtpUseCase>(),
          gh<_i57.UserController>(),
        ));
    gh.factory<_i63.ChatService>(() => _i64.FirebaseChatService(
          gh<_i7.ChatRepository>(),
          gh<_i54.StorageService>(),
        ));
    gh.factory<_i65.CreditCardListFetchUseCase>(
        () => _i65.CreditCardListFetchUseCase(gh<_i42.PaymentService>()));
    gh.factory<_i66.CreditCardSaveUseCase>(
        () => _i66.CreditCardSaveUseCase(gh<_i42.PaymentService>()));
    gh.factory<_i9.Factory<_i67.Future<_i68.UserModel>, _i69.UserModelDto>>(
        () => _i70.UserModelFromDto(gh<_i54.StorageService>()));
    gh.factory<
            _i9.Factory<_i67.Future<_i71.SpecialistModel>,
                _i72.SpecialistModelDto>>(
        () => _i73.SpecialistModelFromDto(gh<_i54.StorageService>()));
    gh.factory<_i74.FetchPickUpFilterUseCase>(
        () => _i74.FetchPickUpFilterUseCase(gh<_i38.FilterService>()));
    gh.factory<_i75.FetchSpecialistFilterUseCase>(
        () => _i75.FetchSpecialistFilterUseCase(gh<_i38.FilterService>()));
    gh.factory<_i76.PickUpSpecialistBloc>(() => _i76.PickUpSpecialistBloc(
          gh<_i74.FetchPickUpFilterUseCase>(),
          gh<_i48.PickUpFilterController>(),
        ));
    gh.factory<_i77.SpecialistFilterBloc>(() => _i77.SpecialistFilterBloc(
          gh<_i75.FetchSpecialistFilterUseCase>(),
          gh<_i3.AppliedFilterController>(),
          gh<_i48.PickUpFilterController>(),
        ));
    gh.factory<_i78.TransactionBloc>(() => _i78.TransactionBloc(
          gh<_i56.TransactionPayUseCase>(),
          gh<_i57.UserController>(),
        ));
    gh.factory<_i79.UserService>(() => _i80.FirebaseUserService(
          gh<_i58.UserRepository>(),
          gh<_i9.Factory<_i67.Future<_i68.UserModel>, _i69.UserModelDto>>(),
        ));
    gh.factory<_i81.ChatBloc>(() => _i81.ChatBloc(
          gh<_i63.ChatService>(),
          gh<_i34.FilePickerService>(),
          gh<_i57.UserController>(),
        ));
    gh.factory<_i82.CreditCardBloc>(() => _i82.CreditCardBloc(
          gh<_i66.CreditCardSaveUseCase>(),
          gh<_i65.CreditCardListFetchUseCase>(),
          gh<_i57.UserController>(),
        ));
    gh.factory<
            _i9.Factory<_i67.Future<_i17.ReviewModel?>, _i16.ReviewModelDto>>(
        () => _i83.ReviewModelFromDto(gh<_i79.UserService>()));
    gh.factory<_i84.GetCurrentUserUseCase>(
        () => _i84.GetCurrentUserUseCase(gh<_i79.UserService>()));
    gh.factory<_i85.LogOutUseCase>(
        () => _i85.LogOutUseCase(gh<_i79.UserService>()));
    gh.factory<_i86.PinCodeChangeUseCase>(
        () => _i86.PinCodeChangeUseCase(gh<_i79.UserService>()));
    gh.factory<_i87.SpecialistService>(() => _i88.FirebaseSpecialistService(
          gh<_i50.SpecialistRepository>(),
          gh<
              _i9.Factory<_i67.Future<_i71.SpecialistModel>,
                  _i72.SpecialistModelDto>>(),
          gh<_i9.Factory<_i13.FilterPreferencesDto, _i14.FilterPreferences>>(),
          gh<
              _i9.Factory<_i67.Future<_i17.ReviewModel?>,
                  _i16.ReviewModelDto>>(),
          gh<_i9.Factory<_i16.ReviewModelDto, _i17.ReviewModel>>(),
        ));
    gh.factory<_i89.UpdateReviewUseCase>(
        () => _i89.UpdateReviewUseCase(gh<_i87.SpecialistService>()));
    gh.factory<_i90.UserBloc>(() => _i90.UserBloc(
          gh<_i84.GetCurrentUserUseCase>(),
          gh<_i85.LogOutUseCase>(),
          gh<_i57.UserController>(),
        ));
    gh.factory<_i91.AddReviewUseCase>(
        () => _i91.AddReviewUseCase(gh<_i87.SpecialistService>()));
    gh.factory<_i92.AddToFavoriteUseCase>(
        () => _i92.AddToFavoriteUseCase(gh<_i87.SpecialistService>()));
    gh.factory<_i93.DeleteReviewUseCase>(
        () => _i93.DeleteReviewUseCase(gh<_i87.SpecialistService>()));
    gh.factory<
            _i9.Factory<_i67.Future<_i23.BookingData?>, _i22.BookingDataDto>>(
        () => _i94.BookingDataFromDto(gh<_i87.SpecialistService>()));
    gh.factory<_i95.FetchFavoriteListUseCase>(
        () => _i95.FetchFavoriteListUseCase(gh<_i87.SpecialistService>()));
    gh.factory<_i96.FetchSpecialistCatalogueUseCase>(() =>
        _i96.FetchSpecialistCatalogueUseCase(gh<_i87.SpecialistService>()));
    gh.factory<_i97.FetchSpecialistReviewsUseCase>(
        () => _i97.FetchSpecialistReviewsUseCase(gh<_i87.SpecialistService>()));
    gh.factory<_i98.FetchSpecialistsOnlineUseCase>(
        () => _i98.FetchSpecialistsOnlineUseCase(gh<_i87.SpecialistService>()));
    gh.factory<_i99.PinCodeBloc>(() => _i99.PinCodeBloc(
          gh<_i57.UserController>(),
          gh<_i86.PinCodeChangeUseCase>(),
        ));
    gh.factory<_i100.RemoveFromFavoriteUseCase>(
        () => _i100.RemoveFromFavoriteUseCase(gh<_i87.SpecialistService>()));
    gh.factory<_i101.ReviewBloc>(() => _i101.ReviewBloc(
          gh<_i97.FetchSpecialistReviewsUseCase>(),
          gh<_i91.AddReviewUseCase>(),
          gh<_i57.UserController>(),
          gh<_i49.SpecialistRatingController>(),
          gh<_i89.UpdateReviewUseCase>(),
          gh<_i93.DeleteReviewUseCase>(),
        ));
    gh.factory<_i102.SpecialistCatalogueBloc>(
        () => _i102.SpecialistCatalogueBloc(
              gh<_i96.FetchSpecialistCatalogueUseCase>(),
              gh<_i3.AppliedFilterController>(),
              gh<_i49.SpecialistRatingController>(),
            ));
    gh.factory<_i103.SpecialistOnlineBloc>(() => _i103.SpecialistOnlineBloc(
          gh<_i98.FetchSpecialistsOnlineUseCase>(),
          gh<_i49.SpecialistRatingController>(),
        ));
    gh.factory<_i104.BookingService>(() => _i105.FirebaseBookingService(
          gh<_i5.BookingRepository>(),
          gh<
              _i9.Factory<_i31.SpecialistWorkInfo,
                  _i32.SpecialistWorkInfoDto>>(),
          gh<_i9.Factory<_i22.BookingDataDto, _i23.BookingData>>(),
          gh<
              _i9.Factory<_i67.Future<_i23.BookingData?>,
                  _i22.BookingDataDto>>(),
        ));
    gh.factory<_i106.FavoriteBloc>(() => _i106.FavoriteBloc(
          gh<_i57.UserController>(),
          gh<_i95.FetchFavoriteListUseCase>(),
          gh<_i92.AddToFavoriteUseCase>(),
          gh<_i100.RemoveFromFavoriteUseCase>(),
        ));
    gh.factory<_i107.FetchPreviousSessionsUseCase>(
        () => _i107.FetchPreviousSessionsUseCase(gh<_i104.BookingService>()));
    gh.factory<_i108.FetchUpcomingSessionsUseCase>(
        () => _i108.FetchUpcomingSessionsUseCase(gh<_i104.BookingService>()));
    gh.factory<_i109.PreviousSessionsBloc>(() => _i109.PreviousSessionsBloc(
          gh<_i107.FetchPreviousSessionsUseCase>(),
          gh<_i57.UserController>(),
        ));
    gh.factory<_i110.SpecialistWorkInfoFetchUseCase>(
        () => _i110.SpecialistWorkInfoFetchUseCase(gh<_i104.BookingService>()));
    gh.factory<_i111.UpcomingSessionsBloc>(() => _i111.UpcomingSessionsBloc(
          gh<_i108.FetchUpcomingSessionsUseCase>(),
          gh<_i57.UserController>(),
          gh<_i4.BookingController>(),
        ));
    gh.factory<_i112.WorkInfoBloc>(
        () => _i112.WorkInfoBloc(gh<_i110.SpecialistWorkInfoFetchUseCase>()));
    gh.factory<_i113.BookingBookUseCase>(
        () => _i113.BookingBookUseCase(gh<_i104.BookingService>()));
    gh.factory<_i114.BookingCancelUseCase>(
        () => _i114.BookingCancelUseCase(gh<_i104.BookingService>()));
    gh.factory<_i115.BookingRescheduleUseCase>(
        () => _i115.BookingRescheduleUseCase(gh<_i104.BookingService>()));
    gh.factory<_i116.BookingBloc>(() => _i116.BookingBloc(
          gh<_i113.BookingBookUseCase>(),
          gh<_i115.BookingRescheduleUseCase>(),
          gh<_i114.BookingCancelUseCase>(),
          gh<_i57.UserController>(),
          gh<_i4.BookingController>(),
        ));
    return this;
  }
}
