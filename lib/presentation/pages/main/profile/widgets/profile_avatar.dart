import 'package:flutter/material.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/colors.gen.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    required this.size,
    this.photoUrl,
  });

  final double size;
  final String? photoUrl;

  @override
  Widget build(BuildContext context) {
    final photo = photoUrl;
    return photo != null
        ? Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Image.network(photo),
            ),
          )
        : Container(
            width: size,
            height: size,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              color: Theme.of(context).brightness == Brightness.dark
                  ? Theme.of(context).colorScheme.secondary
                  : MintColors.elementsGreyDark,
              shape: BoxShape.circle,
            ),
            child: Assets.svg.userPlaceholder.svg(
              width: size * 0.4,
              height: size * 0.4,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          );
  }
}
