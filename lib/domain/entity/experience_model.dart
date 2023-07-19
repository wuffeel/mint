class ExperienceModel {
  ExperienceModel({
    this.experienceFrom,
    this.experienceTo,
  });

  /// Comparison _from_ variable.
  ///
  /// Used in a way: __experience (> or >=) [experienceFrom]__
  ///
  /// Experience less than 1 year:
  ///
  /// __experience > DateTime.now() - 1 year__
  final DateTime? experienceFrom;

  /// Comparison _to_ variable.
  ///
  /// Used in a way: __experience (< or <=) [experienceFrom]__
  ///
  /// Experience more than 1 year:
  ///
  /// __experience < DateTime.now() - 1 year__
  final DateTime? experienceTo;

  /// Method used to convert tags like 'lt\__N_y', '_N_y\__N_y', 'gt\__N_y',
  /// (where _N_ is some int number) to [ExperienceModel]
  ///
  /// Examples:
  /// ```dart
  /// final now = DateTime.now();
  /// fromTag('lt_1') => experienceTo = (now - 1 year)
  /// fromTag('1y_3y') => experienceFrom = (now - 3 years),
  /// experienceTo = (now - 1 year)
  /// fromTag('gt_3y') => experienceFrom = (now - 3 years)
  /// ```
  static ExperienceModel? fromTag(String tag) {
    final lessOrMoreRegex = RegExp(r'^(lt|gt)_?(\d+)y$');
    final rangeRegex = RegExp(r'^(\d+)y_(\d+)y$');
    final lessOrMoreMatch = lessOrMoreRegex.matchAsPrefix(tag);
    final rangeMatch = rangeRegex.matchAsPrefix(tag);

    if (lessOrMoreMatch == null && rangeMatch == null) {
      return null;
    }

    final now = DateTime.now();
    if (lessOrMoreMatch != null) {
      final prefix = lessOrMoreMatch[1];
      final yearsString = lessOrMoreMatch[2];
      if (prefix == null || yearsString == null) return null;

      final years = int.parse(yearsString);

      DateTime? experienceFrom;
      DateTime? experienceTo;

      // Less than 1 year: experience > date.now() - 1 year (experienceFrom)
      // Greater than 1 year: experience < date.now() - 1 year (experienceTo)
      final flatExperience = _convertToFlatDate(now, years);
      if (prefix == 'lt') {
        experienceFrom = flatExperience;
      } else if (prefix == 'gt') {
        experienceTo = flatExperience;
      } else {
        return null;
      }

      return ExperienceModel(
        experienceFrom: experienceFrom,
        experienceTo: experienceTo,
      );
    } else if (rangeMatch != null) {
      final yearsFromString = rangeMatch[1];
      final yearsToString = rangeMatch[2];
      if (yearsFromString == null || yearsToString == null) return null;

      // Experience from 1 to 3 years:
      // yearsFrom: experience >= date.now() - 3 years (experienceFrom)
      // yearsTo: experience <= date.now() - 1 year (experienceTo)
      final yearsFrom = int.parse(yearsToString);
      final yearsTo = int.parse(yearsFromString);

      final experienceFrom = _convertToFlatDate(now, yearsFrom);
      final experienceTo = _convertToFlatDate(now, yearsTo);

      return ExperienceModel(
        experienceFrom: experienceFrom,
        experienceTo: experienceTo,
      );
    }
    return null;
  }

  /// Subtracts the [date] with [years] provided and returns date with time
  /// set to 00:00
  static DateTime _convertToFlatDate(DateTime date, int years) {
    final subtracted = date.subtract(Duration(days: years * 365));
    return DateTime(subtracted.year, subtracted.month, subtracted.day);
  }
}
