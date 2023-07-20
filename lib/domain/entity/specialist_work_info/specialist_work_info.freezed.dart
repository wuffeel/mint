// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'specialist_work_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SpecialistWorkInfo {
  int get bookingDaysAdvance => throw _privateConstructorUsedError;
  int get consultationMinutes => throw _privateConstructorUsedError;
  List<DateTime> get excludedDays => throw _privateConstructorUsedError;
  String get specialistId => throw _privateConstructorUsedError;
  List<Map<String, List<DateTime>>> get workHours =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SpecialistWorkInfoCopyWith<SpecialistWorkInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecialistWorkInfoCopyWith<$Res> {
  factory $SpecialistWorkInfoCopyWith(
          SpecialistWorkInfo value, $Res Function(SpecialistWorkInfo) then) =
      _$SpecialistWorkInfoCopyWithImpl<$Res, SpecialistWorkInfo>;
  @useResult
  $Res call(
      {int bookingDaysAdvance,
      int consultationMinutes,
      List<DateTime> excludedDays,
      String specialistId,
      List<Map<String, List<DateTime>>> workHours});
}

/// @nodoc
class _$SpecialistWorkInfoCopyWithImpl<$Res, $Val extends SpecialistWorkInfo>
    implements $SpecialistWorkInfoCopyWith<$Res> {
  _$SpecialistWorkInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingDaysAdvance = null,
    Object? consultationMinutes = null,
    Object? excludedDays = null,
    Object? specialistId = null,
    Object? workHours = null,
  }) {
    return _then(_value.copyWith(
      bookingDaysAdvance: null == bookingDaysAdvance
          ? _value.bookingDaysAdvance
          : bookingDaysAdvance // ignore: cast_nullable_to_non_nullable
              as int,
      consultationMinutes: null == consultationMinutes
          ? _value.consultationMinutes
          : consultationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      excludedDays: null == excludedDays
          ? _value.excludedDays
          : excludedDays // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      specialistId: null == specialistId
          ? _value.specialistId
          : specialistId // ignore: cast_nullable_to_non_nullable
              as String,
      workHours: null == workHours
          ? _value.workHours
          : workHours // ignore: cast_nullable_to_non_nullable
              as List<Map<String, List<DateTime>>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SpecialistWorkInfoCopyWith<$Res>
    implements $SpecialistWorkInfoCopyWith<$Res> {
  factory _$$_SpecialistWorkInfoCopyWith(_$_SpecialistWorkInfo value,
          $Res Function(_$_SpecialistWorkInfo) then) =
      __$$_SpecialistWorkInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int bookingDaysAdvance,
      int consultationMinutes,
      List<DateTime> excludedDays,
      String specialistId,
      List<Map<String, List<DateTime>>> workHours});
}

/// @nodoc
class __$$_SpecialistWorkInfoCopyWithImpl<$Res>
    extends _$SpecialistWorkInfoCopyWithImpl<$Res, _$_SpecialistWorkInfo>
    implements _$$_SpecialistWorkInfoCopyWith<$Res> {
  __$$_SpecialistWorkInfoCopyWithImpl(
      _$_SpecialistWorkInfo _value, $Res Function(_$_SpecialistWorkInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingDaysAdvance = null,
    Object? consultationMinutes = null,
    Object? excludedDays = null,
    Object? specialistId = null,
    Object? workHours = null,
  }) {
    return _then(_$_SpecialistWorkInfo(
      bookingDaysAdvance: null == bookingDaysAdvance
          ? _value.bookingDaysAdvance
          : bookingDaysAdvance // ignore: cast_nullable_to_non_nullable
              as int,
      consultationMinutes: null == consultationMinutes
          ? _value.consultationMinutes
          : consultationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      excludedDays: null == excludedDays
          ? _value._excludedDays
          : excludedDays // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      specialistId: null == specialistId
          ? _value.specialistId
          : specialistId // ignore: cast_nullable_to_non_nullable
              as String,
      workHours: null == workHours
          ? _value._workHours
          : workHours // ignore: cast_nullable_to_non_nullable
              as List<Map<String, List<DateTime>>>,
    ));
  }
}

/// @nodoc

class _$_SpecialistWorkInfo
    with DiagnosticableTreeMixin
    implements _SpecialistWorkInfo {
  const _$_SpecialistWorkInfo(
      {required this.bookingDaysAdvance,
      required this.consultationMinutes,
      required final List<DateTime> excludedDays,
      required this.specialistId,
      required final List<Map<String, List<DateTime>>> workHours})
      : _excludedDays = excludedDays,
        _workHours = workHours;

  @override
  final int bookingDaysAdvance;
  @override
  final int consultationMinutes;
  final List<DateTime> _excludedDays;
  @override
  List<DateTime> get excludedDays {
    if (_excludedDays is EqualUnmodifiableListView) return _excludedDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_excludedDays);
  }

  @override
  final String specialistId;
  final List<Map<String, List<DateTime>>> _workHours;
  @override
  List<Map<String, List<DateTime>>> get workHours {
    if (_workHours is EqualUnmodifiableListView) return _workHours;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workHours);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SpecialistWorkInfo(bookingDaysAdvance: $bookingDaysAdvance, consultationMinutes: $consultationMinutes, excludedDays: $excludedDays, specialistId: $specialistId, workHours: $workHours)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SpecialistWorkInfo'))
      ..add(DiagnosticsProperty('bookingDaysAdvance', bookingDaysAdvance))
      ..add(DiagnosticsProperty('consultationMinutes', consultationMinutes))
      ..add(DiagnosticsProperty('excludedDays', excludedDays))
      ..add(DiagnosticsProperty('specialistId', specialistId))
      ..add(DiagnosticsProperty('workHours', workHours));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SpecialistWorkInfo &&
            (identical(other.bookingDaysAdvance, bookingDaysAdvance) ||
                other.bookingDaysAdvance == bookingDaysAdvance) &&
            (identical(other.consultationMinutes, consultationMinutes) ||
                other.consultationMinutes == consultationMinutes) &&
            const DeepCollectionEquality()
                .equals(other._excludedDays, _excludedDays) &&
            (identical(other.specialistId, specialistId) ||
                other.specialistId == specialistId) &&
            const DeepCollectionEquality()
                .equals(other._workHours, _workHours));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      bookingDaysAdvance,
      consultationMinutes,
      const DeepCollectionEquality().hash(_excludedDays),
      specialistId,
      const DeepCollectionEquality().hash(_workHours));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SpecialistWorkInfoCopyWith<_$_SpecialistWorkInfo> get copyWith =>
      __$$_SpecialistWorkInfoCopyWithImpl<_$_SpecialistWorkInfo>(
          this, _$identity);
}

abstract class _SpecialistWorkInfo implements SpecialistWorkInfo {
  const factory _SpecialistWorkInfo(
          {required final int bookingDaysAdvance,
          required final int consultationMinutes,
          required final List<DateTime> excludedDays,
          required final String specialistId,
          required final List<Map<String, List<DateTime>>> workHours}) =
      _$_SpecialistWorkInfo;

  @override
  int get bookingDaysAdvance;
  @override
  int get consultationMinutes;
  @override
  List<DateTime> get excludedDays;
  @override
  String get specialistId;
  @override
  List<Map<String, List<DateTime>>> get workHours;
  @override
  @JsonKey(ignore: true)
  _$$_SpecialistWorkInfoCopyWith<_$_SpecialistWorkInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
