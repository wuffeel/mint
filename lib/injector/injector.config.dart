// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i53;

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mint/assembly/entity/booking_data_from_dto.dart' as _i12;
import 'package:mint/assembly/entity/pick_up_filter_from_dto.dart' as _i15;
import 'package:mint/assembly/entity/review_model_from_dto.dart' as _i69;
import 'package:mint/assembly/entity/specialist_filter_from_dto.dart' as _i25;
import 'package:mint/assembly/entity/specialist_model_from_dto.dart' as _i56;
import 'package:mint/assembly/entity/specialist_work_info_from_dto.dart'
    as _i22;
import 'package:mint/assembly/entity/user_model_from_dto.dart' as _i59;
import 'package:mint/assembly/factory.dart' as _i6;
import 'package:mint/assembly/model/booking_data_to_dto.dart' as _i16;
import 'package:mint/assembly/model/filter_preferences_to_dto.dart' as _i9;
import 'package:mint/assembly/model/review_model_to_dto.dart' as _i19;
import 'package:mint/assembly/model/transaction_data_to_dto.dart' as _i28;
import 'package:mint/bloc/auth/auth_bloc.dart' as _i50;
import 'package:mint/bloc/booking/booking_bloc.dart' as _i80;
import 'package:mint/bloc/favorite/favorite_bloc.dart' as _i91;
import 'package:mint/bloc/pick_up_specialist/pick_up_specialist_bloc.dart'
    as _i62;
import 'package:mint/bloc/pin_code/pin_code_bloc.dart' as _i86;
import 'package:mint/bloc/review/review_bloc.dart' as _i88;
import 'package:mint/bloc/specialist_catalogue/specialist_catalogue_bloc.dart'
    as _i89;
import 'package:mint/bloc/specialist_filter/specialist_filter_bloc.dart'
    as _i63;
import 'package:mint/bloc/specialist_online/specialist_online_bloc.dart'
    as _i90;
import 'package:mint/bloc/transaction/transaction_bloc.dart' as _i75;
import 'package:mint/bloc/user/user_bloc.dart' as _i77;
import 'package:mint/data/model/booking_data_dto/booking_data_dto.dart' as _i11;
import 'package:mint/data/model/filter_preferences_dto/filter_preferences_dto.dart'
    as _i7;
import 'package:mint/data/model/pick_up_filter_dto/pick_up_filter_dto.dart'
    as _i14;
import 'package:mint/data/model/review_model_dto/review_model_dto.dart' as _i17;
import 'package:mint/data/model/specialist_filter_dto/specialist_filter_dto.dart'
    as _i24;
import 'package:mint/data/model/specialist_model_dto/specialist_model_dto.dart'
    as _i55;
import 'package:mint/data/model/specialist_work_info_dto/specialist_work_info_dto.dart'
    as _i21;
import 'package:mint/data/model/transaction_data_dto/transaction_data_dto.dart'
    as _i26;
import 'package:mint/data/model/user_model_dto/user_model_dto.dart' as _i58;
import 'package:mint/data/repository/abstract/booking_repository.dart' as _i4;
import 'package:mint/data/repository/abstract/filter_repository.dart' as _i29;
import 'package:mint/data/repository/abstract/phone_auth_repository.dart'
    as _i33;
import 'package:mint/data/repository/abstract/specialist_repository.dart'
    as _i39;
import 'package:mint/data/repository/abstract/storage_repository.dart' as _i41;
import 'package:mint/data/repository/abstract/user_repository.dart' as _i46;
import 'package:mint/data/repository/firebase/firebase_auth_repository.dart'
    as _i34;
import 'package:mint/data/repository/firebase/firebase_booking_repository.dart'
    as _i5;
import 'package:mint/data/repository/firebase/firebase_filter_repository.dart'
    as _i30;
import 'package:mint/data/repository/firebase/firebase_specialist_repository.dart'
    as _i40;
import 'package:mint/data/repository/firebase/firebase_storage_repository.dart'
    as _i42;
import 'package:mint/data/repository/firebase/firebase_user_repository.dart'
    as _i47;
import 'package:mint/domain/controller/applied_filter_controller.dart' as _i3;
import 'package:mint/domain/controller/pick_up_filter_controller.dart' as _i37;
import 'package:mint/domain/controller/specialist_rating_controller.dart'
    as _i38;
import 'package:mint/domain/controller/user_controller.dart' as _i45;
import 'package:mint/domain/entity/booking_data/booking_data.dart' as _i10;
import 'package:mint/domain/entity/filter_preferences/filter_preferences.dart'
    as _i8;
import 'package:mint/domain/entity/pick_up_filter/pick_up_filter.dart' as _i13;
import 'package:mint/domain/entity/review_model/review_model.dart' as _i18;
import 'package:mint/domain/entity/specialist_filter/specialist_filter.dart'
    as _i23;
import 'package:mint/domain/entity/specialist_model/specialist_model.dart'
    as _i54;
import 'package:mint/domain/entity/specialist_work_info/specialist_work_info.dart'
    as _i20;
import 'package:mint/domain/entity/transaction_data/transaction_data.dart'
    as _i27;
import 'package:mint/domain/entity/user_model/user_model.dart' as _i57;
import 'package:mint/domain/service/abstract/booking_service.dart' as _i51;
import 'package:mint/domain/service/abstract/filter_service.dart' as _i31;
import 'package:mint/domain/service/abstract/phone_auth_service.dart' as _i35;
import 'package:mint/domain/service/abstract/specialist_service.dart' as _i73;
import 'package:mint/domain/service/abstract/storage_service.dart' as _i43;
import 'package:mint/domain/service/abstract/user_service.dart' as _i65;
import 'package:mint/domain/service/firebase/firebase_booking_service.dart'
    as _i52;
import 'package:mint/domain/service/firebase/firebase_filter_service.dart'
    as _i32;
import 'package:mint/domain/service/firebase/firebase_phone_auth_service.dart'
    as _i36;
import 'package:mint/domain/service/firebase/firebase_specialist_service.dart'
    as _i74;
import 'package:mint/domain/service/firebase/firebase_storage_service.dart'
    as _i44;
import 'package:mint/domain/service/firebase/firebase_user_service.dart'
    as _i66;
import 'package:mint/domain/usecase/add_review_use_case.dart' as _i78;
import 'package:mint/domain/usecase/add_to_favorite_use_case.dart' as _i79;
import 'package:mint/domain/usecase/booking_book_use_case.dart' as _i67;
import 'package:mint/domain/usecase/booking_info_fetch_use_case.dart' as _i68;
import 'package:mint/domain/usecase/delete_review_use_case.dart' as _i81;
import 'package:mint/domain/usecase/fetch_favorite_list_use_case.dart' as _i82;
import 'package:mint/domain/usecase/fetch_pick_up_filter_use_case.dart' as _i60;
import 'package:mint/domain/usecase/fetch_specialist_catalogue_use_case.dart'
    as _i83;
import 'package:mint/domain/usecase/fetch_specialist_filter_use_case.dart'
    as _i61;
import 'package:mint/domain/usecase/fetch_specialist_reviews_use_case.dart'
    as _i84;
import 'package:mint/domain/usecase/fetch_specialists_online_use_case.dart'
    as _i85;
import 'package:mint/domain/usecase/get_current_user_use_case.dart' as _i70;
import 'package:mint/domain/usecase/log_out_use_case.dart' as _i71;
import 'package:mint/domain/usecase/pin_code_change_use_case.dart' as _i72;
import 'package:mint/domain/usecase/remove_from_favorite_use_case.dart' as _i87;
import 'package:mint/domain/usecase/transaction_pay_use_case.dart' as _i64;
import 'package:mint/domain/usecase/update_review_use_case.dart' as _i76;
import 'package:mint/domain/usecase/verify_otp_use_case.dart' as _i48;
import 'package:mint/domain/usecase/verify_phone_use_case.dart' as _i49;

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
    gh.factory<_i4.BookingRepository>(() => _i5.FirebaseBookingRepository());
    gh.factory<_i6.Factory<_i7.FilterPreferencesDto, _i8.FilterPreferences>>(
        () => _i9.FilterPreferencesToDto());
    gh.factory<_i6.Factory<_i10.BookingData, _i11.BookingDataDto>>(
        () => _i12.BookingDataFromDto());
    gh.factory<_i6.Factory<_i13.PickUpFilter, _i14.PickUpFilterDto>>(
        () => _i15.PickUpFilterFromDto());
    gh.factory<_i6.Factory<_i11.BookingDataDto, _i10.BookingData>>(
        () => _i16.BookingDataToDto());
    gh.factory<_i6.Factory<_i17.ReviewModelDto, _i18.ReviewModel>>(
        () => _i19.ReviewModelToDto());
    gh.factory<
            _i6.Factory<_i20.SpecialistWorkInfo, _i21.SpecialistWorkInfoDto>>(
        () => _i22.SpecialistWorkInfoFromDto());
    gh.factory<_i6.Factory<_i23.SpecialistFilter, _i24.SpecialistFilterDto>>(
        () => _i25.SpecialistFilterFromDto());
    gh.factory<_i6.Factory<_i26.TransactionDataDto, _i27.TransactionData>>(
        () => _i28.TransactionDataToDto());
    gh.factory<_i29.FilterRepository>(() => _i30.FirebaseFilterRepository());
    gh.factory<_i31.FilterService>(() => _i32.FirebaseFilterService(
          gh<_i29.FilterRepository>(),
          gh<_i6.Factory<_i23.SpecialistFilter, _i24.SpecialistFilterDto>>(),
          gh<_i6.Factory<_i13.PickUpFilter, _i14.PickUpFilterDto>>(),
        ));
    gh.factory<_i33.PhoneAuthRepository>(() => _i34.FirebaseAuthRepository());
    gh.factory<_i35.PhoneAuthService>(
        () => _i36.FirebasePhoneAuthService(gh<_i33.PhoneAuthRepository>()));
    gh.lazySingleton<_i37.PickUpFilterController>(
        () => _i37.PickUpFilterController());
    gh.lazySingleton<_i38.SpecialistRatingController>(
        () => _i38.SpecialistRatingController());
    gh.factory<_i39.SpecialistRepository>(
        () => _i40.FirebaseSpecialistRepository());
    gh.factory<_i41.StorageRepository>(() => _i42.FirebaseStorageRepository());
    gh.factory<_i43.StorageService>(
        () => _i44.FirebaseStorageService(gh<_i41.StorageRepository>()));
    gh.lazySingleton<_i45.UserController>(() => _i45.UserController());
    gh.factory<_i46.UserRepository>(() => _i47.FirebaseUserRepository());
    gh.factory<_i48.VerifyOtpUseCase>(
        () => _i48.VerifyOtpUseCase(gh<_i35.PhoneAuthService>()));
    gh.factory<_i49.VerifyPhoneUseCase>(
        () => _i49.VerifyPhoneUseCase(gh<_i35.PhoneAuthService>()));
    gh.factory<_i50.AuthBloc>(() => _i50.AuthBloc(
          gh<_i49.VerifyPhoneUseCase>(),
          gh<_i48.VerifyOtpUseCase>(),
          gh<_i45.UserController>(),
        ));
    gh.factory<_i51.BookingService>(() => _i52.FirebaseBookingService(
          gh<_i4.BookingRepository>(),
          gh<
              _i6.Factory<_i20.SpecialistWorkInfo,
                  _i21.SpecialistWorkInfoDto>>(),
          gh<_i6.Factory<_i11.BookingDataDto, _i10.BookingData>>(),
          gh<_i6.Factory<_i10.BookingData, _i11.BookingDataDto>>(),
          gh<_i6.Factory<_i26.TransactionDataDto, _i27.TransactionData>>(),
        ));
    gh.factory<
            _i6.Factory<_i53.Future<_i54.SpecialistModel>,
                _i55.SpecialistModelDto>>(
        () => _i56.SpecialistModelFromDto(gh<_i43.StorageService>()));
    gh.factory<_i6.Factory<_i53.Future<_i57.UserModel>, _i58.UserModelDto>>(
        () => _i59.UserModelFromDto(gh<_i43.StorageService>()));
    gh.factory<_i60.FetchPickUpFilterUseCase>(
        () => _i60.FetchPickUpFilterUseCase(gh<_i31.FilterService>()));
    gh.factory<_i61.FetchSpecialistFilterUseCase>(
        () => _i61.FetchSpecialistFilterUseCase(gh<_i31.FilterService>()));
    gh.factory<_i62.PickUpSpecialistBloc>(() => _i62.PickUpSpecialistBloc(
          gh<_i60.FetchPickUpFilterUseCase>(),
          gh<_i37.PickUpFilterController>(),
        ));
    gh.factory<_i63.SpecialistFilterBloc>(() => _i63.SpecialistFilterBloc(
          gh<_i61.FetchSpecialistFilterUseCase>(),
          gh<_i3.AppliedFilterController>(),
          gh<_i37.PickUpFilterController>(),
        ));
    gh.factory<_i64.TransactionPayUseCase>(
        () => _i64.TransactionPayUseCase(gh<_i51.BookingService>()));
    gh.factory<_i65.UserService>(() => _i66.FirebaseUserService(
          gh<_i46.UserRepository>(),
          gh<_i6.Factory<_i53.Future<_i57.UserModel>, _i58.UserModelDto>>(),
        ));
    gh.factory<_i67.BookingBookUseCase>(
        () => _i67.BookingBookUseCase(gh<_i51.BookingService>()));
    gh.factory<_i68.BookingInfoFetchUseCase>(
        () => _i68.BookingInfoFetchUseCase(gh<_i51.BookingService>()));
    gh.factory<
            _i6.Factory<_i53.Future<_i18.ReviewModel?>, _i17.ReviewModelDto>>(
        () => _i69.ReviewModelFromDto(gh<_i65.UserService>()));
    gh.factory<_i70.GetCurrentUserUseCase>(
        () => _i70.GetCurrentUserUseCase(gh<_i65.UserService>()));
    gh.factory<_i71.LogOutUseCase>(
        () => _i71.LogOutUseCase(gh<_i65.UserService>()));
    gh.factory<_i72.PinCodeChangeUseCase>(
        () => _i72.PinCodeChangeUseCase(gh<_i65.UserService>()));
    gh.factory<_i73.SpecialistService>(() => _i74.FirebaseSpecialistService(
          gh<_i39.SpecialistRepository>(),
          gh<
              _i6.Factory<_i53.Future<_i54.SpecialistModel>,
                  _i55.SpecialistModelDto>>(),
          gh<_i6.Factory<_i7.FilterPreferencesDto, _i8.FilterPreferences>>(),
          gh<
              _i6.Factory<_i53.Future<_i18.ReviewModel?>,
                  _i17.ReviewModelDto>>(),
          gh<_i6.Factory<_i17.ReviewModelDto, _i18.ReviewModel>>(),
        ));
    gh.factory<_i75.TransactionBloc>(() => _i75.TransactionBloc(
          gh<_i64.TransactionPayUseCase>(),
          gh<_i45.UserController>(),
        ));
    gh.factory<_i76.UpdateReviewUseCase>(
        () => _i76.UpdateReviewUseCase(gh<_i73.SpecialistService>()));
    gh.factory<_i77.UserBloc>(() => _i77.UserBloc(
          gh<_i70.GetCurrentUserUseCase>(),
          gh<_i71.LogOutUseCase>(),
          gh<_i45.UserController>(),
        ));
    gh.factory<_i78.AddReviewUseCase>(
        () => _i78.AddReviewUseCase(gh<_i73.SpecialistService>()));
    gh.factory<_i79.AddToFavoriteUseCase>(
        () => _i79.AddToFavoriteUseCase(gh<_i73.SpecialistService>()));
    gh.factory<_i80.BookingBloc>(() => _i80.BookingBloc(
          gh<_i45.UserController>(),
          gh<_i68.BookingInfoFetchUseCase>(),
          gh<_i67.BookingBookUseCase>(),
        ));
    gh.factory<_i81.DeleteReviewUseCase>(
        () => _i81.DeleteReviewUseCase(gh<_i73.SpecialistService>()));
    gh.factory<_i82.FetchFavoriteListUseCase>(
        () => _i82.FetchFavoriteListUseCase(gh<_i73.SpecialistService>()));
    gh.factory<_i83.FetchSpecialistCatalogueUseCase>(() =>
        _i83.FetchSpecialistCatalogueUseCase(gh<_i73.SpecialistService>()));
    gh.factory<_i84.FetchSpecialistReviewsUseCase>(
        () => _i84.FetchSpecialistReviewsUseCase(gh<_i73.SpecialistService>()));
    gh.factory<_i85.FetchSpecialistsOnlineUseCase>(
        () => _i85.FetchSpecialistsOnlineUseCase(gh<_i73.SpecialistService>()));
    gh.factory<_i86.PinCodeBloc>(() => _i86.PinCodeBloc(
          gh<_i45.UserController>(),
          gh<_i72.PinCodeChangeUseCase>(),
        ));
    gh.factory<_i87.RemoveFromFavoriteUseCase>(
        () => _i87.RemoveFromFavoriteUseCase(gh<_i73.SpecialistService>()));
    gh.factory<_i88.ReviewBloc>(() => _i88.ReviewBloc(
          gh<_i84.FetchSpecialistReviewsUseCase>(),
          gh<_i78.AddReviewUseCase>(),
          gh<_i45.UserController>(),
          gh<_i38.SpecialistRatingController>(),
          gh<_i76.UpdateReviewUseCase>(),
          gh<_i81.DeleteReviewUseCase>(),
        ));
    gh.factory<_i89.SpecialistCatalogueBloc>(() => _i89.SpecialistCatalogueBloc(
          gh<_i83.FetchSpecialistCatalogueUseCase>(),
          gh<_i3.AppliedFilterController>(),
          gh<_i38.SpecialistRatingController>(),
        ));
    gh.factory<_i90.SpecialistOnlineBloc>(() => _i90.SpecialistOnlineBloc(
          gh<_i85.FetchSpecialistsOnlineUseCase>(),
          gh<_i38.SpecialistRatingController>(),
        ));
    gh.factory<_i91.FavoriteBloc>(() => _i91.FavoriteBloc(
          gh<_i45.UserController>(),
          gh<_i82.FetchFavoriteListUseCase>(),
          gh<_i79.AddToFavoriteUseCase>(),
          gh<_i87.RemoveFromFavoriteUseCase>(),
        ));
    return this;
  }
}
