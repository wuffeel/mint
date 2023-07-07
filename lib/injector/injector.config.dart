// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mint/assembly/entity/specialist_model_from_dto.dart' as _i6;
import 'package:mint/assembly/entity/user_model_from_dto.dart' as _i9;
import 'package:mint/assembly/factory.dart' as _i3;
import 'package:mint/bloc/auth/auth_bloc.dart' as _i25;
import 'package:mint/bloc/favorite/favorite_bloc.dart' as _i38;
import 'package:mint/bloc/pin_code/pin_code_bloc.dart' as _i35;
import 'package:mint/bloc/specialist_catalogue/specialist_catalogue_bloc.dart'
    as _i37;
import 'package:mint/bloc/user/user_bloc.dart' as _i31;
import 'package:mint/data/model/specialist_model_dto/specialist_model_dto.dart'
    as _i5;
import 'package:mint/data/model/user_model_dto/user_model_dto.dart' as _i8;
import 'package:mint/data/repository/abstract/phone_auth_repository.dart'
    as _i10;
import 'package:mint/data/repository/abstract/specialist_repository.dart'
    as _i14;
import 'package:mint/data/repository/abstract/storage_repository.dart' as _i16;
import 'package:mint/data/repository/abstract/user_repository.dart' as _i19;
import 'package:mint/data/repository/firebase/firebase_auth_repository.dart'
    as _i11;
import 'package:mint/data/repository/firebase/firebase_specialist_repository.dart'
    as _i15;
import 'package:mint/data/repository/firebase/firebase_storage_repository.dart'
    as _i17;
import 'package:mint/data/repository/firebase/firebase_user_repository.dart'
    as _i20;
import 'package:mint/domain/controller/user_controller.dart' as _i18;
import 'package:mint/domain/entity/specialist_model/specialist_model.dart'
    as _i4;
import 'package:mint/domain/entity/user_model/user_model.dart' as _i7;
import 'package:mint/domain/service/abstract/phone_auth_service.dart' as _i12;
import 'package:mint/domain/service/abstract/specialist_service.dart' as _i29;
import 'package:mint/domain/service/abstract/user_service.dart' as _i21;
import 'package:mint/domain/service/firebase/firebase_phone_auth_service.dart'
    as _i13;
import 'package:mint/domain/service/firebase/firebase_specialist_service.dart'
    as _i30;
import 'package:mint/domain/service/firebase/firebase_user_service.dart'
    as _i22;
import 'package:mint/domain/usecase/add_to_favorite_use_case.dart' as _i32;
import 'package:mint/domain/usecase/fetch_favorite_list_use_case.dart' as _i33;
import 'package:mint/domain/usecase/fetch_specialists_online_use_case.dart'
    as _i34;
import 'package:mint/domain/usecase/get_current_user_use_case.dart' as _i26;
import 'package:mint/domain/usecase/log_out_use_case.dart' as _i27;
import 'package:mint/domain/usecase/pin_code_change_use_case.dart' as _i28;
import 'package:mint/domain/usecase/remove_from_favorite_use_case.dart' as _i36;
import 'package:mint/domain/usecase/verify_otp_use_case.dart' as _i23;
import 'package:mint/domain/usecase/verify_phone_use_case.dart' as _i24;

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
    gh.factory<_i3.Factory<_i4.SpecialistModel, _i5.SpecialistModelDto>>(
        () => _i6.SpecialistModelFromDto());
    gh.factory<_i3.Factory<_i7.UserModel, _i8.UserModelDto>>(
        () => _i9.UserModelFromDto());
    gh.factory<_i10.PhoneAuthRepository>(() => _i11.FirebaseAuthRepository());
    gh.factory<_i12.PhoneAuthService>(
        () => _i13.FirebasePhoneAuthService(gh<_i10.PhoneAuthRepository>()));
    gh.factory<_i14.SpecialistRepository>(
        () => _i15.FirebaseSpecialistRepository());
    gh.factory<_i16.StorageRepository>(() => _i17.FirebaseStorageRepository());
    gh.lazySingleton<_i18.UserController>(() => _i18.UserController());
    gh.factory<_i19.UserRepository>(() => _i20.FirebaseUserRepository());
    gh.factory<_i21.UserService>(() => _i22.FirebaseUserService(
          gh<_i19.UserRepository>(),
          gh<_i3.Factory<_i7.UserModel, _i8.UserModelDto>>(),
        ));
    gh.factory<_i23.VerifyOtpUseCase>(
        () => _i23.VerifyOtpUseCase(gh<_i12.PhoneAuthService>()));
    gh.factory<_i24.VerifyPhoneUseCase>(
        () => _i24.VerifyPhoneUseCase(gh<_i12.PhoneAuthService>()));
    gh.factory<_i25.AuthBloc>(() => _i25.AuthBloc(
          gh<_i24.VerifyPhoneUseCase>(),
          gh<_i23.VerifyOtpUseCase>(),
          gh<_i18.UserController>(),
        ));
    gh.factory<_i26.GetCurrentUserUseCase>(
        () => _i26.GetCurrentUserUseCase(gh<_i21.UserService>()));
    gh.factory<_i27.LogOutUseCase>(
        () => _i27.LogOutUseCase(gh<_i21.UserService>()));
    gh.factory<_i28.PinCodeChangeUseCase>(
        () => _i28.PinCodeChangeUseCase(gh<_i21.UserService>()));
    gh.factory<_i29.SpecialistService>(() => _i30.FirebaseSpecialistService(
          gh<_i14.SpecialistRepository>(),
          gh<_i16.StorageRepository>(),
          gh<_i3.Factory<_i4.SpecialistModel, _i5.SpecialistModelDto>>(),
        ));
    gh.factory<_i31.UserBloc>(() => _i31.UserBloc(
          gh<_i26.GetCurrentUserUseCase>(),
          gh<_i27.LogOutUseCase>(),
          gh<_i18.UserController>(),
        ));
    gh.factory<_i32.AddToFavoriteUseCase>(
        () => _i32.AddToFavoriteUseCase(gh<_i29.SpecialistService>()));
    gh.factory<_i33.FetchFavoriteListUseCase>(
        () => _i33.FetchFavoriteListUseCase(gh<_i29.SpecialistService>()));
    gh.factory<_i34.FetchSpecialistsOnlineUseCase>(
        () => _i34.FetchSpecialistsOnlineUseCase(gh<_i29.SpecialistService>()));
    gh.factory<_i35.PinCodeBloc>(() => _i35.PinCodeBloc(
          gh<_i18.UserController>(),
          gh<_i28.PinCodeChangeUseCase>(),
        ));
    gh.factory<_i36.RemoveFromFavoriteUseCase>(
        () => _i36.RemoveFromFavoriteUseCase(gh<_i29.SpecialistService>()));
    gh.factory<_i37.SpecialistCatalogueBloc>(() =>
        _i37.SpecialistCatalogueBloc(gh<_i34.FetchSpecialistsOnlineUseCase>()));
    gh.factory<_i38.FavoriteBloc>(() => _i38.FavoriteBloc(
          gh<_i18.UserController>(),
          gh<_i33.FetchFavoriteListUseCase>(),
          gh<_i32.AddToFavoriteUseCase>(),
          gh<_i36.RemoveFromFavoriteUseCase>(),
        ));
    return this;
  }
}
