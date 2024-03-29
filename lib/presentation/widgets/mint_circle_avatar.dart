import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';

class MintCircleAvatar extends StatelessWidget {
  const MintCircleAvatar({
    super.key,
    required this.radius,
    required this.backgroundColor,
    this.photoUrl,
    this.child,
  });

  final double radius;
  final Color backgroundColor;
  final String? photoUrl;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final photo = photoUrl;
    return photo != null
        ? CircleAvatar(
            radius: radius,
            backgroundColor: backgroundColor,
            backgroundImage: NetworkImage(photo),
            child: child,
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
