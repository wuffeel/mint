import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/specialist_details/widgets/review_card_tile.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../../../bloc/review/review_bloc.dart';
import '../../../../../domain/entity/review_model/review_model.dart';
import '../../../../../theme/mint_text_styles.dart';

class UserReviewsSection extends StatelessWidget {
  const UserReviewsSection({
    super.key,
    required this.onEdit,
    required this.onDelete,
  });

  final void Function(ReviewModel) onEdit;
  final void Function(ReviewModel) onDelete;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewBloc, ReviewState>(
      builder: (context, state) {
        if (state is ReviewFetchSuccess) {
          final userReviews = state.userReviews;
          if (userReviews.isNotEmpty) {
            return SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              sliver: MultiSliver(
                children: <Widget>[
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          context.l10n.yourReviews,
                          style: MintTextStyles.title3,
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ),
                  ),
                  SliverList.separated(
                    itemBuilder: (context, index) {
                      final review = userReviews[index];
                      return ReviewCardTile(
                        reviewModel: review,
                        isUserReview: true,
                        onEdit: onEdit,
                        onDelete: onDelete,
                      );
                    },
                    separatorBuilder: (_, __) => SizedBox(height: 10.h),
                    itemCount: userReviews.length,
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 12.h)),
                  SliverToBoxAdapter(
                    child: Divider(
                      thickness: 2,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            );
          }
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}
