// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_day_period.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WorkDayPeriod _$WorkDayPeriodFromJson(Map<String, dynamic> json) {
  return _WorkDayPeriod.fromJson(json);
}

/// @nodoc
mixin _$WorkDayPeriod {
  String get start => throw _privateConstructorUsedError;
  String get end => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkDayPeriodCopyWith<WorkDayPeriod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkDayPeriodCopyWith<$Res> {
  factory $WorkDayPeriodCopyWith(
          WorkDayPeriod value, $Res Function(WorkDayPeriod) then) =
      _$WorkDayPeriodCopyWithImpl<$Res, WorkDayPeriod>;
  @useResult
  $Res call({String start, String end});
}

/// @nodoc
class _$WorkDayPeriodCopyWithImpl<$Res, $Val extends WorkDayPeriod>
    implements $WorkDayPeriodCopyWith<$Res> {
  _$WorkDayPeriodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_value.copyWith(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WorkDayPeriodCopyWith<$Res>
    implements $WorkDayPeriodCopyWith<$Res> {
  factory _$$_WorkDayPeriodCopyWith(
          _$_WorkDayPeriod value, $Res Function(_$_WorkDayPeriod) then) =
      __$$_WorkDayPeriodCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String start, String end});
}

/// @nodoc
class __$$_WorkDayPeriodCopyWithImpl<$Res>
    extends _$WorkDayPeriodCopyWithImpl<$Res, _$_WorkDayPeriod>
    implements _$$_WorkDayPeriodCopyWith<$Res> {
  __$$_WorkDayPeriodCopyWithImpl(
      _$_WorkDayPeriod _value, $Res Function(_$_WorkDayPeriod) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_$_WorkDayPeriod(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WorkDayPeriod with DiagnosticableTreeMixin implements _WorkDayPeriod {
  const _$_WorkDayPeriod({required this.start, required this.end});

  factory _$_WorkDayPeriod.fromJson(Map<String, dynamic> json) =>
      _$$_WorkDayPeriodFromJson(json);

  @override
  final String start;
  @override
  final String end;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WorkDayPeriod(start: $start, end: $end)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WorkDayPeriod'))
      ..add(DiagnosticsProperty('start', start))
      ..add(DiagnosticsProperty('end', end));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WorkDayPeriod &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, start, end);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WorkDayPeriodCopyWith<_$_WorkDayPeriod> get copyWith =>
      __$$_WorkDayPeriodCopyWithImpl<_$_WorkDayPeriod>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WorkDayPeriodToJson(
      this,
    );
  }
}

abstract class _WorkDayPeriod implements WorkDayPeriod {
  const factory _WorkDayPeriod(
      {required final String start,
      required final String end}) = _$_WorkDayPeriod;

  factory _WorkDayPeriod.fromJson(Map<String, dynamic> json) =
      _$_WorkDayPeriod.fromJson;

  @override
  String get start;
  @override
  String get end;
  @override
  @JsonKey(ignore: true)
  _$$_WorkDayPeriodCopyWith<_$_WorkDayPeriod> get copyWith =>
      throw _privateConstructorUsedError;
}
