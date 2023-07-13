import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/mint_text_styles.dart';

class NoItemsFound extends StatelessWidget {
  const NoItemsFound({super.key, required this.title, this.subTitle});

  final String title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    final sub = subTitle;
    return sub == null
        ? Text(
            title,
            style: MintTextStyles.title1,
            textAlign: TextAlign.center,
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                style: MintTextStyles.title1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              Text(
                sub,
                style: MintTextStyles.headline1.copyWith(
                  color: Theme.of(context).hintColor.withOpacity(0.6),
                ),
              ),
            ],
          );
  }
}
