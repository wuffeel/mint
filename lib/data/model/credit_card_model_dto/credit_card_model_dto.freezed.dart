// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credit_card_model_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreditCardModelDto _$CreditCardModelDtoFromJson(Map<String, dynamic> json) {
  return _CreditCardModelDto.fromJson(json);
}

/// @nodoc
mixin _$CreditCardModelDto {
  String get id => throw _privateConstructorUsedError;
  String get last4 => throw _privateConstructorUsedError;
  String get cardBrand => throw _privateConstructorUsedError;
  int get expirationMonth => throw _privateConstructorUsedError;
  int get expirationYear => throw _privateConstructorUsedError;
  String get fingerprint => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreditCardModelDtoCopyWith<CreditCardModelDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditCardModelDtoCopyWith<$Res> {
  factory $CreditCardModelDtoCopyWith(
          CreditCardModelDto value, $Res Function(CreditCardModelDto) then) =
      _$CreditCardModelDtoCopyWithImpl<$Res, CreditCardModelDto>;
  @useResult
  $Res call(
      {String id,
      String last4,
      String cardBrand,
      int expirationMonth,
      int expirationYear,
      String fingerprint});
}

/// @nodoc
class _$CreditCardModelDtoCopyWithImpl<$Res, $Val extends CreditCardModelDto>
    implements $CreditCardModelDtoCopyWith<$Res> {
  _$CreditCardModelDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? last4 = null,
    Object? cardBrand = null,
    Object? expirationMonth = null,
    Object? expirationYear = null,
    Object? fingerprint = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      last4: null == last4
          ? _value.last4
          : last4 // ignore: cast_nullable_to_non_nullable
              as String,
      cardBrand: null == cardBrand
          ? _value.cardBrand
          : cardBrand // ignore: cast_nullable_to_non_nullable
              as String,
      expirationMonth: null == expirationMonth
          ? _value.expirationMonth
          : expirationMonth // ignore: cast_nullable_to_non_nullable
              as int,
      expirationYear: null == expirationYear
          ? _value.expirationYear
          : expirationYear // ignore: cast_nullable_to_non_nullable
              as int,
      fingerprint: null == fingerprint
          ? _value.fingerprint
          : fingerprint // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreditCardModelDtoCopyWith<$Res>
    implements $CreditCardModelDtoCopyWith<$Res> {
  factory _$$_CreditCardModelDtoCopyWith(_$_CreditCardModelDto value,
          $Res Function(_$_CreditCardModelDto) then) =
      __$$_CreditCardModelDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String last4,
      String cardBrand,
      int expirationMonth,
      int expirationYear,
      String fingerprint});
}

/// @nodoc
class __$$_CreditCardModelDtoCopyWithImpl<$Res>
    extends _$CreditCardModelDtoCopyWithImpl<$Res, _$_CreditCardModelDto>
    implements _$$_CreditCardModelDtoCopyWith<$Res> {
  __$$_CreditCardModelDtoCopyWithImpl(
      _$_CreditCardModelDto _value, $Res Function(_$_CreditCardModelDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? last4 = null,
    Object? cardBrand = null,
    Object? expirationMonth = null,
    Object? expirationYear = null,
    Object? fingerprint = null,
  }) {
    return _then(_$_CreditCardModelDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      last4: null == last4
          ? _value.last4
          : last4 // ignore: cast_nullable_to_non_nullable
              as String,
      cardBrand: null == cardBrand
          ? _value.cardBrand
          : cardBrand // ignore: cast_nullable_to_non_nullable
              as String,
      expirationMonth: null == expirationMonth
          ? _value.expirationMonth
          : expirationMonth // ignore: cast_nullable_to_non_nullable
              as int,
      expirationYear: null == expirationYear
          ? _value.expirationYear
          : expirationYear // ignore: cast_nullable_to_non_nullable
              as int,
      fingerprint: null == fingerprint
          ? _value.fingerprint
          : fingerprint // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreditCardModelDto
    with DiagnosticableTreeMixin
    implements _CreditCardModelDto {
  const _$_CreditCardModelDto(
      {required this.id,
      required this.last4,
      required this.cardBrand,
      required this.expirationMonth,
      required this.expirationYear,
      required this.fingerprint});

  factory _$_CreditCardModelDto.fromJson(Map<String, dynamic> json) =>
      _$$_CreditCardModelDtoFromJson(json);

  @override
  final String id;
  @override
  final String last4;
  @override
  final String cardBrand;
  @override
  final int expirationMonth;
  @override
  final int expirationYear;
  @override
  final String fingerprint;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CreditCardModelDto(id: $id, last4: $last4, cardBrand: $cardBrand, expirationMonth: $expirationMonth, expirationYear: $expirationYear, fingerprint: $fingerprint)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CreditCardModelDto'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('last4', last4))
      ..add(DiagnosticsProperty('cardBrand', cardBrand))
      ..add(DiagnosticsProperty('expirationMonth', expirationMonth))
      ..add(DiagnosticsProperty('expirationYear', expirationYear))
      ..add(DiagnosticsProperty('fingerprint', fingerprint));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreditCardModelDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.last4, last4) || other.last4 == last4) &&
            (identical(other.cardBrand, cardBrand) ||
                other.cardBrand == cardBrand) &&
            (identical(other.expirationMonth, expirationMonth) ||
                other.expirationMonth == expirationMonth) &&
            (identical(other.expirationYear, expirationYear) ||
                other.expirationYear == expirationYear) &&
            (identical(other.fingerprint, fingerprint) ||
                other.fingerprint == fingerprint));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, last4, cardBrand,
      expirationMonth, expirationYear, fingerprint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreditCardModelDtoCopyWith<_$_CreditCardModelDto> get copyWith =>
      __$$_CreditCardModelDtoCopyWithImpl<_$_CreditCardModelDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreditCardModelDtoToJson(
      this,
    );
  }
}

abstract class _CreditCardModelDto implements CreditCardModelDto {
  const factory _CreditCardModelDto(
      {required final String id,
      required final String last4,
      required final String cardBrand,
      required final int expirationMonth,
      required final int expirationYear,
      required final String fingerprint}) = _$_CreditCardModelDto;

  factory _CreditCardModelDto.fromJson(Map<String, dynamic> json) =
      _$_CreditCardModelDto.fromJson;

  @override
  String get id;
  @override
  String get last4;
  @override
  String get cardBrand;
  @override
  int get expirationMonth;
  @override
  int get expirationYear;
  @override
  String get fingerprint;
  @override
  @JsonKey(ignore: true)
  _$$_CreditCardModelDtoCopyWith<_$_CreditCardModelDto> get copyWith =>
      throw _privateConstructorUsedError;
}
