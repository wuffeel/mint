import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/presentation/widgets/favorite_icon.dart';
import 'package:mint/presentation/widgets/mint_rating_bar.dart';
import 'package:shimmer/shimmer.dart';

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
                      Container(
                        width: 100.w,
                        height: 17.sp * 1.29,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.r),
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Container(
                        width: 130.w,
                        height: 13.sp,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.r),
                          color: Colors.white,
                        ),
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
                Container(
                  width: 50.w,
                  height: 15.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.r),
                    color: Colors.white,
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
