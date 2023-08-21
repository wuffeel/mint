import 'dart:developer' as dev;
import 'dart:math';

import 'package:mint/domain/entity/experience_model.dart';
import 'package:mint/utils/experience/abstract/experience_messages.dart';
import 'package:mint/utils/experience/messages/en_experience.dart';
import 'package:mint/utils/experience/messages/uk_experience.dart';

class ExperienceLocalization {
  static const String _default = 'en';
  static final Map<String, ExperienceMessages> _timeAgoMessagesMap = {
    'en': EnExperience(),
    'uk': UkExperience(),
  };

  /// Determines years number low bound to display 'Less than _X_ years' text
  static const _lessThanLowBoundary = 1;

  /// Calculates the difference in years between a given date or date range
  /// and returns the appropriate localized message.
  ///
  /// __If [date] is provided, the method can return:__
  ///
  /// &gt; 'Less than 1 year' if the difference is less than 1 year.
  ///
  /// &gt; '_X_ years' if the difference is 1 year or more.
  ///
  /// __If [experienceModel] is provided, the method can return:__
  ///
  /// &gt; 'From _X_ to _Y_ years' if both _From_ and _To_ are not null.
  ///
  /// &gt; 'Less than _X_ years' if only _From_ is not null.
  ///
  /// &gt; 'More than _Y_ years' if only _To_ is not null.
  ///
  /// __The [locale] parameter specifies the locale for the message.__
  ///
  /// If no locale is specified, defaults to English.
  static String format({
    DateTime? date,
    String? locale,
    ExperienceModel? experienceModel,
  }) {
    final locale0 = locale ?? _default;
    if (_timeAgoMessagesMap[locale0] == null) {
      dev.log(
        'Locale [$locale0] has not been added, using [$_default] as fallback. '
        'To add a locale use [setLocaleMessages]',
      );
    }
    final messages = _timeAgoMessagesMap[locale0] ?? EnExperience();
    final now = DateTime.now();

    if (experienceModel != null) {
      final from = experienceModel.experienceFrom;
      final to = experienceModel.experienceTo;

      if (from != null && to != null) {
        final fromDiff = _getExperienceYearsDiff(now, from);
        final toDiff = _getExperienceYearsDiff(now, to);
        return messages.fromYearsToYears(toDiff, fromDiff);
      } else if (from != null) {
        final fromDiff = _getExperienceYearsDiff(now, from);
        return messages.lessThanYears(fromDiff);
      } else if (to != null) {
        final toDiff = _getExperienceYearsDiff(now, to);
        return messages.moreThanYears(toDiff);
      }
    }

    if (date == null) return '';
    final years = _getExperienceYears(now.difference(date).inDays);

    return years < _lessThanLowBoundary
        ? messages.lessThanYears(_lessThanLowBoundary)
        : messages.years(years);
  }

  /// Returns experience years difference between [now] and [experienceDate]
  /// provided
  static int _getExperienceYearsDiff(DateTime now, DateTime experienceDate) {
    return _getExperienceYears(now.difference(experienceDate).inDays);
  }

  /// Returns rounded experience years count based on [days] provided
  static int _getExperienceYears(int days) {
    return (days / 365).round();
  }
}
