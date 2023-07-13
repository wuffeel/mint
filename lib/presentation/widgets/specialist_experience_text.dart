import 'package:flutter/material.dart';
import 'package:mint/l10n/l10n.dart';

class SpecialistExperienceText extends StatelessWidget {
  const SpecialistExperienceText({
    super.key,
    required this.experience,
    required this.textStyle,
  });

  final DateTime experience;
  final TextStyle textStyle;

  String _getExperienceString(BuildContext context) {
    final l10n = context.l10n;
    final localExperience = experience;
    final currentDate = DateTime.now();
    var yearDifference = currentDate.year - localExperience.year;

    if (currentDate.month < localExperience.month ||
        (currentDate.month == localExperience.month &&
            currentDate.day < localExperience.day)) {
      yearDifference--;
    }

    if (yearDifference == 0) {
      return '${l10n.psychologist}, ${l10n.lessThanYear}';
    }

    final experienceString = yearDifference == 1
        ? '$yearDifference ${l10n.experienceYear}'
        : '$yearDifference ${l10n.experienceYears}';
    return '${l10n.psychologist}, $experienceString';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _getExperienceString(context),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: textStyle,
    );
  }
}
