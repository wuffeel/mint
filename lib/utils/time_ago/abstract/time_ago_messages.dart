/// [TimeAgoMessages] template for any language
abstract class TimeAgoMessages {
  /// Example: `prefixAgo()` 1 min `suffixAgo()`
  String suffixAgo();

  /// Format when time is less than a minute
  String lessThanOneMinute(int seconds);

  /// Format when time is in minutes
  String minutes(int minutes);

  /// Format when time is in hours
  String hours(int hours);

  /// Format when time is in days
  String days(int days);

  /// Format when time is in months
  String months(int months);

  /// word separator when words are concatenated
  String wordSeparator() => ' ';
}
