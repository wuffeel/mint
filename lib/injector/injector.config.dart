// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i38;

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mint/assembly/entity/pick_up_filter_from_dto.dart' as _i10;
import 'package:mint/assembly/entity/review_model_from_dto.dart' as _i51;
import 'package:mint/assembly/entity/specialist_filter_from_dto.dart' as _i7;
import 'package:mint/assembly/entity/specialist_model_from_dto.dart' as _i41;
import 'package:mint/assembly/entity/user_model_from_dto.dart' as _i44;
import 'package:mint/assembly/factory.dart' as _i4;
import 'package:mint/assembly/model/filter_preferences_to_dto.dart' as _i13;
import 'package:mint/assembly/model/review_model_to_dto.dart' as _i16;
import 'package:mint/bloc/auth/auth_bloc.dart' as _i37;
import 'package:mint/bloc/favorite/favorite_bloc.dart' as _i69;
import 'package:mint/bloc/pick_up_specialist/pick_up_specialist_bloc.dart'
    as _i47;
import 'package:mint/bloc/pin_code/pin_code_bloc.dart' as _i64;
import 'package:mint/bloc/review/review_bloc.dart' as _i66;
import 'package:mint/bloc/specialist_catalogue/specialist_catalogue_bloc.dart'
    as _i67;
import 'package:mint/bloc/specialist_filter/specialist_filter_bloc.dart'
    as _i48;
import 'package:mint/bloc/specialist_online/specialist_online_bloc.dart'
    as _i68;
import 'package:mint/bloc/user/user_bloc.dart' as _i57;
import 'package:mint/data/model/filter_preferences_dto/filter_preferences_dto.dart'
    as _i11;
import 'package:mint/data/model/pick_up_filter_dto/pick_up_filter_dto.dart'
    as _i9;
import 'package:mint/data/model/review_model_dto/review_model_dto.dart' as _i14;
import 'package:mint/data/model/specialist_filter_dto/specialist_filter_dto.dart'
    as _i6;
import 'package:mint/data/model/specialist_model_dto/specialist_model_dto.dart'
    as _i40;
import 'package:mint/data/model/user_model_dto/user_model_dto.dart' as _i43;
import 'package:mint/data/repository/abstract/filter_repository.dart' as _i17;
import 'package:mint/data/repository/abstract/phone_auth_repository.dart'
    as _i21;
import 'package:mint/data/repository/abstract/specialist_repository.dart'
    as _i26;
import 'package:mint/data/repository/abstract/storage_repository.dart' as _i28;
import 'package:mint/data/repository/abstract/user_repository.dart' as _i33;
import 'package:mint/data/repository/firebase/firebase_auth_repository.dart'
    as _i22;
import 'package:mint/data/repository/firebase/firebase_filter_repository.dart'
    as _i18;
import 'package:mint/data/repository/firebase/firebase_specialist_repository.dart'
    as _i27;
import 'package:mint/data/repository/firebase/firebase_storage_repository.dart'
    as _i29;
import 'package:mint/data/repository/firebase/firebase_user_repository.dart'
    as _i34;
import 'package:mint/domain/controller/applied_filter_controller.dart' as _i3;
import 'package:mint/domain/controller/pick_up_filter_controller.dart' as _i25;
import 'package:mint/domain/controller/user_controller.dart' as _i32;
import 'package:mint/domain/entity/filter_preferences/filter_preferences.dart'
    as _i12;
import 'package:mint/domain/entity/pick_up_filter/pick_up_filter.dart' as _i8;
import 'package:mint/domain/entity/review_model/review_model.dart' as _i15;
import 'package:mint/domain/entity/specialist_filter/specialist_filter.dart'
    as _i5;
import 'package:mint/domain/entity/specialist_model/specialist_model.dart'
    as _i39;
import 'package:mint/domain/entity/user_model/user_model.dart' as _i42;
import 'package:mint/domain/service/abstract/filter_service.dart' as _i19;
import 'package:mint/domain/service/abstract/phone_auth_service.dart' as _i23;
import 'package:mint/domain/service/abstract/specialist_service.dart' as _i55;
import 'package:mint/domain/service/abstract/storage_service.dart' as _i30;
import 'package:mint/domain/service/abstract/user_service.dart' as _i49;
import 'package:mint/domain/service/firebase/firebase_filter_service.dart'
    as _i20;
import 'package:mint/domain/service/firebase/firebase_phone_auth_service.dart'
    as _i24;
import 'package:mint/domain/service/firebase/firebase_specialist_service.dart'
    as _i56;
import 'package:mint/domain/service/firebase/firebase_storage_service.dart'
    as _i31;
import 'package:mint/domain/service/firebase/firebase_user_service.dart'
    as _i50;
import 'package:mint/domain/usecase/add_review_use_case.dart' as _i58;
import 'package:mint/domain/usecase/add_to_favorite_use_case.dart' as _i59;
import 'package:mint/domain/usecase/fetch_favorite_list_use_case.dart' as _i60;
import 'package:mint/domain/usecase/fetch_pick_up_filter_use_case.dart' as _i45;
import 'package:mint/domain/usecase/fetch_specialist_catalogue_use_case.dart'
    as _i61;
import 'package:mint/domain/usecase/fetch_specialist_filter_use_case.dart'
    as _i46;
import 'package:mint/domain/usecase/fetch_specialist_reviews_use_case.dart'
    as _i62;
import 'package:mint/domain/usecase/fetch_specialists_online_use_case.dart'
    as _i63;
import 'package:mint/domain/usecase/get_current_user_use_case.dart' as _i52;
import 'package:mint/domain/usecase/log_out_use_case.dart' as _i53;
import 'package:mint/domain/usecase/pin_code_change_use_case.dart' as _i54;
import 'package:mint/domain/usecase/remove_from_favorite_use_case.dart' as _i65;
import 'package:mint/domain/usecase/verify_otp_use_case.dart' as _i35;
import 'package:mint/domain/usecase/verify_phone_use_case.dart' as _i36;

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
    gh.factory<_i4.Factory<_i5.SpecialistFilter, _i6.SpecialistFilterDto>>(
        () => _i7.SpecialistFilterFromDto());
    gh.factory<_i4.Factory<_i8.PickUpFilter, _i9.PickUpFilterDto>>(
        () => _i10.PickUpFilterFromDto());
    gh.factory<_i4.Factory<_i11.FilterPreferencesDto, _i12.FilterPreferences>>(
        () => _i13.FilterPreferencesToDto());
    gh.factory<_i4.Factory<_i14.ReviewModelDto, _i15.ReviewModel>>(
        () => _i16.ReviewModelToDto());
    gh.factory<_i17.FilterRepository>(() => _i18.FirebaseFilterRepository());
    gh.factory<_i19.FilterService>(() => _i20.FirebaseFilterService(
          gh<_i17.FilterRepository>(),
          gh<_i4.Factory<_i5.SpecialistFilter, _i6.SpecialistFilterDto>>(),
          gh<_i4.Factory<_i8.PickUpFilter, _i9.PickUpFilterDto>>(),
        ));
    gh.factory<_i21.PhoneAuthRepository>(() => _i22.FirebaseAuthRepository());
    gh.factory<_i23.PhoneAuthService>(
        () => _i24.FirebasePhoneAuthService(gh<_i21.PhoneAuthRepository>()));
    gh.lazySingleton<_i25.PickUpFilterController>(
        () => _i25.PickUpFilterController());
    gh.factory<_i26.SpecialistRepository>(
        () => _i27.FirebaseSpecialistRepository());
    gh.factory<_i28.StorageRepository>(() => _i29.FirebaseStorageRepository());
    gh.factory<_i30.StorageService>(
        () => _i31.FirebaseStorageService(gh<_i28.StorageRepository>()));
    gh.lazySingleton<_i32.UserController>(() => _i32.UserController());
    gh.factory<_i33.UserRepository>(() => _i34.FirebaseUserRepository());
    gh.factory<_i35.VerifyOtpUseCase>(
        () => _i35.VerifyOtpUseCase(gh<_i23.PhoneAuthService>()));
    gh.factory<_i36.VerifyPhoneUseCase>(
        () => _i36.VerifyPhoneUseCase(gh<_i23.PhoneAuthService>()));
    gh.factory<_i37.AuthBloc>(() => _i37.AuthBloc(
          gh<_i36.VerifyPhoneUseCase>(),
          gh<_i35.VerifyOtpUseCase>(),
          gh<_i32.UserController>(),
        ));
    gh.factory<
            _i4.Factory<_i38.Future<_i39.SpecialistModel>,
                _i40.SpecialistModelDto>>(
        () => _i41.SpecialistModelFromDto(gh<_i30.StorageService>()));
    gh.factory<_i4.Factory<_i38.Future<_i42.UserModel>, _i43.UserModelDto>>(
        () => _i44.UserModelFromDto(gh<_i30.StorageService>()));
    gh.factory<_i45.FetchPickUpFilterUseCase>(
        () => _i45.FetchPickUpFilterUseCase(gh<_i19.FilterService>()));
    gh.factory<_i46.FetchSpecialistFilterUseCase>(
        () => _i46.FetchSpecialistFilterUseCase(gh<_i19.FilterService>()));
    gh.factory<_i47.PickUpSpecialistBloc>(() => _i47.PickUpSpecialistBloc(
          gh<_i45.FetchPickUpFilterUseCase>(),
          gh<_i25.PickUpFilterController>(),
        ));
    gh.factory<_i48.SpecialistFilterBloc>(() => _i48.SpecialistFilterBloc(
          gh<_i46.FetchSpecialistFilterUseCase>(),
          gh<_i3.AppliedFilterController>(),
          gh<_i25.PickUpFilterController>(),
        ));
    gh.factory<_i49.UserService>(() => _i50.FirebaseUserService(
          gh<_i33.UserRepository>(),
          gh<_i4.Factory<_i38.Future<_i42.UserModel>, _i43.UserModelDto>>(),
        ));
    gh.factory<
            _i4.Factory<_i38.Future<_i15.ReviewModel?>, _i14.ReviewModelDto>>(
        () => _i51.ReviewModelFromDto(gh<_i49.UserService>()));
    gh.factory<_i52.GetCurrentUserUseCase>(
        () => _i52.GetCurrentUserUseCase(gh<_i49.UserService>()));
    gh.factory<_i53.LogOutUseCase>(
        () => _i53.LogOutUseCase(gh<_i49.UserService>()));
    gh.factory<_i54.PinCodeChangeUseCase>(
        () => _i54.PinCodeChangeUseCase(gh<_i49.UserService>()));
    gh.factory<_i55.SpecialistService>(() => _i56.FirebaseSpecialistService(
          gh<_i26.SpecialistRepository>(),
          gh<
              _i4.Factory<_i38.Future<_i39.SpecialistModel>,
                  _i40.SpecialistModelDto>>(),
          gh<_i4.Factory<_i11.FilterPreferencesDto, _i12.FilterPreferences>>(),
          gh<
              _i4.Factory<_i38.Future<_i15.ReviewModel?>,
                  _i14.ReviewModelDto>>(),
          gh<_i4.Factory<_i14.ReviewModelDto, _i15.ReviewModel>>(),
        ));
    gh.factory<_i57.UserBloc>(() => _i57.UserBloc(
          gh<_i52.GetCurrentUserUseCase>(),
          gh<_i53.LogOutUseCase>(),
          gh<_i32.UserController>(),
        ));
    gh.factory<_i58.AddReviewUseCase>(
        () => _i58.AddReviewUseCase(gh<_i55.SpecialistService>()));
    gh.factory<_i59.AddToFavoriteUseCase>(
        () => _i59.AddToFavoriteUseCase(gh<_i55.SpecialistService>()));
    gh.factory<_i60.FetchFavoriteListUseCase>(
        () => _i60.FetchFavoriteListUseCase(gh<_i55.SpecialistService>()));
    gh.factory<_i61.FetchSpecialistCatalogueUseCase>(() =>
        _i61.FetchSpecialistCatalogueUseCase(gh<_i55.SpecialistService>()));
    gh.factory<_i62.FetchSpecialistReviewsUseCase>(
        () => _i62.FetchSpecialistReviewsUseCase(gh<_i55.SpecialistService>()));
    gh.factory<_i63.FetchSpecialistsOnlineUseCase>(
        () => _i63.FetchSpecialistsOnlineUseCase(gh<_i55.SpecialistService>()));
    gh.factory<_i64.PinCodeBloc>(() => _i64.PinCodeBloc(
          gh<_i32.UserController>(),
          gh<_i54.PinCodeChangeUseCase>(),
        ));
    gh.factory<_i65.RemoveFromFavoriteUseCase>(
        () => _i65.RemoveFromFavoriteUseCase(gh<_i55.SpecialistService>()));
    gh.factory<_i66.ReviewBloc>(() => _i66.ReviewBloc(
          gh<_i62.FetchSpecialistReviewsUseCase>(),
          gh<_i58.AddReviewUseCase>(),
          gh<_i32.UserController>(),
        ));
    gh.factory<_i67.SpecialistCatalogueBloc>(() => _i67.SpecialistCatalogueBloc(
          gh<_i61.FetchSpecialistCatalogueUseCase>(),
          gh<_i3.AppliedFilterController>(),
        ));
    gh.factory<_i68.SpecialistOnlineBloc>(() =>
        _i68.SpecialistOnlineBloc(gh<_i63.FetchSpecialistsOnlineUseCase>()));
    gh.factory<_i69.FavoriteBloc>(() => _i69.FavoriteBloc(
          gh<_i32.UserController>(),
          gh<_i60.FetchFavoriteListUseCase>(),
          gh<_i59.AddToFavoriteUseCase>(),
          gh<_i65.RemoveFromFavoriteUseCase>(),
        ));
    return this;
  }
}
