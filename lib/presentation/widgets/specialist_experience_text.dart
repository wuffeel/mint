import 'package:flutter/material.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/utils/experience/experience_localization.dart';

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
    final experienceYears = ExperienceLocalization.format(
      date: experience,
      locale: l10n.localeName,
    );
    final psychologist = l10n.psychologist;
    return '$psychologist, $experienceYears';
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
