import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mint/bloc/booking/booking_bloc.dart';
import 'package:mint/injector/injector.dart';

@RoutePage()
class WaitingSessionWrapperPage extends AutoRouter with AutoRouteWrapper {
  const WaitingSessionWrapperPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BookingBloc>(),
      child: BlocListener<BookingBloc, BookingState>(
        listener: (context, state) {
          if (state is BookingRescheduleSuccess ||
              state is BookingCancelSuccess) {
            context.router.pop();
          }
        },
        child: this,
      ),
    );
  }
}
