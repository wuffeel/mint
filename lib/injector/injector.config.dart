// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i46;

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mint/assembly/entity/pick_up_filter_from_dto.dart' as _i9;
import 'package:mint/assembly/entity/review_model_from_dto.dart' as _i60;
import 'package:mint/assembly/entity/specialist_filter_from_dto.dart' as _i18;
import 'package:mint/assembly/entity/specialist_model_from_dto.dart' as _i52;
import 'package:mint/assembly/entity/specialist_work_info_from_dto.dart'
    as _i21;
import 'package:mint/assembly/entity/user_model_from_dto.dart' as _i49;
import 'package:mint/assembly/factory.dart' as _i6;
import 'package:mint/assembly/model/filter_preferences_to_dto.dart' as _i12;
import 'package:mint/assembly/model/review_model_to_dto.dart' as _i15;
import 'package:mint/bloc/auth/auth_bloc.dart' as _i43;
import 'package:mint/bloc/booking/booking_bloc.dart' as _i70;
import 'package:mint/bloc/favorite/favorite_bloc.dart' as _i81;
import 'package:mint/bloc/pick_up_specialist/pick_up_specialist_bloc.dart'
    as _i55;
import 'package:mint/bloc/pin_code/pin_code_bloc.dart' as _i76;
import 'package:mint/bloc/review/review_bloc.dart' as _i78;
import 'package:mint/bloc/specialist_catalogue/specialist_catalogue_bloc.dart'
    as _i79;
import 'package:mint/bloc/specialist_filter/specialist_filter_bloc.dart'
    as _i56;
import 'package:mint/bloc/specialist_online/specialist_online_bloc.dart'
    as _i80;
import 'package:mint/bloc/user/user_bloc.dart' as _i67;
import 'package:mint/data/model/filter_preferences_dto/filter_preferences_dto.dart'
    as _i10;
import 'package:mint/data/model/pick_up_filter_dto/pick_up_filter_dto.dart'
    as _i8;
import 'package:mint/data/model/review_model_dto/review_model_dto.dart' as _i13;
import 'package:mint/data/model/specialist_filter_dto/specialist_filter_dto.dart'
    as _i17;
import 'package:mint/data/model/specialist_model_dto/specialist_model_dto.dart'
    as _i51;
import 'package:mint/data/model/specialist_work_info_dto/specialist_work_info_dto.dart'
    as _i20;
import 'package:mint/data/model/user_model_dto/user_model_dto.dart' as _i48;
import 'package:mint/data/repository/abstract/booking_repository.dart' as _i4;
import 'package:mint/data/repository/abstract/filter_repository.dart' as _i22;
import 'package:mint/data/repository/abstract/phone_auth_repository.dart'
    as _i26;
import 'package:mint/data/repository/abstract/specialist_repository.dart'
    as _i32;
import 'package:mint/data/repository/abstract/storage_repository.dart' as _i34;
import 'package:mint/data/repository/abstract/user_repository.dart' as _i39;
import 'package:mint/data/repository/firebase/firebase_auth_repository.dart'
    as _i27;
import 'package:mint/data/repository/firebase/firebase_booking_repository.dart'
    as _i5;
import 'package:mint/data/repository/firebase/firebase_filter_repository.dart'
    as _i23;
import 'package:mint/data/repository/firebase/firebase_specialist_repository.dart'
    as _i33;
import 'package:mint/data/repository/firebase/firebase_storage_repository.dart'
    as _i35;
import 'package:mint/data/repository/firebase/firebase_user_repository.dart'
    as _i40;
import 'package:mint/domain/controller/applied_filter_controller.dart' as _i3;
import 'package:mint/domain/controller/pick_up_filter_controller.dart' as _i30;
import 'package:mint/domain/controller/specialist_rating_controller.dart'
    as _i31;
import 'package:mint/domain/controller/user_controller.dart' as _i38;
import 'package:mint/domain/entity/filter_preferences/filter_preferences.dart'
    as _i11;
import 'package:mint/domain/entity/pick_up_filter/pick_up_filter.dart' as _i7;
import 'package:mint/domain/entity/review_model/review_model.dart' as _i14;
import 'package:mint/domain/entity/specialist_filter/specialist_filter.dart'
    as _i16;
import 'package:mint/domain/entity/specialist_model/specialist_model.dart'
    as _i50;
import 'package:mint/domain/entity/specialist_work_info/specialist_work_info.dart'
    as _i19;
import 'package:mint/domain/entity/user_model/user_model.dart' as _i47;
import 'package:mint/domain/service/abstract/booking_service.dart' as _i44;
import 'package:mint/domain/service/abstract/filter_service.dart' as _i24;
import 'package:mint/domain/service/abstract/phone_auth_service.dart' as _i28;
import 'package:mint/domain/service/abstract/specialist_service.dart' as _i64;
import 'package:mint/domain/service/abstract/storage_service.dart' as _i36;
import 'package:mint/domain/service/abstract/user_service.dart' as _i57;
import 'package:mint/domain/service/firebase/firebase_booking_service.dart'
    as _i45;
import 'package:mint/domain/service/firebase/firebase_filter_service.dart'
    as _i25;
import 'package:mint/domain/service/firebase/firebase_phone_auth_service.dart'
    as _i29;
import 'package:mint/domain/service/firebase/firebase_specialist_service.dart'
    as _i65;
import 'package:mint/domain/service/firebase/firebase_storage_service.dart'
    as _i37;
import 'package:mint/domain/service/firebase/firebase_user_service.dart'
    as _i58;
import 'package:mint/domain/usecase/add_review_use_case.dart' as _i68;
import 'package:mint/domain/usecase/add_to_favorite_use_case.dart' as _i69;
import 'package:mint/domain/usecase/booking_info_fetch_use_case.dart' as _i59;
import 'package:mint/domain/usecase/delete_review_use_case.dart' as _i71;
import 'package:mint/domain/usecase/fetch_favorite_list_use_case.dart' as _i72;
import 'package:mint/domain/usecase/fetch_pick_up_filter_use_case.dart' as _i53;
import 'package:mint/domain/usecase/fetch_specialist_catalogue_use_case.dart'
    as _i73;
import 'package:mint/domain/usecase/fetch_specialist_filter_use_case.dart'
    as _i54;
import 'package:mint/domain/usecase/fetch_specialist_reviews_use_case.dart'
    as _i74;
import 'package:mint/domain/usecase/fetch_specialists_online_use_case.dart'
    as _i75;
import 'package:mint/domain/usecase/get_current_user_use_case.dart' as _i61;
import 'package:mint/domain/usecase/log_out_use_case.dart' as _i62;
import 'package:mint/domain/usecase/pin_code_change_use_case.dart' as _i63;
import 'package:mint/domain/usecase/remove_from_favorite_use_case.dart' as _i77;
import 'package:mint/domain/usecase/update_review_use_case.dart' as _i66;
import 'package:mint/domain/usecase/verify_otp_use_case.dart' as _i41;
import 'package:mint/domain/usecase/verify_phone_use_case.dart' as _i42;

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
    gh.factory<_i6.Factory<_i7.PickUpFilter, _i8.PickUpFilterDto>>(
        () => _i9.PickUpFilterFromDto());
    gh.factory<_i6.Factory<_i10.FilterPreferencesDto, _i11.FilterPreferences>>(
        () => _i12.FilterPreferencesToDto());
    gh.factory<_i6.Factory<_i13.ReviewModelDto, _i14.ReviewModel>>(
        () => _i15.ReviewModelToDto());
    gh.factory<_i6.Factory<_i16.SpecialistFilter, _i17.SpecialistFilterDto>>(
        () => _i18.SpecialistFilterFromDto());
    gh.factory<
            _i6.Factory<_i19.SpecialistWorkInfo, _i20.SpecialistWorkInfoDto>>(
        () => _i21.SpecialistWorkInfoFromDto());
    gh.factory<_i22.FilterRepository>(() => _i23.FirebaseFilterRepository());
    gh.factory<_i24.FilterService>(() => _i25.FirebaseFilterService(
          gh<_i22.FilterRepository>(),
          gh<_i6.Factory<_i16.SpecialistFilter, _i17.SpecialistFilterDto>>(),
          gh<_i6.Factory<_i7.PickUpFilter, _i8.PickUpFilterDto>>(),
        ));
    gh.factory<_i26.PhoneAuthRepository>(() => _i27.FirebaseAuthRepository());
    gh.factory<_i28.PhoneAuthService>(
        () => _i29.FirebasePhoneAuthService(gh<_i26.PhoneAuthRepository>()));
    gh.lazySingleton<_i30.PickUpFilterController>(
        () => _i30.PickUpFilterController());
    gh.lazySingleton<_i31.SpecialistRatingController>(
        () => _i31.SpecialistRatingController());
    gh.factory<_i32.SpecialistRepository>(
        () => _i33.FirebaseSpecialistRepository());
    gh.factory<_i34.StorageRepository>(() => _i35.FirebaseStorageRepository());
    gh.factory<_i36.StorageService>(
        () => _i37.FirebaseStorageService(gh<_i34.StorageRepository>()));
    gh.lazySingleton<_i38.UserController>(() => _i38.UserController());
    gh.factory<_i39.UserRepository>(() => _i40.FirebaseUserRepository());
    gh.factory<_i41.VerifyOtpUseCase>(
        () => _i41.VerifyOtpUseCase(gh<_i28.PhoneAuthService>()));
    gh.factory<_i42.VerifyPhoneUseCase>(
        () => _i42.VerifyPhoneUseCase(gh<_i28.PhoneAuthService>()));
    gh.factory<_i43.AuthBloc>(() => _i43.AuthBloc(
          gh<_i42.VerifyPhoneUseCase>(),
          gh<_i41.VerifyOtpUseCase>(),
          gh<_i38.UserController>(),
        ));
    gh.factory<_i44.BookingService>(() => _i45.FirebaseBookingService(
          gh<_i4.BookingRepository>(),
          gh<
              _i6.Factory<_i19.SpecialistWorkInfo,
                  _i20.SpecialistWorkInfoDto>>(),
        ));
    gh.factory<_i6.Factory<_i46.Future<_i47.UserModel>, _i48.UserModelDto>>(
        () => _i49.UserModelFromDto(gh<_i36.StorageService>()));
    gh.factory<
            _i6.Factory<_i46.Future<_i50.SpecialistModel>,
                _i51.SpecialistModelDto>>(
        () => _i52.SpecialistModelFromDto(gh<_i36.StorageService>()));
    gh.factory<_i53.FetchPickUpFilterUseCase>(
        () => _i53.FetchPickUpFilterUseCase(gh<_i24.FilterService>()));
    gh.factory<_i54.FetchSpecialistFilterUseCase>(
        () => _i54.FetchSpecialistFilterUseCase(gh<_i24.FilterService>()));
    gh.factory<_i55.PickUpSpecialistBloc>(() => _i55.PickUpSpecialistBloc(
          gh<_i53.FetchPickUpFilterUseCase>(),
          gh<_i30.PickUpFilterController>(),
        ));
    gh.factory<_i56.SpecialistFilterBloc>(() => _i56.SpecialistFilterBloc(
          gh<_i54.FetchSpecialistFilterUseCase>(),
          gh<_i3.AppliedFilterController>(),
          gh<_i30.PickUpFilterController>(),
        ));
    gh.factory<_i57.UserService>(() => _i58.FirebaseUserService(
          gh<_i39.UserRepository>(),
          gh<_i6.Factory<_i46.Future<_i47.UserModel>, _i48.UserModelDto>>(),
        ));
    gh.factory<_i59.BookingInfoFetchUseCase>(
        () => _i59.BookingInfoFetchUseCase(gh<_i44.BookingService>()));
    gh.factory<
            _i6.Factory<_i46.Future<_i14.ReviewModel?>, _i13.ReviewModelDto>>(
        () => _i60.ReviewModelFromDto(gh<_i57.UserService>()));
    gh.factory<_i61.GetCurrentUserUseCase>(
        () => _i61.GetCurrentUserUseCase(gh<_i57.UserService>()));
    gh.factory<_i62.LogOutUseCase>(
        () => _i62.LogOutUseCase(gh<_i57.UserService>()));
    gh.factory<_i63.PinCodeChangeUseCase>(
        () => _i63.PinCodeChangeUseCase(gh<_i57.UserService>()));
    gh.factory<_i64.SpecialistService>(() => _i65.FirebaseSpecialistService(
          gh<_i32.SpecialistRepository>(),
          gh<
              _i6.Factory<_i46.Future<_i50.SpecialistModel>,
                  _i51.SpecialistModelDto>>(),
          gh<_i6.Factory<_i10.FilterPreferencesDto, _i11.FilterPreferences>>(),
          gh<
              _i6.Factory<_i46.Future<_i14.ReviewModel?>,
                  _i13.ReviewModelDto>>(),
          gh<_i6.Factory<_i13.ReviewModelDto, _i14.ReviewModel>>(),
        ));
    gh.factory<_i66.UpdateReviewUseCase>(
        () => _i66.UpdateReviewUseCase(gh<_i64.SpecialistService>()));
    gh.factory<_i67.UserBloc>(() => _i67.UserBloc(
          gh<_i61.GetCurrentUserUseCase>(),
          gh<_i62.LogOutUseCase>(),
          gh<_i38.UserController>(),
        ));
    gh.factory<_i68.AddReviewUseCase>(
        () => _i68.AddReviewUseCase(gh<_i64.SpecialistService>()));
    gh.factory<_i69.AddToFavoriteUseCase>(
        () => _i69.AddToFavoriteUseCase(gh<_i64.SpecialistService>()));
    gh.factory<_i70.BookingBloc>(
        () => _i70.BookingBloc(gh<_i59.BookingInfoFetchUseCase>()));
    gh.factory<_i71.DeleteReviewUseCase>(
        () => _i71.DeleteReviewUseCase(gh<_i64.SpecialistService>()));
    gh.factory<_i72.FetchFavoriteListUseCase>(
        () => _i72.FetchFavoriteListUseCase(gh<_i64.SpecialistService>()));
    gh.factory<_i73.FetchSpecialistCatalogueUseCase>(() =>
        _i73.FetchSpecialistCatalogueUseCase(gh<_i64.SpecialistService>()));
    gh.factory<_i74.FetchSpecialistReviewsUseCase>(
        () => _i74.FetchSpecialistReviewsUseCase(gh<_i64.SpecialistService>()));
    gh.factory<_i75.FetchSpecialistsOnlineUseCase>(
        () => _i75.FetchSpecialistsOnlineUseCase(gh<_i64.SpecialistService>()));
    gh.factory<_i76.PinCodeBloc>(() => _i76.PinCodeBloc(
          gh<_i38.UserController>(),
          gh<_i63.PinCodeChangeUseCase>(),
        ));
    gh.factory<_i77.RemoveFromFavoriteUseCase>(
        () => _i77.RemoveFromFavoriteUseCase(gh<_i64.SpecialistService>()));
    gh.factory<_i78.ReviewBloc>(() => _i78.ReviewBloc(
          gh<_i74.FetchSpecialistReviewsUseCase>(),
          gh<_i68.AddReviewUseCase>(),
          gh<_i38.UserController>(),
          gh<_i31.SpecialistRatingController>(),
          gh<_i66.UpdateReviewUseCase>(),
          gh<_i71.DeleteReviewUseCase>(),
        ));
    gh.factory<_i79.SpecialistCatalogueBloc>(() => _i79.SpecialistCatalogueBloc(
          gh<_i73.FetchSpecialistCatalogueUseCase>(),
          gh<_i3.AppliedFilterController>(),
          gh<_i31.SpecialistRatingController>(),
        ));
    gh.factory<_i80.SpecialistOnlineBloc>(() => _i80.SpecialistOnlineBloc(
          gh<_i75.FetchSpecialistsOnlineUseCase>(),
          gh<_i31.SpecialistRatingController>(),
        ));
    gh.factory<_i81.FavoriteBloc>(() => _i81.FavoriteBloc(
          gh<_i38.UserController>(),
          gh<_i72.FetchFavoriteListUseCase>(),
          gh<_i69.AddToFavoriteUseCase>(),
          gh<_i77.RemoveFromFavoriteUseCase>(),
        ));
    return this;
  }
}
