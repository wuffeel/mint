import 'package:mint/utils/experience/abstract/experience_messages.dart';

class EnExperience implements ExperienceMessages {
  @override
  String lessThanYears(int years) {
    return 'Less than $years ${years > 1 ? 'years' : 'year'}';
  }

  @override
  String moreThanYears(int years) {
    return 'More than $years ${years > 1 ? 'years' : 'year'}';
  }

  @override
  String fromYearsToYears(int from, int to) {
    return 'From $from to $to years';
  }

  @override
  String years(int years) => '$years ${years > 1 ? 'years' : 'year'}';
}
