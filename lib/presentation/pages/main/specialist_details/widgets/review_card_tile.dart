import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/domain/entity/review_model/review_model.dart';
import 'package:mint/gen/colors.gen.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/widgets/expandable_text.dart';
import 'package:mint/presentation/widgets/mint_circle_avatar.dart';
import 'package:mint/presentation/widgets/mint_rating_bar.dart';
import 'package:mint/theme/mint_text_styles.dart';

import '../../../../../utils/time_ago/time_ago_util.dart';

class ReviewCardTile extends StatelessWidget {
  const ReviewCardTile({
    super.key,
    required this.reviewModel,
    this.isUserReview,
    this.onEdit,
    this.onDelete,
  });

  final ReviewModel reviewModel;
  final bool? isUserReview;
  final void Function(ReviewModel)? onEdit;
  final void Function(ReviewModel)? onDelete;

  String _getFullName(BuildContext context) {
    final user = reviewModel.user;
    if (user.firstName == null || user.lastName == null) {
      return context.l10n.patient;
    }
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
    final content = reviewModel.content;
    final userReview = isUserReview;
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
              MintCircleAvatar(
                radius: 20.w,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                photoUrl: reviewModel.user.photoUrl,
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _getFullName(context),
                      style: MintTextStyles.title3,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 2.h),
                    MintRatingBar(rating: reviewModel.rating),
                  ],
                ),
              ),
              if (userReview != null && userReview)
                Row(
                  children: <Widget>[
                    Text(
                      _getStringFromDate(context),
                      style: MintTextStyles.caption1.copyWith(
                        color: Theme.of(context).hintColor.withOpacity(0.6),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    PopupMenuButton<_ReviewPopupMenuItem>(
                      padding: EdgeInsets.zero,
                      onSelected: (item) {
                        final onTap = item.onTap;
                        if (onTap != null) return onTap(reviewModel);
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: _ReviewPopupMenuItem(onTap: onEdit),
                          child: Text(context.l10n.edit),
                        ),
                        PopupMenuItem(
                          value: _ReviewPopupMenuItem(onTap: onDelete),
                          child: Text(context.l10n.delete),
                        ),
                      ],
                      child: const Icon(Icons.more_horiz),
                    ),
                  ],
                )
              else
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

class _ReviewPopupMenuItem {
  const _ReviewPopupMenuItem({required this.onTap});

  final void Function(ReviewModel)? onTap;
}
