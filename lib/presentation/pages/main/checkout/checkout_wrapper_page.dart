import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mint/bloc/booking/booking_bloc.dart';
import 'package:mint/injector/injector.dart';

@RoutePage()
class CheckoutWrapperPage extends AutoRouter with AutoRouteWrapper {
  const CheckoutWrapperPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BookingBloc>(),
      child: this,
    );
  }
}
