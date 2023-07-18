import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/presentation/pages/main/specialist_details/widgets/review_card_tile.dart';

import '../../../../../bloc/review/review_bloc.dart';
import '../../../../../domain/entity/review_model/review_model.dart';

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
              sliver: SliverList.separated(
                itemBuilder: (context, index) {
                  final review = userReviews[index];
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(child: ReviewCardTile(reviewModel: review)),
                      SizedBox(width: 8.w),
                      Column(
                        children: <Widget>[
                          SizedBox(height: 12.h),
                          InkWell(
                            onTap: () => onEdit(review),
                            child: const Icon(Icons.edit),
                          ),
                          SizedBox(height: 12.h),
                          InkWell(
                            onTap: () => onDelete(review),
                            child: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ],
                  );
                },
                separatorBuilder: (_, __) => SizedBox(height: 10.h),
                itemCount: userReviews.length,
              ),
            );
          }
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}
