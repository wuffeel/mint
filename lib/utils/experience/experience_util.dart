import 'dart:developer';

import 'package:mint/utils/experience/abstract/experience_messages.dart';
import 'package:mint/utils/experience/messages/en_experience.dart';
import 'package:mint/utils/experience/messages/uk_experience.dart';

class ExperienceUtil {
  static const String _default = 'en';
  static final Map<String, ExperienceMessages> _timeAgoMessagesMap = {
    'en': EnExperience(),
    'uk': UkExperience(),
  };

  /// Formats provided [date] to a fuzzy time like 'a moment ago'
  ///
  /// - If [locale] is passed will look for message for that locale, defaults to
  /// English
  static String format(
      DateTime date, {
        String? locale,
        bool isMoreThanYears = false,
      }) {
    final locale0 = locale ?? _default;
    if (_timeAgoMessagesMap[locale0] == null) {
      log(
        'Locale [$locale0] has not been added, using [$_default] as fallback. '
            'To add a locale use [setLocaleMessages]',
      );
    }
    final messages = _timeAgoMessagesMap[locale0] ?? EnExperience();
    final now = DateTime.now();

    final days = now.difference(date).inDays;
    final num years = days / 365;

    String result;
    if (isMoreThanYears) {
      result = messages.moreThanYears(years.round());
    } else if (years < 1) {
      result = messages.lessThanOneYear();
    } else {
      result = messages.years(years.round());
    }

    return result;
  }
}
