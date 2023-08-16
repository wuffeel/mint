import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/presentation/pages/main/profile/widgets/profile_button_container.dart';
import 'package:mint/utils/extended_widget_list.dart';

class ProfileButtonGroup extends StatelessWidget {
  const ProfileButtonGroup({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ProfileButtonContainer(
      child: Column(
        children: List.generate(
          children.length,
          (index) => children[index],
        )..insertBetween(
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: const Divider(),
            ),
          ),
      ),
    );
  }
}
