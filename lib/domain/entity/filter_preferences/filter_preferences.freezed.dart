// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FilterPreferences {
  int? get lowPrice => throw _privateConstructorUsedError;
  int? get highPrice => throw _privateConstructorUsedError;
  ExperienceModel? get experience => throw _privateConstructorUsedError;
  List<String>? get specializations => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilterPreferencesCopyWith<FilterPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterPreferencesCopyWith<$Res> {
  factory $FilterPreferencesCopyWith(
          FilterPreferences value, $Res Function(FilterPreferences) then) =
      _$FilterPreferencesCopyWithImpl<$Res, FilterPreferences>;
  @useResult
  $Res call(
      {int? lowPrice,
      int? highPrice,
      ExperienceModel? experience,
      List<String>? specializations});
}

/// @nodoc
class _$FilterPreferencesCopyWithImpl<$Res, $Val extends FilterPreferences>
    implements $FilterPreferencesCopyWith<$Res> {
  _$FilterPreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lowPrice = freezed,
    Object? highPrice = freezed,
    Object? experience = freezed,
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
      experience: freezed == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as ExperienceModel?,
      specializations: freezed == specializations
          ? _value.specializations
          : specializations // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FilterPreferencesCopyWith<$Res>
    implements $FilterPreferencesCopyWith<$Res> {
  factory _$$_FilterPreferencesCopyWith(_$_FilterPreferences value,
          $Res Function(_$_FilterPreferences) then) =
      __$$_FilterPreferencesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? lowPrice,
      int? highPrice,
      ExperienceModel? experience,
      List<String>? specializations});
}

/// @nodoc
class __$$_FilterPreferencesCopyWithImpl<$Res>
    extends _$FilterPreferencesCopyWithImpl<$Res, _$_FilterPreferences>
    implements _$$_FilterPreferencesCopyWith<$Res> {
  __$$_FilterPreferencesCopyWithImpl(
      _$_FilterPreferences _value, $Res Function(_$_FilterPreferences) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lowPrice = freezed,
    Object? highPrice = freezed,
    Object? experience = freezed,
    Object? specializations = freezed,
  }) {
    return _then(_$_FilterPreferences(
      lowPrice: freezed == lowPrice
          ? _value.lowPrice
          : lowPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      highPrice: freezed == highPrice
          ? _value.highPrice
          : highPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      experience: freezed == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as ExperienceModel?,
      specializations: freezed == specializations
          ? _value._specializations
          : specializations // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$_FilterPreferences extends _FilterPreferences
    with DiagnosticableTreeMixin {
  const _$_FilterPreferences(
      {this.lowPrice,
      this.highPrice,
      this.experience,
      final List<String>? specializations})
      : _specializations = specializations,
        super._();

  @override
  final int? lowPrice;
  @override
  final int? highPrice;
  @override
  final ExperienceModel? experience;
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
    return 'FilterPreferences(lowPrice: $lowPrice, highPrice: $highPrice, experience: $experience, specializations: $specializations)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FilterPreferences'))
      ..add(DiagnosticsProperty('lowPrice', lowPrice))
      ..add(DiagnosticsProperty('highPrice', highPrice))
      ..add(DiagnosticsProperty('experience', experience))
      ..add(DiagnosticsProperty('specializations', specializations));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FilterPreferences &&
            (identical(other.lowPrice, lowPrice) ||
                other.lowPrice == lowPrice) &&
            (identical(other.highPrice, highPrice) ||
                other.highPrice == highPrice) &&
            (identical(other.experience, experience) ||
                other.experience == experience) &&
            const DeepCollectionEquality()
                .equals(other._specializations, _specializations));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lowPrice, highPrice, experience,
      const DeepCollectionEquality().hash(_specializations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FilterPreferencesCopyWith<_$_FilterPreferences> get copyWith =>
      __$$_FilterPreferencesCopyWithImpl<_$_FilterPreferences>(
          this, _$identity);
}

abstract class _FilterPreferences extends FilterPreferences {
  const factory _FilterPreferences(
      {final int? lowPrice,
      final int? highPrice,
      final ExperienceModel? experience,
      final List<String>? specializations}) = _$_FilterPreferences;
  const _FilterPreferences._() : super._();

  @override
  int? get lowPrice;
  @override
  int? get highPrice;
  @override
  ExperienceModel? get experience;
  @override
  List<String>? get specializations;
  @override
  @JsonKey(ignore: true)
  _$$_FilterPreferencesCopyWith<_$_FilterPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}
