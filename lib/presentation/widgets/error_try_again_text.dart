import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/widgets/refresh_button.dart';
import 'package:mint/theme/mint_text_styles.dart';

class ErrorTryAgainText extends StatelessWidget {
  const ErrorTryAgainText({super.key, this.title, required this.onRefresh});

  final String? title;
  final VoidCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          title ?? '${context.l10n.oopsSomethingWentWrong}!',
          style: MintTextStyles.title1,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8.h),
        InkWell(
          onTap: onRefresh,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                context.l10n.tryAgainQuestion,
                style: MintTextStyles.headline1.copyWith(
                  color: Theme.of(context).hintColor.withOpacity(0.6),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(width: 8.w),
              RefreshButton(size: 24.r),
            ],
          ),
        )
      ],
    );
  }
}
