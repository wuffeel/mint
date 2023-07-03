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
import 'package:mint/assembly/entity/user_model_from_dto.dart' as _i6;
import 'package:mint/assembly/factory.dart' as _i3;
import 'package:mint/assembly/model/user_model_dto_from_json.dart' as _i7;
import 'package:mint/bloc/auth/auth_bloc.dart' as _i19;
import 'package:mint/bloc/log_in/log_in_cubit.dart' as _i21;
import 'package:mint/bloc/user/user_bloc.dart' as _i23;
import 'package:mint/data/model/user_model_dto.dart' as _i5;
import 'package:mint/data/repository/abstract/phone_auth_repository.dart'
    as _i8;
import 'package:mint/data/repository/abstract/user_repository.dart' as _i13;
import 'package:mint/data/repository/firebase/firebase_auth_repository.dart'
    as _i9;
import 'package:mint/data/repository/firebase/firebase_user_repository.dart'
    as _i14;
import 'package:mint/domain/controller/user_controller.dart' as _i12;
import 'package:mint/domain/entity/user_model.dart' as _i4;
import 'package:mint/domain/service/abstract/phone_auth_service.dart' as _i10;
import 'package:mint/domain/service/abstract/user_service.dart' as _i15;
import 'package:mint/domain/service/firebase/firebase_phone_auth_service.dart'
    as _i11;
import 'package:mint/domain/service/firebase/firebase_user_service.dart'
    as _i16;
import 'package:mint/domain/usecase/get_current_user_use_case.dart' as _i20;
import 'package:mint/domain/usecase/log_out_use_case.dart' as _i22;
import 'package:mint/domain/usecase/verify_otp_use_case.dart' as _i17;
import 'package:mint/domain/usecase/verify_phone_use_case.dart' as _i18;

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
    gh.factory<_i3.Factory<_i4.UserModel, _i5.UserModelDto>>(
        () => _i6.UserModelFromDto());
    gh.factory<_i3.Factory<_i5.UserModelDto, Map<String, dynamic>>>(
        () => _i7.UserModelDtoFromJson());
    gh.factory<_i8.PhoneAuthRepository>(() => _i9.FirebaseAuthRepository());
    gh.factory<_i10.PhoneAuthService>(
        () => _i11.FirebasePhoneAuthService(gh<_i8.PhoneAuthRepository>()));
    gh.lazySingleton<_i12.UserController>(() => _i12.UserController());
    gh.factory<_i13.UserRepository>(() => _i14.FirebaseUserRepository(
        gh<_i3.Factory<_i5.UserModelDto, Map<String, dynamic>>>()));
    gh.factory<_i15.UserService>(() => _i16.FirebaseUserService(
          gh<_i13.UserRepository>(),
          gh<_i3.Factory<_i4.UserModel, _i5.UserModelDto>>(),
        ));
    gh.factory<_i17.VerifyOtpUseCase>(
        () => _i17.VerifyOtpUseCase(gh<_i10.PhoneAuthService>()));
    gh.factory<_i18.VerifyPhoneUseCase>(
        () => _i18.VerifyPhoneUseCase(gh<_i10.PhoneAuthService>()));
    gh.factory<_i19.AuthBloc>(() => _i19.AuthBloc(
          gh<_i18.VerifyPhoneUseCase>(),
          gh<_i17.VerifyOtpUseCase>(),
        ));
    gh.factory<_i20.GetCurrentUserUseCase>(
        () => _i20.GetCurrentUserUseCase(gh<_i15.UserService>()));
    gh.factory<_i21.LogInCubit>(
        () => _i21.LogInCubit(gh<_i20.GetCurrentUserUseCase>()));
    gh.factory<_i22.LogOutUseCase>(
        () => _i22.LogOutUseCase(gh<_i15.UserService>()));
    gh.factory<_i23.UserBloc>(() => _i23.UserBloc(
          gh<_i20.GetCurrentUserUseCase>(),
          gh<_i22.LogOutUseCase>(),
        ));
    return this;
  }
}
