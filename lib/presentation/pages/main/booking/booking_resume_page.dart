import 'package:flutter/material.dart';
import 'package:mint/domain/entity/specialist_model/specialist_model.dart';

class BookingResumePage extends StatelessWidget {
  const BookingResumePage({
    super.key,
    required this.specialistModel,
    required this.date,
    required this.time,
    this.minutesDuration = 60,
  });

  final SpecialistModel specialistModel;
  final DateTime date;
  final DateTime time;
  final int minutesDuration;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
