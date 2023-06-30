// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:mint/presentation/pages/auth/enter_phone/enter_phone_page.dart'
    as _i2;
import 'package:mint/presentation/pages/auth/otp_page/otp_page.dart' as _i1;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    OtpRoute.name: (routeData) {
      final args = routeData.argsAs<OtpRouteArgs>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.OtpPage(
          key: args.key,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    EnterPhoneRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.EnterPhonePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.OtpPage]
class OtpRoute extends _i3.PageRouteInfo<OtpRouteArgs> {
  OtpRoute({
    _i4.Key? key,
    required String phoneNumber,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          OtpRoute.name,
          args: OtpRouteArgs(
            key: key,
            phoneNumber: phoneNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'OtpRoute';

  static const _i3.PageInfo<OtpRouteArgs> page =
      _i3.PageInfo<OtpRouteArgs>(name);
}

class OtpRouteArgs {
  const OtpRouteArgs({
    this.key,
    required this.phoneNumber,
  });

  final _i4.Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'OtpRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i2.EnterPhonePage]
class EnterPhoneRoute extends _i3.PageRouteInfo<void> {
  const EnterPhoneRoute({List<_i3.PageRouteInfo>? children})
      : super(
          EnterPhoneRoute.name,
          initialChildren: children,
        );

  static const String name = 'EnterPhoneRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
