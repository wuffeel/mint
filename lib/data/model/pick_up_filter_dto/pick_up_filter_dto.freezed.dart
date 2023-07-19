// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pick_up_filter_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PickUpFilterDto _$PickUpFilterDtoFromJson(Map<String, dynamic> json) {
  return _PickUpFilterDto.fromJson(json);
}

/// @nodoc
mixin _$PickUpFilterDto {
  List<String> get communicationMembers => throw _privateConstructorUsedError;
  List<String> get priceRange => throw _privateConstructorUsedError;
  List<String> get specializations => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PickUpFilterDtoCopyWith<PickUpFilterDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PickUpFilterDtoCopyWith<$Res> {
  factory $PickUpFilterDtoCopyWith(
          PickUpFilterDto value, $Res Function(PickUpFilterDto) then) =
      _$PickUpFilterDtoCopyWithImpl<$Res, PickUpFilterDto>;
  @useResult
  $Res call(
      {List<String> communicationMembers,
      List<String> priceRange,
      List<String> specializations});
}

/// @nodoc
class _$PickUpFilterDtoCopyWithImpl<$Res, $Val extends PickUpFilterDto>
    implements $PickUpFilterDtoCopyWith<$Res> {
  _$PickUpFilterDtoCopyWithImpl(this._value, this._then);

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
              as List<String>,
      specializations: null == specializations
          ? _value.specializations
          : specializations // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PickUpFilterDtoCopyWith<$Res>
    implements $PickUpFilterDtoCopyWith<$Res> {
  factory _$$_PickUpFilterDtoCopyWith(
          _$_PickUpFilterDto value, $Res Function(_$_PickUpFilterDto) then) =
      __$$_PickUpFilterDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> communicationMembers,
      List<String> priceRange,
      List<String> specializations});
}

/// @nodoc
class __$$_PickUpFilterDtoCopyWithImpl<$Res>
    extends _$PickUpFilterDtoCopyWithImpl<$Res, _$_PickUpFilterDto>
    implements _$$_PickUpFilterDtoCopyWith<$Res> {
  __$$_PickUpFilterDtoCopyWithImpl(
      _$_PickUpFilterDto _value, $Res Function(_$_PickUpFilterDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? communicationMembers = null,
    Object? priceRange = null,
    Object? specializations = null,
  }) {
    return _then(_$_PickUpFilterDto(
      communicationMembers: null == communicationMembers
          ? _value._communicationMembers
          : communicationMembers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      priceRange: null == priceRange
          ? _value._priceRange
          : priceRange // ignore: cast_nullable_to_non_nullable
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
class _$_PickUpFilterDto extends _PickUpFilterDto with DiagnosticableTreeMixin {
  const _$_PickUpFilterDto(
      {required final List<String> communicationMembers,
      required final List<String> priceRange,
      required final List<String> specializations})
      : _communicationMembers = communicationMembers,
        _priceRange = priceRange,
        _specializations = specializations,
        super._();

  factory _$_PickUpFilterDto.fromJson(Map<String, dynamic> json) =>
      _$$_PickUpFilterDtoFromJson(json);

  final List<String> _communicationMembers;
  @override
  List<String> get communicationMembers {
    if (_communicationMembers is EqualUnmodifiableListView)
      return _communicationMembers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_communicationMembers);
  }

  final List<String> _priceRange;
  @override
  List<String> get priceRange {
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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PickUpFilterDto(communicationMembers: $communicationMembers, priceRange: $priceRange, specializations: $specializations)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PickUpFilterDto'))
      ..add(DiagnosticsProperty('communicationMembers', communicationMembers))
      ..add(DiagnosticsProperty('priceRange', priceRange))
      ..add(DiagnosticsProperty('specializations', specializations));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PickUpFilterDto &&
            const DeepCollectionEquality()
                .equals(other._communicationMembers, _communicationMembers) &&
            const DeepCollectionEquality()
                .equals(other._priceRange, _priceRange) &&
            const DeepCollectionEquality()
                .equals(other._specializations, _specializations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_communicationMembers),
      const DeepCollectionEquality().hash(_priceRange),
      const DeepCollectionEquality().hash(_specializations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PickUpFilterDtoCopyWith<_$_PickUpFilterDto> get copyWith =>
      __$$_PickUpFilterDtoCopyWithImpl<_$_PickUpFilterDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PickUpFilterDtoToJson(
      this,
    );
  }
}

abstract class _PickUpFilterDto extends PickUpFilterDto {
  const factory _PickUpFilterDto(
      {required final List<String> communicationMembers,
      required final List<String> priceRange,
      required final List<String> specializations}) = _$_PickUpFilterDto;
  const _PickUpFilterDto._() : super._();

  factory _PickUpFilterDto.fromJson(Map<String, dynamic> json) =
      _$_PickUpFilterDto.fromJson;

  @override
  List<String> get communicationMembers;
  @override
  List<String> get priceRange;
  @override
  List<String> get specializations;
  @override
  @JsonKey(ignore: true)
  _$$_PickUpFilterDtoCopyWith<_$_PickUpFilterDto> get copyWith =>
      throw _privateConstructorUsedError;
}
