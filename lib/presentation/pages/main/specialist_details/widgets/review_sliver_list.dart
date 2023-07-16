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
      padding: EdgeInsets.all(16.r),
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
            if (state.reviews.isEmpty) {
              return SliverToBoxAdapter(
                child: NoItemsFound(title: context.l10n.noReviewsFound),
              );
            }
            return SliverList.separated(
              itemCount: state.reviews.length,
              itemBuilder: (context, index) =>
                  ReviewCardTile(reviewModel: state.reviews[index]),
              separatorBuilder: (_, __) => SizedBox(height: 8.h),
            );
          }
          return const SliverToBoxAdapter();
        },
      ),
    );
  }
}
