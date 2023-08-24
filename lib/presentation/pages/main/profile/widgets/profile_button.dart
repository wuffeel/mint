import 'package:flutter/material.dart';
import 'package:mint/gen/assets.gen.dart';
import 'package:mint/presentation/pages/main/profile/widgets/profile_button_container.dart';
import 'package:mint/presentation/pages/main/profile/widgets/profile_button_content.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    super.key,
    required this.title,
    required this.svgIcon,
    required this.onTap,
    this.isChevronVisible = true,
    this.foregroundColor,
  });

  final String title;
  final SvgGenImage svgIcon;
  final VoidCallback onTap;
  final bool isChevronVisible;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ProfileButtonContainer(
        child: ProfileButtonContent(
          title: title,
          svgIcon: svgIcon,
          isChevronVisible: isChevronVisible,
          foregroundColor: foregroundColor,
        ),
      ),
    );
  }
}
