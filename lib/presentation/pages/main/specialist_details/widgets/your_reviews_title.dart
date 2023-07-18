import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/l10n/l10n.dart';

import '../../../../../theme/mint_text_styles.dart';

class YourReviewsTitle extends StatelessWidget {
  const YourReviewsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
            ),
            child: Text(
              context.l10n.yourReviews,
              style: MintTextStyles.title3,
            ),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
