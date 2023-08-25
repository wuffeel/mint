import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../gen/colors.gen.dart';
import '../../../../../theme/mint_text_styles.dart';
import '../../../../widgets/mint_app_bar.dart';
import '../widgets/custom_switch.dart';

@RoutePage()
class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({super.key});

  @override
  State<NotificationSettingsPage> createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool _value = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final granted = await Permission.notification.isGranted;
      log(granted.toString());
      if (granted) setState(() => _value = granted);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MintAppBar(),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              context.l10n.inAppNotificationsTitle,
              style: MintTextStyles.headline,
            ),
            SizedBox(height: 16.h),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      context.l10n.getNotifications,
                      style: MintTextStyles.tab16,
                    ),
                    CustomSwitch(
                      value: _value,
                      onChanged: (value) => {},
                      onTap: () async {
                        final status = await Permission.microphone.request();
                        if (status == PermissionStatus.denied ||
                            status == PermissionStatus.permanentlyDenied) {
                          await openAppSettings();
                        }
                      },
                      width: 51.w,
                      height: 31.h,
                      switchWidth: 27.w,
                      switchHeight: 27.h,
                      enabledColor: Theme.of(context).colorScheme.primary,
                      disabledColor:
                          MintColors.switchDisabledLight.withOpacity(0.16),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
