import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/domain/entity/review_model/review_model.dart';
import 'package:mint/gen/colors.gen.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/widgets/expandable_text.dart';
import 'package:mint/presentation/widgets/mint_rating_bar.dart';
import 'package:mint/theme/mint_text_styles.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../utils/time_ago/time_ago_util.dart';

class ReviewCardTile extends StatelessWidget {
  const ReviewCardTile({super.key, required this.reviewModel});

  final ReviewModel reviewModel;

  String _getFullName() {
    final user = reviewModel.user;
    // TODO(wuffeel): what user name placeholder should be used?
    if (user.firstName == null || user.lastName == null) return 'Patient';
    return '${user.firstName} ${user.lastName}';
  }

  String _getStringFromDate(BuildContext context) {
    final createdAt = reviewModel.createdAt;
    return TimeAgoUtil.format(createdAt, locale: context.l10n.localeName);
  }

  Color _getThemeContentColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? MintColors.greyDark.withOpacity(0.6)
        : MintColors.quarternary1;
  }

  @override
  Widget build(BuildContext context) {
    final localPhoto = reviewModel.user.photoUrl;
    final content = reviewModel.content;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Theme.of(context).colorScheme.background,
      ),
      padding: EdgeInsets.all(10.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (localPhoto != null)
                CircleAvatar(
                  radius: 20.r,
                  backgroundImage: NetworkImage(localPhoto),
                )
              else
                CircleAvatar(
                  radius: 20.r,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  child: Assets.svg.userPlaceholder.svg(
                    width: 20.w,
                    height: 20.h,
                    fit: BoxFit.scaleDown,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).primaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              SizedBox(width: 8.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _getFullName(),
                      style: MintTextStyles.title3,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 2.h),
                    MintRatingBar(rating: reviewModel.rating),
                  ],
                ),
              ),
              Text(
                _getStringFromDate(context),
                style: MintTextStyles.caption1.copyWith(
                  color: Theme.of(context).hintColor.withOpacity(0.6),
                ),
              ),
            ],
          ),
          if (content != null) ...[
            SizedBox(height: 6.h),
            ExpandableText(
              content,
              style: MintTextStyles.subhead.copyWith(
                color: _getThemeContentColor(context),
              ),
              maxLines: 5,
            ),
          ]
        ],
      ),
    );
  }
}
