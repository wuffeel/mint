// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'specialist_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SpecialistFilter {
  int get minPrice => throw _privateConstructorUsedError;
  int get maxPrice => throw _privateConstructorUsedError;
  List<ExperienceModel> get experience => throw _privateConstructorUsedError;
  List<String> get specializations => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SpecialistFilterCopyWith<SpecialistFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecialistFilterCopyWith<$Res> {
  factory $SpecialistFilterCopyWith(
          SpecialistFilter value, $Res Function(SpecialistFilter) then) =
      _$SpecialistFilterCopyWithImpl<$Res, SpecialistFilter>;
  @useResult
  $Res call(
      {int minPrice,
      int maxPrice,
      List<ExperienceModel> experience,
      List<String> specializations});
}

/// @nodoc
class _$SpecialistFilterCopyWithImpl<$Res, $Val extends SpecialistFilter>
    implements $SpecialistFilterCopyWith<$Res> {
  _$SpecialistFilterCopyWithImpl(this._value, this._then);

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
              as List<ExperienceModel>,
      specializations: null == specializations
          ? _value.specializations
          : specializations // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SpecialistFilterCopyWith<$Res>
    implements $SpecialistFilterCopyWith<$Res> {
  factory _$$_SpecialistFilterCopyWith(
          _$_SpecialistFilter value, $Res Function(_$_SpecialistFilter) then) =
      __$$_SpecialistFilterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int minPrice,
      int maxPrice,
      List<ExperienceModel> experience,
      List<String> specializations});
}

/// @nodoc
class __$$_SpecialistFilterCopyWithImpl<$Res>
    extends _$SpecialistFilterCopyWithImpl<$Res, _$_SpecialistFilter>
    implements _$$_SpecialistFilterCopyWith<$Res> {
  __$$_SpecialistFilterCopyWithImpl(
      _$_SpecialistFilter _value, $Res Function(_$_SpecialistFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minPrice = null,
    Object? maxPrice = null,
    Object? experience = null,
    Object? specializations = null,
  }) {
    return _then(_$_SpecialistFilter(
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
              as List<ExperienceModel>,
      specializations: null == specializations
          ? _value._specializations
          : specializations // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_SpecialistFilter extends _SpecialistFilter
    with DiagnosticableTreeMixin {
  const _$_SpecialistFilter(
      {required this.minPrice,
      required this.maxPrice,
      required final List<ExperienceModel> experience,
      required final List<String> specializations})
      : _experience = experience,
        _specializations = specializations,
        super._();

  @override
  final int minPrice;
  @override
  final int maxPrice;
  final List<ExperienceModel> _experience;
  @override
  List<ExperienceModel> get experience {
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
    return 'SpecialistFilter(minPrice: $minPrice, maxPrice: $maxPrice, experience: $experience, specializations: $specializations)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SpecialistFilter'))
      ..add(DiagnosticsProperty('minPrice', minPrice))
      ..add(DiagnosticsProperty('maxPrice', maxPrice))
      ..add(DiagnosticsProperty('experience', experience))
      ..add(DiagnosticsProperty('specializations', specializations));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SpecialistFilter &&
            (identical(other.minPrice, minPrice) ||
                other.minPrice == minPrice) &&
            (identical(other.maxPrice, maxPrice) ||
                other.maxPrice == maxPrice) &&
            const DeepCollectionEquality()
                .equals(other._experience, _experience) &&
            const DeepCollectionEquality()
                .equals(other._specializations, _specializations));
  }

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
  _$$_SpecialistFilterCopyWith<_$_SpecialistFilter> get copyWith =>
      __$$_SpecialistFilterCopyWithImpl<_$_SpecialistFilter>(this, _$identity);
}

abstract class _SpecialistFilter extends SpecialistFilter {
  const factory _SpecialistFilter(
      {required final int minPrice,
      required final int maxPrice,
      required final List<ExperienceModel> experience,
      required final List<String> specializations}) = _$_SpecialistFilter;
  const _SpecialistFilter._() : super._();

  @override
  int get minPrice;
  @override
  int get maxPrice;
  @override
  List<ExperienceModel> get experience;
  @override
  List<String> get specializations;
  @override
  @JsonKey(ignore: true)
  _$$_SpecialistFilterCopyWith<_$_SpecialistFilter> get copyWith =>
      throw _privateConstructorUsedError;
}
