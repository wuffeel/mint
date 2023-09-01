import 'package:mint/utils/time_ago/abstract/time_ago_messages.dart';

class EnTimeAgo implements TimeAgoMessages {
  @override
  String suffixAgo() => 'ago';

  @override
  String lessThanOneMinute(int seconds) => '< 1 minute';

  @override
  String minutes(int minutes) =>
      '$minutes ${minutes == 1 ? 'minute' : 'minutes'}';

  @override
  String hours(int hours) => '$hours ${hours == 1 ? 'hour' : 'hours'}';

  @override
  String days(int days) => '$days ${days == 1 ? 'day' : 'days'}';

  @override
  String months(int months) => '$months ${months == 1 ? 'month' : 'months'}';

  @override
  String wordSeparator() => ' ';
}
