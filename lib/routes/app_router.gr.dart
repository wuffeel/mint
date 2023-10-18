// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i32;
import 'package:flutter/material.dart' as _i33;
import 'package:flutter_chat_types/flutter_chat_types.dart' as _i36;
import 'package:mint/domain/entity/booking_data/booking_data.dart' as _i35;
import 'package:mint/presentation/pages/auth/enter_phone/enter_phone_page.dart'
    as _i8;
import 'package:mint/presentation/pages/auth/otp_page/otp_page.dart' as _i17;
import 'package:mint/presentation/pages/auth/sign_up_wrapper_page.dart' as _i28;
import 'package:mint/presentation/pages/log_in_check_page.dart' as _i12;
import 'package:mint/presentation/pages/main/booking/booking_resume_page.dart'
    as _i1;
import 'package:mint/presentation/pages/main/chat/chat_page.dart' as _i2;
import 'package:mint/presentation/pages/main/chat_room/chat_room_page.dart'
    as _i3;
import 'package:mint/presentation/pages/main/checkout/checkout_details_page.dart'
    as _i4;
import 'package:mint/presentation/pages/main/checkout/checkout_payment_page.dart'
    as _i5;
import 'package:mint/presentation/pages/main/checkout/checkout_wrapper_page.dart'
    as _i6;
import 'package:mint/presentation/pages/main/home/home_page.dart' as _i11;
import 'package:mint/presentation/pages/main/navigation/navigation_page.dart'
    as _i13;
import 'package:mint/presentation/pages/main/navigation/navigation_wrapper_page.dart'
    as _i14;
import 'package:mint/presentation/pages/main/notifications/notifications_page.dart'
    as _i16;
import 'package:mint/presentation/pages/main/pick_up_specialist/pick_up_specialist_page.dart'
    as _i18;
import 'package:mint/presentation/pages/main/pin_code/forgot_pin_otp_wrapper_page.dart'
    as _i10;
import 'package:mint/presentation/pages/main/pin_code/pin_code_page.dart'
    as _i19;
import 'package:mint/presentation/pages/main/pin_code/pin_code_wrapper_page.dart'
    as _i20;
import 'package:mint/presentation/pages/main/profile/color_theme/color_theme_page.dart'
    as _i7;
import 'package:mint/presentation/pages/main/profile/credit_cards/profile_credit_cards_page.dart'
    as _i21;
import 'package:mint/presentation/pages/main/profile/favorite_doctors/favorite_doctors_page.dart'
    as _i9;
import 'package:mint/presentation/pages/main/profile/notification_settings/notification_settings_page.dart'
    as _i15;
import 'package:mint/presentation/pages/main/profile/personal_data/profile_personal_data_page.dart'
    as _i23;
import 'package:mint/presentation/pages/main/profile/profile_page.dart' as _i22;
import 'package:mint/presentation/pages/main/sessions/sessions_page.dart'
    as _i27;
import 'package:mint/presentation/pages/main/specialist_details/specialist_details_page.dart'
    as _i29;
import 'package:mint/presentation/pages/main/specialists/specialists_page.dart'
    as _i30;
import 'package:mint/presentation/pages/main/specialists/specialists_wrapper_page.dart'
    as _i31;
import 'package:mint/presentation/pages/main/waiting_session/session_details_page.dart'
    as _i25;
import 'package:mint/presentation/pages/main/waiting_session/session_details_wrapper_page.dart'
    as _i26;
import 'package:mint/routes/app_router.dart' as _i24;
import 'package:mint_core/mint_core.dart' as _i34;

abstract class $AppRouter extends _i32.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i32.PageFactory> pagesMap = {
    BookingResumeRoute.name: (routeData) {
      final args = routeData.argsAs<BookingResumeRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.BookingResumePage(
          key: args.key,
          specialistModel: args.specialistModel,
          bookTime: args.bookTime,
          durationMinutes: args.durationMinutes,
          previousBookingData: args.previousBookingData,
        ),
      );
    },
    ChatRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ChatPage(),
      );
    },
    ChatRoomRoute.name: (routeData) {
      final args = routeData.argsAs<ChatRoomRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ChatRoomPage(
          key: args.key,
          room: args.room,
          senderId: args.senderId,
        ),
      );
    },
    CheckoutDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CheckoutDetailsRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.CheckoutDetailsPage(
          key: args.key,
          bookingData: args.bookingData,
        ),
      );
    },
    CheckoutPaymentRoute.name: (routeData) {
      final args = routeData.argsAs<CheckoutPaymentRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.CheckoutPaymentPage(
          key: args.key,
          bookingData: args.bookingData,
        ),
      );
    },
    CheckoutWrapperRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(child: const _i6.CheckoutWrapperPage()),
      );
    },
    ColorThemeRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ColorThemePage(),
      );
    },
    EnterPhoneRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.EnterPhonePage(),
      );
    },
    FavoriteDoctorsRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.FavoriteDoctorsPage(),
      );
    },
    ForgotPinOtpWrapperRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(child: const _i10.ForgotPinOtpWrapperPage()),
      );
    },
    HomeRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.HomePage(),
      );
    },
    LogInCheckRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.LogInCheckPage(),
      );
    },
    NavigationRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.NavigationPage(),
      );
    },
    NavigationWrapperRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(child: const _i14.NavigationWrapperPage()),
      );
    },
    NotificationSettingsRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.NotificationSettingsPage(),
      );
    },
    NotificationsRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.NotificationsPage(),
      );
    },
    OtpRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.OtpPage(),
      );
    },
    PickUpSpecialistRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.PickUpSpecialistPage(),
      );
    },
    PinCodeRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.PinCodePage(),
      );
    },
    PinCodeWrapperRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(child: const _i20.PinCodeWrapperPage()),
      );
    },
    ProfileCreditCardsRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.ProfileCreditCardsPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.ProfilePage(),
      );
    },
    ProfilePersonalDataRoute.name: (routeData) {
      final args = routeData.argsAs<ProfilePersonalDataRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i23.ProfilePersonalDataPage(
          key: args.key,
          firstName: args.firstName,
          lastName: args.lastName,
          dateOfBirth: args.dateOfBirth,
          photoUrl: args.photoUrl,
        ),
      );
    },
    ProfileTabRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.ProfileTabPage(),
      );
    },
    SessionDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<SessionDetailsRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.SessionDetailsPage(
          key: args.key,
          bookingData: args.bookingData,
        ),
      );
    },
    SessionDetailsWrapperRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(child: const _i26.SessionDetailsWrapperPage()),
      );
    },
    SessionsRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i27.SessionsPage(),
      );
    },
    SignUpWrapperRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(child: const _i28.SignUpWrapperPage()),
      );
    },
    SpecialistDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<SpecialistDetailsRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.SpecialistDetailsPage(
          key: args.key,
          specialistModel: args.specialistModel,
        ),
      );
    },
    SpecialistsRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i30.SpecialistsPage(),
      );
    },
    SpecialistsWrapperRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WrappedRoute(child: const _i31.SpecialistsWrapperPage()),
      );
    },
  };
}

/// generated route for
/// [_i1.BookingResumePage]
class BookingResumeRoute extends _i32.PageRouteInfo<BookingResumeRouteArgs> {
  BookingResumeRoute({
    _i33.Key? key,
    required _i34.SpecialistModel specialistModel,
    required DateTime bookTime,
    required int durationMinutes,
    _i35.BookingData? previousBookingData,
    List<_i32.PageRouteInfo>? children,
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

  static const _i32.PageInfo<BookingResumeRouteArgs> page =
      _i32.PageInfo<BookingResumeRouteArgs>(name);
}

class BookingResumeRouteArgs {
  const BookingResumeRouteArgs({
    this.key,
    required this.specialistModel,
    required this.bookTime,
    required this.durationMinutes,
    this.previousBookingData,
  });

  final _i33.Key? key;

  final _i34.SpecialistModel specialistModel;

  final DateTime bookTime;

  final int durationMinutes;

  final _i35.BookingData? previousBookingData;

  @override
  String toString() {
    return 'BookingResumeRouteArgs{key: $key, specialistModel: $specialistModel, bookTime: $bookTime, durationMinutes: $durationMinutes, previousBookingData: $previousBookingData}';
  }
}

/// generated route for
/// [_i2.ChatPage]
class ChatRoute extends _i32.PageRouteInfo<void> {
  const ChatRoute({List<_i32.PageRouteInfo>? children})
      : super(
          ChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ChatRoomPage]
class ChatRoomRoute extends _i32.PageRouteInfo<ChatRoomRouteArgs> {
  ChatRoomRoute({
    _i33.Key? key,
    required _i36.Room room,
    required String senderId,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          ChatRoomRoute.name,
          args: ChatRoomRouteArgs(
            key: key,
            room: room,
            senderId: senderId,
          ),
          initialChildren: children,
        );

  static const String name = 'ChatRoomRoute';

  static const _i32.PageInfo<ChatRoomRouteArgs> page =
      _i32.PageInfo<ChatRoomRouteArgs>(name);
}

class ChatRoomRouteArgs {
  const ChatRoomRouteArgs({
    this.key,
    required this.room,
    required this.senderId,
  });

  final _i33.Key? key;

  final _i36.Room room;

  final String senderId;

  @override
  String toString() {
    return 'ChatRoomRouteArgs{key: $key, room: $room, senderId: $senderId}';
  }
}

/// generated route for
/// [_i4.CheckoutDetailsPage]
class CheckoutDetailsRoute
    extends _i32.PageRouteInfo<CheckoutDetailsRouteArgs> {
  CheckoutDetailsRoute({
    _i33.Key? key,
    required _i35.BookingData bookingData,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          CheckoutDetailsRoute.name,
          args: CheckoutDetailsRouteArgs(
            key: key,
            bookingData: bookingData,
          ),
          initialChildren: children,
        );

  static const String name = 'CheckoutDetailsRoute';

  static const _i32.PageInfo<CheckoutDetailsRouteArgs> page =
      _i32.PageInfo<CheckoutDetailsRouteArgs>(name);
}

class CheckoutDetailsRouteArgs {
  const CheckoutDetailsRouteArgs({
    this.key,
    required this.bookingData,
  });

  final _i33.Key? key;

  final _i35.BookingData bookingData;

  @override
  String toString() {
    return 'CheckoutDetailsRouteArgs{key: $key, bookingData: $bookingData}';
  }
}

/// generated route for
/// [_i5.CheckoutPaymentPage]
class CheckoutPaymentRoute
    extends _i32.PageRouteInfo<CheckoutPaymentRouteArgs> {
  CheckoutPaymentRoute({
    _i33.Key? key,
    required _i35.BookingData bookingData,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          CheckoutPaymentRoute.name,
          args: CheckoutPaymentRouteArgs(
            key: key,
            bookingData: bookingData,
          ),
          initialChildren: children,
        );

  static const String name = 'CheckoutPaymentRoute';

  static const _i32.PageInfo<CheckoutPaymentRouteArgs> page =
      _i32.PageInfo<CheckoutPaymentRouteArgs>(name);
}

class CheckoutPaymentRouteArgs {
  const CheckoutPaymentRouteArgs({
    this.key,
    required this.bookingData,
  });

  final _i33.Key? key;

  final _i35.BookingData bookingData;

  @override
  String toString() {
    return 'CheckoutPaymentRouteArgs{key: $key, bookingData: $bookingData}';
  }
}

/// generated route for
/// [_i6.CheckoutWrapperPage]
class CheckoutWrapperRoute extends _i32.PageRouteInfo<void> {
  const CheckoutWrapperRoute({List<_i32.PageRouteInfo>? children})
      : super(
          CheckoutWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'CheckoutWrapperRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ColorThemePage]
class ColorThemeRoute extends _i32.PageRouteInfo<void> {
  const ColorThemeRoute({List<_i32.PageRouteInfo>? children})
      : super(
          ColorThemeRoute.name,
          initialChildren: children,
        );

  static const String name = 'ColorThemeRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i8.EnterPhonePage]
class EnterPhoneRoute extends _i32.PageRouteInfo<void> {
  const EnterPhoneRoute({List<_i32.PageRouteInfo>? children})
      : super(
          EnterPhoneRoute.name,
          initialChildren: children,
        );

  static const String name = 'EnterPhoneRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i9.FavoriteDoctorsPage]
class FavoriteDoctorsRoute extends _i32.PageRouteInfo<void> {
  const FavoriteDoctorsRoute({List<_i32.PageRouteInfo>? children})
      : super(
          FavoriteDoctorsRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoriteDoctorsRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i10.ForgotPinOtpWrapperPage]
class ForgotPinOtpWrapperRoute extends _i32.PageRouteInfo<void> {
  const ForgotPinOtpWrapperRoute({List<_i32.PageRouteInfo>? children})
      : super(
          ForgotPinOtpWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPinOtpWrapperRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i11.HomePage]
class HomeRoute extends _i32.PageRouteInfo<void> {
  const HomeRoute({List<_i32.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i12.LogInCheckPage]
class LogInCheckRoute extends _i32.PageRouteInfo<void> {
  const LogInCheckRoute({List<_i32.PageRouteInfo>? children})
      : super(
          LogInCheckRoute.name,
          initialChildren: children,
        );

  static const String name = 'LogInCheckRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i13.NavigationPage]
class NavigationRoute extends _i32.PageRouteInfo<void> {
  const NavigationRoute({List<_i32.PageRouteInfo>? children})
      : super(
          NavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NavigationRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i14.NavigationWrapperPage]
class NavigationWrapperRoute extends _i32.PageRouteInfo<void> {
  const NavigationWrapperRoute({List<_i32.PageRouteInfo>? children})
      : super(
          NavigationWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'NavigationWrapperRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i15.NotificationSettingsPage]
class NotificationSettingsRoute extends _i32.PageRouteInfo<void> {
  const NotificationSettingsRoute({List<_i32.PageRouteInfo>? children})
      : super(
          NotificationSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationSettingsRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i16.NotificationsPage]
class NotificationsRoute extends _i32.PageRouteInfo<void> {
  const NotificationsRoute({List<_i32.PageRouteInfo>? children})
      : super(
          NotificationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationsRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i17.OtpPage]
class OtpRoute extends _i32.PageRouteInfo<void> {
  const OtpRoute({List<_i32.PageRouteInfo>? children})
      : super(
          OtpRoute.name,
          initialChildren: children,
        );

  static const String name = 'OtpRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i18.PickUpSpecialistPage]
class PickUpSpecialistRoute extends _i32.PageRouteInfo<void> {
  const PickUpSpecialistRoute({List<_i32.PageRouteInfo>? children})
      : super(
          PickUpSpecialistRoute.name,
          initialChildren: children,
        );

  static const String name = 'PickUpSpecialistRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i19.PinCodePage]
class PinCodeRoute extends _i32.PageRouteInfo<void> {
  const PinCodeRoute({List<_i32.PageRouteInfo>? children})
      : super(
          PinCodeRoute.name,
          initialChildren: children,
        );

  static const String name = 'PinCodeRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i20.PinCodeWrapperPage]
class PinCodeWrapperRoute extends _i32.PageRouteInfo<void> {
  const PinCodeWrapperRoute({List<_i32.PageRouteInfo>? children})
      : super(
          PinCodeWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'PinCodeWrapperRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i21.ProfileCreditCardsPage]
class ProfileCreditCardsRoute extends _i32.PageRouteInfo<void> {
  const ProfileCreditCardsRoute({List<_i32.PageRouteInfo>? children})
      : super(
          ProfileCreditCardsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileCreditCardsRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i22.ProfilePage]
class ProfileRoute extends _i32.PageRouteInfo<void> {
  const ProfileRoute({List<_i32.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i23.ProfilePersonalDataPage]
class ProfilePersonalDataRoute
    extends _i32.PageRouteInfo<ProfilePersonalDataRouteArgs> {
  ProfilePersonalDataRoute({
    _i33.Key? key,
    required String? firstName,
    required String? lastName,
    required DateTime? dateOfBirth,
    required String? photoUrl,
    List<_i32.PageRouteInfo>? children,
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

  static const _i32.PageInfo<ProfilePersonalDataRouteArgs> page =
      _i32.PageInfo<ProfilePersonalDataRouteArgs>(name);
}

class ProfilePersonalDataRouteArgs {
  const ProfilePersonalDataRouteArgs({
    this.key,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.photoUrl,
  });

  final _i33.Key? key;

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
/// [_i24.ProfileTabPage]
class ProfileTabRoute extends _i32.PageRouteInfo<void> {
  const ProfileTabRoute({List<_i32.PageRouteInfo>? children})
      : super(
          ProfileTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileTabRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i25.SessionDetailsPage]
class SessionDetailsRoute extends _i32.PageRouteInfo<SessionDetailsRouteArgs> {
  SessionDetailsRoute({
    _i33.Key? key,
    required _i35.BookingData bookingData,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          SessionDetailsRoute.name,
          args: SessionDetailsRouteArgs(
            key: key,
            bookingData: bookingData,
          ),
          initialChildren: children,
        );

  static const String name = 'SessionDetailsRoute';

  static const _i32.PageInfo<SessionDetailsRouteArgs> page =
      _i32.PageInfo<SessionDetailsRouteArgs>(name);
}

class SessionDetailsRouteArgs {
  const SessionDetailsRouteArgs({
    this.key,
    required this.bookingData,
  });

  final _i33.Key? key;

  final _i35.BookingData bookingData;

  @override
  String toString() {
    return 'SessionDetailsRouteArgs{key: $key, bookingData: $bookingData}';
  }
}

/// generated route for
/// [_i26.SessionDetailsWrapperPage]
class SessionDetailsWrapperRoute extends _i32.PageRouteInfo<void> {
  const SessionDetailsWrapperRoute({List<_i32.PageRouteInfo>? children})
      : super(
          SessionDetailsWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'SessionDetailsWrapperRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i27.SessionsPage]
class SessionsRoute extends _i32.PageRouteInfo<void> {
  const SessionsRoute({List<_i32.PageRouteInfo>? children})
      : super(
          SessionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SessionsRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i28.SignUpWrapperPage]
class SignUpWrapperRoute extends _i32.PageRouteInfo<void> {
  const SignUpWrapperRoute({List<_i32.PageRouteInfo>? children})
      : super(
          SignUpWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpWrapperRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i29.SpecialistDetailsPage]
class SpecialistDetailsRoute
    extends _i32.PageRouteInfo<SpecialistDetailsRouteArgs> {
  SpecialistDetailsRoute({
    _i33.Key? key,
    required _i34.SpecialistModel specialistModel,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          SpecialistDetailsRoute.name,
          args: SpecialistDetailsRouteArgs(
            key: key,
            specialistModel: specialistModel,
          ),
          initialChildren: children,
        );

  static const String name = 'SpecialistDetailsRoute';

  static const _i32.PageInfo<SpecialistDetailsRouteArgs> page =
      _i32.PageInfo<SpecialistDetailsRouteArgs>(name);
}

class SpecialistDetailsRouteArgs {
  const SpecialistDetailsRouteArgs({
    this.key,
    required this.specialistModel,
  });

  final _i33.Key? key;

  final _i34.SpecialistModel specialistModel;

  @override
  String toString() {
    return 'SpecialistDetailsRouteArgs{key: $key, specialistModel: $specialistModel}';
  }
}

/// generated route for
/// [_i30.SpecialistsPage]
class SpecialistsRoute extends _i32.PageRouteInfo<void> {
  const SpecialistsRoute({List<_i32.PageRouteInfo>? children})
      : super(
          SpecialistsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SpecialistsRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i31.SpecialistsWrapperPage]
class SpecialistsWrapperRoute extends _i32.PageRouteInfo<void> {
  const SpecialistsWrapperRoute({List<_i32.PageRouteInfo>? children})
      : super(
          SpecialistsWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'SpecialistsWrapperRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}
