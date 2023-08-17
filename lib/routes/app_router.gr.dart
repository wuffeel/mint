// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i27;
import 'package:flutter/material.dart' as _i28;
import 'package:flutter_chat_types/flutter_chat_types.dart' as _i29;
import 'package:mint/domain/entity/booking_data/booking_data.dart' as _i31;
import 'package:mint/domain/entity/specialist_model/specialist_model.dart'
    as _i30;
import 'package:mint/presentation/pages/auth/enter_phone/enter_phone_page.dart'
    as _i3;
import 'package:mint/presentation/pages/auth/otp_page/otp_page.dart' as _i2;
import 'package:mint/presentation/pages/auth/sign_up_wrapper_page.dart' as _i1;
import 'package:mint/presentation/pages/log_in_check_page.dart' as _i4;
import 'package:mint/presentation/pages/main/booking/booking_resume_page.dart'
    as _i10;
import 'package:mint/presentation/pages/main/chat/chat_page.dart' as _i9;
import 'package:mint/presentation/pages/main/checkout/checkout_details_page.dart'
    as _i15;
import 'package:mint/presentation/pages/main/checkout/checkout_payment_page.dart'
    as _i14;
import 'package:mint/presentation/pages/main/checkout/checkout_wrapper_page.dart'
    as _i13;
import 'package:mint/presentation/pages/main/home/home_page.dart' as _i5;
import 'package:mint/presentation/pages/main/navigation/navigation_page.dart'
    as _i11;
import 'package:mint/presentation/pages/main/navigation/navigation_wrapper_page.dart'
    as _i12;
import 'package:mint/presentation/pages/main/pick_up_specialist/pick_up_specialist_page.dart'
    as _i18;
import 'package:mint/presentation/pages/main/pin_code/forgot_pin_otp_wrapper_page.dart'
    as _i6;
import 'package:mint/presentation/pages/main/pin_code/pin_code_page.dart'
    as _i8;
import 'package:mint/presentation/pages/main/pin_code/pin_code_wrapper_page.dart'
    as _i7;
import 'package:mint/presentation/pages/main/profile/credit_cards/profile_credit_cards_page.dart'
    as _i20;
import 'package:mint/presentation/pages/main/profile/personal_data/profile_personal_data_page.dart'
    as _i21;
import 'package:mint/presentation/pages/main/profile/profile_page.dart' as _i22;
import 'package:mint/presentation/pages/main/sessions/sessions_page.dart'
    as _i19;
import 'package:mint/presentation/pages/main/specialist_details/specialist_details_page.dart'
    as _i23;
import 'package:mint/presentation/pages/main/specialists/specialists_page.dart'
    as _i16;
import 'package:mint/presentation/pages/main/specialists/specialists_wrapper_page.dart'
    as _i17;
import 'package:mint/presentation/pages/main/waiting_session/session_details_page.dart'
    as _i24;
import 'package:mint/presentation/pages/main/waiting_session/session_details_wrapper_page.dart'
    as _i25;
import 'package:mint/routes/app_router.dart' as _i26;

abstract class $AppRouter extends _i27.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i27.PageFactory> pagesMap = {
    SignUpWrapperRoute.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i27.WrappedRoute(child: const _i1.SignUpWrapperPage()),
      );
    },
    OtpRoute.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.OtpPage(),
      );
    },
    EnterPhoneRoute.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.EnterPhonePage(),
      );
    },
    LogInCheckRoute.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LogInCheckPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomePage(),
      );
    },
    ForgotPinOtpWrapperRoute.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i27.WrappedRoute(child: const _i6.ForgotPinOtpWrapperPage()),
      );
    },
    PinCodeWrapperRoute.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i27.WrappedRoute(child: const _i7.PinCodeWrapperPage()),
      );
    },
    PinCodeRoute.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.PinCodePage(),
      );
    },
    ChatRoute.name: (routeData) {
      final args = routeData.argsAs<ChatRouteArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.ChatPage(
          key: args.key,
          room: args.room,
          specialistModel: args.specialistModel,
        ),
      );
    },
    BookingResumeRoute.name: (routeData) {
      final args = routeData.argsAs<BookingResumeRouteArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.BookingResumePage(
          key: args.key,
          specialistModel: args.specialistModel,
          bookTime: args.bookTime,
          durationMinutes: args.durationMinutes,
          previousBookingData: args.previousBookingData,
        ),
      );
    },
    NavigationRoute.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.NavigationPage(),
      );
    },
    NavigationWrapperRoute.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i27.WrappedRoute(child: const _i12.NavigationWrapperPage()),
      );
    },
    CheckoutWrapperRoute.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i27.WrappedRoute(child: const _i13.CheckoutWrapperPage()),
      );
    },
    CheckoutPaymentRoute.name: (routeData) {
      final args = routeData.argsAs<CheckoutPaymentRouteArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.CheckoutPaymentPage(
          key: args.key,
          bookingData: args.bookingData,
        ),
      );
    },
    CheckoutDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CheckoutDetailsRouteArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.CheckoutDetailsPage(
          key: args.key,
          bookingData: args.bookingData,
        ),
      );
    },
    SpecialistsRoute.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.SpecialistsPage(),
      );
    },
    SpecialistsWrapperRoute.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i27.WrappedRoute(child: const _i17.SpecialistsWrapperPage()),
      );
    },
    PickUpSpecialistRoute.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.PickUpSpecialistPage(),
      );
    },
    SessionsRoute.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.SessionsPage(),
      );
    },
    ProfileCreditCardsRoute.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.ProfileCreditCardsPage(),
      );
    },
    ProfilePersonalDataRoute.name: (routeData) {
      final args = routeData.argsAs<ProfilePersonalDataRouteArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.ProfilePersonalDataPage(
          key: args.key,
          firstName: args.firstName,
          lastName: args.lastName,
          dateOfBirth: args.dateOfBirth,
          photoUrl: args.photoUrl,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.ProfilePage(),
      );
    },
    SpecialistDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<SpecialistDetailsRouteArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i23.SpecialistDetailsPage(
          key: args.key,
          specialistModel: args.specialistModel,
        ),
      );
    },
    SessionDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<SessionDetailsRouteArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i24.SessionDetailsPage(
          key: args.key,
          bookingData: args.bookingData,
        ),
      );
    },
    SessionDetailsWrapperRoute.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i27.WrappedRoute(child: const _i25.SessionDetailsWrapperPage()),
      );
    },
    ProfileTabRoute.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i26.ProfileTabPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.SignUpWrapperPage]
class SignUpWrapperRoute extends _i27.PageRouteInfo<void> {
  const SignUpWrapperRoute({List<_i27.PageRouteInfo>? children})
      : super(
          SignUpWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpWrapperRoute';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i2.OtpPage]
class OtpRoute extends _i27.PageRouteInfo<void> {
  const OtpRoute({List<_i27.PageRouteInfo>? children})
      : super(
          OtpRoute.name,
          initialChildren: children,
        );

  static const String name = 'OtpRoute';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i3.EnterPhonePage]
class EnterPhoneRoute extends _i27.PageRouteInfo<void> {
  const EnterPhoneRoute({List<_i27.PageRouteInfo>? children})
      : super(
          EnterPhoneRoute.name,
          initialChildren: children,
        );

  static const String name = 'EnterPhoneRoute';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LogInCheckPage]
class LogInCheckRoute extends _i27.PageRouteInfo<void> {
  const LogInCheckRoute({List<_i27.PageRouteInfo>? children})
      : super(
          LogInCheckRoute.name,
          initialChildren: children,
        );

  static const String name = 'LogInCheckRoute';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomePage]
class HomeRoute extends _i27.PageRouteInfo<void> {
  const HomeRoute({List<_i27.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ForgotPinOtpWrapperPage]
class ForgotPinOtpWrapperRoute extends _i27.PageRouteInfo<void> {
  const ForgotPinOtpWrapperRoute({List<_i27.PageRouteInfo>? children})
      : super(
          ForgotPinOtpWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPinOtpWrapperRoute';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i7.PinCodeWrapperPage]
class PinCodeWrapperRoute extends _i27.PageRouteInfo<void> {
  const PinCodeWrapperRoute({List<_i27.PageRouteInfo>? children})
      : super(
          PinCodeWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'PinCodeWrapperRoute';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i8.PinCodePage]
class PinCodeRoute extends _i27.PageRouteInfo<void> {
  const PinCodeRoute({List<_i27.PageRouteInfo>? children})
      : super(
          PinCodeRoute.name,
          initialChildren: children,
        );

  static const String name = 'PinCodeRoute';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ChatPage]
class ChatRoute extends _i27.PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    _i28.Key? key,
    required _i29.Room room,
    required _i30.SpecialistModel specialistModel,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          ChatRoute.name,
          args: ChatRouteArgs(
            key: key,
            room: room,
            specialistModel: specialistModel,
          ),
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const _i27.PageInfo<ChatRouteArgs> page =
      _i27.PageInfo<ChatRouteArgs>(name);
}

class ChatRouteArgs {
  const ChatRouteArgs({
    this.key,
    required this.room,
    required this.specialistModel,
  });

  final _i28.Key? key;

  final _i29.Room room;

  final _i30.SpecialistModel specialistModel;

  @override
  String toString() {
    return 'ChatRouteArgs{key: $key, room: $room, specialistModel: $specialistModel}';
  }
}

/// generated route for
/// [_i10.BookingResumePage]
class BookingResumeRoute extends _i27.PageRouteInfo<BookingResumeRouteArgs> {
  BookingResumeRoute({
    _i28.Key? key,
    required _i30.SpecialistModel specialistModel,
    required DateTime bookTime,
    required int durationMinutes,
    _i31.BookingData? previousBookingData,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          BookingResumeRoute.name,
          args: BookingResumeRouteArgs(
            key: key,
            specialistModel: specialistModel,
            bookTime: bookTime,
            durationMinutes: durationMinutes,
            previousBookingData: previousBookingData,
          ),
          initialChildren: children,
        );

  static const String name = 'BookingResumeRoute';

  static const _i27.PageInfo<BookingResumeRouteArgs> page =
      _i27.PageInfo<BookingResumeRouteArgs>(name);
}

class BookingResumeRouteArgs {
  const BookingResumeRouteArgs({
    this.key,
    required this.specialistModel,
    required this.bookTime,
    required this.durationMinutes,
    this.previousBookingData,
  });

  final _i28.Key? key;

  final _i30.SpecialistModel specialistModel;

  final DateTime bookTime;

  final int durationMinutes;

  final _i31.BookingData? previousBookingData;

  @override
  String toString() {
    return 'BookingResumeRouteArgs{key: $key, specialistModel: $specialistModel, bookTime: $bookTime, durationMinutes: $durationMinutes, previousBookingData: $previousBookingData}';
  }
}

/// generated route for
/// [_i11.NavigationPage]
class NavigationRoute extends _i27.PageRouteInfo<void> {
  const NavigationRoute({List<_i27.PageRouteInfo>? children})
      : super(
          NavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NavigationRoute';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i12.NavigationWrapperPage]
class NavigationWrapperRoute extends _i27.PageRouteInfo<void> {
  const NavigationWrapperRoute({List<_i27.PageRouteInfo>? children})
      : super(
          NavigationWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'NavigationWrapperRoute';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i13.CheckoutWrapperPage]
class CheckoutWrapperRoute extends _i27.PageRouteInfo<void> {
  const CheckoutWrapperRoute({List<_i27.PageRouteInfo>? children})
      : super(
          CheckoutWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'CheckoutWrapperRoute';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i14.CheckoutPaymentPage]
class CheckoutPaymentRoute
    extends _i27.PageRouteInfo<CheckoutPaymentRouteArgs> {
  CheckoutPaymentRoute({
    _i28.Key? key,
    required _i31.BookingData bookingData,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          CheckoutPaymentRoute.name,
          args: CheckoutPaymentRouteArgs(
            key: key,
            bookingData: bookingData,
          ),
          initialChildren: children,
        );

  static const String name = 'CheckoutPaymentRoute';

  static const _i27.PageInfo<CheckoutPaymentRouteArgs> page =
      _i27.PageInfo<CheckoutPaymentRouteArgs>(name);
}

class CheckoutPaymentRouteArgs {
  const CheckoutPaymentRouteArgs({
    this.key,
    required this.bookingData,
  });

  final _i28.Key? key;

  final _i31.BookingData bookingData;

  @override
  String toString() {
    return 'CheckoutPaymentRouteArgs{key: $key, bookingData: $bookingData}';
  }
}

/// generated route for
/// [_i15.CheckoutDetailsPage]
class CheckoutDetailsRoute
    extends _i27.PageRouteInfo<CheckoutDetailsRouteArgs> {
  CheckoutDetailsRoute({
    _i28.Key? key,
    required _i31.BookingData bookingData,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          CheckoutDetailsRoute.name,
          args: CheckoutDetailsRouteArgs(
            key: key,
            bookingData: bookingData,
          ),
          initialChildren: children,
        );

  static const String name = 'CheckoutDetailsRoute';

  static const _i27.PageInfo<CheckoutDetailsRouteArgs> page =
      _i27.PageInfo<CheckoutDetailsRouteArgs>(name);
}

class CheckoutDetailsRouteArgs {
  const CheckoutDetailsRouteArgs({
    this.key,
    required this.bookingData,
  });

  final _i28.Key? key;

  final _i31.BookingData bookingData;

  @override
  String toString() {
    return 'CheckoutDetailsRouteArgs{key: $key, bookingData: $bookingData}';
  }
}

/// generated route for
/// [_i16.SpecialistsPage]
class SpecialistsRoute extends _i27.PageRouteInfo<void> {
  const SpecialistsRoute({List<_i27.PageRouteInfo>? children})
      : super(
          SpecialistsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SpecialistsRoute';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i17.SpecialistsWrapperPage]
class SpecialistsWrapperRoute extends _i27.PageRouteInfo<void> {
  const SpecialistsWrapperRoute({List<_i27.PageRouteInfo>? children})
      : super(
          SpecialistsWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'SpecialistsWrapperRoute';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i18.PickUpSpecialistPage]
class PickUpSpecialistRoute extends _i27.PageRouteInfo<void> {
  const PickUpSpecialistRoute({List<_i27.PageRouteInfo>? children})
      : super(
          PickUpSpecialistRoute.name,
          initialChildren: children,
        );

  static const String name = 'PickUpSpecialistRoute';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i19.SessionsPage]
class SessionsRoute extends _i27.PageRouteInfo<void> {
  const SessionsRoute({List<_i27.PageRouteInfo>? children})
      : super(
          SessionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SessionsRoute';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i20.ProfileCreditCardsPage]
class ProfileCreditCardsRoute extends _i27.PageRouteInfo<void> {
  const ProfileCreditCardsRoute({List<_i27.PageRouteInfo>? children})
      : super(
          ProfileCreditCardsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileCreditCardsRoute';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i21.ProfilePersonalDataPage]
class ProfilePersonalDataRoute
    extends _i27.PageRouteInfo<ProfilePersonalDataRouteArgs> {
  ProfilePersonalDataRoute({
    _i28.Key? key,
    required String? firstName,
    required String? lastName,
    required DateTime? dateOfBirth,
    required String? photoUrl,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          ProfilePersonalDataRoute.name,
          args: ProfilePersonalDataRouteArgs(
            key: key,
            firstName: firstName,
            lastName: lastName,
            dateOfBirth: dateOfBirth,
            photoUrl: photoUrl,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfilePersonalDataRoute';

  static const _i27.PageInfo<ProfilePersonalDataRouteArgs> page =
      _i27.PageInfo<ProfilePersonalDataRouteArgs>(name);
}

class ProfilePersonalDataRouteArgs {
  const ProfilePersonalDataRouteArgs({
    this.key,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.photoUrl,
  });

  final _i28.Key? key;

  final String? firstName;

  final String? lastName;

  final DateTime? dateOfBirth;

  final String? photoUrl;

  @override
  String toString() {
    return 'ProfilePersonalDataRouteArgs{key: $key, firstName: $firstName, lastName: $lastName, dateOfBirth: $dateOfBirth, photoUrl: $photoUrl}';
  }
}

/// generated route for
/// [_i22.ProfilePage]
class ProfileRoute extends _i27.PageRouteInfo<void> {
  const ProfileRoute({List<_i27.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i23.SpecialistDetailsPage]
class SpecialistDetailsRoute
    extends _i27.PageRouteInfo<SpecialistDetailsRouteArgs> {
  SpecialistDetailsRoute({
    _i28.Key? key,
    required _i30.SpecialistModel specialistModel,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          SpecialistDetailsRoute.name,
          args: SpecialistDetailsRouteArgs(
            key: key,
            specialistModel: specialistModel,
          ),
          initialChildren: children,
        );

  static const String name = 'SpecialistDetailsRoute';

  static const _i27.PageInfo<SpecialistDetailsRouteArgs> page =
      _i27.PageInfo<SpecialistDetailsRouteArgs>(name);
}

class SpecialistDetailsRouteArgs {
  const SpecialistDetailsRouteArgs({
    this.key,
    required this.specialistModel,
  });

  final _i28.Key? key;

  final _i30.SpecialistModel specialistModel;

  @override
  String toString() {
    return 'SpecialistDetailsRouteArgs{key: $key, specialistModel: $specialistModel}';
  }
}

/// generated route for
/// [_i24.SessionDetailsPage]
class SessionDetailsRoute extends _i27.PageRouteInfo<SessionDetailsRouteArgs> {
  SessionDetailsRoute({
    _i28.Key? key,
    required _i31.BookingData bookingData,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          SessionDetailsRoute.name,
          args: SessionDetailsRouteArgs(
            key: key,
            bookingData: bookingData,
          ),
          initialChildren: children,
        );

  static const String name = 'SessionDetailsRoute';

  static const _i27.PageInfo<SessionDetailsRouteArgs> page =
      _i27.PageInfo<SessionDetailsRouteArgs>(name);
}

class SessionDetailsRouteArgs {
  const SessionDetailsRouteArgs({
    this.key,
    required this.bookingData,
  });

  final _i28.Key? key;

  final _i31.BookingData bookingData;

  @override
  String toString() {
    return 'SessionDetailsRouteArgs{key: $key, bookingData: $bookingData}';
  }
}

/// generated route for
/// [_i25.SessionDetailsWrapperPage]
class SessionDetailsWrapperRoute extends _i27.PageRouteInfo<void> {
  const SessionDetailsWrapperRoute({List<_i27.PageRouteInfo>? children})
      : super(
          SessionDetailsWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'SessionDetailsWrapperRoute';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i26.ProfileTabPage]
class ProfileTabRoute extends _i27.PageRouteInfo<void> {
  const ProfileTabRoute({List<_i27.PageRouteInfo>? children})
      : super(
          ProfileTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileTabRoute';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}
