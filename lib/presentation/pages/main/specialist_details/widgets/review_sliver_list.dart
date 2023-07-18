import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/specialist_details/widgets/review_card_tile.dart';

import '../../../../../bloc/review/review_bloc.dart';
import '../../../../widgets/error_try_again_text.dart';
import '../../../../widgets/no_items_found.dart';

class ReviewSliverList extends StatelessWidget {
  const ReviewSliverList({super.key, required this.onRefresh});

  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h, top: 4.h),
      sliver: BlocBuilder<ReviewBloc, ReviewState>(
        builder: (context, state) {
          if (state is ReviewLoading) {
            return const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is ReviewFetchFailure) {
            return SliverToBoxAdapter(
              child: ErrorTryAgainText(
                onRefresh: onRefresh,
              ),
            );
          }
          if (state is ReviewFetchSuccess) {
            final reviews = state.reviews;
            if (reviews.isEmpty) {
              return SliverToBoxAdapter(
                child: NoItemsFound(title: context.l10n.noReviewsFound),
              );
            }
            return SliverList.separated(
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                final review = reviews[index];
                return !state.userReviews.contains(review)
                    ? ReviewCardTile(reviewModel: review)
                    : const SizedBox.shrink();
              },
              separatorBuilder: (_, __) => SizedBox(height: 8.h),
            );
          }
          return const SliverToBoxAdapter();
        },
      ),
    );
  }
}
