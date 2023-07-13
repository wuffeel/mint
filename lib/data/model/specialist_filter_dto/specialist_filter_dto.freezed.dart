// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'specialist_filter_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SpecialistFilterDto _$SpecialistFilterDtoFromJson(Map<String, dynamic> json) {
  return _SpecialistFilterDto.fromJson(json);
}

/// @nodoc
mixin _$SpecialistFilterDto {
  int get minPrice => throw _privateConstructorUsedError;
  int get maxPrice => throw _privateConstructorUsedError;
  List<String> get experience => throw _privateConstructorUsedError;
  List<String> get specializations => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpecialistFilterDtoCopyWith<SpecialistFilterDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecialistFilterDtoCopyWith<$Res> {
  factory $SpecialistFilterDtoCopyWith(
          SpecialistFilterDto value, $Res Function(SpecialistFilterDto) then) =
      _$SpecialistFilterDtoCopyWithImpl<$Res, SpecialistFilterDto>;
  @useResult
  $Res call(
      {int minPrice,
      int maxPrice,
      List<String> experience,
      List<String> specializations});
}

/// @nodoc
class _$SpecialistFilterDtoCopyWithImpl<$Res, $Val extends SpecialistFilterDto>
    implements $SpecialistFilterDtoCopyWith<$Res> {
  _$SpecialistFilterDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minPrice = null,
    Object? maxPrice = null,
    Object? experience = null,
    Object? specializations = null,
  }) {
    return _then(_value.copyWith(
      minPrice: null == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as int,
      maxPrice: null == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as int,
      experience: null == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as List<String>,
      specializations: null == specializations
          ? _value.specializations
          : specializations // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SpecialistFilterDtoCopyWith<$Res>
    implements $SpecialistFilterDtoCopyWith<$Res> {
  factory _$$_SpecialistFilterDtoCopyWith(_$_SpecialistFilterDto value,
          $Res Function(_$_SpecialistFilterDto) then) =
      __$$_SpecialistFilterDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int minPrice,
      int maxPrice,
      List<String> experience,
      List<String> specializations});
}

/// @nodoc
class __$$_SpecialistFilterDtoCopyWithImpl<$Res>
    extends _$SpecialistFilterDtoCopyWithImpl<$Res, _$_SpecialistFilterDto>
    implements _$$_SpecialistFilterDtoCopyWith<$Res> {
  __$$_SpecialistFilterDtoCopyWithImpl(_$_SpecialistFilterDto _value,
      $Res Function(_$_SpecialistFilterDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minPrice = null,
    Object? maxPrice = null,
    Object? experience = null,
    Object? specializations = null,
  }) {
    return _then(_$_SpecialistFilterDto(
      minPrice: null == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as int,
      maxPrice: null == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as int,
      experience: null == experience
          ? _value._experience
          : experience // ignore: cast_nullable_to_non_nullable
              as List<String>,
      specializations: null == specializations
          ? _value._specializations
          : specializations // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SpecialistFilterDto extends _SpecialistFilterDto
    with DiagnosticableTreeMixin {
  const _$_SpecialistFilterDto(
      {required this.minPrice,
      required this.maxPrice,
      required final List<String> experience,
      required final List<String> specializations})
      : _experience = experience,
        _specializations = specializations,
        super._();

  factory _$_SpecialistFilterDto.fromJson(Map<String, dynamic> json) =>
      _$$_SpecialistFilterDtoFromJson(json);

  @override
  final int minPrice;
  @override
  final int maxPrice;
  final List<String> _experience;
  @override
  List<String> get experience {
    if (_experience is EqualUnmodifiableListView) return _experience;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_experience);
  }

  final List<String> _specializations;
  @override
  List<String> get specializations {
    if (_specializations is EqualUnmodifiableListView) return _specializations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_specializations);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SpecialistFilterDto(minPrice: $minPrice, maxPrice: $maxPrice, experience: $experience, specializations: $specializations)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SpecialistFilterDto'))
      ..add(DiagnosticsProperty('minPrice', minPrice))
      ..add(DiagnosticsProperty('maxPrice', maxPrice))
      ..add(DiagnosticsProperty('experience', experience))
      ..add(DiagnosticsProperty('specializations', specializations));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SpecialistFilterDto &&
            (identical(other.minPrice, minPrice) ||
                other.minPrice == minPrice) &&
            (identical(other.maxPrice, maxPrice) ||
                other.maxPrice == maxPrice) &&
            const DeepCollectionEquality()
                .equals(other._experience, _experience) &&
            const DeepCollectionEquality()
                .equals(other._specializations, _specializations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      minPrice,
      maxPrice,
      const DeepCollectionEquality().hash(_experience),
      const DeepCollectionEquality().hash(_specializations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SpecialistFilterDtoCopyWith<_$_SpecialistFilterDto> get copyWith =>
      __$$_SpecialistFilterDtoCopyWithImpl<_$_SpecialistFilterDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SpecialistFilterDtoToJson(
      this,
    );
  }
}

abstract class _SpecialistFilterDto extends SpecialistFilterDto {
  const factory _SpecialistFilterDto(
      {required final int minPrice,
      required final int maxPrice,
      required final List<String> experience,
      required final List<String> specializations}) = _$_SpecialistFilterDto;
  const _SpecialistFilterDto._() : super._();

  factory _SpecialistFilterDto.fromJson(Map<String, dynamic> json) =
      _$_SpecialistFilterDto.fromJson;

  @override
  int get minPrice;
  @override
  int get maxPrice;
  @override
  List<String> get experience;
  @override
  List<String> get specializations;
  @override
  @JsonKey(ignore: true)
  _$$_SpecialistFilterDtoCopyWith<_$_SpecialistFilterDto> get copyWith =>
      throw _privateConstructorUsedError;
}
