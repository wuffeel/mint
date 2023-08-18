import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/domain/entity/specialist_model/specialist_model.dart';
import 'package:mint/presentation/widgets/favorite_button.dart';
import 'package:mint/presentation/widgets/mint_rating_bar.dart';
import 'package:mint/presentation/widgets/specialist_experience_text.dart';
import 'package:mint/presentation/widgets/specialist_full_name_text.dart';
import 'package:mint/presentation/widgets/specialist_photo_container.dart';
import 'package:mint/routes/app_router.gr.dart';
import 'package:mint/theme/mint_text_styles.dart';

class SpecialistCardTile extends StatelessWidget {
  const SpecialistCardTile({
    super.key,
    required this.specialistModel,
    this.showDialogOnFavoriteRemove = false,
  });

  final SpecialistModel specialistModel;

  /// See [FavoriteButton.showDialogOnFavoriteRemove]
  final bool showDialogOnFavoriteRemove;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.navigate(
        SpecialistsWrapperRoute(
          children: [
            const SpecialistsRoute(),
            SpecialistDetailsRoute(specialistModel: specialistModel)
          ],
        ),
      ),
      child: Container(
        height: 106.h,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 11.h),
        child: Row(
          children: <Widget>[
            SpecialistPhotoContainer(
              size: 84.w,
              photoUrl: specialistModel.photoUrl,
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
                      SpecialistFullNameText(
                        firstName: specialistModel.firstName,
                        lastName: specialistModel.lastName,
                        textStyle: MintTextStyles.headline1,
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
                FavoriteButton(
                  specialistModel: specialistModel,
                  showDialogOnFavoriteRemove: showDialogOnFavoriteRemove,
                ),
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
