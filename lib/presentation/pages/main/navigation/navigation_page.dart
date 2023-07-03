import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mint/bloc/user/user_bloc.dart';
import 'package:mint/l10n/l10n.dart';

@RoutePage()
class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.read<UserBloc>().add(UserLogOutRequested()),
          child: Text(context.l10n.logOut),
        ),
      ),
    );
  }
}
