// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pick_up_preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PickUpPreferences {
  String? get communicationMember => throw _privateConstructorUsedError;
  bool? get haveBeenToTherapy => throw _privateConstructorUsedError;
  PriceRangeModel? get priceRange => throw _privateConstructorUsedError;
  List<String>? get specializations => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PickUpPreferencesCopyWith<PickUpPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PickUpPreferencesCopyWith<$Res> {
  factory $PickUpPreferencesCopyWith(
          PickUpPreferences value, $Res Function(PickUpPreferences) then) =
      _$PickUpPreferencesCopyWithImpl<$Res, PickUpPreferences>;
  @useResult
  $Res call(
      {String? communicationMember,
      bool? haveBeenToTherapy,
      PriceRangeModel? priceRange,
      List<String>? specializations});
}

/// @nodoc
class _$PickUpPreferencesCopyWithImpl<$Res, $Val extends PickUpPreferences>
    implements $PickUpPreferencesCopyWith<$Res> {
  _$PickUpPreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? communicationMember = freezed,
    Object? haveBeenToTherapy = freezed,
    Object? priceRange = freezed,
    Object? specializations = freezed,
  }) {
    return _then(_value.copyWith(
      communicationMember: freezed == communicationMember
          ? _value.communicationMember
          : communicationMember // ignore: cast_nullable_to_non_nullable
              as String?,
      haveBeenToTherapy: freezed == haveBeenToTherapy
          ? _value.haveBeenToTherapy
          : haveBeenToTherapy // ignore: cast_nullable_to_non_nullable
              as bool?,
      priceRange: freezed == priceRange
          ? _value.priceRange
          : priceRange // ignore: cast_nullable_to_non_nullable
              as PriceRangeModel?,
      specializations: freezed == specializations
          ? _value.specializations
          : specializations // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PickUpPreferencesCopyWith<$Res>
    implements $PickUpPreferencesCopyWith<$Res> {
  factory _$$_PickUpPreferencesCopyWith(_$_PickUpPreferences value,
          $Res Function(_$_PickUpPreferences) then) =
      __$$_PickUpPreferencesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? communicationMember,
      bool? haveBeenToTherapy,
      PriceRangeModel? priceRange,
      List<String>? specializations});
}

/// @nodoc
class __$$_PickUpPreferencesCopyWithImpl<$Res>
    extends _$PickUpPreferencesCopyWithImpl<$Res, _$_PickUpPreferences>
    implements _$$_PickUpPreferencesCopyWith<$Res> {
  __$$_PickUpPreferencesCopyWithImpl(
      _$_PickUpPreferences _value, $Res Function(_$_PickUpPreferences) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? communicationMember = freezed,
    Object? haveBeenToTherapy = freezed,
    Object? priceRange = freezed,
    Object? specializations = freezed,
  }) {
    return _then(_$_PickUpPreferences(
      communicationMember: freezed == communicationMember
          ? _value.communicationMember
          : communicationMember // ignore: cast_nullable_to_non_nullable
              as String?,
      haveBeenToTherapy: freezed == haveBeenToTherapy
          ? _value.haveBeenToTherapy
          : haveBeenToTherapy // ignore: cast_nullable_to_non_nullable
              as bool?,
      priceRange: freezed == priceRange
          ? _value.priceRange
          : priceRange // ignore: cast_nullable_to_non_nullable
              as PriceRangeModel?,
      specializations: freezed == specializations
          ? _value._specializations
          : specializations // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$_PickUpPreferences extends _PickUpPreferences {
  const _$_PickUpPreferences(
      {this.communicationMember,
      this.haveBeenToTherapy,
      this.priceRange,
      final List<String>? specializations})
      : _specializations = specializations,
        super._();

  @override
  final String? communicationMember;
  @override
  final bool? haveBeenToTherapy;
  @override
  final PriceRangeModel? priceRange;
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
  String toString() {
    return 'PickUpPreferences(communicationMember: $communicationMember, haveBeenToTherapy: $haveBeenToTherapy, priceRange: $priceRange, specializations: $specializations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PickUpPreferences &&
            (identical(other.communicationMember, communicationMember) ||
                other.communicationMember == communicationMember) &&
            (identical(other.haveBeenToTherapy, haveBeenToTherapy) ||
                other.haveBeenToTherapy == haveBeenToTherapy) &&
            (identical(other.priceRange, priceRange) ||
                other.priceRange == priceRange) &&
            const DeepCollectionEquality()
                .equals(other._specializations, _specializations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      communicationMember,
      haveBeenToTherapy,
      priceRange,
      const DeepCollectionEquality().hash(_specializations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PickUpPreferencesCopyWith<_$_PickUpPreferences> get copyWith =>
      __$$_PickUpPreferencesCopyWithImpl<_$_PickUpPreferences>(
          this, _$identity);
}

abstract class _PickUpPreferences extends PickUpPreferences {
  const factory _PickUpPreferences(
      {final String? communicationMember,
      final bool? haveBeenToTherapy,
      final PriceRangeModel? priceRange,
      final List<String>? specializations}) = _$_PickUpPreferences;
  const _PickUpPreferences._() : super._();

  @override
  String? get communicationMember;
  @override
  bool? get haveBeenToTherapy;
  @override
  PriceRangeModel? get priceRange;
  @override
  List<String>? get specializations;
  @override
  @JsonKey(ignore: true)
  _$$_PickUpPreferencesCopyWith<_$_PickUpPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}
