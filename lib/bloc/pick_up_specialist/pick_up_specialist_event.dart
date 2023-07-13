part of 'pick_up_specialist_bloc.dart';

@immutable
abstract class PickUpSpecialistEvent {}

class PickUpSpecialistFilterRequested extends PickUpSpecialistEvent {}

class PickUpSpecialistFilterSelected extends PickUpSpecialistEvent {
  PickUpSpecialistFilterSelected(this.pickUpPreferences);

  final PickUpPreferences pickUpPreferences;
}

class PickUpSpecialistFilterFinished extends PickUpSpecialistEvent {}
