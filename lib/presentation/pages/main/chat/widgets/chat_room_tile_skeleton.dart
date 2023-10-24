import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/mint_text_styles.dart';

class ChatRoomTileSkeleton extends StatelessWidget {
  const ChatRoomTileSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: Row(
        children: <Widget>[
          DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: SizedBox(width: 54.w, height: 54.h),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: FractionallySizedBox(
              heightFactor: 0.75,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '-------- ----------',
                    maxLines: 2,
                    style: MintTextStyles.headline1,
                  ),
                  Text(
                    '-------------------------------',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14.sp),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 8.w),
          FractionallySizedBox(
            heightFactor: 0.75,
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                '--:--',
                style: TextStyle(fontSize: 14.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
