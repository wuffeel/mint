// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SessionData {
  String get id => throw _privateConstructorUsedError;
  SpecialistModel get specialistModel => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  DateTime get bookTime => throw _privateConstructorUsedError;
  int get durationMinutes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SessionDataCopyWith<SessionData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionDataCopyWith<$Res> {
  factory $SessionDataCopyWith(
          SessionData value, $Res Function(SessionData) then) =
      _$SessionDataCopyWithImpl<$Res, SessionData>;
  @useResult
  $Res call(
      {String id,
      SpecialistModel specialistModel,
      String notes,
      DateTime bookTime,
      int durationMinutes});

  $SpecialistModelCopyWith<$Res> get specialistModel;
}

/// @nodoc
class _$SessionDataCopyWithImpl<$Res, $Val extends SessionData>
    implements $SessionDataCopyWith<$Res> {
  _$SessionDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? specialistModel = null,
    Object? notes = null,
    Object? bookTime = null,
    Object? durationMinutes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      specialistModel: null == specialistModel
          ? _value.specialistModel
          : specialistModel // ignore: cast_nullable_to_non_nullable
              as SpecialistModel,
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

  @override
  @pragma('vm:prefer-inline')
  $SpecialistModelCopyWith<$Res> get specialistModel {
    return $SpecialistModelCopyWith<$Res>(_value.specialistModel, (value) {
      return _then(_value.copyWith(specialistModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SessionDataCopyWith<$Res>
    implements $SessionDataCopyWith<$Res> {
  factory _$$_SessionDataCopyWith(
          _$_SessionData value, $Res Function(_$_SessionData) then) =
      __$$_SessionDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      SpecialistModel specialistModel,
      String notes,
      DateTime bookTime,
      int durationMinutes});

  @override
  $SpecialistModelCopyWith<$Res> get specialistModel;
}

/// @nodoc
class __$$_SessionDataCopyWithImpl<$Res>
    extends _$SessionDataCopyWithImpl<$Res, _$_SessionData>
    implements _$$_SessionDataCopyWith<$Res> {
  __$$_SessionDataCopyWithImpl(
      _$_SessionData _value, $Res Function(_$_SessionData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? specialistModel = null,
    Object? notes = null,
    Object? bookTime = null,
    Object? durationMinutes = null,
  }) {
    return _then(_$_SessionData(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      specialistModel: null == specialistModel
          ? _value.specialistModel
          : specialistModel // ignore: cast_nullable_to_non_nullable
              as SpecialistModel,
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

class _$_SessionData with DiagnosticableTreeMixin implements _SessionData {
  const _$_SessionData(
      {required this.id,
      required this.specialistModel,
      required this.notes,
      required this.bookTime,
      required this.durationMinutes});

  @override
  final String id;
  @override
  final SpecialistModel specialistModel;
  @override
  final String notes;
  @override
  final DateTime bookTime;
  @override
  final int durationMinutes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SessionData(id: $id, specialistModel: $specialistModel, notes: $notes, bookTime: $bookTime, durationMinutes: $durationMinutes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SessionData'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('specialistModel', specialistModel))
      ..add(DiagnosticsProperty('notes', notes))
      ..add(DiagnosticsProperty('bookTime', bookTime))
      ..add(DiagnosticsProperty('durationMinutes', durationMinutes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SessionData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.specialistModel, specialistModel) ||
                other.specialistModel == specialistModel) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.bookTime, bookTime) ||
                other.bookTime == bookTime) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, specialistModel, notes, bookTime, durationMinutes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SessionDataCopyWith<_$_SessionData> get copyWith =>
      __$$_SessionDataCopyWithImpl<_$_SessionData>(this, _$identity);
}

abstract class _SessionData implements SessionData {
  const factory _SessionData(
      {required final String id,
      required final SpecialistModel specialistModel,
      required final String notes,
      required final DateTime bookTime,
      required final int durationMinutes}) = _$_SessionData;

  @override
  String get id;
  @override
  SpecialistModel get specialistModel;
  @override
  String get notes;
  @override
  DateTime get bookTime;
  @override
  int get durationMinutes;
  @override
  @JsonKey(ignore: true)
  _$$_SessionDataCopyWith<_$_SessionData> get copyWith =>
      throw _privateConstructorUsedError;
}
