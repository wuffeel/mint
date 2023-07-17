/// [ExperienceMessages] template for any language
abstract class ExperienceMessages {
  /// Format date as __Less than 1 year__
  String lessThanOneYear();

  /// Format date as __More than [years] years__
  String moreThanYears(int years);

  /// Format date range as __From [from] to [to] years__
  String fromYearsToYEars(int from, int to);

  /// Format experience years
  /// If experience <1 year, get __Less than 1 year__
  ///
  /// Otherwise, returns [years] years
  String years(int years);
}
