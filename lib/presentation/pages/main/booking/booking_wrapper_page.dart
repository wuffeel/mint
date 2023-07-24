import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mint/bloc/booking/booking_bloc.dart';
import 'package:mint/bloc/transaction/transaction_bloc.dart';
import 'package:mint/injector/injector.dart';

@RoutePage()
class BookingWrapperPage extends AutoRouter with AutoRouteWrapper {
  const BookingWrapperPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<BookingBloc>()),
        BlocProvider(
          create: (context) => getIt<TransactionBloc>(),
        )
      ],
      child: BlocListener<TransactionBloc, TransactionState>(
        listener: (context, state) {
          if (state is TransactionPaySuccess) context.router.pop();
        },
        child: this,
      ),
    );
  }
}
