import 'package:mint/utils/experience/abstract/experience_messages.dart';

class EnExperience implements ExperienceMessages {
  @override
  String lessThanOneYear() => 'Less than 1 year';

  @override
  String moreThanYears(int years) => 'More than $years years';

  @override
  String fromYearsToYEars(int from, int to) {
    return 'From $from to $to';
  }

  @override
  String years(int years) => '$years';
}
