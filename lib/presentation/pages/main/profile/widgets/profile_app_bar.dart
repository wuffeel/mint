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
import '../../../../../domain/entity/user_model/user_model.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    super.key,
    required this.minHeight,
    required this.maxHeight,
    this.collapseFactor = 0.8,
    this.onPickPhoto,
    this.localPhotoUrl,
    this.avatarSize = 110,
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

  /// Used to display picked photo with [onPickPhoto] callback.
  ///
  /// If null, current user's photo will be displayed.
  final String? localPhotoUrl;

  /// Circle avatar radius
  final double avatarSize;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _ProfileHeaderDelegate(
        avatarSize: avatarSize,
        minHeight: minHeight,
        maxHeight: maxHeight,
        collapseFactor: collapseFactor,
        onPickPhoto: onPickPhoto,
        localPhotoUrl: localPhotoUrl,
      ),
      pinned: true,
    );
  }
}

class _ProfileHeaderDelegate extends SliverPersistentHeaderDelegate {
  _ProfileHeaderDelegate({
    required this.avatarSize,
    required this.minHeight,
    required this.maxHeight,
    required this.collapseFactor,
    this.onPickPhoto,
    this.localPhotoUrl,
  });

  final double minHeight;
  final double maxHeight;
  final double collapseFactor;
  final VoidCallback? onPickPhoto;
  final String? localPhotoUrl;
  final double avatarSize;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  /// Calculates the configuration values for the header based on the current
  /// shrink offset.
  ///
  /// The configuration includes the percentage of shrinkage, scale factor for
  /// animation, text scale factor, and the radius of the avatar.
  _HeaderConfig _calculateHeaderConfig(double shrinkOffset) {
    final percentage = (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);
    final scaleFactor = 1 - percentage;
    final textScaleFactor = 1 - percentage * 0.6;
    final avatarRadius =
        percentage >= collapseFactor ? 32.w : 110.w * scaleFactor;

    return _HeaderConfig(
      percentage: percentage,
      scaleFactor: scaleFactor,
      textScaleFactor: textScaleFactor,
      avatarRadius: avatarRadius,
    );
  }

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final headerConfig = _calculateHeaderConfig(shrinkOffset);

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
          return ColoredBox(
            color: Theme.of(context).colorScheme.primary,
            child: SafeArea(
              bottom: false,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: headerConfig.percentage >= collapseFactor
                    ? _CollapsedAppBar(
                        headerConfig: headerConfig,
                        localPhotoUrl: localPhotoUrl,
                        user: state.user,
                      )
                    : _ExpandedAppBar(
                        headerConfig: headerConfig,
                        localPhotoUrl: localPhotoUrl,
                        onPickPhoto: onPickPhoto,
                        user: state.user,
                      ),
              ),
            ),
          );
        }
        return _AppBarContainer(maxHeight: maxHeight);
      },
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class _CollapsedAppBar extends StatelessWidget {
  const _CollapsedAppBar({
    required this.headerConfig,
    this.localPhotoUrl,
    required this.user,
  });

  final _HeaderConfig headerConfig;
  final String? localPhotoUrl;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final phone = user.phoneNumber;
    return Row(
      children: <Widget>[
        if (context.router.canPop())
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: const MintBackButton(color: Colors.white),
          ),
        SizedBox(width: 16.w),
        ProfileAvatar(
          size: headerConfig.avatarRadius,
          scaleFactor: headerConfig.scaleFactor,
          localPhotoUrl: localPhotoUrl,
          photoUrl: user.photoUrl,
        ),
        SizedBox(width: 8.w),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _UserNameText(
              firstName: user.firstName,
              lastName: user.lastName,
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
    );
  }
}

class _ExpandedAppBar extends StatelessWidget {
  const _ExpandedAppBar({
    required this.headerConfig,
    required this.user,
    this.localPhotoUrl,
    this.onPickPhoto,
  });

  final _HeaderConfig headerConfig;
  final UserModel user;
  final VoidCallback? onPickPhoto;
  final String? localPhotoUrl;

  @override
  Widget build(BuildContext context) {
    final phone = user.phoneNumber;
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        if (context.router.canPop(ignoreParentRoutes: true))
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 8.w, top: 8.h),
              child: const MintBackButton(
                color: Colors.white,
              ),
            ),
          ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ProfileAvatar(
              size: headerConfig.avatarRadius,
              scaleFactor: headerConfig.scaleFactor,
              onPickPhoto: onPickPhoto,
              localPhotoUrl: localPhotoUrl,
              photoUrl: user.photoUrl,
            ),
            SizedBox(height: 5.h),
            _UserNameText(
              firstName: user.firstName,
              lastName: user.lastName,
              fontSize: 20.sp * headerConfig.textScaleFactor,
            ),
            if (phone != null)
              _PhoneNumberText(
                phoneNumber: phone,
                fontSize: 13.sp * headerConfig.textScaleFactor,
              ),
          ],
        ),
      ],
    );
  }
}

class _AppBarContainer extends StatelessWidget {
  const _AppBarContainer({required this.maxHeight, this.child});

  final double maxHeight;
  final Widget? child;

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
    final patientFallback = context.l10n.patient;

    if (firstName != null && lastName != null) {
      return '$firstName $lastName';
    } else if (firstName != null) {
      return firstName;
    } else if (lastName != null) {
      return lastName;
    }

    return patientFallback;
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

/// Configuration values for the header's appearance and animation.
class _HeaderConfig {
  _HeaderConfig({
    required this.percentage,
    required this.scaleFactor,
    required this.textScaleFactor,
    required this.avatarRadius,
  });

  /// The percentage of shrinkage, ranging from 0.0 (not shrunk) to 1.0
  /// (fully shrunk).
  final double percentage;

  /// The scale factor for various animations based on the shrink percentage.
  final double scaleFactor;

  /// The scale factor for text animations based on the shrink percentage.
  final double textScaleFactor;

  /// The radius of the avatar image based on the shrink percentage.
  final double avatarRadius;
}
