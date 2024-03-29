import 'package:mint_core/mint_core.dart';

extension SpecialistModelExtensions on List<SpecialistModel> {
  List<SpecialistModel> sortByMostOccurrences({
    required List<String> selectedSpecializations,
    bool isDescending = false,
  }) {
    return this
      ..sort((a, b) {
        var countA = 0;
        var countB = 0;
        for (final specialization in a.specializations) {
          if (selectedSpecializations.contains(specialization)) {
            countA++;
          }
        }
        for (final specialization in b.specializations) {
          if (selectedSpecializations.contains(specialization)) {
            countB++;
          }
        }
        return isDescending ? countA - countB : countB - countA;
      });
  }
}
