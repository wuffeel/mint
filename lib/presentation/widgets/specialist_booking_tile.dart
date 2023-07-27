import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mint/domain/entity/specialist_model/specialist_model.dart';
import 'package:mint/gen/colors.gen.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/widgets/specialist_full_name_text.dart';
import 'package:mint/presentation/widgets/specialist_photo_container.dart';
import 'package:mint/theme/mint_text_styles.dart';

class SpecialistBookingTile extends StatelessWidget {
  const SpecialistBookingTile({
    super.key,
    required this.specialistModel,
    required this.date,
    required this.time,
    required this.durationMinutes,
  });

  final SpecialistModel specialistModel;
  final DateTime date;
  final DateTime time;
  final int durationMinutes;

  Color _getDateColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? MintColors.greyDark
        : MintColors.quarternary1;
  }

  String _getTimeString(DateTime time, int durationMinutes) {
    final consultationEnd = time.add(Duration(minutes: durationMinutes));
    final start = DateFormat('h:mm').format(time);
    final end = DateFormat('h:mm a').format(consultationEnd);
    return '$start-$end';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Theme.of(context).colorScheme.secondary,
      ),
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SpecialistPhotoContainer(
                size: 39.w,
                photoUrl: specialistModel.photoUrl,
              ),
              SizedBox(width: 6.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SpecialistFullNameText(
                      firstName: specialistModel.firstName,
                      lastName: specialistModel.lastName,
                      textStyle: MintTextStyles.title3,
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      l10n.psychologist,
                      style: TextStyle(
                        fontSize: 12.sp,
                        height: 1.3,
                        color: Theme.of(context).hintColor.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '${specialistModel.price}₴',
                style: MintTextStyles.footnoteSemiBold,
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Divider(thickness: 0.5.h, height: 0.5.h),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                l10n.date,
                style: MintTextStyles.footnote.copyWith(
                  color: Theme.of(context).hintColor.withOpacity(0.6),
                ),
              ),
              Text(
                DateFormat.yMMMd().format(date),
                style: MintTextStyles.footnote.copyWith(
                  color: _getDateColor(context),
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                l10n.time,
                style: MintTextStyles.footnote.copyWith(
                  color: Theme.of(context).hintColor.withOpacity(0.6),
                ),
              ),
              Text(
                _getTimeString(time, durationMinutes),
                style: MintTextStyles.footnote.copyWith(
                  color: _getDateColor(context),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
