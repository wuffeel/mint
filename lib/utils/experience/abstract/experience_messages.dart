/// [ExperienceMessages] template for any language
abstract class ExperienceMessages {
  /// Format date as __Less than 1 year__ or __Less than 2 years__
  String lessThanYears(int years);

  /// Format date as __More than [years] years__
  String moreThanYears(int years);

  /// Format date range as __From [from] to [to] years__
  String fromYearsToYears(int from, int to);

  /// Format experience years
  /// If experience <1 year, get __Less than 1 year__
  ///
  /// Otherwise, returns [years] years
  String years(int years);
}
