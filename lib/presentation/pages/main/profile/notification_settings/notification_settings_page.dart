import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/bloc/notification_settings/notification_settings_cubit.dart';
import 'package:mint/l10n/l10n.dart';

import '../../../../../gen/colors.gen.dart';
import '../../../../../theme/mint_text_styles.dart';
import '../../../../widgets/mint_app_bar.dart';
import '../widgets/custom_switch.dart';

@RoutePage()
class NotificationSettingsPage extends StatelessWidget {
  const NotificationSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NotificationSettingsCubit()..checkNotificationSettings(),
      child: const _NotificationSettingsView(),
    );
  }
}

class _NotificationSettingsView extends StatefulWidget {
  const _NotificationSettingsView();

  @override
  State<_NotificationSettingsView> createState() =>
      _NotificationSettingsViewState();
}

class _NotificationSettingsViewState extends State<_NotificationSettingsView>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  Future<void> _openNotificationSettings() {
    return context.read<NotificationSettingsCubit>().openNotificationSettings();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      await context
          .read<NotificationSettingsCubit>()
          .checkNotificationSettings();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
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
                    BlocBuilder<NotificationSettingsCubit,
                        NotificationSettingsState>(
                      builder: (context, state) {
                        if (state is NotificationSettingsLoading) {
                          return const _SwitchLoadingIndicator();
                        }
                        return CustomSwitch(
                          value: state is NotificationSettingsGranted,
                          onChanged: (value) => {},
                          onTap: _openNotificationSettings,
                          width: 51.w,
                          height: 31.h,
                          switchWidth: 27.w,
                          switchHeight: 27.h,
                          enabledColor: Theme.of(context).colorScheme.primary,
                          disabledColor:
                              MintColors.switchDisabledLight.withOpacity(0.16),
                        );
                      },
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

class _SwitchLoadingIndicator extends StatelessWidget {
  const _SwitchLoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 24.w,
        height: 24.h,
        child: const CircularProgressIndicator(strokeWidth: 2),
      ),
    );
  }
}
