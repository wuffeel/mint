import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';

class MintCircleAvatar extends StatelessWidget {
  const MintCircleAvatar({
    super.key,
    required this.radius,
    required this.backgroundColor,
    this.photoUrl,
  });

  final double radius;
  final Color backgroundColor;
  final String? photoUrl;

  @override
  Widget build(BuildContext context) {
    final photo = photoUrl;
    return photo != null
        ? CircleAvatar(
            radius: radius,
            child: ClipOval(
              child: Image.network(photo),
            ),
          )
        : CircleAvatar(
            radius: radius,
            backgroundColor: backgroundColor,
            child: Assets.svg.userPlaceholder.svg(
              width: radius,
              height: radius,
              fit: BoxFit.scaleDown,
              colorFilter: ColorFilter.mode(
                Theme.of(context).primaryColor,
                BlendMode.srcIn,
              ),
            ),
          );
  }
}
