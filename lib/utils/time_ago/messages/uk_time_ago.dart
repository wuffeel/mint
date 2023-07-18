import 'package:mint/backbone/time_type.dart';
import 'package:mint/utils/time_ago/abstract/time_ago_messages.dart';

class UkTimeAgo implements TimeAgoMessages {
  @override
  String suffixAgo() => 'тому';

  @override
  String lessThanOneMinute(int seconds) => '< 1 хвилини';

  @override
  String minutes(int minutes) {
    return '$minutes ${_convert(minutes, TimeType.minutes)}';
  }

  @override
  String hours(int hours) => '$hours ${_convert(hours, TimeType.hours)}';

  @override
  String days(int days) => '$days ${_convert(days, TimeType.days)}';

  @override
  String months(int months) => '$months ${_convert(months, TimeType.months)}';

  @override
  String wordSeparator() => ' ';

  /// Function to get a Ukrainian-localized time type for given [type]
  String _convert(int number, TimeType type) {
    final mod = number % 10;
    final modH = number % 100;

    if (mod == 1 && modH != 11) {
      switch (type) {
        case TimeType.minutes:
          return 'хвилину';
        case TimeType.hours:
          return 'годину';
        case TimeType.days:
          return 'день';
        case TimeType.months:
          return 'місяць';
      }
    } else if (<int>[2, 3, 4].contains(mod) &&
        !<int>[12, 13, 14].contains(modH)) {
      switch (type) {
        case TimeType.minutes:
          return 'хвилини';
        case TimeType.hours:
          return 'години';
        case TimeType.days:
          return 'дні';
        case TimeType.months:
          return 'місяця';
      }
    }
    switch (type) {
      case TimeType.minutes:
        return 'хвилин';
      case TimeType.hours:
        return 'годин';
      case TimeType.days:
        return 'днів';
      case TimeType.months:
        return 'місяців';
    }
  }
}
