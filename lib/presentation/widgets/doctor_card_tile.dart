import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/gen/assets.gen.dart';
import 'package:mint/gen/colors.gen.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/widgets/mint_rating_bar.dart';
import 'package:mint/theme/mint_text_styles.dart';

class DoctorCardTile extends StatelessWidget {
  const DoctorCardTile({
    super.key,
    required this.fullName,
    required this.experience,
    required this.price,
    required this.rating,
    required this.isFavorite,
    this.photoUrl,
  });

  final String fullName;
  final int experience;
  final int price;
  final double rating;
  final bool isFavorite;
  final String? photoUrl;

  Color _getBackgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? MintColors.imageBackgroundDark.withOpacity(0.16)
        : MintColors.imageBackgroundLight.withOpacity(0.06);
  }

  String _getExperienceString(BuildContext context) {
    final l10n = context.l10n;
    final experienceString = experience == 1
        ? '$experience ${l10n.experienceYear}'
        : '$experience ${l10n.experienceYears}';
    return '${l10n.psychologist}, $experienceString';
  }

  @override
  Widget build(BuildContext context) {
    final photo = photoUrl;
    return Container(
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
                    width: 32.w,
                    height: 32.h,
                    fit: BoxFit.scaleDown,
                  )
                : null,
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
                    Text(
                      fullName,
                      style: MintTextStyles.headline1,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      _getExperienceString(context),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Theme.of(context).hintColor.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
                MintRatingBar(rating: rating, itemSize: 16.r),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              if (isFavorite)
                Assets.svg.heartIconFilled.svg(
                  width: 24.w,
                  height: 24.h,
                  fit: BoxFit.scaleDown,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).iconTheme.color ?? Colors.white,
                    BlendMode.srcIn,
                  ),
                )
              else
                Assets.svg.heartIcon.svg(
                  width: 24.w,
                  height: 24.h,
                  fit: BoxFit.scaleDown,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).iconTheme.color ?? Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              Text(
                '₴$price',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
