// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_data_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BookingDataDto _$BookingDataDtoFromJson(Map<String, dynamic> json) {
  return _BookingDataDto.fromJson(json);
}

/// @nodoc
mixin _$BookingDataDto {
  String get specialistId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  int get durationMinutes => throw _privateConstructorUsedError;
  @JsonKey(toJson: _toDateTime)
  DateTime get bookTime => throw _privateConstructorUsedError;
  @JsonKey(toJson: _toDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingDataDtoCopyWith<BookingDataDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingDataDtoCopyWith<$Res> {
  factory $BookingDataDtoCopyWith(
          BookingDataDto value, $Res Function(BookingDataDto) then) =
      _$BookingDataDtoCopyWithImpl<$Res, BookingDataDto>;
  @useResult
  $Res call(
      {String specialistId,
      String userId,
      String notes,
      int durationMinutes,
      @JsonKey(toJson: _toDateTime) DateTime bookTime,
      @JsonKey(toJson: _toDateTime) DateTime createdAt});
}

/// @nodoc
class _$BookingDataDtoCopyWithImpl<$Res, $Val extends BookingDataDto>
    implements $BookingDataDtoCopyWith<$Res> {
  _$BookingDataDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? specialistId = null,
    Object? userId = null,
    Object? notes = null,
    Object? durationMinutes = null,
    Object? bookTime = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      specialistId: null == specialistId
          ? _value.specialistId
          : specialistId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      bookTime: null == bookTime
          ? _value.bookTime
          : bookTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BookingDataDtoCopyWith<$Res>
    implements $BookingDataDtoCopyWith<$Res> {
  factory _$$_BookingDataDtoCopyWith(
          _$_BookingDataDto value, $Res Function(_$_BookingDataDto) then) =
      __$$_BookingDataDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String specialistId,
      String userId,
      String notes,
      int durationMinutes,
      @JsonKey(toJson: _toDateTime) DateTime bookTime,
      @JsonKey(toJson: _toDateTime) DateTime createdAt});
}

/// @nodoc
class __$$_BookingDataDtoCopyWithImpl<$Res>
    extends _$BookingDataDtoCopyWithImpl<$Res, _$_BookingDataDto>
    implements _$$_BookingDataDtoCopyWith<$Res> {
  __$$_BookingDataDtoCopyWithImpl(
      _$_BookingDataDto _value, $Res Function(_$_BookingDataDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? specialistId = null,
    Object? userId = null,
    Object? notes = null,
    Object? durationMinutes = null,
    Object? bookTime = null,
    Object? createdAt = null,
  }) {
    return _then(_$_BookingDataDto(
      specialistId: null == specialistId
          ? _value.specialistId
          : specialistId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      bookTime: null == bookTime
          ? _value.bookTime
          : bookTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BookingDataDto
    with DiagnosticableTreeMixin
    implements _BookingDataDto {
  const _$_BookingDataDto(
      {required this.specialistId,
      required this.userId,
      required this.notes,
      required this.durationMinutes,
      @JsonKey(toJson: _toDateTime) required this.bookTime,
      @JsonKey(toJson: _toDateTime) required this.createdAt});

  factory _$_BookingDataDto.fromJson(Map<String, dynamic> json) =>
      _$$_BookingDataDtoFromJson(json);

  @override
  final String specialistId;
  @override
  final String userId;
  @override
  final String notes;
  @override
  final int durationMinutes;
  @override
  @JsonKey(toJson: _toDateTime)
  final DateTime bookTime;
  @override
  @JsonKey(toJson: _toDateTime)
  final DateTime createdAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BookingDataDto(specialistId: $specialistId, userId: $userId, notes: $notes, durationMinutes: $durationMinutes, bookTime: $bookTime, createdAt: $createdAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BookingDataDto'))
      ..add(DiagnosticsProperty('specialistId', specialistId))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('notes', notes))
      ..add(DiagnosticsProperty('durationMinutes', durationMinutes))
      ..add(DiagnosticsProperty('bookTime', bookTime))
      ..add(DiagnosticsProperty('createdAt', createdAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookingDataDto &&
            (identical(other.specialistId, specialistId) ||
                other.specialistId == specialistId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.bookTime, bookTime) ||
                other.bookTime == bookTime) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, specialistId, userId, notes,
      durationMinutes, bookTime, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookingDataDtoCopyWith<_$_BookingDataDto> get copyWith =>
      __$$_BookingDataDtoCopyWithImpl<_$_BookingDataDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookingDataDtoToJson(
      this,
    );
  }
}

abstract class _BookingDataDto implements BookingDataDto {
  const factory _BookingDataDto(
          {required final String specialistId,
          required final String userId,
          required final String notes,
          required final int durationMinutes,
          @JsonKey(toJson: _toDateTime) required final DateTime bookTime,
          @JsonKey(toJson: _toDateTime) required final DateTime createdAt}) =
      _$_BookingDataDto;

  factory _BookingDataDto.fromJson(Map<String, dynamic> json) =
      _$_BookingDataDto.fromJson;

  @override
  String get specialistId;
  @override
  String get userId;
  @override
  String get notes;
  @override
  int get durationMinutes;
  @override
  @JsonKey(toJson: _toDateTime)
  DateTime get bookTime;
  @override
  @JsonKey(toJson: _toDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_BookingDataDtoCopyWith<_$_BookingDataDto> get copyWith =>
      throw _privateConstructorUsedError;
}
