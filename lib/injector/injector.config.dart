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
import 'package:mint/assembly/model/specialist_model_dto_from_json.dart'
    as _i11;
import 'package:mint/assembly/model/user_model_dto_from_json.dart' as _i10;
import 'package:mint/bloc/auth/auth_bloc.dart' as _i27;
import 'package:mint/bloc/favorite/favorite_bloc.dart' as _i40;
import 'package:mint/bloc/pin_code/pin_code_bloc.dart' as _i37;
import 'package:mint/bloc/specialist_catalogue/specialist_catalogue_bloc.dart'
    as _i39;
import 'package:mint/bloc/user/user_bloc.dart' as _i33;
import 'package:mint/data/model/specialist_model_dto.dart' as _i5;
import 'package:mint/data/model/user_model_dto.dart' as _i8;
import 'package:mint/data/repository/abstract/phone_auth_repository.dart'
    as _i12;
import 'package:mint/data/repository/abstract/specialist_repository.dart'
    as _i16;
import 'package:mint/data/repository/abstract/storage_repository.dart' as _i18;
import 'package:mint/data/repository/abstract/user_repository.dart' as _i21;
import 'package:mint/data/repository/firebase/firebase_auth_repository.dart'
    as _i13;
import 'package:mint/data/repository/firebase/firebase_specialist_repository.dart'
    as _i17;
import 'package:mint/data/repository/firebase/firebase_storage_repository.dart'
    as _i19;
import 'package:mint/data/repository/firebase/firebase_user_repository.dart'
    as _i22;
import 'package:mint/domain/controller/user_controller.dart' as _i20;
import 'package:mint/domain/entity/specialist_model.dart' as _i4;
import 'package:mint/domain/entity/user_model.dart' as _i7;
import 'package:mint/domain/service/abstract/phone_auth_service.dart' as _i14;
import 'package:mint/domain/service/abstract/specialist_service.dart' as _i31;
import 'package:mint/domain/service/abstract/user_service.dart' as _i23;
import 'package:mint/domain/service/firebase/firebase_phone_auth_service.dart'
    as _i15;
import 'package:mint/domain/service/firebase/firebase_specialist_service.dart'
    as _i32;
import 'package:mint/domain/service/firebase/firebase_user_service.dart'
    as _i24;
import 'package:mint/domain/usecase/add_to_favorite_use_case.dart' as _i34;
import 'package:mint/domain/usecase/fetch_favorite_list_use_case.dart' as _i35;
import 'package:mint/domain/usecase/fetch_specialists_online_use_case.dart'
    as _i36;
import 'package:mint/domain/usecase/get_current_user_use_case.dart' as _i28;
import 'package:mint/domain/usecase/log_out_use_case.dart' as _i29;
import 'package:mint/domain/usecase/pin_code_change_use_case.dart' as _i30;
import 'package:mint/domain/usecase/remove_from_favorite_use_case.dart' as _i38;
import 'package:mint/domain/usecase/verify_otp_use_case.dart' as _i25;
import 'package:mint/domain/usecase/verify_phone_use_case.dart' as _i26;

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
    gh.factory<_i3.Factory<_i8.UserModelDto, Map<String, dynamic>>>(
        () => _i10.UserModelDtoFromJson());
    gh.factory<_i3.Factory<_i5.SpecialistModelDto, Map<String, dynamic>>>(
        () => _i11.SpecialistModelDtoFromJson());
    gh.factory<_i12.PhoneAuthRepository>(() => _i13.FirebaseAuthRepository());
    gh.factory<_i14.PhoneAuthService>(
        () => _i15.FirebasePhoneAuthService(gh<_i12.PhoneAuthRepository>()));
    gh.factory<_i16.SpecialistRepository>(() =>
        _i17.FirebaseSpecialistRepository(
            gh<_i3.Factory<_i5.SpecialistModelDto, Map<String, dynamic>>>()));
    gh.factory<_i18.StorageRepository>(() => _i19.FirebaseStorageRepository());
    gh.lazySingleton<_i20.UserController>(() => _i20.UserController());
    gh.factory<_i21.UserRepository>(() => _i22.FirebaseUserRepository(
        gh<_i3.Factory<_i8.UserModelDto, Map<String, dynamic>>>()));
    gh.factory<_i23.UserService>(() => _i24.FirebaseUserService(
          gh<_i21.UserRepository>(),
          gh<_i3.Factory<_i7.UserModel, _i8.UserModelDto>>(),
        ));
    gh.factory<_i25.VerifyOtpUseCase>(
        () => _i25.VerifyOtpUseCase(gh<_i14.PhoneAuthService>()));
    gh.factory<_i26.VerifyPhoneUseCase>(
        () => _i26.VerifyPhoneUseCase(gh<_i14.PhoneAuthService>()));
    gh.factory<_i27.AuthBloc>(() => _i27.AuthBloc(
          gh<_i26.VerifyPhoneUseCase>(),
          gh<_i25.VerifyOtpUseCase>(),
          gh<_i20.UserController>(),
        ));
    gh.factory<_i28.GetCurrentUserUseCase>(
        () => _i28.GetCurrentUserUseCase(gh<_i23.UserService>()));
    gh.factory<_i29.LogOutUseCase>(
        () => _i29.LogOutUseCase(gh<_i23.UserService>()));
    gh.factory<_i30.PinCodeChangeUseCase>(
        () => _i30.PinCodeChangeUseCase(gh<_i23.UserService>()));
    gh.factory<_i31.SpecialistService>(() => _i32.FirebaseSpecialistService(
          gh<_i16.SpecialistRepository>(),
          gh<_i18.StorageRepository>(),
          gh<_i3.Factory<_i4.SpecialistModel, _i5.SpecialistModelDto>>(),
        ));
    gh.factory<_i33.UserBloc>(() => _i33.UserBloc(
          gh<_i28.GetCurrentUserUseCase>(),
          gh<_i29.LogOutUseCase>(),
          gh<_i20.UserController>(),
        ));
    gh.factory<_i34.AddToFavoriteUseCase>(
        () => _i34.AddToFavoriteUseCase(gh<_i31.SpecialistService>()));
    gh.factory<_i35.FetchFavoriteListUseCase>(
        () => _i35.FetchFavoriteListUseCase(gh<_i31.SpecialistService>()));
    gh.factory<_i36.FetchSpecialistsOnlineUseCase>(
        () => _i36.FetchSpecialistsOnlineUseCase(gh<_i31.SpecialistService>()));
    gh.factory<_i37.PinCodeBloc>(() => _i37.PinCodeBloc(
          gh<_i20.UserController>(),
          gh<_i30.PinCodeChangeUseCase>(),
        ));
    gh.factory<_i38.RemoveFromFavoriteUseCase>(
        () => _i38.RemoveFromFavoriteUseCase(gh<_i31.SpecialistService>()));
    gh.factory<_i39.SpecialistCatalogueBloc>(() =>
        _i39.SpecialistCatalogueBloc(gh<_i36.FetchSpecialistsOnlineUseCase>()));
    gh.factory<_i40.FavoriteBloc>(() => _i40.FavoriteBloc(
          gh<_i20.UserController>(),
          gh<_i35.FetchFavoriteListUseCase>(),
          gh<_i34.AddToFavoriteUseCase>(),
          gh<_i38.RemoveFromFavoriteUseCase>(),
        ));
    return this;
  }
}
