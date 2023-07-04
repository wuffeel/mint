import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mint/bloc/user/user_bloc.dart';
import 'package:mint/injector/injector.dart';
import 'package:mint/routes/app_router.gr.dart';

@RoutePage()
class LogInCheckPage extends StatelessWidget {
  const LogInCheckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<UserBloc>()..add(UserLogInCheckRequested()),
        child: BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {
            if (state is UserUnauthenticated) {
              context.router.replace(const SignUpWrapperRoute());
            }
            if (state is UserAuthenticated) {
              context.router.replace(const NavigationWrapperRoute());
            }
          },
          builder: (context, state) {
            if (state is UserLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
