import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CheckoutWrapperPage extends AutoRouter with AutoRouteWrapper {
  const CheckoutWrapperPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}
