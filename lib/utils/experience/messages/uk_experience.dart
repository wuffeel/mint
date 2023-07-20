import 'package:mint/utils/experience/abstract/experience_messages.dart';

class UkExperience implements ExperienceMessages {
  @override
  String lessThanYears(int years) => 'Менше $years ${_yearsRange(years)}';

  @override
  String moreThanYears(int years) => 'Більше $years ${_yearsRange(years)}';

  @override
  String fromYearsToYears(int from, int to) {
    return 'Від $from до $to ${_yearsRange(to)}';
  }

  @override
  String years(int years) => '$years ${_experienceYears(years)}';

  String _experienceYears(int number) {
    final mod = number % 10;
    final modH = number % 100;

    if (mod == 1 && modH != 11) {
      return 'рік';
    } else if (<int>[2, 3, 4].contains(mod) &&
        !<int>[12, 13, 14].contains(modH)) {
      return 'роки';
    } else {
      return 'років';
    }
  }

  String _yearsRange(int number) {
    final mod = number % 10;
    final modH = number % 100;

    return mod == 1 && modH != 11 ? 'року' : 'років';
  }
}
