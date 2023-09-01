import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/bloc/pin_code/pin_code_bloc.dart';
import 'package:mint/bloc/user/user_bloc.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/profile/widgets/profile_app_bar.dart';
import 'package:mint/presentation/pages/main/profile/widgets/profile_button.dart';
import 'package:mint/presentation/pages/main/profile/widgets/profile_button_content.dart';
import 'package:mint/presentation/pages/main/profile/widgets/profile_button_group.dart';
import 'package:mint/routes/app_router.gr.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void _onPersonalData({
    String? firstName,
    String? lastName,
    DateTime? dateOfBirth,
    String? photoUrl,
  }) {
    context.router.push(
      ProfilePersonalDataRoute(
        firstName: firstName,
        lastName: lastName,
        dateOfBirth: dateOfBirth,
        photoUrl: photoUrl,
      ),
    );
  }

  void _onPinChange() {
    context.read<PinCodeBloc>().add(PinCodeChangeRequested());
    context.router.push(const PinCodeWrapperRoute());
  }

  void _onLogout() {
    context.read<UserBloc>().add(UserLogOutRequested());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          ProfileAppBar(
            avatarSize: 110.w,
            minHeight: kToolbarHeight + MediaQuery.paddingOf(context).top,
            maxHeight: 244.h,
            collapseFactor: 0.5,
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            sliver: SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 19.h),
                  ProfileButtonGroup(
                    children: [
                      BlocBuilder<UserBloc, UserState>(
                        builder: (context, state) {
                          if (state is UserFetchSuccess) {
                            return InkWell(
                              onTap: () => _onPersonalData(
                                firstName: state.user.firstName,
                                lastName: state.user.lastName,
                                dateOfBirth: state.user.dateOfBirth,
                                photoUrl: state.user.photoUrl,
                              ),
                              child: ProfileButtonContent(
                                title: l10n.personalData,
                                svgIcon: Assets.svg.personalData,
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                      InkWell(
                        onTap: _onPinChange,
                        child: ProfileButtonContent(
                          title: l10n.changePinCode,
                          svgIcon: Assets.svg.changePin,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  ProfileButton(
                    title: l10n.myCreditCards,
                    svgIcon: Assets.svg.creditCards,
                    foregroundColor: Theme.of(context).primaryColor,
                    onTap: () =>
                        context.router.push(const ProfileCreditCardsRoute()),
                  ),
                  SizedBox(height: 8.h),
                  ProfileButton(
                    title: l10n.favoriteDoctors,
                    svgIcon: Assets.svg.heartIcon,
                    foregroundColor: Theme.of(context).primaryColor,
                    onTap: () => context.router.push(
                      const FavoriteDoctorsRoute(),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  ProfileButton(
                    title: l10n.notifications,
                    svgIcon: Assets.svg.notificationsBell,
                    foregroundColor: Theme.of(context).primaryColor,
                    onTap: () => context.router.push(
                      const NotificationSettingsRoute(),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  ProfileButton(
                    title: l10n.colorTheme,
                    svgIcon: Assets.svg.colorThemeIcon,
                    foregroundColor: Theme.of(context).primaryColor,
                    onTap: () => context.router.push(const ColorThemeRoute()),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: ProfileButton(
                      title: l10n.logOut,
                      svgIcon: Assets.svg.logout,
                      isChevronVisible: false,
                      foregroundColor: MintColors.error,
                      onTap: _onLogout,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
