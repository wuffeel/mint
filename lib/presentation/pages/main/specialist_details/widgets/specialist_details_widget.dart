import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/specialist_details/widgets/specialization_tile.dart';

import '../../../../../domain/entity/specialist_model/specialist_model.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../../theme/mint_text_styles.dart';
import '../../../../widgets/specialist_experience_text.dart';

class SpecialistDetailsWidget extends StatelessWidget {
  const SpecialistDetailsWidget({super.key, required this.specialistModel});

  final SpecialistModel specialistModel;

  String get _fullName =>
      '${specialistModel.firstName} ${specialistModel.lastName}';

  String _getReviewCountString(BuildContext context) {
    final l10n = context.l10n;
    final reviews = specialistModel.reviewCount;
    return reviews == 1
        ? '($reviews) ${l10n.reviewSingleCount}'
        : '($reviews) ${l10n.reviewsMultipleCount}';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final photo = specialistModel.photoUrl;
    final specializations = specialistModel.specializations;
    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: <Widget>[
          if (photo != null)
            Container(
              height: 322.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: MintColors.imageBackgroundLight.withOpacity(0.15),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.r),
                  bottomRight: Radius.circular(30.r),
                ),
              ),
              child: Image.network(
                photo,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              top: 16.h,
              bottom: 24.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            _fullName,
                            style: MintTextStyles.title2,
                          ),
                          SizedBox(height: 2.h),
                          SpecialistExperienceText(
                            experience: specialistModel.experience,
                            textStyle: MintTextStyles.subhead.copyWith(
                              color:
                                  Theme.of(context).hintColor.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          '₴${specialistModel.price}',
                          style: MintTextStyles.caption4,
                        ),
                        Text(
                          l10n.perVisit,
                          style: MintTextStyles.footnote.copyWith(
                            color: Theme.of(context).hintColor.withOpacity(0.6),
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  children: <Widget>[
                    Assets.svg.starIconFilled.svg(
                      width: 16.w,
                      height: 16.h,
                      fit: BoxFit.scaleDown,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                    Text(
                      specialistModel.rating.toStringAsFixed(1),
                      style: MintTextStyles.footnote.copyWith(),
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      _getReviewCountString(context),
                      style: MintTextStyles.footnote.copyWith(
                        color: Theme.of(context).hintColor.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 23.h),
                Text(
                  l10n.specializations,
                  style: MintTextStyles.headline1,
                ),
                SizedBox(height: 12.h),
                Wrap(
                  spacing: 8.w,
                  runSpacing: 8.h,
                  children: List.generate(
                    specializations.length,
                    (index) => SpecializationTile(
                      title: specializations[index],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
