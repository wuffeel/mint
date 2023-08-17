import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mint/l10n/l10n.dart';

import '../../../../../../theme/mint_text_styles.dart';

class ProfileDateOfBirth extends StatelessWidget {
  const ProfileDateOfBirth({
    super.key,
    required this.dateOfBirth,
    required this.onDateChange,
  });

  final DateTime? dateOfBirth;
  final void Function(DateTime) onDateChange;

  Future<void> _showDatePicker(
    BuildContext context,
    DateTime? dateOfBirth,
  ) async {
    final now = DateTime.now();
    final date = await showDatePicker(
      context: context,
      initialDate: dateOfBirth ?? DateTime.now(),
      firstDate: DateTime(now.year - 80),
      lastDate: now,
      currentDate: dateOfBirth,
      locale: Locale(context.l10n.localeName),
    );
    if (date != null) onDateChange(date);
  }

  String _getDateOfBirthText(BuildContext context, DateTime? dateOfBirth) {
    final l10n = context.l10n;
    return dateOfBirth != null
        ? DateFormat.yMd(l10n.localeName).format(dateOfBirth)
        : l10n.dateOfBirth;
  }

  Color _getDateOfBirthColor(BuildContext context, DateTime? dateOfBirth) {
    return dateOfBirth != null
        ? Theme.of(context).primaryColor
        : Theme.of(context).hintColor.withOpacity(0.3);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showDatePicker(context, dateOfBirth),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Theme.of(context).colorScheme.secondary,
        ),
        padding: EdgeInsets.symmetric(
          vertical: 14.h,
          horizontal: 16.w,
        ),
        child: Text(
          _getDateOfBirthText(context, dateOfBirth),
          style: MintTextStyles.body.copyWith(
            color: _getDateOfBirthColor(context, dateOfBirth),
          ),
        ),
      ),
    );
  }
}
