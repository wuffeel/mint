import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/l10n/l10n.dart';

import '../../../../../gen/assets.gen.dart';

class ChatBottomBar extends StatelessWidget {
  const ChatBottomBar({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Row(
        children: <Widget>[
          _BottomBarIcon(Assets.svg.attachIcon),
          SizedBox(width: 9.w),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(40.r),
                ),
                suffixIcon: _BottomBarIcon(Assets.svg.emojiIcon),
                hintText: context.l10n.message,
              ),
            ),
          ),
          SizedBox(width: 9.w),
          _BottomBarIcon(Assets.svg.microphoneIcon),
        ],
      ),
    );
  }
}

class _BottomBarIcon extends StatelessWidget {
  const _BottomBarIcon(this.svgImage);

  final SvgGenImage svgImage;

  @override
  Widget build(BuildContext context) {
    return svgImage.svg(
      width: 24.w,
      height: 24.h,
      fit: BoxFit.scaleDown,
      colorFilter: ColorFilter.mode(
        Theme.of(context).hintColor.withOpacity(0.6),
        BlendMode.srcIn,
      ),
    );
  }
}
