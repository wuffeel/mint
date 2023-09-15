import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint_core/mint_core.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/colors.gen.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    required this.size,
    required this.scaleFactor,
    this.photoUrl,
    this.onPickPhoto,
    this.photoData,
  });

  final double size;
  final double scaleFactor;
  final VoidCallback? onPickPhoto;

  /// Network url to user's photo.
  final String? photoUrl;

  /// Locally picked image bytes.
  final FileData? photoData;

  @override
  Widget build(BuildContext context) {
    final photo = photoUrl;
    final localPhoto = photoData;
    return localPhoto != null
        ? _PhotoContainer(
            size: size,
            scaleFactor: scaleFactor,
            onPickPhoto: onPickPhoto,
            child: ClipOval(
              child: Image.memory(localPhoto.bytes, fit: BoxFit.cover),
            ),
          )
        : photo != null
            ? _PhotoContainer(
                size: size,
                scaleFactor: scaleFactor,
                onPickPhoto: onPickPhoto,
                child: ClipOval(child: Image.network(photo)),
              )
            : _PhotoContainer(
                size: size,
                scaleFactor: scaleFactor,
                alignment: Alignment.center,
                backgroundColor: Theme.of(context).brightness == Brightness.dark
                    ? Theme.of(context).colorScheme.secondary
                    : MintColors.elementsGreyDark,
                onPickPhoto: onPickPhoto,
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

class _PhotoContainer extends StatelessWidget {
  const _PhotoContainer({
    required this.size,
    required this.scaleFactor,
    required this.child,
    this.alignment,
    this.backgroundColor,
    this.onPickPhoto,
  });

  final double size;
  final double scaleFactor;
  final Widget child;
  final AlignmentGeometry? alignment;
  final Color? backgroundColor;
  final VoidCallback? onPickPhoto;

  @override
  Widget build(BuildContext context) {
    final onPhotoCallback = onPickPhoto;
    return onPickPhoto == null
        ? Container(
            width: size,
            height: size,
            alignment: alignment,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              shape: BoxShape.circle,
              color: backgroundColor,
            ),
            child: child,
          )
        : InkWell(
            onTap: onPhotoCallback,
            child: Stack(
              children: <Widget>[
                Container(
                  width: size,
                  height: size,
                  alignment: alignment,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    shape: BoxShape.circle,
                    color: backgroundColor,
                  ),
                  child: child,
                ),
                Positioned.fill(
                  bottom: 3.h,
                  right: 4.w,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: 28.w * scaleFactor,
                      height: 28.h * scaleFactor,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Assets.svg.cameraIcon.svg(
                        width: 15.w * scaleFactor,
                        height: 15.h * scaleFactor,
                        colorFilter: const ColorFilter.mode(
                          MintColors.elementsGreyDark,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
