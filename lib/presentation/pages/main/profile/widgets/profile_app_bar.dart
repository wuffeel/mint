import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/profile/widgets/profile_avatar.dart';
import 'package:mint/presentation/widgets/error_try_again_text.dart';
import 'package:mint/presentation/widgets/mint_back_button.dart';
import 'package:mint/theme/mint_text_styles.dart';

import '../../../../../bloc/user/user_bloc.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    super.key,
    required this.minHeight,
    required this.maxHeight,
    this.collapseFactor = 0.8,
    this.onPickPhoto,
  })  : assert(
          collapseFactor > 0 && collapseFactor < 1,
          'collapseFactor should be in range of 0.0 to 1.0. '
          'Passed collapseFactor: $collapseFactor',
        ),
        assert(
          minHeight < maxHeight,
          'minHeight can not be greater than maxHeight. '
          'minHeight: $minHeight, maxHeight: $maxHeight',
        ),
        assert(
          minHeight > 0 && maxHeight > 0,
          'minHeight and maxHeight should be greater than zero. '
          'minHeight: $minHeight, maxHeight: $maxHeight',
        );

  /// Height of app bar in collapsed mode
  final double minHeight;

  /// Max height of app bar in extended mode
  final double maxHeight;

  /// Defines when app bar should be set in collapse mode. Should be in range
  /// of 0.0 to 1.0.
  ///
  /// Value of 1.0 stands for collapse on reaching [minHeight]
  final double collapseFactor;

  /// Used to display photo change button and trigger according callback.
  ///
  /// Photo change is only possible in extended app-bar mode.
  final VoidCallback? onPickPhoto;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _ProfileHeaderDelegate(
        minHeight: minHeight,
        maxHeight: maxHeight,
        collapseFactor: collapseFactor,
        onPickPhoto: onPickPhoto,
      ),
      pinned: true,
    );
  }
}

class _ProfileHeaderDelegate extends SliverPersistentHeaderDelegate {
  _ProfileHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.collapseFactor,
    this.onPickPhoto,
  });

  final double minHeight;
  final double maxHeight;
  final double collapseFactor;
  final VoidCallback? onPickPhoto;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final percentage = (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);
    final scaleFactor = 1 - percentage;
    final textScaleFactor = 1 - percentage * 0.6;
    var avatarRadius = 110.w * scaleFactor;

    if (percentage >= collapseFactor) avatarRadius = 32.w;

    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoading) {
          return _AppBarContainer(
            maxHeight: maxHeight,
            child: const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          );
        }
        if (state is UserFetchFailure) {
          return _AppBarContainer(
            maxHeight: maxHeight,
            child: ErrorTryAgainText(
              onRefresh: () =>
                  context.read<UserBloc>().add(UserDataRequested()),
              refreshButtonColor: Theme.of(context).hintColor.withOpacity(0.6),
            ),
          );
        }
        if (state is UserFetchSuccess) {
          final phone = state.user.phoneNumber;
          return ColoredBox(
            color: Theme.of(context).colorScheme.primary,
            child: SafeArea(
              bottom: false,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: percentage >= collapseFactor
                    ? Row(
                        children: <Widget>[
                          if (context.router.canPop())
                            Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: const MintBackButton(),
                            ),
                          SizedBox(width: 16.w),
                          ProfileAvatar(
                            size: avatarRadius,
                            scaleFactor: scaleFactor,
                          ),
                          SizedBox(width: 8.w),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _UserNameText(
                                firstName: state.user.firstName,
                                lastName: state.user.lastName,
                                fontSize: 16.sp,
                              ),
                              if (phone != null)
                                _PhoneNumberText(
                                  phoneNumber: phone,
                                  fontSize: 11.sp,
                                ),
                            ],
                          ),
                        ],
                      )
                    : Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          if (context.router.canPop(ignoreParentRoutes: true))
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 8.w, top: 8.h),
                                child: const MintBackButton(),
                              ),
                            ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ProfileAvatar(
                                size: avatarRadius,
                                scaleFactor: scaleFactor,
                                onPickPhoto: onPickPhoto,
                              ),
                              SizedBox(height: 5.h),
                              _UserNameText(
                                firstName: state.user.firstName,
                                lastName: state.user.lastName,
                                fontSize: 20.sp * textScaleFactor,
                              ),
                              if (phone != null)
                                _PhoneNumberText(
                                  phoneNumber: phone,
                                  fontSize: 13.sp * textScaleFactor,
                                ),
                            ],
                          ),
                        ],
                      ),
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class _AppBarContainer extends StatelessWidget {
  const _AppBarContainer({required this.maxHeight, required this.child});

  final double maxHeight;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
      ),
      child: SizedBox(
        height: maxHeight,
        child: child,
      ),
    );
  }
}

class _UserNameText extends StatelessWidget {
  const _UserNameText({
    required this.firstName,
    required this.lastName,
    required this.fontSize,
  });

  final String? firstName;
  final String? lastName;
  final double fontSize;

  String _getUserName(
    BuildContext context,
    String? firstName,
    String? lastName,
  ) {
    String? userName;
    if (firstName != null) {
      userName = firstName;
    } else if (lastName != null) {
      userName = lastName;
    }

    return userName ?? context.l10n.patient;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _getUserName(context, firstName, lastName),
      style: MintTextStyles.title2.copyWith(
        color: Colors.white,
        fontSize: fontSize,
      ),
    );
  }
}

class _PhoneNumberText extends StatelessWidget {
  const _PhoneNumberText({
    required this.phoneNumber,
    required this.fontSize,
  });

  final String phoneNumber;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      phoneNumber,
      style: MintTextStyles.footnote.copyWith(
        color: Colors.white,
        fontSize: fontSize,
      ),
    );
  }
}
