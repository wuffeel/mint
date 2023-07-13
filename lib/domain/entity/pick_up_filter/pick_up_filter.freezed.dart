// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pick_up_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PickUpFilter {
  List<String> get communicationMembers => throw _privateConstructorUsedError;
  List<PriceRangeModel> get priceRange => throw _privateConstructorUsedError;
  List<String> get specializations => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PickUpFilterCopyWith<PickUpFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PickUpFilterCopyWith<$Res> {
  factory $PickUpFilterCopyWith(
          PickUpFilter value, $Res Function(PickUpFilter) then) =
      _$PickUpFilterCopyWithImpl<$Res, PickUpFilter>;
  @useResult
  $Res call(
      {List<String> communicationMembers,
      List<PriceRangeModel> priceRange,
      List<String> specializations});
}

/// @nodoc
class _$PickUpFilterCopyWithImpl<$Res, $Val extends PickUpFilter>
    implements $PickUpFilterCopyWith<$Res> {
  _$PickUpFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? communicationMembers = null,
    Object? priceRange = null,
    Object? specializations = null,
  }) {
    return _then(_value.copyWith(
      communicationMembers: null == communicationMembers
          ? _value.communicationMembers
          : communicationMembers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      priceRange: null == priceRange
          ? _value.priceRange
          : priceRange // ignore: cast_nullable_to_non_nullable
              as List<PriceRangeModel>,
      specializations: null == specializations
          ? _value.specializations
          : specializations // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PickUpFilterCopyWith<$Res>
    implements $PickUpFilterCopyWith<$Res> {
  factory _$$_PickUpFilterCopyWith(
          _$_PickUpFilter value, $Res Function(_$_PickUpFilter) then) =
      __$$_PickUpFilterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> communicationMembers,
      List<PriceRangeModel> priceRange,
      List<String> specializations});
}

/// @nodoc
class __$$_PickUpFilterCopyWithImpl<$Res>
    extends _$PickUpFilterCopyWithImpl<$Res, _$_PickUpFilter>
    implements _$$_PickUpFilterCopyWith<$Res> {
  __$$_PickUpFilterCopyWithImpl(
      _$_PickUpFilter _value, $Res Function(_$_PickUpFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? communicationMembers = null,
    Object? priceRange = null,
    Object? specializations = null,
  }) {
    return _then(_$_PickUpFilter(
      communicationMembers: null == communicationMembers
          ? _value._communicationMembers
          : communicationMembers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      priceRange: null == priceRange
          ? _value._priceRange
          : priceRange // ignore: cast_nullable_to_non_nullable
              as List<PriceRangeModel>,
      specializations: null == specializations
          ? _value._specializations
          : specializations // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_PickUpFilter extends _PickUpFilter {
  const _$_PickUpFilter(
      {required final List<String> communicationMembers,
      required final List<PriceRangeModel> priceRange,
      required final List<String> specializations})
      : _communicationMembers = communicationMembers,
        _priceRange = priceRange,
        _specializations = specializations,
        super._();

  final List<String> _communicationMembers;
  @override
  List<String> get communicationMembers {
    if (_communicationMembers is EqualUnmodifiableListView)
      return _communicationMembers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_communicationMembers);
  }

  final List<PriceRangeModel> _priceRange;
  @override
  List<PriceRangeModel> get priceRange {
    if (_priceRange is EqualUnmodifiableListView) return _priceRange;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_priceRange);
  }

  final List<String> _specializations;
  @override
  List<String> get specializations {
    if (_specializations is EqualUnmodifiableListView) return _specializations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_specializations);
  }

  @override
  String toString() {
    return 'PickUpFilter(communicationMembers: $communicationMembers, priceRange: $priceRange, specializations: $specializations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PickUpFilter &&
            const DeepCollectionEquality()
                .equals(other._communicationMembers, _communicationMembers) &&
            const DeepCollectionEquality()
                .equals(other._priceRange, _priceRange) &&
            const DeepCollectionEquality()
                .equals(other._specializations, _specializations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_communicationMembers),
      const DeepCollectionEquality().hash(_priceRange),
      const DeepCollectionEquality().hash(_specializations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PickUpFilterCopyWith<_$_PickUpFilter> get copyWith =>
      __$$_PickUpFilterCopyWithImpl<_$_PickUpFilter>(this, _$identity);
}

abstract class _PickUpFilter extends PickUpFilter {
  const factory _PickUpFilter(
      {required final List<String> communicationMembers,
      required final List<PriceRangeModel> priceRange,
      required final List<String> specializations}) = _$_PickUpFilter;
  const _PickUpFilter._() : super._();

  @override
  List<String> get communicationMembers;
  @override
  List<PriceRangeModel> get priceRange;
  @override
  List<String> get specializations;
  @override
  @JsonKey(ignore: true)
  _$$_PickUpFilterCopyWith<_$_PickUpFilter> get copyWith =>
      throw _privateConstructorUsedError;
}
