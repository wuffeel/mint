import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';

class SpecialistPhotoContainer extends StatelessWidget {
  const SpecialistPhotoContainer({
    super.key,
    required this.size,
    required this.photoUrl,
  });

  final double size;
  final String? photoUrl;

  Color _getBackgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? MintColors.imageBackgroundDark.withOpacity(0.16)
        : MintColors.imageBackgroundLight.withOpacity(0.06);
  }

  @override
  Widget build(BuildContext context) {
    final photo = photoUrl;
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: _getBackgroundColor(context),
        image: photo != null
            ? DecorationImage(
                image: NetworkImage(photo),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: photo == null
          ? Assets.svg.questionMark.svg(
              width: size / 2.5,
              height: size / 2.5,
              fit: BoxFit.scaleDown,
            )
          : null,
    );
  }
}
