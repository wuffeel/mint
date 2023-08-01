// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i61;

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mint/assembly/entity/booking_data_from_dto.dart' as _i87;
import 'package:mint/assembly/entity/credit_card_model_from_dto.dart' as _i28;
import 'package:mint/assembly/entity/pick_up_filter_from_dto.dart' as _i22;
import 'package:mint/assembly/entity/review_model_from_dto.dart' as _i76;
import 'package:mint/assembly/entity/specialist_filter_from_dto.dart' as _i31;
import 'package:mint/assembly/entity/specialist_model_from_dto.dart' as _i64;
import 'package:mint/assembly/entity/specialist_work_info_from_dto.dart'
    as _i25;
import 'package:mint/assembly/entity/user_model_from_dto.dart' as _i67;
import 'package:mint/assembly/factory.dart' as _i7;
import 'package:mint/assembly/model/booking_data_to_dto.dart' as _i10;
import 'package:mint/assembly/model/filter_preferences_to_dto.dart' as _i19;
import 'package:mint/assembly/model/review_model_to_dto.dart' as _i16;
import 'package:mint/assembly/model/transaction_data_to_dto.dart' as _i13;
import 'package:mint/bloc/auth/auth_bloc.dart' as _i58;
import 'package:mint/bloc/booking/booking_bloc.dart' as _i108;
import 'package:mint/bloc/credit_card/credit_card_bloc.dart' as _i75;
import 'package:mint/bloc/favorite/favorite_bloc.dart' as _i99;
import 'package:mint/bloc/pick_up_specialist/pick_up_specialist_bloc.dart'
    as _i70;
import 'package:mint/bloc/pin_code/pin_code_bloc.dart' as _i92;
import 'package:mint/bloc/previous_sessions/previous_sessions_bloc.dart'
    as _i102;
import 'package:mint/bloc/review/review_bloc.dart' as _i94;
import 'package:mint/bloc/specialist_catalogue/specialist_catalogue_bloc.dart'
    as _i95;
import 'package:mint/bloc/specialist_filter/specialist_filter_bloc.dart'
    as _i71;
import 'package:mint/bloc/specialist_online/specialist_online_bloc.dart'
    as _i96;
import 'package:mint/bloc/transaction/transaction_bloc.dart' as _i72;
import 'package:mint/bloc/upcoming_sessions/upcoming_sessions_bloc.dart'
    as _i104;
import 'package:mint/bloc/user/user_bloc.dart' as _i83;
import 'package:mint/data/model/booking_data_dto/booking_data_dto.dart' as _i8;
import 'package:mint/data/model/credit_card_model_dto/credit_card_model_dto.dart'
    as _i27;
import 'package:mint/data/model/filter_preferences_dto/filter_preferences_dto.dart'
    as _i17;
import 'package:mint/data/model/pick_up_filter_dto/pick_up_filter_dto.dart'
    as _i21;
import 'package:mint/data/model/review_model_dto/review_model_dto.dart' as _i14;
import 'package:mint/data/model/specialist_filter_dto/specialist_filter_dto.dart'
    as _i30;
import 'package:mint/data/model/specialist_model_dto/specialist_model_dto.dart'
    as _i63;
import 'package:mint/data/model/specialist_work_info_dto/specialist_work_info_dto.dart'
    as _i24;
import 'package:mint/data/model/transaction_data_dto/transaction_data_dto.dart'
    as _i11;
import 'package:mint/data/model/user_model_dto/user_model_dto.dart' as _i66;
import 'package:mint/data/repository/abstract/booking_repository.dart' as _i5;
import 'package:mint/data/repository/abstract/filter_repository.dart' as _i32;
import 'package:mint/data/repository/abstract/payment_repository.dart' as _i36;
import 'package:mint/data/repository/abstract/phone_auth_repository.dart'
    as _i40;
import 'package:mint/data/repository/abstract/specialist_repository.dart'
    as _i46;
import 'package:mint/data/repository/abstract/storage_repository.dart' as _i48;
import 'package:mint/data/repository/abstract/user_repository.dart' as _i54;
import 'package:mint/data/repository/firebase/firebase_auth_repository.dart'
    as _i41;
import 'package:mint/data/repository/firebase/firebase_booking_repository.dart'
    as _i6;
import 'package:mint/data/repository/firebase/firebase_filter_repository.dart'
    as _i33;
import 'package:mint/data/repository/firebase/firebase_payment_repository.dart'
    as _i37;
import 'package:mint/data/repository/firebase/firebase_specialist_repository.dart'
    as _i47;
import 'package:mint/data/repository/firebase/firebase_storage_repository.dart'
    as _i49;
import 'package:mint/data/repository/firebase/firebase_user_repository.dart'
    as _i55;
import 'package:mint/domain/controller/applied_filter_controller.dart' as _i3;
import 'package:mint/domain/controller/booking_controller.dart' as _i4;
import 'package:mint/domain/controller/pick_up_filter_controller.dart' as _i44;
import 'package:mint/domain/controller/specialist_rating_controller.dart'
    as _i45;
import 'package:mint/domain/controller/user_controller.dart' as _i53;
import 'package:mint/domain/entity/booking_data/booking_data.dart' as _i9;
import 'package:mint/domain/entity/credit_card_model/credit_card_model.dart'
    as _i26;
import 'package:mint/domain/entity/filter_preferences/filter_preferences.dart'
    as _i18;
import 'package:mint/domain/entity/pick_up_filter/pick_up_filter.dart' as _i20;
import 'package:mint/domain/entity/review_model/review_model.dart' as _i15;
import 'package:mint/domain/entity/specialist_filter/specialist_filter.dart'
    as _i29;
import 'package:mint/domain/entity/specialist_model/specialist_model.dart'
    as _i62;
import 'package:mint/domain/entity/specialist_work_info/specialist_work_info.dart'
    as _i23;
import 'package:mint/domain/entity/transaction_data/transaction_data.dart'
    as _i12;
import 'package:mint/domain/entity/user_model/user_model.dart' as _i65;
import 'package:mint/domain/service/abstract/booking_service.dart' as _i97;
import 'package:mint/domain/service/abstract/filter_service.dart' as _i34;
import 'package:mint/domain/service/abstract/payment_service.dart' as _i38;
import 'package:mint/domain/service/abstract/phone_auth_service.dart' as _i42;
import 'package:mint/domain/service/abstract/specialist_service.dart' as _i80;
import 'package:mint/domain/service/abstract/storage_service.dart' as _i50;
import 'package:mint/domain/service/abstract/user_service.dart' as _i73;
import 'package:mint/domain/service/firebase/firebase_booking_service.dart'
    as _i98;
import 'package:mint/domain/service/firebase/firebase_filter_service.dart'
    as _i35;
import 'package:mint/domain/service/firebase/firebase_payment_service.dart'
    as _i39;
import 'package:mint/domain/service/firebase/firebase_phone_auth_service.dart'
    as _i43;
import 'package:mint/domain/service/firebase/firebase_specialist_service.dart'
    as _i81;
import 'package:mint/domain/service/firebase/firebase_storage_service.dart'
    as _i51;
import 'package:mint/domain/service/firebase/firebase_user_service.dart'
    as _i74;
import 'package:mint/domain/usecase/add_review_use_case.dart' as _i84;
import 'package:mint/domain/usecase/add_to_favorite_use_case.dart' as _i85;
import 'package:mint/domain/usecase/booking_book_use_case.dart' as _i105;
import 'package:mint/domain/usecase/booking_cancel_use_case.dart' as _i106;
import 'package:mint/domain/usecase/booking_reschedule_use_case.dart' as _i107;
import 'package:mint/domain/usecase/credit_card_list_fetch_use_case.dart'
    as _i59;
import 'package:mint/domain/usecase/credit_card_save_use_case.dart' as _i60;
import 'package:mint/domain/usecase/delete_review_use_case.dart' as _i86;
import 'package:mint/domain/usecase/fetch_favorite_list_use_case.dart' as _i88;
import 'package:mint/domain/usecase/fetch_pick_up_filter_use_case.dart' as _i68;
import 'package:mint/domain/usecase/fetch_previous_sessions_use_case.dart'
    as _i100;
import 'package:mint/domain/usecase/fetch_specialist_catalogue_use_case.dart'
    as _i89;
import 'package:mint/domain/usecase/fetch_specialist_filter_use_case.dart'
    as _i69;
import 'package:mint/domain/usecase/fetch_specialist_reviews_use_case.dart'
    as _i90;
import 'package:mint/domain/usecase/fetch_specialists_online_use_case.dart'
    as _i91;
import 'package:mint/domain/usecase/fetch_upcoming_sessions_use_case.dart'
    as _i101;
import 'package:mint/domain/usecase/get_current_user_use_case.dart' as _i77;
import 'package:mint/domain/usecase/log_out_use_case.dart' as _i78;
import 'package:mint/domain/usecase/pin_code_change_use_case.dart' as _i79;
import 'package:mint/domain/usecase/remove_from_favorite_use_case.dart' as _i93;
import 'package:mint/domain/usecase/specialist_work_info_fetch_use_case.dart'
    as _i103;
import 'package:mint/domain/usecase/transaction_pay_use_case.dart' as _i52;
import 'package:mint/domain/usecase/update_review_use_case.dart' as _i82;
import 'package:mint/domain/usecase/verify_otp_use_case.dart' as _i56;
import 'package:mint/domain/usecase/verify_phone_use_case.dart' as _i57;

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
    gh.factory<_i7.Factory<_i8.BookingDataDto, _i9.BookingData>>(
        () => _i10.BookingDataToDto());
    gh.factory<_i7.Factory<_i11.TransactionDataDto, _i12.TransactionData>>(
        () => _i13.TransactionDataToDto());
    gh.factory<_i7.Factory<_i14.ReviewModelDto, _i15.ReviewModel>>(
        () => _i16.ReviewModelToDto());
    gh.factory<_i7.Factory<_i17.FilterPreferencesDto, _i18.FilterPreferences>>(
        () => _i19.FilterPreferencesToDto());
    gh.factory<_i7.Factory<_i20.PickUpFilter, _i21.PickUpFilterDto>>(
        () => _i22.PickUpFilterFromDto());
    gh.factory<
            _i7.Factory<_i23.SpecialistWorkInfo, _i24.SpecialistWorkInfoDto>>(
        () => _i25.SpecialistWorkInfoFromDto());
    gh.factory<_i7.Factory<_i26.CreditCardModel, _i27.CreditCardModelDto>>(
        () => _i28.CreditCardModelFromDto());
    gh.factory<_i7.Factory<_i29.SpecialistFilter, _i30.SpecialistFilterDto>>(
        () => _i31.SpecialistFilterFromDto());
    gh.factory<_i32.FilterRepository>(() => _i33.FirebaseFilterRepository());
    gh.factory<_i34.FilterService>(() => _i35.FirebaseFilterService(
          gh<_i32.FilterRepository>(),
          gh<_i7.Factory<_i29.SpecialistFilter, _i30.SpecialistFilterDto>>(),
          gh<_i7.Factory<_i20.PickUpFilter, _i21.PickUpFilterDto>>(),
        ));
    gh.factory<_i36.PaymentRepository>(() => _i37.FirebasePaymentRepository());
    gh.factory<_i38.PaymentService>(() => _i39.FirebasePaymentService(
          gh<_i36.PaymentRepository>(),
          gh<_i7.Factory<_i26.CreditCardModel, _i27.CreditCardModelDto>>(),
          gh<_i7.Factory<_i11.TransactionDataDto, _i12.TransactionData>>(),
        ));
    gh.factory<_i40.PhoneAuthRepository>(() => _i41.FirebaseAuthRepository());
    gh.factory<_i42.PhoneAuthService>(
        () => _i43.FirebasePhoneAuthService(gh<_i40.PhoneAuthRepository>()));
    gh.lazySingleton<_i44.PickUpFilterController>(
        () => _i44.PickUpFilterController());
    gh.lazySingleton<_i45.SpecialistRatingController>(
        () => _i45.SpecialistRatingController());
    gh.factory<_i46.SpecialistRepository>(
        () => _i47.FirebaseSpecialistRepository());
    gh.factory<_i48.StorageRepository>(() => _i49.FirebaseStorageRepository());
    gh.factory<_i50.StorageService>(
        () => _i51.FirebaseStorageService(gh<_i48.StorageRepository>()));
    gh.factory<_i52.TransactionPayUseCase>(
        () => _i52.TransactionPayUseCase(gh<_i38.PaymentService>()));
    gh.lazySingleton<_i53.UserController>(() => _i53.UserController());
    gh.factory<_i54.UserRepository>(() => _i55.FirebaseUserRepository());
    gh.factory<_i56.VerifyOtpUseCase>(
        () => _i56.VerifyOtpUseCase(gh<_i42.PhoneAuthService>()));
    gh.factory<_i57.VerifyPhoneUseCase>(
        () => _i57.VerifyPhoneUseCase(gh<_i42.PhoneAuthService>()));
    gh.factory<_i58.AuthBloc>(() => _i58.AuthBloc(
          gh<_i57.VerifyPhoneUseCase>(),
          gh<_i56.VerifyOtpUseCase>(),
          gh<_i53.UserController>(),
        ));
    gh.factory<_i59.CreditCardListFetchUseCase>(
        () => _i59.CreditCardListFetchUseCase(gh<_i38.PaymentService>()));
    gh.factory<_i60.CreditCardSaveUseCase>(
        () => _i60.CreditCardSaveUseCase(gh<_i38.PaymentService>()));
    gh.factory<
            _i7.Factory<_i61.Future<_i62.SpecialistModel>,
                _i63.SpecialistModelDto>>(
        () => _i64.SpecialistModelFromDto(gh<_i50.StorageService>()));
    gh.factory<_i7.Factory<_i61.Future<_i65.UserModel>, _i66.UserModelDto>>(
        () => _i67.UserModelFromDto(gh<_i50.StorageService>()));
    gh.factory<_i68.FetchPickUpFilterUseCase>(
        () => _i68.FetchPickUpFilterUseCase(gh<_i34.FilterService>()));
    gh.factory<_i69.FetchSpecialistFilterUseCase>(
        () => _i69.FetchSpecialistFilterUseCase(gh<_i34.FilterService>()));
    gh.factory<_i70.PickUpSpecialistBloc>(() => _i70.PickUpSpecialistBloc(
          gh<_i68.FetchPickUpFilterUseCase>(),
          gh<_i44.PickUpFilterController>(),
        ));
    gh.factory<_i71.SpecialistFilterBloc>(() => _i71.SpecialistFilterBloc(
          gh<_i69.FetchSpecialistFilterUseCase>(),
          gh<_i3.AppliedFilterController>(),
          gh<_i44.PickUpFilterController>(),
        ));
    gh.factory<_i72.TransactionBloc>(() => _i72.TransactionBloc(
          gh<_i52.TransactionPayUseCase>(),
          gh<_i53.UserController>(),
        ));
    gh.factory<_i73.UserService>(() => _i74.FirebaseUserService(
          gh<_i54.UserRepository>(),
          gh<_i7.Factory<_i61.Future<_i65.UserModel>, _i66.UserModelDto>>(),
        ));
    gh.factory<_i75.CreditCardBloc>(() => _i75.CreditCardBloc(
          gh<_i60.CreditCardSaveUseCase>(),
          gh<_i59.CreditCardListFetchUseCase>(),
          gh<_i53.UserController>(),
        ));
    gh.factory<
            _i7.Factory<_i61.Future<_i15.ReviewModel?>, _i14.ReviewModelDto>>(
        () => _i76.ReviewModelFromDto(gh<_i73.UserService>()));
    gh.factory<_i77.GetCurrentUserUseCase>(
        () => _i77.GetCurrentUserUseCase(gh<_i73.UserService>()));
    gh.factory<_i78.LogOutUseCase>(
        () => _i78.LogOutUseCase(gh<_i73.UserService>()));
    gh.factory<_i79.PinCodeChangeUseCase>(
        () => _i79.PinCodeChangeUseCase(gh<_i73.UserService>()));
    gh.factory<_i80.SpecialistService>(() => _i81.FirebaseSpecialistService(
          gh<_i46.SpecialistRepository>(),
          gh<
              _i7.Factory<_i61.Future<_i62.SpecialistModel>,
                  _i63.SpecialistModelDto>>(),
          gh<_i7.Factory<_i17.FilterPreferencesDto, _i18.FilterPreferences>>(),
          gh<
              _i7.Factory<_i61.Future<_i15.ReviewModel?>,
                  _i14.ReviewModelDto>>(),
          gh<_i7.Factory<_i14.ReviewModelDto, _i15.ReviewModel>>(),
        ));
    gh.factory<_i82.UpdateReviewUseCase>(
        () => _i82.UpdateReviewUseCase(gh<_i80.SpecialistService>()));
    gh.factory<_i83.UserBloc>(() => _i83.UserBloc(
          gh<_i77.GetCurrentUserUseCase>(),
          gh<_i78.LogOutUseCase>(),
          gh<_i53.UserController>(),
        ));
    gh.factory<_i84.AddReviewUseCase>(
        () => _i84.AddReviewUseCase(gh<_i80.SpecialistService>()));
    gh.factory<_i85.AddToFavoriteUseCase>(
        () => _i85.AddToFavoriteUseCase(gh<_i80.SpecialistService>()));
    gh.factory<_i86.DeleteReviewUseCase>(
        () => _i86.DeleteReviewUseCase(gh<_i80.SpecialistService>()));
    gh.factory<_i7.Factory<_i61.Future<_i9.BookingData?>, _i8.BookingDataDto>>(
        () => _i87.BookingDataFromDto(gh<_i80.SpecialistService>()));
    gh.factory<_i88.FetchFavoriteListUseCase>(
        () => _i88.FetchFavoriteListUseCase(gh<_i80.SpecialistService>()));
    gh.factory<_i89.FetchSpecialistCatalogueUseCase>(() =>
        _i89.FetchSpecialistCatalogueUseCase(gh<_i80.SpecialistService>()));
    gh.factory<_i90.FetchSpecialistReviewsUseCase>(
        () => _i90.FetchSpecialistReviewsUseCase(gh<_i80.SpecialistService>()));
    gh.factory<_i91.FetchSpecialistsOnlineUseCase>(
        () => _i91.FetchSpecialistsOnlineUseCase(gh<_i80.SpecialistService>()));
    gh.factory<_i92.PinCodeBloc>(() => _i92.PinCodeBloc(
          gh<_i53.UserController>(),
          gh<_i79.PinCodeChangeUseCase>(),
        ));
    gh.factory<_i93.RemoveFromFavoriteUseCase>(
        () => _i93.RemoveFromFavoriteUseCase(gh<_i80.SpecialistService>()));
    gh.factory<_i94.ReviewBloc>(() => _i94.ReviewBloc(
          gh<_i90.FetchSpecialistReviewsUseCase>(),
          gh<_i84.AddReviewUseCase>(),
          gh<_i53.UserController>(),
          gh<_i45.SpecialistRatingController>(),
          gh<_i82.UpdateReviewUseCase>(),
          gh<_i86.DeleteReviewUseCase>(),
        ));
    gh.factory<_i95.SpecialistCatalogueBloc>(() => _i95.SpecialistCatalogueBloc(
          gh<_i89.FetchSpecialistCatalogueUseCase>(),
          gh<_i3.AppliedFilterController>(),
          gh<_i45.SpecialistRatingController>(),
        ));
    gh.factory<_i96.SpecialistOnlineBloc>(() => _i96.SpecialistOnlineBloc(
          gh<_i91.FetchSpecialistsOnlineUseCase>(),
          gh<_i45.SpecialistRatingController>(),
        ));
    gh.factory<_i97.BookingService>(() => _i98.FirebaseBookingService(
          gh<_i5.BookingRepository>(),
          gh<
              _i7.Factory<_i23.SpecialistWorkInfo,
                  _i24.SpecialistWorkInfoDto>>(),
          gh<_i7.Factory<_i8.BookingDataDto, _i9.BookingData>>(),
          gh<_i7.Factory<_i61.Future<_i9.BookingData?>, _i8.BookingDataDto>>(),
        ));
    gh.factory<_i99.FavoriteBloc>(() => _i99.FavoriteBloc(
          gh<_i53.UserController>(),
          gh<_i88.FetchFavoriteListUseCase>(),
          gh<_i85.AddToFavoriteUseCase>(),
          gh<_i93.RemoveFromFavoriteUseCase>(),
        ));
    gh.factory<_i100.FetchPreviousSessionsUseCase>(
        () => _i100.FetchPreviousSessionsUseCase(gh<_i97.BookingService>()));
    gh.factory<_i101.FetchUpcomingSessionsUseCase>(
        () => _i101.FetchUpcomingSessionsUseCase(gh<_i97.BookingService>()));
    gh.factory<_i102.PreviousSessionsBloc>(() => _i102.PreviousSessionsBloc(
          gh<_i100.FetchPreviousSessionsUseCase>(),
          gh<_i53.UserController>(),
        ));
    gh.factory<_i103.SpecialistWorkInfoFetchUseCase>(
        () => _i103.SpecialistWorkInfoFetchUseCase(gh<_i97.BookingService>()));
    gh.factory<_i104.UpcomingSessionsBloc>(() => _i104.UpcomingSessionsBloc(
          gh<_i101.FetchUpcomingSessionsUseCase>(),
          gh<_i53.UserController>(),
          gh<_i4.BookingController>(),
        ));
    gh.factory<_i105.BookingBookUseCase>(
        () => _i105.BookingBookUseCase(gh<_i97.BookingService>()));
    gh.factory<_i106.BookingCancelUseCase>(
        () => _i106.BookingCancelUseCase(gh<_i97.BookingService>()));
    gh.factory<_i107.BookingRescheduleUseCase>(
        () => _i107.BookingRescheduleUseCase(gh<_i97.BookingService>()));
    gh.factory<_i108.BookingBloc>(() => _i108.BookingBloc(
          gh<_i103.SpecialistWorkInfoFetchUseCase>(),
          gh<_i105.BookingBookUseCase>(),
          gh<_i107.BookingRescheduleUseCase>(),
          gh<_i106.BookingCancelUseCase>(),
          gh<_i53.UserController>(),
          gh<_i4.BookingController>(),
        ));
    return this;
  }
}
