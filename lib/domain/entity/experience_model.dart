class ExperienceModel {
  ExperienceModel({
    required this.title,
    this.experienceFrom,
    this.experienceTo,
    this.isLessOrMoreThan = false,
  });

  /// A string representation of tag. Can be either:
  ///
  ///
  /// - Less than _N_ year(-s)
  /// - From _N_ to _N_ years
  /// - More than _N_ year(-s)
  ///
  /// Where _N_ is some integer value representing years count
  final String title;

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

  /// Variable used to identify whether experience should be compared on
  /// equality or not
  ///
  /// If true, comparison do not include equality (i.e. < or >)
  final bool isLessOrMoreThan;

  /// Method used to convert tags like 'lt\__N_y', '_N_y\__N_y', 'gt\__N_y',
  /// (where _N_ is some int number) to [ExperienceModel]
  ///
  /// Examples:
  /// ```dart
  /// ExperienceModel.fromTag('lt_1').title => 'Less than 1 year'
  /// ExperienceModel.fromTag('500_1000').title => '500-1000₴'
  /// ExperienceModel.fromTag('gt_1000').title => '1000₴ and more'
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
        title: _getTitleByPrefix(prefix, years),
        experienceFrom: experienceFrom,
        experienceTo: experienceTo,
        isLessOrMoreThan: true,
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
        title: 'From $yearsFromString to $yearsToString years',
        experienceFrom: experienceFrom,
        experienceTo: experienceTo,
      );
    }
    return null;
  }

  /// Returns a corresponding [title] depending on [prefix] passed
  static String _getTitleByPrefix(String prefix, int years) {
    switch (prefix) {
      case 'lt':
        final lessThan = 'Less than $years';
        return years == 1 ? '$lessThan year' : '$lessThan years';
      case 'gt':
        final moreThan = 'More than $years';
        return years == 1 ? '$moreThan year' : '$moreThan years';
    }
    return '';
  }

  /// Subtracts the [date] with [years] provided and returns date with time
  /// set to 00:00
  static DateTime _convertToFlatDate(DateTime date, int years) {
    final subtracted = date.subtract(Duration(days: years * 365));
    return DateTime(subtracted.year, subtracted.month, subtracted.day);
  }
}
