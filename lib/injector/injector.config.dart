// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i20;

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mint/assembly/entity/specialist_model_from_dto.dart' as _i23;
import 'package:mint/assembly/entity/user_model_from_dto.dart' as _i26;
import 'package:mint/assembly/factory.dart' as _i19;
import 'package:mint/bloc/auth/auth_bloc.dart' as _i18;
import 'package:mint/bloc/favorite/favorite_bloc.dart' as _i40;
import 'package:mint/bloc/pin_code/pin_code_bloc.dart' as _i41;
import 'package:mint/bloc/specialist_catalogue/specialist_catalogue_bloc.dart'
    as _i38;
import 'package:mint/bloc/user/user_bloc.dart' as _i39;
import 'package:mint/data/model/specialist_model_dto/specialist_model_dto.dart'
    as _i22;
import 'package:mint/data/model/user_model_dto/user_model_dto.dart' as _i25;
import 'package:mint/data/repository/abstract/phone_auth_repository.dart'
    as _i3;
import 'package:mint/data/repository/abstract/specialist_repository.dart'
    as _i7;
import 'package:mint/data/repository/abstract/storage_repository.dart' as _i9;
import 'package:mint/data/repository/abstract/user_repository.dart' as _i14;
import 'package:mint/data/repository/firebase/firebase_auth_repository.dart'
    as _i4;
import 'package:mint/data/repository/firebase/firebase_specialist_repository.dart'
    as _i8;
import 'package:mint/data/repository/firebase/firebase_storage_repository.dart'
    as _i10;
import 'package:mint/data/repository/firebase/firebase_user_repository.dart'
    as _i15;
import 'package:mint/domain/controller/user_controller.dart' as _i13;
import 'package:mint/domain/entity/specialist_model/specialist_model.dart'
    as _i21;
import 'package:mint/domain/entity/user_model/user_model.dart' as _i24;
import 'package:mint/domain/service/abstract/phone_auth_service.dart' as _i5;
import 'package:mint/domain/service/abstract/specialist_service.dart' as _i27;
import 'package:mint/domain/service/abstract/storage_service.dart' as _i11;
import 'package:mint/domain/service/abstract/user_service.dart' as _i29;
import 'package:mint/domain/service/firebase/firebase_phone_auth_service.dart'
    as _i6;
import 'package:mint/domain/service/firebase/firebase_specialist_service.dart'
    as _i28;
import 'package:mint/domain/service/firebase/firebase_storage_service.dart'
    as _i12;
import 'package:mint/domain/service/firebase/firebase_user_service.dart'
    as _i30;
import 'package:mint/domain/usecase/add_to_favorite_use_case.dart' as _i31;
import 'package:mint/domain/usecase/fetch_favorite_list_use_case.dart' as _i32;
import 'package:mint/domain/usecase/fetch_specialists_online_use_case.dart'
    as _i33;
import 'package:mint/domain/usecase/get_current_user_use_case.dart' as _i34;
import 'package:mint/domain/usecase/log_out_use_case.dart' as _i35;
import 'package:mint/domain/usecase/pin_code_change_use_case.dart' as _i36;
import 'package:mint/domain/usecase/remove_from_favorite_use_case.dart' as _i37;
import 'package:mint/domain/usecase/verify_otp_use_case.dart' as _i16;
import 'package:mint/domain/usecase/verify_phone_use_case.dart' as _i17;

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
    gh.factory<_i3.PhoneAuthRepository>(() => _i4.FirebaseAuthRepository());
    gh.factory<_i5.PhoneAuthService>(
        () => _i6.FirebasePhoneAuthService(gh<_i3.PhoneAuthRepository>()));
    gh.factory<_i7.SpecialistRepository>(
        () => _i8.FirebaseSpecialistRepository());
    gh.factory<_i9.StorageRepository>(() => _i10.FirebaseStorageRepository());
    gh.factory<_i11.StorageService>(
        () => _i12.FirebaseStorageService(gh<_i9.StorageRepository>()));
    gh.lazySingleton<_i13.UserController>(() => _i13.UserController());
    gh.factory<_i14.UserRepository>(() => _i15.FirebaseUserRepository());
    gh.factory<_i16.VerifyOtpUseCase>(
        () => _i16.VerifyOtpUseCase(gh<_i5.PhoneAuthService>()));
    gh.factory<_i17.VerifyPhoneUseCase>(
        () => _i17.VerifyPhoneUseCase(gh<_i5.PhoneAuthService>()));
    gh.factory<_i18.AuthBloc>(() => _i18.AuthBloc(
          gh<_i17.VerifyPhoneUseCase>(),
          gh<_i16.VerifyOtpUseCase>(),
          gh<_i13.UserController>(),
        ));
    gh.factory<
            _i19.Factory<_i20.Future<_i21.SpecialistModel>,
                _i22.SpecialistModelDto>>(
        () => _i23.SpecialistModelFromDto(gh<_i11.StorageService>()));
    gh.factory<_i19.Factory<_i20.Future<_i24.UserModel>, _i25.UserModelDto>>(
        () => _i26.UserModelFromDto(gh<_i11.StorageService>()));
    gh.factory<_i27.SpecialistService>(() => _i28.FirebaseSpecialistService(
          gh<_i7.SpecialistRepository>(),
          gh<
              _i19.Factory<_i20.Future<_i21.SpecialistModel>,
                  _i22.SpecialistModelDto>>(),
        ));
    gh.factory<_i29.UserService>(() => _i30.FirebaseUserService(
          gh<_i14.UserRepository>(),
          gh<_i19.Factory<_i20.Future<_i24.UserModel>, _i25.UserModelDto>>(),
        ));
    gh.factory<_i31.AddToFavoriteUseCase>(
        () => _i31.AddToFavoriteUseCase(gh<_i27.SpecialistService>()));
    gh.factory<_i32.FetchFavoriteListUseCase>(
        () => _i32.FetchFavoriteListUseCase(gh<_i27.SpecialistService>()));
    gh.factory<_i33.FetchSpecialistsOnlineUseCase>(
        () => _i33.FetchSpecialistsOnlineUseCase(gh<_i27.SpecialistService>()));
    gh.factory<_i34.GetCurrentUserUseCase>(
        () => _i34.GetCurrentUserUseCase(gh<_i29.UserService>()));
    gh.factory<_i35.LogOutUseCase>(
        () => _i35.LogOutUseCase(gh<_i29.UserService>()));
    gh.factory<_i36.PinCodeChangeUseCase>(
        () => _i36.PinCodeChangeUseCase(gh<_i29.UserService>()));
    gh.factory<_i37.RemoveFromFavoriteUseCase>(
        () => _i37.RemoveFromFavoriteUseCase(gh<_i27.SpecialistService>()));
    gh.factory<_i38.SpecialistCatalogueBloc>(() =>
        _i38.SpecialistCatalogueBloc(gh<_i33.FetchSpecialistsOnlineUseCase>()));
    gh.factory<_i39.UserBloc>(() => _i39.UserBloc(
          gh<_i34.GetCurrentUserUseCase>(),
          gh<_i35.LogOutUseCase>(),
          gh<_i13.UserController>(),
        ));
    gh.factory<_i40.FavoriteBloc>(() => _i40.FavoriteBloc(
          gh<_i13.UserController>(),
          gh<_i32.FetchFavoriteListUseCase>(),
          gh<_i31.AddToFavoriteUseCase>(),
          gh<_i37.RemoveFromFavoriteUseCase>(),
        ));
    gh.factory<_i41.PinCodeBloc>(() => _i41.PinCodeBloc(
          gh<_i13.UserController>(),
          gh<_i36.PinCodeChangeUseCase>(),
        ));
    return this;
  }
}
