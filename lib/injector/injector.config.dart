// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i62;

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mint/assembly/entity/booking_data_from_dto.dart' as _i13;
import 'package:mint/assembly/entity/credit_card_model_from_dto.dart' as _i26;
import 'package:mint/assembly/entity/pick_up_filter_from_dto.dart' as _i32;
import 'package:mint/assembly/entity/review_model_from_dto.dart' as _i77;
import 'package:mint/assembly/entity/specialist_filter_from_dto.dart' as _i10;
import 'package:mint/assembly/entity/specialist_model_from_dto.dart' as _i68;
import 'package:mint/assembly/entity/specialist_work_info_from_dto.dart'
    as _i29;
import 'package:mint/assembly/entity/upcoming_consultation_data_from_dto.dart'
    as _i90;
import 'package:mint/assembly/entity/user_model_from_dto.dart' as _i65;
import 'package:mint/assembly/factory.dart' as _i7;
import 'package:mint/assembly/model/booking_data_to_dto.dart' as _i23;
import 'package:mint/assembly/model/filter_preferences_to_dto.dart' as _i16;
import 'package:mint/assembly/model/review_model_to_dto.dart' as _i19;
import 'package:mint/assembly/model/transaction_data_to_dto.dart' as _i22;
import 'package:mint/bloc/auth/auth_bloc.dart' as _i59;
import 'package:mint/bloc/booking/booking_bloc.dart' as _i107;
import 'package:mint/bloc/credit_card/credit_card_bloc.dart' as _i76;
import 'package:mint/bloc/favorite/favorite_bloc.dart' as _i102;
import 'package:mint/bloc/pick_up_specialist/pick_up_specialist_bloc.dart'
    as _i71;
import 'package:mint/bloc/pin_code/pin_code_bloc.dart' as _i95;
import 'package:mint/bloc/review/review_bloc.dart' as _i97;
import 'package:mint/bloc/specialist_catalogue/specialist_catalogue_bloc.dart'
    as _i98;
import 'package:mint/bloc/specialist_filter/specialist_filter_bloc.dart'
    as _i72;
import 'package:mint/bloc/specialist_online/specialist_online_bloc.dart'
    as _i99;
import 'package:mint/bloc/transaction/transaction_bloc.dart' as _i73;
import 'package:mint/bloc/upcoming_consultations/upcoming_consultations_bloc.dart'
    as _i105;
import 'package:mint/bloc/user/user_bloc.dart' as _i84;
import 'package:mint/data/model/booking_data_dto/booking_data_dto.dart' as _i12;
import 'package:mint/data/model/credit_card_model_dto/credit_card_model_dto.dart'
    as _i25;
import 'package:mint/data/model/filter_preferences_dto/filter_preferences_dto.dart'
    as _i14;
import 'package:mint/data/model/pick_up_filter_dto/pick_up_filter_dto.dart'
    as _i31;
import 'package:mint/data/model/review_model_dto/review_model_dto.dart' as _i17;
import 'package:mint/data/model/specialist_filter_dto/specialist_filter_dto.dart'
    as _i9;
import 'package:mint/data/model/specialist_model_dto/specialist_model_dto.dart'
    as _i67;
import 'package:mint/data/model/specialist_work_info_dto/specialist_work_info_dto.dart'
    as _i28;
import 'package:mint/data/model/transaction_data_dto/transaction_data_dto.dart'
    as _i20;
import 'package:mint/data/model/upcoming_consultation_data_dto/upcoming_consultation_data_dto.dart'
    as _i89;
import 'package:mint/data/model/user_model_dto/user_model_dto.dart' as _i64;
import 'package:mint/data/repository/abstract/booking_repository.dart' as _i5;
import 'package:mint/data/repository/abstract/filter_repository.dart' as _i33;
import 'package:mint/data/repository/abstract/payment_repository.dart' as _i37;
import 'package:mint/data/repository/abstract/phone_auth_repository.dart'
    as _i41;
import 'package:mint/data/repository/abstract/specialist_repository.dart'
    as _i47;
import 'package:mint/data/repository/abstract/storage_repository.dart' as _i49;
import 'package:mint/data/repository/abstract/user_repository.dart' as _i55;
import 'package:mint/data/repository/firebase/firebase_auth_repository.dart'
    as _i42;
import 'package:mint/data/repository/firebase/firebase_booking_repository.dart'
    as _i6;
import 'package:mint/data/repository/firebase/firebase_filter_repository.dart'
    as _i34;
import 'package:mint/data/repository/firebase/firebase_payment_repository.dart'
    as _i38;
import 'package:mint/data/repository/firebase/firebase_specialist_repository.dart'
    as _i48;
import 'package:mint/data/repository/firebase/firebase_storage_repository.dart'
    as _i50;
import 'package:mint/data/repository/firebase/firebase_user_repository.dart'
    as _i56;
import 'package:mint/domain/controller/applied_filter_controller.dart' as _i3;
import 'package:mint/domain/controller/booking_controller.dart' as _i4;
import 'package:mint/domain/controller/pick_up_filter_controller.dart' as _i45;
import 'package:mint/domain/controller/specialist_rating_controller.dart'
    as _i46;
import 'package:mint/domain/controller/user_controller.dart' as _i54;
import 'package:mint/domain/entity/booking_data/booking_data.dart' as _i11;
import 'package:mint/domain/entity/credit_card_model/credit_card_model.dart'
    as _i24;
import 'package:mint/domain/entity/filter_preferences/filter_preferences.dart'
    as _i15;
import 'package:mint/domain/entity/pick_up_filter/pick_up_filter.dart' as _i30;
import 'package:mint/domain/entity/review_model/review_model.dart' as _i18;
import 'package:mint/domain/entity/specialist_filter/specialist_filter.dart'
    as _i8;
import 'package:mint/domain/entity/specialist_model/specialist_model.dart'
    as _i66;
import 'package:mint/domain/entity/specialist_work_info/specialist_work_info.dart'
    as _i27;
import 'package:mint/domain/entity/transaction_data/transaction_data.dart'
    as _i21;
import 'package:mint/domain/entity/upcoming_consultation_data/upcoming_consultation_data.dart'
    as _i88;
import 'package:mint/domain/entity/user_model/user_model.dart' as _i63;
import 'package:mint/domain/service/abstract/booking_service.dart' as _i100;
import 'package:mint/domain/service/abstract/filter_service.dart' as _i35;
import 'package:mint/domain/service/abstract/payment_service.dart' as _i39;
import 'package:mint/domain/service/abstract/phone_auth_service.dart' as _i43;
import 'package:mint/domain/service/abstract/specialist_service.dart' as _i81;
import 'package:mint/domain/service/abstract/storage_service.dart' as _i51;
import 'package:mint/domain/service/abstract/user_service.dart' as _i74;
import 'package:mint/domain/service/firebase/firebase_booking_service.dart'
    as _i101;
import 'package:mint/domain/service/firebase/firebase_filter_service.dart'
    as _i36;
import 'package:mint/domain/service/firebase/firebase_payment_service.dart'
    as _i40;
import 'package:mint/domain/service/firebase/firebase_phone_auth_service.dart'
    as _i44;
import 'package:mint/domain/service/firebase/firebase_specialist_service.dart'
    as _i82;
import 'package:mint/domain/service/firebase/firebase_storage_service.dart'
    as _i52;
import 'package:mint/domain/service/firebase/firebase_user_service.dart'
    as _i75;
import 'package:mint/domain/usecase/add_review_use_case.dart' as _i85;
import 'package:mint/domain/usecase/add_to_favorite_use_case.dart' as _i86;
import 'package:mint/domain/usecase/booking_book_use_case.dart' as _i106;
import 'package:mint/domain/usecase/credit_card_list_fetch_use_case.dart'
    as _i60;
import 'package:mint/domain/usecase/credit_card_save_use_case.dart' as _i61;
import 'package:mint/domain/usecase/delete_review_use_case.dart' as _i87;
import 'package:mint/domain/usecase/fetch_favorite_list_use_case.dart' as _i91;
import 'package:mint/domain/usecase/fetch_pick_up_filter_use_case.dart' as _i69;
import 'package:mint/domain/usecase/fetch_specialist_catalogue_use_case.dart'
    as _i92;
import 'package:mint/domain/usecase/fetch_specialist_filter_use_case.dart'
    as _i70;
import 'package:mint/domain/usecase/fetch_specialist_reviews_use_case.dart'
    as _i93;
import 'package:mint/domain/usecase/fetch_specialists_online_use_case.dart'
    as _i94;
import 'package:mint/domain/usecase/fetch_upcoming_consultations_use_case.dart'
    as _i103;
import 'package:mint/domain/usecase/get_current_user_use_case.dart' as _i78;
import 'package:mint/domain/usecase/log_out_use_case.dart' as _i79;
import 'package:mint/domain/usecase/pin_code_change_use_case.dart' as _i80;
import 'package:mint/domain/usecase/remove_from_favorite_use_case.dart' as _i96;
import 'package:mint/domain/usecase/specialist_work_info_fetch_use_case.dart'
    as _i104;
import 'package:mint/domain/usecase/transaction_pay_use_case.dart' as _i53;
import 'package:mint/domain/usecase/update_review_use_case.dart' as _i83;
import 'package:mint/domain/usecase/verify_otp_use_case.dart' as _i57;
import 'package:mint/domain/usecase/verify_phone_use_case.dart' as _i58;

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
    gh.factory<_i7.Factory<_i8.SpecialistFilter, _i9.SpecialistFilterDto>>(
        () => _i10.SpecialistFilterFromDto());
    gh.factory<_i7.Factory<_i11.BookingData, _i12.BookingDataDto>>(
        () => _i13.BookingDataFromDto());
    gh.factory<_i7.Factory<_i14.FilterPreferencesDto, _i15.FilterPreferences>>(
        () => _i16.FilterPreferencesToDto());
    gh.factory<_i7.Factory<_i17.ReviewModelDto, _i18.ReviewModel>>(
        () => _i19.ReviewModelToDto());
    gh.factory<_i7.Factory<_i20.TransactionDataDto, _i21.TransactionData>>(
        () => _i22.TransactionDataToDto());
    gh.factory<_i7.Factory<_i12.BookingDataDto, _i11.BookingData>>(
        () => _i23.BookingDataToDto());
    gh.factory<_i7.Factory<_i24.CreditCardModel, _i25.CreditCardModelDto>>(
        () => _i26.CreditCardModelFromDto());
    gh.factory<
            _i7.Factory<_i27.SpecialistWorkInfo, _i28.SpecialistWorkInfoDto>>(
        () => _i29.SpecialistWorkInfoFromDto());
    gh.factory<_i7.Factory<_i30.PickUpFilter, _i31.PickUpFilterDto>>(
        () => _i32.PickUpFilterFromDto());
    gh.factory<_i33.FilterRepository>(() => _i34.FirebaseFilterRepository());
    gh.factory<_i35.FilterService>(() => _i36.FirebaseFilterService(
          gh<_i33.FilterRepository>(),
          gh<_i7.Factory<_i8.SpecialistFilter, _i9.SpecialistFilterDto>>(),
          gh<_i7.Factory<_i30.PickUpFilter, _i31.PickUpFilterDto>>(),
        ));
    gh.factory<_i37.PaymentRepository>(() => _i38.FirebasePaymentRepository());
    gh.factory<_i39.PaymentService>(() => _i40.FirebasePaymentService(
          gh<_i37.PaymentRepository>(),
          gh<_i7.Factory<_i24.CreditCardModel, _i25.CreditCardModelDto>>(),
          gh<_i7.Factory<_i20.TransactionDataDto, _i21.TransactionData>>(),
        ));
    gh.factory<_i41.PhoneAuthRepository>(() => _i42.FirebaseAuthRepository());
    gh.factory<_i43.PhoneAuthService>(
        () => _i44.FirebasePhoneAuthService(gh<_i41.PhoneAuthRepository>()));
    gh.lazySingleton<_i45.PickUpFilterController>(
        () => _i45.PickUpFilterController());
    gh.lazySingleton<_i46.SpecialistRatingController>(
        () => _i46.SpecialistRatingController());
    gh.factory<_i47.SpecialistRepository>(
        () => _i48.FirebaseSpecialistRepository());
    gh.factory<_i49.StorageRepository>(() => _i50.FirebaseStorageRepository());
    gh.factory<_i51.StorageService>(
        () => _i52.FirebaseStorageService(gh<_i49.StorageRepository>()));
    gh.factory<_i53.TransactionPayUseCase>(
        () => _i53.TransactionPayUseCase(gh<_i39.PaymentService>()));
    gh.lazySingleton<_i54.UserController>(() => _i54.UserController());
    gh.factory<_i55.UserRepository>(() => _i56.FirebaseUserRepository());
    gh.factory<_i57.VerifyOtpUseCase>(
        () => _i57.VerifyOtpUseCase(gh<_i43.PhoneAuthService>()));
    gh.factory<_i58.VerifyPhoneUseCase>(
        () => _i58.VerifyPhoneUseCase(gh<_i43.PhoneAuthService>()));
    gh.factory<_i59.AuthBloc>(() => _i59.AuthBloc(
          gh<_i58.VerifyPhoneUseCase>(),
          gh<_i57.VerifyOtpUseCase>(),
          gh<_i54.UserController>(),
        ));
    gh.factory<_i60.CreditCardListFetchUseCase>(
        () => _i60.CreditCardListFetchUseCase(gh<_i39.PaymentService>()));
    gh.factory<_i61.CreditCardSaveUseCase>(
        () => _i61.CreditCardSaveUseCase(gh<_i39.PaymentService>()));
    gh.factory<_i7.Factory<_i62.Future<_i63.UserModel>, _i64.UserModelDto>>(
        () => _i65.UserModelFromDto(gh<_i51.StorageService>()));
    gh.factory<
            _i7.Factory<_i62.Future<_i66.SpecialistModel>,
                _i67.SpecialistModelDto>>(
        () => _i68.SpecialistModelFromDto(gh<_i51.StorageService>()));
    gh.factory<_i69.FetchPickUpFilterUseCase>(
        () => _i69.FetchPickUpFilterUseCase(gh<_i35.FilterService>()));
    gh.factory<_i70.FetchSpecialistFilterUseCase>(
        () => _i70.FetchSpecialistFilterUseCase(gh<_i35.FilterService>()));
    gh.factory<_i71.PickUpSpecialistBloc>(() => _i71.PickUpSpecialistBloc(
          gh<_i69.FetchPickUpFilterUseCase>(),
          gh<_i45.PickUpFilterController>(),
        ));
    gh.factory<_i72.SpecialistFilterBloc>(() => _i72.SpecialistFilterBloc(
          gh<_i70.FetchSpecialistFilterUseCase>(),
          gh<_i3.AppliedFilterController>(),
          gh<_i45.PickUpFilterController>(),
        ));
    gh.factory<_i73.TransactionBloc>(() => _i73.TransactionBloc(
          gh<_i53.TransactionPayUseCase>(),
          gh<_i54.UserController>(),
        ));
    gh.factory<_i74.UserService>(() => _i75.FirebaseUserService(
          gh<_i55.UserRepository>(),
          gh<_i7.Factory<_i62.Future<_i63.UserModel>, _i64.UserModelDto>>(),
        ));
    gh.factory<_i76.CreditCardBloc>(() => _i76.CreditCardBloc(
          gh<_i61.CreditCardSaveUseCase>(),
          gh<_i60.CreditCardListFetchUseCase>(),
          gh<_i54.UserController>(),
        ));
    gh.factory<
            _i7.Factory<_i62.Future<_i18.ReviewModel?>, _i17.ReviewModelDto>>(
        () => _i77.ReviewModelFromDto(gh<_i74.UserService>()));
    gh.factory<_i78.GetCurrentUserUseCase>(
        () => _i78.GetCurrentUserUseCase(gh<_i74.UserService>()));
    gh.factory<_i79.LogOutUseCase>(
        () => _i79.LogOutUseCase(gh<_i74.UserService>()));
    gh.factory<_i80.PinCodeChangeUseCase>(
        () => _i80.PinCodeChangeUseCase(gh<_i74.UserService>()));
    gh.factory<_i81.SpecialistService>(() => _i82.FirebaseSpecialistService(
          gh<_i47.SpecialistRepository>(),
          gh<
              _i7.Factory<_i62.Future<_i66.SpecialistModel>,
                  _i67.SpecialistModelDto>>(),
          gh<_i7.Factory<_i14.FilterPreferencesDto, _i15.FilterPreferences>>(),
          gh<
              _i7.Factory<_i62.Future<_i18.ReviewModel?>,
                  _i17.ReviewModelDto>>(),
          gh<_i7.Factory<_i17.ReviewModelDto, _i18.ReviewModel>>(),
        ));
    gh.factory<_i83.UpdateReviewUseCase>(
        () => _i83.UpdateReviewUseCase(gh<_i81.SpecialistService>()));
    gh.factory<_i84.UserBloc>(() => _i84.UserBloc(
          gh<_i78.GetCurrentUserUseCase>(),
          gh<_i79.LogOutUseCase>(),
          gh<_i54.UserController>(),
        ));
    gh.factory<_i85.AddReviewUseCase>(
        () => _i85.AddReviewUseCase(gh<_i81.SpecialistService>()));
    gh.factory<_i86.AddToFavoriteUseCase>(
        () => _i86.AddToFavoriteUseCase(gh<_i81.SpecialistService>()));
    gh.factory<_i87.DeleteReviewUseCase>(
        () => _i87.DeleteReviewUseCase(gh<_i81.SpecialistService>()));
    gh.factory<
        _i7.Factory<_i62.Future<_i88.UpcomingConsultationData?>,
            _i89.UpcomingConsultationDataDto>>(() =>
        _i90.UpcomingConsultationDataFromDto(gh<_i81.SpecialistService>()));
    gh.factory<_i91.FetchFavoriteListUseCase>(
        () => _i91.FetchFavoriteListUseCase(gh<_i81.SpecialistService>()));
    gh.factory<_i92.FetchSpecialistCatalogueUseCase>(() =>
        _i92.FetchSpecialistCatalogueUseCase(gh<_i81.SpecialistService>()));
    gh.factory<_i93.FetchSpecialistReviewsUseCase>(
        () => _i93.FetchSpecialistReviewsUseCase(gh<_i81.SpecialistService>()));
    gh.factory<_i94.FetchSpecialistsOnlineUseCase>(
        () => _i94.FetchSpecialistsOnlineUseCase(gh<_i81.SpecialistService>()));
    gh.factory<_i95.PinCodeBloc>(() => _i95.PinCodeBloc(
          gh<_i54.UserController>(),
          gh<_i80.PinCodeChangeUseCase>(),
        ));
    gh.factory<_i96.RemoveFromFavoriteUseCase>(
        () => _i96.RemoveFromFavoriteUseCase(gh<_i81.SpecialistService>()));
    gh.factory<_i97.ReviewBloc>(() => _i97.ReviewBloc(
          gh<_i93.FetchSpecialistReviewsUseCase>(),
          gh<_i85.AddReviewUseCase>(),
          gh<_i54.UserController>(),
          gh<_i46.SpecialistRatingController>(),
          gh<_i83.UpdateReviewUseCase>(),
          gh<_i87.DeleteReviewUseCase>(),
        ));
    gh.factory<_i98.SpecialistCatalogueBloc>(() => _i98.SpecialistCatalogueBloc(
          gh<_i92.FetchSpecialistCatalogueUseCase>(),
          gh<_i3.AppliedFilterController>(),
          gh<_i46.SpecialistRatingController>(),
        ));
    gh.factory<_i99.SpecialistOnlineBloc>(() => _i99.SpecialistOnlineBloc(
          gh<_i94.FetchSpecialistsOnlineUseCase>(),
          gh<_i46.SpecialistRatingController>(),
        ));
    gh.factory<_i100.BookingService>(() => _i101.FirebaseBookingService(
          gh<_i5.BookingRepository>(),
          gh<
              _i7.Factory<_i27.SpecialistWorkInfo,
                  _i28.SpecialistWorkInfoDto>>(),
          gh<_i7.Factory<_i12.BookingDataDto, _i11.BookingData>>(),
          gh<_i7.Factory<_i11.BookingData, _i12.BookingDataDto>>(),
          gh<
              _i7.Factory<_i62.Future<_i88.UpcomingConsultationData?>,
                  _i89.UpcomingConsultationDataDto>>(),
        ));
    gh.factory<_i102.FavoriteBloc>(() => _i102.FavoriteBloc(
          gh<_i54.UserController>(),
          gh<_i91.FetchFavoriteListUseCase>(),
          gh<_i86.AddToFavoriteUseCase>(),
          gh<_i96.RemoveFromFavoriteUseCase>(),
        ));
    gh.factory<_i103.FetchUpcomingConsultationsUseCase>(() =>
        _i103.FetchUpcomingConsultationsUseCase(gh<_i100.BookingService>()));
    gh.factory<_i104.SpecialistWorkInfoFetchUseCase>(
        () => _i104.SpecialistWorkInfoFetchUseCase(gh<_i100.BookingService>()));
    gh.factory<_i105.UpcomingConsultationsBloc>(
        () => _i105.UpcomingConsultationsBloc(
              gh<_i103.FetchUpcomingConsultationsUseCase>(),
              gh<_i54.UserController>(),
              gh<_i4.BookingController>(),
            ));
    gh.factory<_i106.BookingBookUseCase>(
        () => _i106.BookingBookUseCase(gh<_i100.BookingService>()));
    gh.factory<_i107.BookingBloc>(() => _i107.BookingBloc(
          gh<_i54.UserController>(),
          gh<_i104.SpecialistWorkInfoFetchUseCase>(),
          gh<_i106.BookingBookUseCase>(),
          gh<_i4.BookingController>(),
        ));
    return this;
  }
}
