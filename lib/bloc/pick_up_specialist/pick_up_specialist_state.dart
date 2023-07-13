part of 'pick_up_specialist_bloc.dart';

@immutable
abstract class PickUpSpecialistState {}

class PickUpSpecialistLoading extends PickUpSpecialistState {}

class PickUpSpecialistLoadSuccess extends PickUpSpecialistState {
  PickUpSpecialistLoadSuccess({
    this.pickUpFilter = PickUpFilter.empty,
    this.pickUpPreferences = PickUpPreferences.empty,
  });

  final PickUpFilter pickUpFilter;
  final PickUpPreferences pickUpPreferences;
}

class PickUpSpecialistSelectSuccess extends PickUpSpecialistLoadSuccess {
  PickUpSpecialistSelectSuccess({
    required super.pickUpFilter,
    required super.pickUpPreferences,
  });
}

class PickUpSpecialistLoadFailure extends PickUpSpecialistState {}

class PickUpSpecialistApplySuccess extends PickUpSpecialistState {}
