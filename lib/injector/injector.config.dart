// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i39;

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mint/assembly/entity/pick_up_filter_from_dto.dart' as _i10;
import 'package:mint/assembly/entity/review_model_from_dto.dart' as _i52;
import 'package:mint/assembly/entity/specialist_filter_from_dto.dart' as _i7;
import 'package:mint/assembly/entity/specialist_model_from_dto.dart' as _i42;
import 'package:mint/assembly/entity/user_model_from_dto.dart' as _i45;
import 'package:mint/assembly/factory.dart' as _i4;
import 'package:mint/assembly/model/filter_preferences_to_dto.dart' as _i16;
import 'package:mint/assembly/model/review_model_to_dto.dart' as _i13;
import 'package:mint/bloc/auth/auth_bloc.dart' as _i38;
import 'package:mint/bloc/favorite/favorite_bloc.dart' as _i72;
import 'package:mint/bloc/pick_up_specialist/pick_up_specialist_bloc.dart'
    as _i48;
import 'package:mint/bloc/pin_code/pin_code_bloc.dart' as _i67;
import 'package:mint/bloc/review/review_bloc.dart' as _i69;
import 'package:mint/bloc/specialist_catalogue/specialist_catalogue_bloc.dart'
    as _i70;
import 'package:mint/bloc/specialist_filter/specialist_filter_bloc.dart'
    as _i49;
import 'package:mint/bloc/specialist_online/specialist_online_bloc.dart'
    as _i71;
import 'package:mint/bloc/user/user_bloc.dart' as _i59;
import 'package:mint/data/model/filter_preferences_dto/filter_preferences_dto.dart'
    as _i14;
import 'package:mint/data/model/pick_up_filter_dto/pick_up_filter_dto.dart'
    as _i9;
import 'package:mint/data/model/review_model_dto/review_model_dto.dart' as _i11;
import 'package:mint/data/model/specialist_filter_dto/specialist_filter_dto.dart'
    as _i6;
import 'package:mint/data/model/specialist_model_dto/specialist_model_dto.dart'
    as _i41;
import 'package:mint/data/model/user_model_dto/user_model_dto.dart' as _i44;
import 'package:mint/data/repository/abstract/filter_repository.dart' as _i17;
import 'package:mint/data/repository/abstract/phone_auth_repository.dart'
    as _i21;
import 'package:mint/data/repository/abstract/specialist_repository.dart'
    as _i27;
import 'package:mint/data/repository/abstract/storage_repository.dart' as _i29;
import 'package:mint/data/repository/abstract/user_repository.dart' as _i34;
import 'package:mint/data/repository/firebase/firebase_auth_repository.dart'
    as _i22;
import 'package:mint/data/repository/firebase/firebase_filter_repository.dart'
    as _i18;
import 'package:mint/data/repository/firebase/firebase_specialist_repository.dart'
    as _i28;
import 'package:mint/data/repository/firebase/firebase_storage_repository.dart'
    as _i30;
import 'package:mint/data/repository/firebase/firebase_user_repository.dart'
    as _i35;
import 'package:mint/domain/controller/applied_filter_controller.dart' as _i3;
import 'package:mint/domain/controller/pick_up_filter_controller.dart' as _i25;
import 'package:mint/domain/controller/specialist_rating_controller.dart'
    as _i26;
import 'package:mint/domain/controller/user_controller.dart' as _i33;
import 'package:mint/domain/entity/filter_preferences/filter_preferences.dart'
    as _i15;
import 'package:mint/domain/entity/pick_up_filter/pick_up_filter.dart' as _i8;
import 'package:mint/domain/entity/review_model/review_model.dart' as _i12;
import 'package:mint/domain/entity/specialist_filter/specialist_filter.dart'
    as _i5;
import 'package:mint/domain/entity/specialist_model/specialist_model.dart'
    as _i40;
import 'package:mint/domain/entity/user_model/user_model.dart' as _i43;
import 'package:mint/domain/service/abstract/filter_service.dart' as _i19;
import 'package:mint/domain/service/abstract/phone_auth_service.dart' as _i23;
import 'package:mint/domain/service/abstract/specialist_service.dart' as _i56;
import 'package:mint/domain/service/abstract/storage_service.dart' as _i31;
import 'package:mint/domain/service/abstract/user_service.dart' as _i50;
import 'package:mint/domain/service/firebase/firebase_filter_service.dart'
    as _i20;
import 'package:mint/domain/service/firebase/firebase_phone_auth_service.dart'
    as _i24;
import 'package:mint/domain/service/firebase/firebase_specialist_service.dart'
    as _i57;
import 'package:mint/domain/service/firebase/firebase_storage_service.dart'
    as _i32;
import 'package:mint/domain/service/firebase/firebase_user_service.dart'
    as _i51;
import 'package:mint/domain/usecase/add_review_use_case.dart' as _i60;
import 'package:mint/domain/usecase/add_to_favorite_use_case.dart' as _i61;
import 'package:mint/domain/usecase/delete_review_use_case.dart' as _i62;
import 'package:mint/domain/usecase/fetch_favorite_list_use_case.dart' as _i63;
import 'package:mint/domain/usecase/fetch_pick_up_filter_use_case.dart' as _i46;
import 'package:mint/domain/usecase/fetch_specialist_catalogue_use_case.dart'
    as _i64;
import 'package:mint/domain/usecase/fetch_specialist_filter_use_case.dart'
    as _i47;
import 'package:mint/domain/usecase/fetch_specialist_reviews_use_case.dart'
    as _i65;
import 'package:mint/domain/usecase/fetch_specialists_online_use_case.dart'
    as _i66;
import 'package:mint/domain/usecase/get_current_user_use_case.dart' as _i53;
import 'package:mint/domain/usecase/log_out_use_case.dart' as _i54;
import 'package:mint/domain/usecase/pin_code_change_use_case.dart' as _i55;
import 'package:mint/domain/usecase/remove_from_favorite_use_case.dart' as _i68;
import 'package:mint/domain/usecase/update_review_use_case.dart' as _i58;
import 'package:mint/domain/usecase/verify_otp_use_case.dart' as _i36;
import 'package:mint/domain/usecase/verify_phone_use_case.dart' as _i37;

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
    gh.factory<_i4.Factory<_i11.ReviewModelDto, _i12.ReviewModel>>(
        () => _i13.ReviewModelToDto());
    gh.factory<_i4.Factory<_i14.FilterPreferencesDto, _i15.FilterPreferences>>(
        () => _i16.FilterPreferencesToDto());
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
    gh.lazySingleton<_i26.SpecialistRatingController>(
        () => _i26.SpecialistRatingController());
    gh.factory<_i27.SpecialistRepository>(
        () => _i28.FirebaseSpecialistRepository());
    gh.factory<_i29.StorageRepository>(() => _i30.FirebaseStorageRepository());
    gh.factory<_i31.StorageService>(
        () => _i32.FirebaseStorageService(gh<_i29.StorageRepository>()));
    gh.lazySingleton<_i33.UserController>(() => _i33.UserController());
    gh.factory<_i34.UserRepository>(() => _i35.FirebaseUserRepository());
    gh.factory<_i36.VerifyOtpUseCase>(
        () => _i36.VerifyOtpUseCase(gh<_i23.PhoneAuthService>()));
    gh.factory<_i37.VerifyPhoneUseCase>(
        () => _i37.VerifyPhoneUseCase(gh<_i23.PhoneAuthService>()));
    gh.factory<_i38.AuthBloc>(() => _i38.AuthBloc(
          gh<_i37.VerifyPhoneUseCase>(),
          gh<_i36.VerifyOtpUseCase>(),
          gh<_i33.UserController>(),
        ));
    gh.factory<
            _i4.Factory<_i39.Future<_i40.SpecialistModel>,
                _i41.SpecialistModelDto>>(
        () => _i42.SpecialistModelFromDto(gh<_i31.StorageService>()));
    gh.factory<_i4.Factory<_i39.Future<_i43.UserModel>, _i44.UserModelDto>>(
        () => _i45.UserModelFromDto(gh<_i31.StorageService>()));
    gh.factory<_i46.FetchPickUpFilterUseCase>(
        () => _i46.FetchPickUpFilterUseCase(gh<_i19.FilterService>()));
    gh.factory<_i47.FetchSpecialistFilterUseCase>(
        () => _i47.FetchSpecialistFilterUseCase(gh<_i19.FilterService>()));
    gh.factory<_i48.PickUpSpecialistBloc>(() => _i48.PickUpSpecialistBloc(
          gh<_i46.FetchPickUpFilterUseCase>(),
          gh<_i25.PickUpFilterController>(),
        ));
    gh.factory<_i49.SpecialistFilterBloc>(() => _i49.SpecialistFilterBloc(
          gh<_i47.FetchSpecialistFilterUseCase>(),
          gh<_i3.AppliedFilterController>(),
          gh<_i25.PickUpFilterController>(),
        ));
    gh.factory<_i50.UserService>(() => _i51.FirebaseUserService(
          gh<_i34.UserRepository>(),
          gh<_i4.Factory<_i39.Future<_i43.UserModel>, _i44.UserModelDto>>(),
        ));
    gh.factory<
            _i4.Factory<_i39.Future<_i12.ReviewModel?>, _i11.ReviewModelDto>>(
        () => _i52.ReviewModelFromDto(gh<_i50.UserService>()));
    gh.factory<_i53.GetCurrentUserUseCase>(
        () => _i53.GetCurrentUserUseCase(gh<_i50.UserService>()));
    gh.factory<_i54.LogOutUseCase>(
        () => _i54.LogOutUseCase(gh<_i50.UserService>()));
    gh.factory<_i55.PinCodeChangeUseCase>(
        () => _i55.PinCodeChangeUseCase(gh<_i50.UserService>()));
    gh.factory<_i56.SpecialistService>(() => _i57.FirebaseSpecialistService(
          gh<_i27.SpecialistRepository>(),
          gh<
              _i4.Factory<_i39.Future<_i40.SpecialistModel>,
                  _i41.SpecialistModelDto>>(),
          gh<_i4.Factory<_i14.FilterPreferencesDto, _i15.FilterPreferences>>(),
          gh<
              _i4.Factory<_i39.Future<_i12.ReviewModel?>,
                  _i11.ReviewModelDto>>(),
          gh<_i4.Factory<_i11.ReviewModelDto, _i12.ReviewModel>>(),
        ));
    gh.factory<_i58.UpdateReviewUseCase>(
        () => _i58.UpdateReviewUseCase(gh<_i56.SpecialistService>()));
    gh.factory<_i59.UserBloc>(() => _i59.UserBloc(
          gh<_i53.GetCurrentUserUseCase>(),
          gh<_i54.LogOutUseCase>(),
          gh<_i33.UserController>(),
        ));
    gh.factory<_i60.AddReviewUseCase>(
        () => _i60.AddReviewUseCase(gh<_i56.SpecialistService>()));
    gh.factory<_i61.AddToFavoriteUseCase>(
        () => _i61.AddToFavoriteUseCase(gh<_i56.SpecialistService>()));
    gh.factory<_i62.DeleteReviewUseCase>(
        () => _i62.DeleteReviewUseCase(gh<_i56.SpecialistService>()));
    gh.factory<_i63.FetchFavoriteListUseCase>(
        () => _i63.FetchFavoriteListUseCase(gh<_i56.SpecialistService>()));
    gh.factory<_i64.FetchSpecialistCatalogueUseCase>(() =>
        _i64.FetchSpecialistCatalogueUseCase(gh<_i56.SpecialistService>()));
    gh.factory<_i65.FetchSpecialistReviewsUseCase>(
        () => _i65.FetchSpecialistReviewsUseCase(gh<_i56.SpecialistService>()));
    gh.factory<_i66.FetchSpecialistsOnlineUseCase>(
        () => _i66.FetchSpecialistsOnlineUseCase(gh<_i56.SpecialistService>()));
    gh.factory<_i67.PinCodeBloc>(() => _i67.PinCodeBloc(
          gh<_i33.UserController>(),
          gh<_i55.PinCodeChangeUseCase>(),
        ));
    gh.factory<_i68.RemoveFromFavoriteUseCase>(
        () => _i68.RemoveFromFavoriteUseCase(gh<_i56.SpecialistService>()));
    gh.factory<_i69.ReviewBloc>(() => _i69.ReviewBloc(
          gh<_i65.FetchSpecialistReviewsUseCase>(),
          gh<_i60.AddReviewUseCase>(),
          gh<_i33.UserController>(),
          gh<_i26.SpecialistRatingController>(),
          gh<_i58.UpdateReviewUseCase>(),
          gh<_i62.DeleteReviewUseCase>(),
        ));
    gh.factory<_i70.SpecialistCatalogueBloc>(() => _i70.SpecialistCatalogueBloc(
          gh<_i64.FetchSpecialistCatalogueUseCase>(),
          gh<_i3.AppliedFilterController>(),
          gh<_i26.SpecialistRatingController>(),
        ));
    gh.factory<_i71.SpecialistOnlineBloc>(() => _i71.SpecialistOnlineBloc(
          gh<_i66.FetchSpecialistsOnlineUseCase>(),
          gh<_i26.SpecialistRatingController>(),
        ));
    gh.factory<_i72.FavoriteBloc>(() => _i72.FavoriteBloc(
          gh<_i33.UserController>(),
          gh<_i63.FetchFavoriteListUseCase>(),
          gh<_i61.AddToFavoriteUseCase>(),
          gh<_i68.RemoveFromFavoriteUseCase>(),
        ));
    return this;
  }
}
