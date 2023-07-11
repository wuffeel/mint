// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'specialist_model_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SpecialistModelDto _$SpecialistModelDtoFromJson(Map<String, dynamic> json) {
  return _SpecialistModelDto.fromJson(json);
}

/// @nodoc
mixin _$SpecialistModelDto {
  String get id => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  int get experience => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpecialistModelDtoCopyWith<SpecialistModelDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecialistModelDtoCopyWith<$Res> {
  factory $SpecialistModelDtoCopyWith(
          SpecialistModelDto value, $Res Function(SpecialistModelDto) then) =
      _$SpecialistModelDtoCopyWithImpl<$Res, SpecialistModelDto>;
  @useResult
  $Res call(
      {String id,
      String firstName,
      String lastName,
      int price,
      int experience,
      double rating,
      String? photoUrl});
}

/// @nodoc
class _$SpecialistModelDtoCopyWithImpl<$Res, $Val extends SpecialistModelDto>
    implements $SpecialistModelDtoCopyWith<$Res> {
  _$SpecialistModelDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? price = null,
    Object? experience = null,
    Object? rating = null,
    Object? photoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      experience: null == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SpecialistModelDtoCopyWith<$Res>
    implements $SpecialistModelDtoCopyWith<$Res> {
  factory _$$_SpecialistModelDtoCopyWith(_$_SpecialistModelDto value,
          $Res Function(_$_SpecialistModelDto) then) =
      __$$_SpecialistModelDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String firstName,
      String lastName,
      int price,
      int experience,
      double rating,
      String? photoUrl});
}

/// @nodoc
class __$$_SpecialistModelDtoCopyWithImpl<$Res>
    extends _$SpecialistModelDtoCopyWithImpl<$Res, _$_SpecialistModelDto>
    implements _$$_SpecialistModelDtoCopyWith<$Res> {
  __$$_SpecialistModelDtoCopyWithImpl(
      _$_SpecialistModelDto _value, $Res Function(_$_SpecialistModelDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? price = null,
    Object? experience = null,
    Object? rating = null,
    Object? photoUrl = freezed,
  }) {
    return _then(_$_SpecialistModelDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      experience: null == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SpecialistModelDto
    with DiagnosticableTreeMixin
    implements _SpecialistModelDto {
  const _$_SpecialistModelDto(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.price,
      required this.experience,
      required this.rating,
      this.photoUrl});

  factory _$_SpecialistModelDto.fromJson(Map<String, dynamic> json) =>
      _$$_SpecialistModelDtoFromJson(json);

  @override
  final String id;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final int price;
  @override
  final int experience;
  @override
  final double rating;
  @override
  final String? photoUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SpecialistModelDto(id: $id, firstName: $firstName, lastName: $lastName, price: $price, experience: $experience, rating: $rating, photoUrl: $photoUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SpecialistModelDto'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('firstName', firstName))
      ..add(DiagnosticsProperty('lastName', lastName))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('experience', experience))
      ..add(DiagnosticsProperty('rating', rating))
      ..add(DiagnosticsProperty('photoUrl', photoUrl));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SpecialistModelDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.experience, experience) ||
                other.experience == experience) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName, price,
      experience, rating, photoUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SpecialistModelDtoCopyWith<_$_SpecialistModelDto> get copyWith =>
      __$$_SpecialistModelDtoCopyWithImpl<_$_SpecialistModelDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SpecialistModelDtoToJson(
      this,
    );
  }
}

abstract class _SpecialistModelDto implements SpecialistModelDto {
  const factory _SpecialistModelDto(
      {required final String id,
      required final String firstName,
      required final String lastName,
      required final int price,
      required final int experience,
      required final double rating,
      final String? photoUrl}) = _$_SpecialistModelDto;

  factory _SpecialistModelDto.fromJson(Map<String, dynamic> json) =
      _$_SpecialistModelDto.fromJson;

  @override
  String get id;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  int get price;
  @override
  int get experience;
  @override
  double get rating;
  @override
  String? get photoUrl;
  @override
  @JsonKey(ignore: true)
  _$$_SpecialistModelDtoCopyWith<_$_SpecialistModelDto> get copyWith =>
      throw _privateConstructorUsedError;
}
