import 'dart:developer';

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

  /// Calculates the difference in years between a given date or date range
  /// and returns the appropriate localized message.
  ///
  /// __If [date] is provided, the method can either return:__
  ///
  /// &gt; 'Less than 1 year' if the difference is less than 1 year.
  ///
  /// &gt; '_difference_ years' if the difference is 1 year or more.
  ///
  /// __If [experienceModel] is provided, the method can either return:__
  ///
  /// &gt; 'From _fromDiff_ to _toDiff_ years' if both _from_ and _to_ are not
  /// null.
  ///
  /// &gt; 'Less than _fromDiff_ years' if only _from_ is not null.
  ///
  /// &gt; 'More than _toDiff_ years' if only _to_ is not null.
  ///
  /// The [locale] parameter specifies the locale for the message.
  /// If no locale is specified, defaults to English.
  static String format({
    DateTime? date,
    String? locale,
    ExperienceModel? experienceModel,
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

    if (experienceModel != null) {
      final from = experienceModel.experienceFrom;
      final to = experienceModel.experienceTo;

      if (from != null && to != null) {
        final fromDiff = (now.difference(from).inDays / 365).round();
        final toDiff = (now.difference(to).inDays / 365).round();
        return messages.fromYearsToYears(toDiff, fromDiff);
      } else if (from != null) {
        final fromDiff = (now.difference(from).inDays / 365).round();
        return messages.lessThanYears(fromDiff);
      } else if (to != null) {
        final toDiff = (now.difference(to).inDays / 365).round();
        return messages.moreThanYears(toDiff);
      }
    }

    if (date == null) return '';
    final days = now.difference(date).inDays;
    final years = days / 365;

    return years < 1
        ? messages.lessThanYears(years.round())
        : messages.years(years.round());
  }
}
