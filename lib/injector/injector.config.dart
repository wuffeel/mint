// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i49;

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mint/assembly/entity/pick_up_filter_from_dto.dart' as _i24;
import 'package:mint/assembly/entity/review_model_from_dto.dart' as _i64;
import 'package:mint/assembly/entity/specialist_filter_from_dto.dart' as _i18;
import 'package:mint/assembly/entity/specialist_model_from_dto.dart' as _i55;
import 'package:mint/assembly/entity/specialist_work_info_from_dto.dart'
    as _i15;
import 'package:mint/assembly/entity/user_model_from_dto.dart' as _i52;
import 'package:mint/assembly/factory.dart' as _i6;
import 'package:mint/assembly/model/booking_model_to_dto.dart' as _i12;
import 'package:mint/assembly/model/filter_preferences_to_dto.dart' as _i9;
import 'package:mint/assembly/model/review_model_to_dto.dart' as _i21;
import 'package:mint/bloc/auth/auth_bloc.dart' as _i46;
import 'package:mint/bloc/booking/booking_bloc.dart' as _i74;
import 'package:mint/bloc/favorite/favorite_bloc.dart' as _i85;
import 'package:mint/bloc/pick_up_specialist/pick_up_specialist_bloc.dart'
    as _i58;
import 'package:mint/bloc/pin_code/pin_code_bloc.dart' as _i80;
import 'package:mint/bloc/review/review_bloc.dart' as _i82;
import 'package:mint/bloc/specialist_catalogue/specialist_catalogue_bloc.dart'
    as _i83;
import 'package:mint/bloc/specialist_filter/specialist_filter_bloc.dart'
    as _i59;
import 'package:mint/bloc/specialist_online/specialist_online_bloc.dart'
    as _i84;
import 'package:mint/bloc/user/user_bloc.dart' as _i71;
import 'package:mint/data/model/booking_data_dto/booking_data_dto.dart' as _i10;
import 'package:mint/data/model/filter_preferences_dto/filter_preferences_dto.dart'
    as _i7;
import 'package:mint/data/model/pick_up_filter_dto/pick_up_filter_dto.dart'
    as _i23;
import 'package:mint/data/model/review_model_dto/review_model_dto.dart' as _i19;
import 'package:mint/data/model/specialist_filter_dto/specialist_filter_dto.dart'
    as _i17;
import 'package:mint/data/model/specialist_model_dto/specialist_model_dto.dart'
    as _i54;
import 'package:mint/data/model/specialist_work_info_dto/specialist_work_info_dto.dart'
    as _i14;
import 'package:mint/data/model/user_model_dto/user_model_dto.dart' as _i51;
import 'package:mint/data/repository/abstract/booking_repository.dart' as _i4;
import 'package:mint/data/repository/abstract/filter_repository.dart' as _i25;
import 'package:mint/data/repository/abstract/phone_auth_repository.dart'
    as _i29;
import 'package:mint/data/repository/abstract/specialist_repository.dart'
    as _i35;
import 'package:mint/data/repository/abstract/storage_repository.dart' as _i37;
import 'package:mint/data/repository/abstract/user_repository.dart' as _i42;
import 'package:mint/data/repository/firebase/firebase_auth_repository.dart'
    as _i30;
import 'package:mint/data/repository/firebase/firebase_booking_repository.dart'
    as _i5;
import 'package:mint/data/repository/firebase/firebase_filter_repository.dart'
    as _i26;
import 'package:mint/data/repository/firebase/firebase_specialist_repository.dart'
    as _i36;
import 'package:mint/data/repository/firebase/firebase_storage_repository.dart'
    as _i38;
import 'package:mint/data/repository/firebase/firebase_user_repository.dart'
    as _i43;
import 'package:mint/domain/controller/applied_filter_controller.dart' as _i3;
import 'package:mint/domain/controller/pick_up_filter_controller.dart' as _i33;
import 'package:mint/domain/controller/specialist_rating_controller.dart'
    as _i34;
import 'package:mint/domain/controller/user_controller.dart' as _i41;
import 'package:mint/domain/entity/booking_data/booking_data.dart' as _i11;
import 'package:mint/domain/entity/filter_preferences/filter_preferences.dart'
    as _i8;
import 'package:mint/domain/entity/pick_up_filter/pick_up_filter.dart' as _i22;
import 'package:mint/domain/entity/review_model/review_model.dart' as _i20;
import 'package:mint/domain/entity/specialist_filter/specialist_filter.dart'
    as _i16;
import 'package:mint/domain/entity/specialist_model/specialist_model.dart'
    as _i53;
import 'package:mint/domain/entity/specialist_work_info/specialist_work_info.dart'
    as _i13;
import 'package:mint/domain/entity/user_model/user_model.dart' as _i50;
import 'package:mint/domain/service/abstract/booking_service.dart' as _i47;
import 'package:mint/domain/service/abstract/filter_service.dart' as _i27;
import 'package:mint/domain/service/abstract/phone_auth_service.dart' as _i31;
import 'package:mint/domain/service/abstract/specialist_service.dart' as _i68;
import 'package:mint/domain/service/abstract/storage_service.dart' as _i39;
import 'package:mint/domain/service/abstract/user_service.dart' as _i60;
import 'package:mint/domain/service/firebase/firebase_booking_service.dart'
    as _i48;
import 'package:mint/domain/service/firebase/firebase_filter_service.dart'
    as _i28;
import 'package:mint/domain/service/firebase/firebase_phone_auth_service.dart'
    as _i32;
import 'package:mint/domain/service/firebase/firebase_specialist_service.dart'
    as _i69;
import 'package:mint/domain/service/firebase/firebase_storage_service.dart'
    as _i40;
import 'package:mint/domain/service/firebase/firebase_user_service.dart'
    as _i61;
import 'package:mint/domain/usecase/add_review_use_case.dart' as _i72;
import 'package:mint/domain/usecase/add_to_favorite_use_case.dart' as _i73;
import 'package:mint/domain/usecase/booking_book_use_case.dart' as _i62;
import 'package:mint/domain/usecase/booking_info_fetch_use_case.dart' as _i63;
import 'package:mint/domain/usecase/delete_review_use_case.dart' as _i75;
import 'package:mint/domain/usecase/fetch_favorite_list_use_case.dart' as _i76;
import 'package:mint/domain/usecase/fetch_pick_up_filter_use_case.dart' as _i56;
import 'package:mint/domain/usecase/fetch_specialist_catalogue_use_case.dart'
    as _i77;
import 'package:mint/domain/usecase/fetch_specialist_filter_use_case.dart'
    as _i57;
import 'package:mint/domain/usecase/fetch_specialist_reviews_use_case.dart'
    as _i78;
import 'package:mint/domain/usecase/fetch_specialists_online_use_case.dart'
    as _i79;
import 'package:mint/domain/usecase/get_current_user_use_case.dart' as _i65;
import 'package:mint/domain/usecase/log_out_use_case.dart' as _i66;
import 'package:mint/domain/usecase/pin_code_change_use_case.dart' as _i67;
import 'package:mint/domain/usecase/remove_from_favorite_use_case.dart' as _i81;
import 'package:mint/domain/usecase/update_review_use_case.dart' as _i70;
import 'package:mint/domain/usecase/verify_otp_use_case.dart' as _i44;
import 'package:mint/domain/usecase/verify_phone_use_case.dart' as _i45;

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
    gh.factory<_i6.Factory<_i10.BookingDataDto, _i11.BookingData>>(
        () => _i12.BookingModelToDto());
    gh.factory<
            _i6.Factory<_i13.SpecialistWorkInfo, _i14.SpecialistWorkInfoDto>>(
        () => _i15.SpecialistWorkInfoFromDto());
    gh.factory<_i6.Factory<_i16.SpecialistFilter, _i17.SpecialistFilterDto>>(
        () => _i18.SpecialistFilterFromDto());
    gh.factory<_i6.Factory<_i19.ReviewModelDto, _i20.ReviewModel>>(
        () => _i21.ReviewModelToDto());
    gh.factory<_i6.Factory<_i22.PickUpFilter, _i23.PickUpFilterDto>>(
        () => _i24.PickUpFilterFromDto());
    gh.factory<_i25.FilterRepository>(() => _i26.FirebaseFilterRepository());
    gh.factory<_i27.FilterService>(() => _i28.FirebaseFilterService(
          gh<_i25.FilterRepository>(),
          gh<_i6.Factory<_i16.SpecialistFilter, _i17.SpecialistFilterDto>>(),
          gh<_i6.Factory<_i22.PickUpFilter, _i23.PickUpFilterDto>>(),
        ));
    gh.factory<_i29.PhoneAuthRepository>(() => _i30.FirebaseAuthRepository());
    gh.factory<_i31.PhoneAuthService>(
        () => _i32.FirebasePhoneAuthService(gh<_i29.PhoneAuthRepository>()));
    gh.lazySingleton<_i33.PickUpFilterController>(
        () => _i33.PickUpFilterController());
    gh.lazySingleton<_i34.SpecialistRatingController>(
        () => _i34.SpecialistRatingController());
    gh.factory<_i35.SpecialistRepository>(
        () => _i36.FirebaseSpecialistRepository());
    gh.factory<_i37.StorageRepository>(() => _i38.FirebaseStorageRepository());
    gh.factory<_i39.StorageService>(
        () => _i40.FirebaseStorageService(gh<_i37.StorageRepository>()));
    gh.lazySingleton<_i41.UserController>(() => _i41.UserController());
    gh.factory<_i42.UserRepository>(() => _i43.FirebaseUserRepository());
    gh.factory<_i44.VerifyOtpUseCase>(
        () => _i44.VerifyOtpUseCase(gh<_i31.PhoneAuthService>()));
    gh.factory<_i45.VerifyPhoneUseCase>(
        () => _i45.VerifyPhoneUseCase(gh<_i31.PhoneAuthService>()));
    gh.factory<_i46.AuthBloc>(() => _i46.AuthBloc(
          gh<_i45.VerifyPhoneUseCase>(),
          gh<_i44.VerifyOtpUseCase>(),
          gh<_i41.UserController>(),
        ));
    gh.factory<_i47.BookingService>(() => _i48.FirebaseBookingService(
          gh<_i4.BookingRepository>(),
          gh<
              _i6.Factory<_i13.SpecialistWorkInfo,
                  _i14.SpecialistWorkInfoDto>>(),
          gh<_i6.Factory<_i10.BookingDataDto, _i11.BookingData>>(),
        ));
    gh.factory<_i6.Factory<_i49.Future<_i50.UserModel>, _i51.UserModelDto>>(
        () => _i52.UserModelFromDto(gh<_i39.StorageService>()));
    gh.factory<
            _i6.Factory<_i49.Future<_i53.SpecialistModel>,
                _i54.SpecialistModelDto>>(
        () => _i55.SpecialistModelFromDto(gh<_i39.StorageService>()));
    gh.factory<_i56.FetchPickUpFilterUseCase>(
        () => _i56.FetchPickUpFilterUseCase(gh<_i27.FilterService>()));
    gh.factory<_i57.FetchSpecialistFilterUseCase>(
        () => _i57.FetchSpecialistFilterUseCase(gh<_i27.FilterService>()));
    gh.factory<_i58.PickUpSpecialistBloc>(() => _i58.PickUpSpecialistBloc(
          gh<_i56.FetchPickUpFilterUseCase>(),
          gh<_i33.PickUpFilterController>(),
        ));
    gh.factory<_i59.SpecialistFilterBloc>(() => _i59.SpecialistFilterBloc(
          gh<_i57.FetchSpecialistFilterUseCase>(),
          gh<_i3.AppliedFilterController>(),
          gh<_i33.PickUpFilterController>(),
        ));
    gh.factory<_i60.UserService>(() => _i61.FirebaseUserService(
          gh<_i42.UserRepository>(),
          gh<_i6.Factory<_i49.Future<_i50.UserModel>, _i51.UserModelDto>>(),
        ));
    gh.factory<_i62.BookingBookUseCase>(
        () => _i62.BookingBookUseCase(gh<_i47.BookingService>()));
    gh.factory<_i63.BookingInfoFetchUseCase>(
        () => _i63.BookingInfoFetchUseCase(gh<_i47.BookingService>()));
    gh.factory<
            _i6.Factory<_i49.Future<_i20.ReviewModel?>, _i19.ReviewModelDto>>(
        () => _i64.ReviewModelFromDto(gh<_i60.UserService>()));
    gh.factory<_i65.GetCurrentUserUseCase>(
        () => _i65.GetCurrentUserUseCase(gh<_i60.UserService>()));
    gh.factory<_i66.LogOutUseCase>(
        () => _i66.LogOutUseCase(gh<_i60.UserService>()));
    gh.factory<_i67.PinCodeChangeUseCase>(
        () => _i67.PinCodeChangeUseCase(gh<_i60.UserService>()));
    gh.factory<_i68.SpecialistService>(() => _i69.FirebaseSpecialistService(
          gh<_i35.SpecialistRepository>(),
          gh<
              _i6.Factory<_i49.Future<_i53.SpecialistModel>,
                  _i54.SpecialistModelDto>>(),
          gh<_i6.Factory<_i7.FilterPreferencesDto, _i8.FilterPreferences>>(),
          gh<
              _i6.Factory<_i49.Future<_i20.ReviewModel?>,
                  _i19.ReviewModelDto>>(),
          gh<_i6.Factory<_i19.ReviewModelDto, _i20.ReviewModel>>(),
        ));
    gh.factory<_i70.UpdateReviewUseCase>(
        () => _i70.UpdateReviewUseCase(gh<_i68.SpecialistService>()));
    gh.factory<_i71.UserBloc>(() => _i71.UserBloc(
          gh<_i65.GetCurrentUserUseCase>(),
          gh<_i66.LogOutUseCase>(),
          gh<_i41.UserController>(),
        ));
    gh.factory<_i72.AddReviewUseCase>(
        () => _i72.AddReviewUseCase(gh<_i68.SpecialistService>()));
    gh.factory<_i73.AddToFavoriteUseCase>(
        () => _i73.AddToFavoriteUseCase(gh<_i68.SpecialistService>()));
    gh.factory<_i74.BookingBloc>(() => _i74.BookingBloc(
          gh<_i41.UserController>(),
          gh<_i63.BookingInfoFetchUseCase>(),
          gh<_i62.BookingBookUseCase>(),
        ));
    gh.factory<_i75.DeleteReviewUseCase>(
        () => _i75.DeleteReviewUseCase(gh<_i68.SpecialistService>()));
    gh.factory<_i76.FetchFavoriteListUseCase>(
        () => _i76.FetchFavoriteListUseCase(gh<_i68.SpecialistService>()));
    gh.factory<_i77.FetchSpecialistCatalogueUseCase>(() =>
        _i77.FetchSpecialistCatalogueUseCase(gh<_i68.SpecialistService>()));
    gh.factory<_i78.FetchSpecialistReviewsUseCase>(
        () => _i78.FetchSpecialistReviewsUseCase(gh<_i68.SpecialistService>()));
    gh.factory<_i79.FetchSpecialistsOnlineUseCase>(
        () => _i79.FetchSpecialistsOnlineUseCase(gh<_i68.SpecialistService>()));
    gh.factory<_i80.PinCodeBloc>(() => _i80.PinCodeBloc(
          gh<_i41.UserController>(),
          gh<_i67.PinCodeChangeUseCase>(),
        ));
    gh.factory<_i81.RemoveFromFavoriteUseCase>(
        () => _i81.RemoveFromFavoriteUseCase(gh<_i68.SpecialistService>()));
    gh.factory<_i82.ReviewBloc>(() => _i82.ReviewBloc(
          gh<_i78.FetchSpecialistReviewsUseCase>(),
          gh<_i72.AddReviewUseCase>(),
          gh<_i41.UserController>(),
          gh<_i34.SpecialistRatingController>(),
          gh<_i70.UpdateReviewUseCase>(),
          gh<_i75.DeleteReviewUseCase>(),
        ));
    gh.factory<_i83.SpecialistCatalogueBloc>(() => _i83.SpecialistCatalogueBloc(
          gh<_i77.FetchSpecialistCatalogueUseCase>(),
          gh<_i3.AppliedFilterController>(),
          gh<_i34.SpecialistRatingController>(),
        ));
    gh.factory<_i84.SpecialistOnlineBloc>(() => _i84.SpecialistOnlineBloc(
          gh<_i79.FetchSpecialistsOnlineUseCase>(),
          gh<_i34.SpecialistRatingController>(),
        ));
    gh.factory<_i85.FavoriteBloc>(() => _i85.FavoriteBloc(
          gh<_i41.UserController>(),
          gh<_i76.FetchFavoriteListUseCase>(),
          gh<_i73.AddToFavoriteUseCase>(),
          gh<_i81.RemoveFromFavoriteUseCase>(),
        ));
    return this;
  }
}
