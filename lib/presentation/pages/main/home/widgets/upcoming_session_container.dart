import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mint/domain/entity/booking_data/booking_data.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/widgets/specialist_full_name_text.dart';
import 'package:mint/presentation/widgets/specialist_photo_container.dart';
import 'package:mint/theme/mint_text_styles.dart';

import '../../../../../gen/assets.gen.dart';

class UpcomingSessionContainer extends StatelessWidget {
  const UpcomingSessionContainer({
    super.key,
    required this.onTap,
    required this.bookingData,
  });

  final VoidCallback onTap;
  final BookingData bookingData;

  String _getBookTimeDateString(BuildContext context, DateTime bookTime) {
    final date = DateFormat.yMd(context.l10n.localeName).format(bookTime);
    final time = DateFormat.Hm().format(bookTime);
    return '$date, $time';
  }

  @override
  Widget build(BuildContext context) {
    final specialistModel = bookingData.specialistModel;
    final bookTime = bookingData.bookTime;
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Theme.of(context).colorScheme.secondary,
        ),
        padding: EdgeInsets.all(16.w),
        child: Row(
          children: <Widget>[
            SpecialistPhotoContainer(
              size: 43.w,
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
                    _getBookTimeDateString(context, bookTime),
                    style: MintTextStyles.footnoteMedium.copyWith(
                      color: Theme.of(context).hintColor.withOpacity(0.6),
                    ),
                  )
                ],
              ),
            ),
            Assets.svg.chevronRight.svg(
              width: 24.w,
              height: 24.h,
              fit: BoxFit.scaleDown,
              colorFilter: ColorFilter.mode(
                Theme.of(context).iconTheme.color ?? Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
