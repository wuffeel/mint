// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'specialist_work_info_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SpecialistWorkInfoDto _$SpecialistWorkInfoDtoFromJson(
    Map<String, dynamic> json) {
  return _SpecialistWorkInfoDto.fromJson(json);
}

/// @nodoc
mixin _$SpecialistWorkInfoDto {
  int get bookingDaysAdvance => throw _privateConstructorUsedError;
  int get consultationMinutes => throw _privateConstructorUsedError;
  String get specialistId => throw _privateConstructorUsedError;
  Map<String, WorkDayPeriod> get workHours =>
      throw _privateConstructorUsedError;
  @JsonKey(fromJson: DateTimeUtils.convertToDateTimeList)
  List<DateTime> get excludedDays => throw _privateConstructorUsedError;
  @JsonKey(fromJson: DateTimeUtils.convertToDateTimeList)
  List<DateTime> get bookedTimes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpecialistWorkInfoDtoCopyWith<SpecialistWorkInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecialistWorkInfoDtoCopyWith<$Res> {
  factory $SpecialistWorkInfoDtoCopyWith(SpecialistWorkInfoDto value,
          $Res Function(SpecialistWorkInfoDto) then) =
      _$SpecialistWorkInfoDtoCopyWithImpl<$Res, SpecialistWorkInfoDto>;
  @useResult
  $Res call(
      {int bookingDaysAdvance,
      int consultationMinutes,
      String specialistId,
      Map<String, WorkDayPeriod> workHours,
      @JsonKey(fromJson: DateTimeUtils.convertToDateTimeList)
          List<DateTime> excludedDays,
      @JsonKey(fromJson: DateTimeUtils.convertToDateTimeList)
          List<DateTime> bookedTimes});
}

/// @nodoc
class _$SpecialistWorkInfoDtoCopyWithImpl<$Res,
        $Val extends SpecialistWorkInfoDto>
    implements $SpecialistWorkInfoDtoCopyWith<$Res> {
  _$SpecialistWorkInfoDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingDaysAdvance = null,
    Object? consultationMinutes = null,
    Object? specialistId = null,
    Object? workHours = null,
    Object? excludedDays = null,
    Object? bookedTimes = null,
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
      specialistId: null == specialistId
          ? _value.specialistId
          : specialistId // ignore: cast_nullable_to_non_nullable
              as String,
      workHours: null == workHours
          ? _value.workHours
          : workHours // ignore: cast_nullable_to_non_nullable
              as Map<String, WorkDayPeriod>,
      excludedDays: null == excludedDays
          ? _value.excludedDays
          : excludedDays // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      bookedTimes: null == bookedTimes
          ? _value.bookedTimes
          : bookedTimes // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SpecialistWorkInfoDtoCopyWith<$Res>
    implements $SpecialistWorkInfoDtoCopyWith<$Res> {
  factory _$$_SpecialistWorkInfoDtoCopyWith(_$_SpecialistWorkInfoDto value,
          $Res Function(_$_SpecialistWorkInfoDto) then) =
      __$$_SpecialistWorkInfoDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int bookingDaysAdvance,
      int consultationMinutes,
      String specialistId,
      Map<String, WorkDayPeriod> workHours,
      @JsonKey(fromJson: DateTimeUtils.convertToDateTimeList)
          List<DateTime> excludedDays,
      @JsonKey(fromJson: DateTimeUtils.convertToDateTimeList)
          List<DateTime> bookedTimes});
}

/// @nodoc
class __$$_SpecialistWorkInfoDtoCopyWithImpl<$Res>
    extends _$SpecialistWorkInfoDtoCopyWithImpl<$Res, _$_SpecialistWorkInfoDto>
    implements _$$_SpecialistWorkInfoDtoCopyWith<$Res> {
  __$$_SpecialistWorkInfoDtoCopyWithImpl(_$_SpecialistWorkInfoDto _value,
      $Res Function(_$_SpecialistWorkInfoDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingDaysAdvance = null,
    Object? consultationMinutes = null,
    Object? specialistId = null,
    Object? workHours = null,
    Object? excludedDays = null,
    Object? bookedTimes = null,
  }) {
    return _then(_$_SpecialistWorkInfoDto(
      bookingDaysAdvance: null == bookingDaysAdvance
          ? _value.bookingDaysAdvance
          : bookingDaysAdvance // ignore: cast_nullable_to_non_nullable
              as int,
      consultationMinutes: null == consultationMinutes
          ? _value.consultationMinutes
          : consultationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      specialistId: null == specialistId
          ? _value.specialistId
          : specialistId // ignore: cast_nullable_to_non_nullable
              as String,
      workHours: null == workHours
          ? _value._workHours
          : workHours // ignore: cast_nullable_to_non_nullable
              as Map<String, WorkDayPeriod>,
      excludedDays: null == excludedDays
          ? _value._excludedDays
          : excludedDays // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      bookedTimes: null == bookedTimes
          ? _value._bookedTimes
          : bookedTimes // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SpecialistWorkInfoDto
    with DiagnosticableTreeMixin
    implements _SpecialistWorkInfoDto {
  const _$_SpecialistWorkInfoDto(
      {required this.bookingDaysAdvance,
      required this.consultationMinutes,
      required this.specialistId,
      required final Map<String, WorkDayPeriod> workHours,
      @JsonKey(fromJson: DateTimeUtils.convertToDateTimeList)
          final List<DateTime> excludedDays = const <DateTime>[],
      @JsonKey(fromJson: DateTimeUtils.convertToDateTimeList)
          final List<DateTime> bookedTimes = const <DateTime>[]})
      : _workHours = workHours,
        _excludedDays = excludedDays,
        _bookedTimes = bookedTimes;

  factory _$_SpecialistWorkInfoDto.fromJson(Map<String, dynamic> json) =>
      _$$_SpecialistWorkInfoDtoFromJson(json);

  @override
  final int bookingDaysAdvance;
  @override
  final int consultationMinutes;
  @override
  final String specialistId;
  final Map<String, WorkDayPeriod> _workHours;
  @override
  Map<String, WorkDayPeriod> get workHours {
    if (_workHours is EqualUnmodifiableMapView) return _workHours;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_workHours);
  }

  final List<DateTime> _excludedDays;
  @override
  @JsonKey(fromJson: DateTimeUtils.convertToDateTimeList)
  List<DateTime> get excludedDays {
    if (_excludedDays is EqualUnmodifiableListView) return _excludedDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_excludedDays);
  }

  final List<DateTime> _bookedTimes;
  @override
  @JsonKey(fromJson: DateTimeUtils.convertToDateTimeList)
  List<DateTime> get bookedTimes {
    if (_bookedTimes is EqualUnmodifiableListView) return _bookedTimes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookedTimes);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SpecialistWorkInfoDto(bookingDaysAdvance: $bookingDaysAdvance, consultationMinutes: $consultationMinutes, specialistId: $specialistId, workHours: $workHours, excludedDays: $excludedDays, bookedTimes: $bookedTimes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SpecialistWorkInfoDto'))
      ..add(DiagnosticsProperty('bookingDaysAdvance', bookingDaysAdvance))
      ..add(DiagnosticsProperty('consultationMinutes', consultationMinutes))
      ..add(DiagnosticsProperty('specialistId', specialistId))
      ..add(DiagnosticsProperty('workHours', workHours))
      ..add(DiagnosticsProperty('excludedDays', excludedDays))
      ..add(DiagnosticsProperty('bookedTimes', bookedTimes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SpecialistWorkInfoDto &&
            (identical(other.bookingDaysAdvance, bookingDaysAdvance) ||
                other.bookingDaysAdvance == bookingDaysAdvance) &&
            (identical(other.consultationMinutes, consultationMinutes) ||
                other.consultationMinutes == consultationMinutes) &&
            (identical(other.specialistId, specialistId) ||
                other.specialistId == specialistId) &&
            const DeepCollectionEquality()
                .equals(other._workHours, _workHours) &&
            const DeepCollectionEquality()
                .equals(other._excludedDays, _excludedDays) &&
            const DeepCollectionEquality()
                .equals(other._bookedTimes, _bookedTimes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      bookingDaysAdvance,
      consultationMinutes,
      specialistId,
      const DeepCollectionEquality().hash(_workHours),
      const DeepCollectionEquality().hash(_excludedDays),
      const DeepCollectionEquality().hash(_bookedTimes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SpecialistWorkInfoDtoCopyWith<_$_SpecialistWorkInfoDto> get copyWith =>
      __$$_SpecialistWorkInfoDtoCopyWithImpl<_$_SpecialistWorkInfoDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SpecialistWorkInfoDtoToJson(
      this,
    );
  }
}

abstract class _SpecialistWorkInfoDto implements SpecialistWorkInfoDto {
  const factory _SpecialistWorkInfoDto(
      {required final int bookingDaysAdvance,
      required final int consultationMinutes,
      required final String specialistId,
      required final Map<String, WorkDayPeriod> workHours,
      @JsonKey(fromJson: DateTimeUtils.convertToDateTimeList)
          final List<DateTime> excludedDays,
      @JsonKey(fromJson: DateTimeUtils.convertToDateTimeList)
          final List<DateTime> bookedTimes}) = _$_SpecialistWorkInfoDto;

  factory _SpecialistWorkInfoDto.fromJson(Map<String, dynamic> json) =
      _$_SpecialistWorkInfoDto.fromJson;

  @override
  int get bookingDaysAdvance;
  @override
  int get consultationMinutes;
  @override
  String get specialistId;
  @override
  Map<String, WorkDayPeriod> get workHours;
  @override
  @JsonKey(fromJson: DateTimeUtils.convertToDateTimeList)
  List<DateTime> get excludedDays;
  @override
  @JsonKey(fromJson: DateTimeUtils.convertToDateTimeList)
  List<DateTime> get bookedTimes;
  @override
  @JsonKey(ignore: true)
  _$$_SpecialistWorkInfoDtoCopyWith<_$_SpecialistWorkInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}
