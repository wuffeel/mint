// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i18;
import 'package:flutter/material.dart' as _i19;
import 'package:mint/domain/entity/specialist_model/specialist_model.dart'
    as _i20;
import 'package:mint/presentation/pages/auth/enter_phone/enter_phone_page.dart'
    as _i3;
import 'package:mint/presentation/pages/auth/otp_page/otp_page.dart' as _i2;
import 'package:mint/presentation/pages/auth/sign_up_wrapper_page.dart' as _i1;
import 'package:mint/presentation/pages/log_in_check_page.dart' as _i4;
import 'package:mint/presentation/pages/main/booking/booking_resume_page.dart'
    as _i9;
import 'package:mint/presentation/pages/main/home/home_page.dart' as _i5;
import 'package:mint/presentation/pages/main/navigation/navigation_page.dart'
    as _i10;
import 'package:mint/presentation/pages/main/navigation/navigation_wrapper_page.dart'
    as _i11;
import 'package:mint/presentation/pages/main/pick_up_specialist/pick_up_specialist_page.dart'
    as _i14;
import 'package:mint/presentation/pages/main/pin_code/forgot_pin_otp_wrapper_page.dart'
    as _i6;
import 'package:mint/presentation/pages/main/pin_code/pin_code_page.dart'
    as _i8;
import 'package:mint/presentation/pages/main/pin_code/pin_code_wrapper_page.dart'
    as _i7;
import 'package:mint/presentation/pages/main/profile/profile_page.dart' as _i16;
import 'package:mint/presentation/pages/main/sessions/sessions_page.dart'
    as _i15;
import 'package:mint/presentation/pages/main/specialist_details/specialist_details_page.dart'
    as _i17;
import 'package:mint/presentation/pages/main/specialists/specialists_page.dart'
    as _i12;
import 'package:mint/presentation/pages/main/specialists/specialists_wrapper_page.dart'
    as _i13;

abstract class $AppRouter extends _i18.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i18.PageFactory> pagesMap = {
    SignUpWrapperRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.WrappedRoute(child: const _i1.SignUpWrapperPage()),
      );
    },
    OtpRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.OtpPage(),
      );
    },
    EnterPhoneRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.EnterPhonePage(),
      );
    },
    LogInCheckRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LogInCheckPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomePage(),
      );
    },
    ForgotPinOtpWrapperRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.WrappedRoute(child: const _i6.ForgotPinOtpWrapperPage()),
      );
    },
    PinCodeWrapperRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.WrappedRoute(child: const _i7.PinCodeWrapperPage()),
      );
    },
    PinCodeRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.PinCodePage(),
      );
    },
    BookingResumeRoute.name: (routeData) {
      final args = routeData.argsAs<BookingResumeRouteArgs>();
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.BookingResumePage(
          key: args.key,
          specialistModel: args.specialistModel,
          date: args.date,
          time: args.time,
          minutesDuration: args.minutesDuration,
        ),
      );
    },
    NavigationRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.NavigationPage(),
      );
    },
    NavigationWrapperRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.WrappedRoute(child: const _i11.NavigationWrapperPage()),
      );
    },
    SpecialistsRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.SpecialistsPage(),
      );
    },
    SpecialistsWrapperRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.WrappedRoute(child: const _i13.SpecialistsWrapperPage()),
      );
    },
    PickUpSpecialistRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.PickUpSpecialistPage(),
      );
    },
    SessionsRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.SessionsPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.ProfilePage(),
      );
    },
    SpecialistDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<SpecialistDetailsRouteArgs>();
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.SpecialistDetailsPage(
          key: args.key,
          specialistModel: args.specialistModel,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.SignUpWrapperPage]
class SignUpWrapperRoute extends _i18.PageRouteInfo<void> {
  const SignUpWrapperRoute({List<_i18.PageRouteInfo>? children})
      : super(
          SignUpWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpWrapperRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i2.OtpPage]
class OtpRoute extends _i18.PageRouteInfo<void> {
  const OtpRoute({List<_i18.PageRouteInfo>? children})
      : super(
          OtpRoute.name,
          initialChildren: children,
        );

  static const String name = 'OtpRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i3.EnterPhonePage]
class EnterPhoneRoute extends _i18.PageRouteInfo<void> {
  const EnterPhoneRoute({List<_i18.PageRouteInfo>? children})
      : super(
          EnterPhoneRoute.name,
          initialChildren: children,
        );

  static const String name = 'EnterPhoneRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LogInCheckPage]
class LogInCheckRoute extends _i18.PageRouteInfo<void> {
  const LogInCheckRoute({List<_i18.PageRouteInfo>? children})
      : super(
          LogInCheckRoute.name,
          initialChildren: children,
        );

  static const String name = 'LogInCheckRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomePage]
class HomeRoute extends _i18.PageRouteInfo<void> {
  const HomeRoute({List<_i18.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ForgotPinOtpWrapperPage]
class ForgotPinOtpWrapperRoute extends _i18.PageRouteInfo<void> {
  const ForgotPinOtpWrapperRoute({List<_i18.PageRouteInfo>? children})
      : super(
          ForgotPinOtpWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPinOtpWrapperRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i7.PinCodeWrapperPage]
class PinCodeWrapperRoute extends _i18.PageRouteInfo<void> {
  const PinCodeWrapperRoute({List<_i18.PageRouteInfo>? children})
      : super(
          PinCodeWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'PinCodeWrapperRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i8.PinCodePage]
class PinCodeRoute extends _i18.PageRouteInfo<void> {
  const PinCodeRoute({List<_i18.PageRouteInfo>? children})
      : super(
          PinCodeRoute.name,
          initialChildren: children,
        );

  static const String name = 'PinCodeRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i9.BookingResumePage]
class BookingResumeRoute extends _i18.PageRouteInfo<BookingResumeRouteArgs> {
  BookingResumeRoute({
    _i19.Key? key,
    required _i20.SpecialistModel specialistModel,
    required DateTime date,
    required DateTime time,
    int minutesDuration = 60,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          BookingResumeRoute.name,
          args: BookingResumeRouteArgs(
            key: key,
            specialistModel: specialistModel,
            date: date,
            time: time,
            minutesDuration: minutesDuration,
          ),
          initialChildren: children,
        );

  static const String name = 'BookingResumeRoute';

  static const _i18.PageInfo<BookingResumeRouteArgs> page =
      _i18.PageInfo<BookingResumeRouteArgs>(name);
}

class BookingResumeRouteArgs {
  const BookingResumeRouteArgs({
    this.key,
    required this.specialistModel,
    required this.date,
    required this.time,
    this.minutesDuration = 60,
  });

  final _i19.Key? key;

  final _i20.SpecialistModel specialistModel;

  final DateTime date;

  final DateTime time;

  final int minutesDuration;

  @override
  String toString() {
    return 'BookingResumeRouteArgs{key: $key, specialistModel: $specialistModel, date: $date, time: $time, minutesDuration: $minutesDuration}';
  }
}

/// generated route for
/// [_i10.NavigationPage]
class NavigationRoute extends _i18.PageRouteInfo<void> {
  const NavigationRoute({List<_i18.PageRouteInfo>? children})
      : super(
          NavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NavigationRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i11.NavigationWrapperPage]
class NavigationWrapperRoute extends _i18.PageRouteInfo<void> {
  const NavigationWrapperRoute({List<_i18.PageRouteInfo>? children})
      : super(
          NavigationWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'NavigationWrapperRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i12.SpecialistsPage]
class SpecialistsRoute extends _i18.PageRouteInfo<void> {
  const SpecialistsRoute({List<_i18.PageRouteInfo>? children})
      : super(
          SpecialistsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SpecialistsRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i13.SpecialistsWrapperPage]
class SpecialistsWrapperRoute extends _i18.PageRouteInfo<void> {
  const SpecialistsWrapperRoute({List<_i18.PageRouteInfo>? children})
      : super(
          SpecialistsWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'SpecialistsWrapperRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i14.PickUpSpecialistPage]
class PickUpSpecialistRoute extends _i18.PageRouteInfo<void> {
  const PickUpSpecialistRoute({List<_i18.PageRouteInfo>? children})
      : super(
          PickUpSpecialistRoute.name,
          initialChildren: children,
        );

  static const String name = 'PickUpSpecialistRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i15.SessionsPage]
class SessionsRoute extends _i18.PageRouteInfo<void> {
  const SessionsRoute({List<_i18.PageRouteInfo>? children})
      : super(
          SessionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SessionsRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i16.ProfilePage]
class ProfileRoute extends _i18.PageRouteInfo<void> {
  const ProfileRoute({List<_i18.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i17.SpecialistDetailsPage]
class SpecialistDetailsRoute
    extends _i18.PageRouteInfo<SpecialistDetailsRouteArgs> {
  SpecialistDetailsRoute({
    _i19.Key? key,
    required _i20.SpecialistModel specialistModel,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          SpecialistDetailsRoute.name,
          args: SpecialistDetailsRouteArgs(
            key: key,
            specialistModel: specialistModel,
          ),
          initialChildren: children,
        );

  static const String name = 'SpecialistDetailsRoute';

  static const _i18.PageInfo<SpecialistDetailsRouteArgs> page =
      _i18.PageInfo<SpecialistDetailsRouteArgs>(name);
}

class SpecialistDetailsRouteArgs {
  const SpecialistDetailsRouteArgs({
    this.key,
    required this.specialistModel,
  });

  final _i19.Key? key;

  final _i20.SpecialistModel specialistModel;

  @override
  String toString() {
    return 'SpecialistDetailsRouteArgs{key: $key, specialistModel: $specialistModel}';
  }
}
