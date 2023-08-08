import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:mint/utils/time_ago/abstract/time_ago_messages.dart';
import 'package:mint/utils/time_ago/messages/en_time_ago.dart';
import 'package:mint/utils/time_ago/messages/uk_time_ago.dart';

class TimeAgoUtil {
  static const String _default = 'en';
  static final Map<String, TimeAgoMessages> _timeAgoMessagesMap = {
    'en': EnTimeAgo(),
    'uk': UkTimeAgo(),
  };

  /// Formats provided [date] to return corresponding _time ago_ type string;
  /// compared to current time
  ///
  /// If given [date] exceeds 1 year, returns date formatted like _Jan 1, 1990_
  ///
  /// - If [locale] is passed will look for message for that locale. Defaults to
  /// English
  static String format(
      DateTime date, {
        String? locale,
      }) {
    final locale0 = locale ?? _default;
    if (_timeAgoMessagesMap[locale0] == null) {
      log(
        'Locale [$locale0] has not been added, using [$_default] as fallback. '
            'To add a locale use [setLocaleMessages]',
      );
    }
    final messages = _timeAgoMessagesMap[locale0] ?? EnTimeAgo();
    final now = DateTime.now();
    final elapsed = now.millisecondsSinceEpoch - date.millisecondsSinceEpoch;

    final suffix = messages.suffixAgo();

    final num seconds = elapsed / 1000;
    final num minutes = seconds / 60;
    final num hours = minutes / 60;
    final num days = hours / 24;
    final num months = days / 30;

    if (days > 365) {
      return DateFormat.yMMMd(locale).format(date);
    }

    String result;
    if (seconds < 60) {
      result = messages.lessThanOneMinute(seconds.round());
    } else if (minutes < 60) {
      result = messages.minutes(minutes.round());
    } else if (hours < 24) {
      result = messages.hours(hours.round());
    } else if (days < 30) {
      result = messages.days(days.round());
    } else {
      result = messages.months(months.round());
    }

    return [result, suffix]
        .where((str) => str.isNotEmpty)
        .join(messages.wordSeparator());
  }
}
