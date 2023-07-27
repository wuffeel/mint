// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_data_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SessionDataDto _$SessionDataDtoFromJson(Map<String, dynamic> json) {
  return _SessionDataDto.fromJson(json);
}

/// @nodoc
mixin _$SessionDataDto {
  String get id => throw _privateConstructorUsedError;
  String get specialistId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  int get durationMinutes => throw _privateConstructorUsedError;
  @JsonKey(fromJson: DateUtils.convertToDateTime)
  DateTime get bookTime => throw _privateConstructorUsedError;
  @JsonKey(fromJson: DateUtils.convertToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SessionDataDtoCopyWith<SessionDataDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionDataDtoCopyWith<$Res> {
  factory $SessionDataDtoCopyWith(
          SessionDataDto value, $Res Function(SessionDataDto) then) =
      _$SessionDataDtoCopyWithImpl<$Res, SessionDataDto>;
  @useResult
  $Res call(
      {String id,
      String specialistId,
      String userId,
      String notes,
      int durationMinutes,
      @JsonKey(fromJson: DateUtils.convertToDateTime) DateTime bookTime,
      @JsonKey(fromJson: DateUtils.convertToDateTime) DateTime createdAt});
}

/// @nodoc
class _$SessionDataDtoCopyWithImpl<$Res, $Val extends SessionDataDto>
    implements $SessionDataDtoCopyWith<$Res> {
  _$SessionDataDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? specialistId = null,
    Object? userId = null,
    Object? notes = null,
    Object? durationMinutes = null,
    Object? bookTime = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$_SessionDataDtoCopyWith<$Res>
    implements $SessionDataDtoCopyWith<$Res> {
  factory _$$_SessionDataDtoCopyWith(
          _$_SessionDataDto value, $Res Function(_$_SessionDataDto) then) =
      __$$_SessionDataDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String specialistId,
      String userId,
      String notes,
      int durationMinutes,
      @JsonKey(fromJson: DateUtils.convertToDateTime) DateTime bookTime,
      @JsonKey(fromJson: DateUtils.convertToDateTime) DateTime createdAt});
}

/// @nodoc
class __$$_SessionDataDtoCopyWithImpl<$Res>
    extends _$SessionDataDtoCopyWithImpl<$Res, _$_SessionDataDto>
    implements _$$_SessionDataDtoCopyWith<$Res> {
  __$$_SessionDataDtoCopyWithImpl(
      _$_SessionDataDto _value, $Res Function(_$_SessionDataDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? specialistId = null,
    Object? userId = null,
    Object? notes = null,
    Object? durationMinutes = null,
    Object? bookTime = null,
    Object? createdAt = null,
  }) {
    return _then(_$_SessionDataDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$_SessionDataDto
    with DiagnosticableTreeMixin
    implements _SessionDataDto {
  const _$_SessionDataDto(
      {required this.id,
      required this.specialistId,
      required this.userId,
      required this.notes,
      required this.durationMinutes,
      @JsonKey(fromJson: DateUtils.convertToDateTime) required this.bookTime,
      @JsonKey(fromJson: DateUtils.convertToDateTime) required this.createdAt});

  factory _$_SessionDataDto.fromJson(Map<String, dynamic> json) =>
      _$$_SessionDataDtoFromJson(json);

  @override
  final String id;
  @override
  final String specialistId;
  @override
  final String userId;
  @override
  final String notes;
  @override
  final int durationMinutes;
  @override
  @JsonKey(fromJson: DateUtils.convertToDateTime)
  final DateTime bookTime;
  @override
  @JsonKey(fromJson: DateUtils.convertToDateTime)
  final DateTime createdAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SessionDataDto(id: $id, specialistId: $specialistId, userId: $userId, notes: $notes, durationMinutes: $durationMinutes, bookTime: $bookTime, createdAt: $createdAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SessionDataDto'))
      ..add(DiagnosticsProperty('id', id))
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
            other is _$_SessionDataDto &&
            (identical(other.id, id) || other.id == id) &&
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
  int get hashCode => Object.hash(runtimeType, id, specialistId, userId, notes,
      durationMinutes, bookTime, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SessionDataDtoCopyWith<_$_SessionDataDto> get copyWith =>
      __$$_SessionDataDtoCopyWithImpl<_$_SessionDataDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SessionDataDtoToJson(
      this,
    );
  }
}

abstract class _SessionDataDto implements SessionDataDto {
  const factory _SessionDataDto(
      {required final String id,
      required final String specialistId,
      required final String userId,
      required final String notes,
      required final int durationMinutes,
      @JsonKey(fromJson: DateUtils.convertToDateTime)
          required final DateTime bookTime,
      @JsonKey(fromJson: DateUtils.convertToDateTime)
          required final DateTime createdAt}) = _$_SessionDataDto;

  factory _SessionDataDto.fromJson(Map<String, dynamic> json) =
      _$_SessionDataDto.fromJson;

  @override
  String get id;
  @override
  String get specialistId;
  @override
  String get userId;
  @override
  String get notes;
  @override
  int get durationMinutes;
  @override
  @JsonKey(fromJson: DateUtils.convertToDateTime)
  DateTime get bookTime;
  @override
  @JsonKey(fromJson: DateUtils.convertToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_SessionDataDtoCopyWith<_$_SessionDataDto> get copyWith =>
      throw _privateConstructorUsedError;
}
