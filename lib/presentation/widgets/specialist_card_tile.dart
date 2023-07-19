import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/domain/entity/specialist_model/specialist_model.dart';
import 'package:mint/gen/assets.gen.dart';
import 'package:mint/gen/colors.gen.dart';
import 'package:mint/presentation/widgets/favorite_button.dart';
import 'package:mint/presentation/widgets/mint_rating_bar.dart';
import 'package:mint/presentation/widgets/specialist_experience_text.dart';
import 'package:mint/routes/app_router.gr.dart';
import 'package:mint/theme/mint_text_styles.dart';

class SpecialistCardTile extends StatelessWidget {
  const SpecialistCardTile({super.key, required this.specialistModel});

  final SpecialistModel specialistModel;

  Color _getBackgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? MintColors.imageBackgroundDark.withOpacity(0.16)
        : MintColors.imageBackgroundLight.withOpacity(0.06);
  }

  String _getFullName() {
    return '${specialistModel.firstName} ${specialistModel.lastName}';
  }

  @override
  Widget build(BuildContext context) {
    final photo = specialistModel.photoUrl;
    return InkWell(
      onTap: () => context.router.push(
        SpecialistDetailsRoute(specialistModel: specialistModel),
      ),
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
                        _getFullName(),
                        style: MintTextStyles.headline1,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4.h),
                      SpecialistExperienceText(
                        experience: specialistModel.experience,
                        textStyle: TextStyle(
                          fontSize: 13.sp,
                          color: Theme.of(context).hintColor.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                  MintRatingBar(
                    rating: specialistModel.rating,
                    itemSize: 16.r,
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                FavoriteButton(specialistModel: specialistModel),
                Text(
                  '₴${specialistModel.price}',
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
