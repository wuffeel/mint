// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_preferences_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FilterPreferencesDto {
  int? get lowPrice => throw _privateConstructorUsedError;
  int? get highPrice => throw _privateConstructorUsedError;
  DateTime? get experienceFrom => throw _privateConstructorUsedError;
  DateTime? get experienceTo => throw _privateConstructorUsedError;
  bool? get isExperienceLessOrMoreThan => throw _privateConstructorUsedError;
  List<String>? get specializations => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilterPreferencesDtoCopyWith<FilterPreferencesDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterPreferencesDtoCopyWith<$Res> {
  factory $FilterPreferencesDtoCopyWith(FilterPreferencesDto value,
          $Res Function(FilterPreferencesDto) then) =
      _$FilterPreferencesDtoCopyWithImpl<$Res, FilterPreferencesDto>;
  @useResult
  $Res call(
      {int? lowPrice,
      int? highPrice,
      DateTime? experienceFrom,
      DateTime? experienceTo,
      bool? isExperienceLessOrMoreThan,
      List<String>? specializations});
}

/// @nodoc
class _$FilterPreferencesDtoCopyWithImpl<$Res,
        $Val extends FilterPreferencesDto>
    implements $FilterPreferencesDtoCopyWith<$Res> {
  _$FilterPreferencesDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lowPrice = freezed,
    Object? highPrice = freezed,
    Object? experienceFrom = freezed,
    Object? experienceTo = freezed,
    Object? isExperienceLessOrMoreThan = freezed,
    Object? specializations = freezed,
  }) {
    return _then(_value.copyWith(
      lowPrice: freezed == lowPrice
          ? _value.lowPrice
          : lowPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      highPrice: freezed == highPrice
          ? _value.highPrice
          : highPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      experienceFrom: freezed == experienceFrom
          ? _value.experienceFrom
          : experienceFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      experienceTo: freezed == experienceTo
          ? _value.experienceTo
          : experienceTo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isExperienceLessOrMoreThan: freezed == isExperienceLessOrMoreThan
          ? _value.isExperienceLessOrMoreThan
          : isExperienceLessOrMoreThan // ignore: cast_nullable_to_non_nullable
              as bool?,
      specializations: freezed == specializations
          ? _value.specializations
          : specializations // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FilterPreferencesDtoCopyWith<$Res>
    implements $FilterPreferencesDtoCopyWith<$Res> {
  factory _$$_FilterPreferencesDtoCopyWith(_$_FilterPreferencesDto value,
          $Res Function(_$_FilterPreferencesDto) then) =
      __$$_FilterPreferencesDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? lowPrice,
      int? highPrice,
      DateTime? experienceFrom,
      DateTime? experienceTo,
      bool? isExperienceLessOrMoreThan,
      List<String>? specializations});
}

/// @nodoc
class __$$_FilterPreferencesDtoCopyWithImpl<$Res>
    extends _$FilterPreferencesDtoCopyWithImpl<$Res, _$_FilterPreferencesDto>
    implements _$$_FilterPreferencesDtoCopyWith<$Res> {
  __$$_FilterPreferencesDtoCopyWithImpl(_$_FilterPreferencesDto _value,
      $Res Function(_$_FilterPreferencesDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lowPrice = freezed,
    Object? highPrice = freezed,
    Object? experienceFrom = freezed,
    Object? experienceTo = freezed,
    Object? isExperienceLessOrMoreThan = freezed,
    Object? specializations = freezed,
  }) {
    return _then(_$_FilterPreferencesDto(
      lowPrice: freezed == lowPrice
          ? _value.lowPrice
          : lowPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      highPrice: freezed == highPrice
          ? _value.highPrice
          : highPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      experienceFrom: freezed == experienceFrom
          ? _value.experienceFrom
          : experienceFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      experienceTo: freezed == experienceTo
          ? _value.experienceTo
          : experienceTo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isExperienceLessOrMoreThan: freezed == isExperienceLessOrMoreThan
          ? _value.isExperienceLessOrMoreThan
          : isExperienceLessOrMoreThan // ignore: cast_nullable_to_non_nullable
              as bool?,
      specializations: freezed == specializations
          ? _value._specializations
          : specializations // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$_FilterPreferencesDto extends _FilterPreferencesDto
    with DiagnosticableTreeMixin {
  const _$_FilterPreferencesDto(
      {this.lowPrice,
      this.highPrice,
      this.experienceFrom,
      this.experienceTo,
      this.isExperienceLessOrMoreThan,
      final List<String>? specializations})
      : _specializations = specializations,
        super._();

  @override
  final int? lowPrice;
  @override
  final int? highPrice;
  @override
  final DateTime? experienceFrom;
  @override
  final DateTime? experienceTo;
  @override
  final bool? isExperienceLessOrMoreThan;
  final List<String>? _specializations;
  @override
  List<String>? get specializations {
    final value = _specializations;
    if (value == null) return null;
    if (_specializations is EqualUnmodifiableListView) return _specializations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FilterPreferencesDto(lowPrice: $lowPrice, highPrice: $highPrice, experienceFrom: $experienceFrom, experienceTo: $experienceTo, isExperienceLessOrMoreThan: $isExperienceLessOrMoreThan, specializations: $specializations)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FilterPreferencesDto'))
      ..add(DiagnosticsProperty('lowPrice', lowPrice))
      ..add(DiagnosticsProperty('highPrice', highPrice))
      ..add(DiagnosticsProperty('experienceFrom', experienceFrom))
      ..add(DiagnosticsProperty('experienceTo', experienceTo))
      ..add(DiagnosticsProperty(
          'isExperienceLessOrMoreThan', isExperienceLessOrMoreThan))
      ..add(DiagnosticsProperty('specializations', specializations));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FilterPreferencesDto &&
            (identical(other.lowPrice, lowPrice) ||
                other.lowPrice == lowPrice) &&
            (identical(other.highPrice, highPrice) ||
                other.highPrice == highPrice) &&
            (identical(other.experienceFrom, experienceFrom) ||
                other.experienceFrom == experienceFrom) &&
            (identical(other.experienceTo, experienceTo) ||
                other.experienceTo == experienceTo) &&
            (identical(other.isExperienceLessOrMoreThan,
                    isExperienceLessOrMoreThan) ||
                other.isExperienceLessOrMoreThan ==
                    isExperienceLessOrMoreThan) &&
            const DeepCollectionEquality()
                .equals(other._specializations, _specializations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      lowPrice,
      highPrice,
      experienceFrom,
      experienceTo,
      isExperienceLessOrMoreThan,
      const DeepCollectionEquality().hash(_specializations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FilterPreferencesDtoCopyWith<_$_FilterPreferencesDto> get copyWith =>
      __$$_FilterPreferencesDtoCopyWithImpl<_$_FilterPreferencesDto>(
          this, _$identity);
}

abstract class _FilterPreferencesDto extends FilterPreferencesDto {
  const factory _FilterPreferencesDto(
      {final int? lowPrice,
      final int? highPrice,
      final DateTime? experienceFrom,
      final DateTime? experienceTo,
      final bool? isExperienceLessOrMoreThan,
      final List<String>? specializations}) = _$_FilterPreferencesDto;
  const _FilterPreferencesDto._() : super._();

  @override
  int? get lowPrice;
  @override
  int? get highPrice;
  @override
  DateTime? get experienceFrom;
  @override
  DateTime? get experienceTo;
  @override
  bool? get isExperienceLessOrMoreThan;
  @override
  List<String>? get specializations;
  @override
  @JsonKey(ignore: true)
  _$$_FilterPreferencesDtoCopyWith<_$_FilterPreferencesDto> get copyWith =>
      throw _privateConstructorUsedError;
}
