import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/presentation/widgets/favorite_icon.dart';
import 'package:mint/presentation/widgets/mint_rating_bar.dart';
import 'package:shimmer/shimmer.dart';

import '../../theme/mint_text_styles.dart';

class SpecialistCardTileSkeleton extends StatelessWidget {
  const SpecialistCardTileSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).hintColor.withOpacity(0.6),
      highlightColor: Colors.white,
      child: Container(
        height: 106.h,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 11.h),
        child: Row(
          children: <Widget>[
            Container(
              width: 84.w,
              height: 84.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.white,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('----------------', style: MintTextStyles.headline1),
                      SizedBox(height: 4.h),
                      Text(
                        '----------------',
                        style: TextStyle(fontSize: 13.sp),
                      ),
                    ],
                  ),
                  MintRatingBar(rating: 0, itemSize: 16.r),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                const FavoriteIcon(),
                Text(
                  '₴ -----',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
