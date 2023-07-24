// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BookingData {
  String get id => throw _privateConstructorUsedError;
  String get specialistId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  DateTime get bookTime => throw _privateConstructorUsedError;
  int get durationMinutes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookingDataCopyWith<BookingData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingDataCopyWith<$Res> {
  factory $BookingDataCopyWith(
          BookingData value, $Res Function(BookingData) then) =
      _$BookingDataCopyWithImpl<$Res, BookingData>;
  @useResult
  $Res call(
      {String id,
      String specialistId,
      String userId,
      String notes,
      DateTime bookTime,
      int durationMinutes});
}

/// @nodoc
class _$BookingDataCopyWithImpl<$Res, $Val extends BookingData>
    implements $BookingDataCopyWith<$Res> {
  _$BookingDataCopyWithImpl(this._value, this._then);

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
    Object? bookTime = null,
    Object? durationMinutes = null,
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
      bookTime: null == bookTime
          ? _value.bookTime
          : bookTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BookingDataCopyWith<$Res>
    implements $BookingDataCopyWith<$Res> {
  factory _$$_BookingDataCopyWith(
          _$_BookingData value, $Res Function(_$_BookingData) then) =
      __$$_BookingDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String specialistId,
      String userId,
      String notes,
      DateTime bookTime,
      int durationMinutes});
}

/// @nodoc
class __$$_BookingDataCopyWithImpl<$Res>
    extends _$BookingDataCopyWithImpl<$Res, _$_BookingData>
    implements _$$_BookingDataCopyWith<$Res> {
  __$$_BookingDataCopyWithImpl(
      _$_BookingData _value, $Res Function(_$_BookingData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? specialistId = null,
    Object? userId = null,
    Object? notes = null,
    Object? bookTime = null,
    Object? durationMinutes = null,
  }) {
    return _then(_$_BookingData(
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
      bookTime: null == bookTime
          ? _value.bookTime
          : bookTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_BookingData with DiagnosticableTreeMixin implements _BookingData {
  const _$_BookingData(
      {required this.id,
      required this.specialistId,
      required this.userId,
      required this.notes,
      required this.bookTime,
      required this.durationMinutes});

  @override
  final String id;
  @override
  final String specialistId;
  @override
  final String userId;
  @override
  final String notes;
  @override
  final DateTime bookTime;
  @override
  final int durationMinutes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BookingData(id: $id, specialistId: $specialistId, userId: $userId, notes: $notes, bookTime: $bookTime, durationMinutes: $durationMinutes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BookingData'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('specialistId', specialistId))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('notes', notes))
      ..add(DiagnosticsProperty('bookTime', bookTime))
      ..add(DiagnosticsProperty('durationMinutes', durationMinutes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookingData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.specialistId, specialistId) ||
                other.specialistId == specialistId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.bookTime, bookTime) ||
                other.bookTime == bookTime) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, specialistId, userId, notes, bookTime, durationMinutes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookingDataCopyWith<_$_BookingData> get copyWith =>
      __$$_BookingDataCopyWithImpl<_$_BookingData>(this, _$identity);
}

abstract class _BookingData implements BookingData {
  const factory _BookingData(
      {required final String id,
      required final String specialistId,
      required final String userId,
      required final String notes,
      required final DateTime bookTime,
      required final int durationMinutes}) = _$_BookingData;

  @override
  String get id;
  @override
  String get specialistId;
  @override
  String get userId;
  @override
  String get notes;
  @override
  DateTime get bookTime;
  @override
  int get durationMinutes;
  @override
  @JsonKey(ignore: true)
  _$$_BookingDataCopyWith<_$_BookingData> get copyWith =>
      throw _privateConstructorUsedError;
}
