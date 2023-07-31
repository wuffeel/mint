import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';

class SpecialistCircleAvatar extends StatelessWidget {
  const SpecialistCircleAvatar({
    super.key,
    required this.size,
    required this.backgroundColor,
    this.photoUrl,
  });

  final double size;
  final Color backgroundColor;
  final String? photoUrl;

  @override
  Widget build(BuildContext context) {
    final photo = photoUrl;
    return photo != null
        ? CircleAvatar(
            radius: size,
            backgroundImage: NetworkImage(photo),
          )
        : CircleAvatar(
            radius: size,
            backgroundColor: backgroundColor,
            child: Assets.svg.userPlaceholder.svg(
              width: size,
              height: size,
              fit: BoxFit.scaleDown,
              colorFilter: ColorFilter.mode(
                Theme.of(context).primaryColor,
                BlendMode.srcIn,
              ),
            ),
          );
  }
}
