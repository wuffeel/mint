import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/specialist_details/widgets/review_card_tile.dart';
import 'package:mint/theme/mint_text_styles.dart';

import '../../../../../bloc/review/review_bloc.dart';

class UserReviewTile extends StatelessWidget {
  const UserReviewTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewBloc, ReviewState>(
      builder: (context, state) {
        if (state is ReviewFetchSuccess) {
          final userReview = state.userReview;
          if (userReview != null) {
            return SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(context.l10n.yourReview, style: MintTextStyles.title3),
                    SizedBox(height: 10.h),
                    ReviewCardTile(reviewModel: userReview),
                    SizedBox(height: 4.h),
                    Divider(
                      height: 1,
                      thickness: 2,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            );
          }
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}
