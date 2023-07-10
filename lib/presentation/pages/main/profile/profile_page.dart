import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/bloc/pin_code/pin_code_bloc.dart';
import 'package:mint/bloc/user/user_bloc.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/routes/app_router.gr.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.read<PinCodeBloc>().add(PinCodeChangeRequested());
                context.router.push(const PinCodeWrapperRoute());
              },
              child: Text(context.l10n.changePinCode),
            ),
            SizedBox(height: 12.h),
            ElevatedButton(
              onPressed: () =>
                  context.read<UserBloc>().add(UserLogOutRequested()),
              child: Text(context.l10n.logOut),
            ),
          ],
        ),
      ),
    );
  }
}
