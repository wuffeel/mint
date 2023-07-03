import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mint/bloc/log_in/log_in_cubit.dart';
import 'package:mint/injector/injector.dart';
import 'package:mint/routes/app_router.gr.dart';

@RoutePage()
class LogInCheckPage extends StatelessWidget {
  const LogInCheckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<LogInCubit>()..checkLogIn(),
        child: BlocConsumer<LogInCubit, LogInState>(
          listener: (context, state) {
            if (state is LogInUnauthenticated) {
              context.router.replace(const SignUpWrapperRoute());
            }
            if (state is LogInAuthenticated) {
              context.router.replace(const NavigationWrapperRoute());
            }
          },
          builder: (context, state) {
            if (state is LogInLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
