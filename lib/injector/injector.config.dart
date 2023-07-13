// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i35;

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mint/assembly/entity/pick_up_filter_from_dto.dart' as _i13;
import 'package:mint/assembly/entity/specialist_filter_from_dto.dart' as _i10;
import 'package:mint/assembly/entity/specialist_model_from_dto.dart' as _i41;
import 'package:mint/assembly/entity/user_model_from_dto.dart' as _i38;
import 'package:mint/assembly/factory.dart' as _i4;
import 'package:mint/assembly/model/filter_preferences_to_dto.dart' as _i7;
import 'package:mint/bloc/auth/auth_bloc.dart' as _i34;
import 'package:mint/bloc/favorite/favorite_bloc.dart' as _i61;
import 'package:mint/bloc/pick_up_specialist/pick_up_specialist_bloc.dart'
    as _i44;
import 'package:mint/bloc/pin_code/pin_code_bloc.dart' as _i62;
import 'package:mint/bloc/specialist_catalogue/specialist_catalogue_bloc.dart'
    as _i58;
import 'package:mint/bloc/specialist_filter/specialist_filter_bloc.dart'
    as _i45;
import 'package:mint/bloc/specialist_online/specialist_online_bloc.dart'
    as _i59;
import 'package:mint/bloc/user/user_bloc.dart' as _i60;
import 'package:mint/data/model/filter_preferences_dto/filter_preferences_dto.dart'
    as _i5;
import 'package:mint/data/model/pick_up_filter_dto/pick_up_filter_dto.dart'
    as _i12;
import 'package:mint/data/model/specialist_filter_dto/specialist_filter_dto.dart'
    as _i9;
import 'package:mint/data/model/specialist_model_dto/specialist_model_dto.dart'
    as _i40;
import 'package:mint/data/model/user_model_dto/user_model_dto.dart' as _i37;
import 'package:mint/data/repository/abstract/filter_repository.dart' as _i14;
import 'package:mint/data/repository/abstract/phone_auth_repository.dart'
    as _i18;
import 'package:mint/data/repository/abstract/specialist_repository.dart'
    as _i23;
import 'package:mint/data/repository/abstract/storage_repository.dart' as _i25;
import 'package:mint/data/repository/abstract/user_repository.dart' as _i30;
import 'package:mint/data/repository/firebase/firebase_auth_repository.dart'
    as _i19;
import 'package:mint/data/repository/firebase/firebase_filter_repository.dart'
    as _i15;
import 'package:mint/data/repository/firebase/firebase_specialist_repository.dart'
    as _i24;
import 'package:mint/data/repository/firebase/firebase_storage_repository.dart'
    as _i26;
import 'package:mint/data/repository/firebase/firebase_user_repository.dart'
    as _i31;
import 'package:mint/domain/controller/applied_filter_controller.dart' as _i3;
import 'package:mint/domain/controller/pick_up_filter_controller.dart' as _i22;
import 'package:mint/domain/controller/user_controller.dart' as _i29;
import 'package:mint/domain/entity/filter_preferences/filter_preferences.dart'
    as _i6;
import 'package:mint/domain/entity/pick_up_filter/pick_up_filter.dart' as _i11;
import 'package:mint/domain/entity/specialist_filter/specialist_filter.dart'
    as _i8;
import 'package:mint/domain/entity/specialist_model/specialist_model.dart'
    as _i39;
import 'package:mint/domain/entity/user_model/user_model.dart' as _i36;
import 'package:mint/domain/service/abstract/filter_service.dart' as _i16;
import 'package:mint/domain/service/abstract/phone_auth_service.dart' as _i20;
import 'package:mint/domain/service/abstract/specialist_service.dart' as _i46;
import 'package:mint/domain/service/abstract/storage_service.dart' as _i27;
import 'package:mint/domain/service/abstract/user_service.dart' as _i48;
import 'package:mint/domain/service/firebase/firebase_filter_service.dart'
    as _i17;
import 'package:mint/domain/service/firebase/firebase_phone_auth_service.dart'
    as _i21;
import 'package:mint/domain/service/firebase/firebase_specialist_service.dart'
    as _i47;
import 'package:mint/domain/service/firebase/firebase_storage_service.dart'
    as _i28;
import 'package:mint/domain/service/firebase/firebase_user_service.dart'
    as _i49;
import 'package:mint/domain/usecase/add_to_favorite_use_case.dart' as _i50;
import 'package:mint/domain/usecase/fetch_favorite_list_use_case.dart' as _i51;
import 'package:mint/domain/usecase/fetch_pick_up_filter_use_case.dart' as _i42;
import 'package:mint/domain/usecase/fetch_specialist_catalogue_use_case.dart'
    as _i52;
import 'package:mint/domain/usecase/fetch_specialist_filter_use_case.dart'
    as _i43;
import 'package:mint/domain/usecase/fetch_specialists_online_use_case.dart'
    as _i53;
import 'package:mint/domain/usecase/get_current_user_use_case.dart' as _i54;
import 'package:mint/domain/usecase/log_out_use_case.dart' as _i55;
import 'package:mint/domain/usecase/pin_code_change_use_case.dart' as _i56;
import 'package:mint/domain/usecase/remove_from_favorite_use_case.dart' as _i57;
import 'package:mint/domain/usecase/verify_otp_use_case.dart' as _i32;
import 'package:mint/domain/usecase/verify_phone_use_case.dart' as _i33;

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
    gh.factory<_i4.Factory<_i5.FilterPreferencesDto, _i6.FilterPreferences>>(
        () => _i7.FilterPreferencesToDto());
    gh.factory<_i4.Factory<_i8.SpecialistFilter, _i9.SpecialistFilterDto>>(
        () => _i10.SpecialistFilterFromDto());
    gh.factory<_i4.Factory<_i11.PickUpFilter, _i12.PickUpFilterDto>>(
        () => _i13.PickUpFilterFromDto());
    gh.factory<_i14.FilterRepository>(() => _i15.FirebaseFilterRepository());
    gh.factory<_i16.FilterService>(() => _i17.FirebaseFilterService(
          gh<_i14.FilterRepository>(),
          gh<_i4.Factory<_i8.SpecialistFilter, _i9.SpecialistFilterDto>>(),
          gh<_i4.Factory<_i11.PickUpFilter, _i12.PickUpFilterDto>>(),
        ));
    gh.factory<_i18.PhoneAuthRepository>(() => _i19.FirebaseAuthRepository());
    gh.factory<_i20.PhoneAuthService>(
        () => _i21.FirebasePhoneAuthService(gh<_i18.PhoneAuthRepository>()));
    gh.lazySingleton<_i22.PickUpFilterController>(
        () => _i22.PickUpFilterController());
    gh.factory<_i23.SpecialistRepository>(
        () => _i24.FirebaseSpecialistRepository());
    gh.factory<_i25.StorageRepository>(() => _i26.FirebaseStorageRepository());
    gh.factory<_i27.StorageService>(
        () => _i28.FirebaseStorageService(gh<_i25.StorageRepository>()));
    gh.lazySingleton<_i29.UserController>(() => _i29.UserController());
    gh.factory<_i30.UserRepository>(() => _i31.FirebaseUserRepository());
    gh.factory<_i32.VerifyOtpUseCase>(
        () => _i32.VerifyOtpUseCase(gh<_i20.PhoneAuthService>()));
    gh.factory<_i33.VerifyPhoneUseCase>(
        () => _i33.VerifyPhoneUseCase(gh<_i20.PhoneAuthService>()));
    gh.factory<_i34.AuthBloc>(() => _i34.AuthBloc(
          gh<_i33.VerifyPhoneUseCase>(),
          gh<_i32.VerifyOtpUseCase>(),
          gh<_i29.UserController>(),
        ));
    gh.factory<_i4.Factory<_i35.Future<_i36.UserModel>, _i37.UserModelDto>>(
        () => _i38.UserModelFromDto(gh<_i27.StorageService>()));
    gh.factory<
            _i4.Factory<_i35.Future<_i39.SpecialistModel>,
                _i40.SpecialistModelDto>>(
        () => _i41.SpecialistModelFromDto(gh<_i27.StorageService>()));
    gh.factory<_i42.FetchPickUpFilterUseCase>(
        () => _i42.FetchPickUpFilterUseCase(gh<_i16.FilterService>()));
    gh.factory<_i43.FetchSpecialistFilterUseCase>(
        () => _i43.FetchSpecialistFilterUseCase(gh<_i16.FilterService>()));
    gh.factory<_i44.PickUpSpecialistBloc>(() => _i44.PickUpSpecialistBloc(
          gh<_i42.FetchPickUpFilterUseCase>(),
          gh<_i22.PickUpFilterController>(),
        ));
    gh.factory<_i45.SpecialistFilterBloc>(() => _i45.SpecialistFilterBloc(
          gh<_i43.FetchSpecialistFilterUseCase>(),
          gh<_i3.AppliedFilterController>(),
          gh<_i22.PickUpFilterController>(),
        ));
    gh.factory<_i46.SpecialistService>(() => _i47.FirebaseSpecialistService(
          gh<_i23.SpecialistRepository>(),
          gh<
              _i4.Factory<_i35.Future<_i39.SpecialistModel>,
                  _i40.SpecialistModelDto>>(),
          gh<_i4.Factory<_i5.FilterPreferencesDto, _i6.FilterPreferences>>(),
        ));
    gh.factory<_i48.UserService>(() => _i49.FirebaseUserService(
          gh<_i30.UserRepository>(),
          gh<_i4.Factory<_i35.Future<_i36.UserModel>, _i37.UserModelDto>>(),
        ));
    gh.factory<_i50.AddToFavoriteUseCase>(
        () => _i50.AddToFavoriteUseCase(gh<_i46.SpecialistService>()));
    gh.factory<_i51.FetchFavoriteListUseCase>(
        () => _i51.FetchFavoriteListUseCase(gh<_i46.SpecialistService>()));
    gh.factory<_i52.FetchSpecialistCatalogueUseCase>(() =>
        _i52.FetchSpecialistCatalogueUseCase(gh<_i46.SpecialistService>()));
    gh.factory<_i53.FetchSpecialistsOnlineUseCase>(
        () => _i53.FetchSpecialistsOnlineUseCase(gh<_i46.SpecialistService>()));
    gh.factory<_i54.GetCurrentUserUseCase>(
        () => _i54.GetCurrentUserUseCase(gh<_i48.UserService>()));
    gh.factory<_i55.LogOutUseCase>(
        () => _i55.LogOutUseCase(gh<_i48.UserService>()));
    gh.factory<_i56.PinCodeChangeUseCase>(
        () => _i56.PinCodeChangeUseCase(gh<_i48.UserService>()));
    gh.factory<_i57.RemoveFromFavoriteUseCase>(
        () => _i57.RemoveFromFavoriteUseCase(gh<_i46.SpecialistService>()));
    gh.factory<_i58.SpecialistCatalogueBloc>(() => _i58.SpecialistCatalogueBloc(
          gh<_i52.FetchSpecialistCatalogueUseCase>(),
          gh<_i3.AppliedFilterController>(),
        ));
    gh.factory<_i59.SpecialistOnlineBloc>(() =>
        _i59.SpecialistOnlineBloc(gh<_i53.FetchSpecialistsOnlineUseCase>()));
    gh.factory<_i60.UserBloc>(() => _i60.UserBloc(
          gh<_i54.GetCurrentUserUseCase>(),
          gh<_i55.LogOutUseCase>(),
          gh<_i29.UserController>(),
        ));
    gh.factory<_i61.FavoriteBloc>(() => _i61.FavoriteBloc(
          gh<_i29.UserController>(),
          gh<_i51.FetchFavoriteListUseCase>(),
          gh<_i50.AddToFavoriteUseCase>(),
          gh<_i57.RemoveFromFavoriteUseCase>(),
        ));
    gh.factory<_i62.PinCodeBloc>(() => _i62.PinCodeBloc(
          gh<_i29.UserController>(),
          gh<_i56.PinCodeChangeUseCase>(),
        ));
    return this;
  }
}
