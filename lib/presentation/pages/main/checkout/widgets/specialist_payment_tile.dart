import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint_core/mint_core.dart';

import '../../../../../theme/mint_text_styles.dart';
import '../../../../widgets/specialist_full_name_text.dart';
import '../../../../widgets/specialist_photo_container.dart';

class SpecialistPaymentTile extends StatelessWidget {
  const SpecialistPaymentTile({
    super.key,
    required this.specialistModel,
    required this.bookTime,
  });

  final SpecialistModel specialistModel;
  final DateTime bookTime;

  String _getDateString(BuildContext context, DateTime bookTime) {
    final dateString = DateFormat.yMd(context.l10n.localeName).format(bookTime);
    final timeString = DateFormat.Hm().format(bookTime);
    return '$dateString, $timeString';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Row(
      children: <Widget>[
        SpecialistPhotoContainer(
          size: 53.w,
          photoUrl: specialistModel.photoUrl,
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SpecialistFullNameText(
                firstName: specialistModel.firstName,
                lastName: specialistModel.lastName,
                textStyle: MintTextStyles.caption4,
              ),
              SizedBox(height: 4.h),
              Text(
                _getDateString(context, bookTime),
                style: MintTextStyles.footnoteMedium.copyWith(
                  color: Theme.of(context).hintColor.withOpacity(0.6),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: <Widget>[
            Text(
              '₴${specialistModel.price}',
              style: MintTextStyles.caption4,
            ),
            Text(
              l10n.perVisit,
              style: MintTextStyles.footnote.copyWith(
                color: Theme.of(context).hintColor.withOpacity(0.6),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}
