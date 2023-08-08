// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credit_card_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreditCardModel {
  String get id => throw _privateConstructorUsedError;
  String get last4 => throw _privateConstructorUsedError;
  String get cardBrand => throw _privateConstructorUsedError;
  int get expirationMonth => throw _privateConstructorUsedError;
  int get expirationYear => throw _privateConstructorUsedError;
  String get fingerprint => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreditCardModelCopyWith<CreditCardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditCardModelCopyWith<$Res> {
  factory $CreditCardModelCopyWith(
          CreditCardModel value, $Res Function(CreditCardModel) then) =
      _$CreditCardModelCopyWithImpl<$Res, CreditCardModel>;
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
class _$CreditCardModelCopyWithImpl<$Res, $Val extends CreditCardModel>
    implements $CreditCardModelCopyWith<$Res> {
  _$CreditCardModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_CreditCardModelCopyWith<$Res>
    implements $CreditCardModelCopyWith<$Res> {
  factory _$$_CreditCardModelCopyWith(
          _$_CreditCardModel value, $Res Function(_$_CreditCardModel) then) =
      __$$_CreditCardModelCopyWithImpl<$Res>;
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
class __$$_CreditCardModelCopyWithImpl<$Res>
    extends _$CreditCardModelCopyWithImpl<$Res, _$_CreditCardModel>
    implements _$$_CreditCardModelCopyWith<$Res> {
  __$$_CreditCardModelCopyWithImpl(
      _$_CreditCardModel _value, $Res Function(_$_CreditCardModel) _then)
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
    return _then(_$_CreditCardModel(
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

class _$_CreditCardModel
    with DiagnosticableTreeMixin
    implements _CreditCardModel {
  const _$_CreditCardModel(
      {required this.id,
      required this.last4,
      required this.cardBrand,
      required this.expirationMonth,
      required this.expirationYear,
      required this.fingerprint});

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
    return 'CreditCardModel(id: $id, last4: $last4, cardBrand: $cardBrand, expirationMonth: $expirationMonth, expirationYear: $expirationYear, fingerprint: $fingerprint)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CreditCardModel'))
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
            other is _$_CreditCardModel &&
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

  @override
  int get hashCode => Object.hash(runtimeType, id, last4, cardBrand,
      expirationMonth, expirationYear, fingerprint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreditCardModelCopyWith<_$_CreditCardModel> get copyWith =>
      __$$_CreditCardModelCopyWithImpl<_$_CreditCardModel>(this, _$identity);
}

abstract class _CreditCardModel implements CreditCardModel {
  const factory _CreditCardModel(
      {required final String id,
      required final String last4,
      required final String cardBrand,
      required final int expirationMonth,
      required final int expirationYear,
      required final String fingerprint}) = _$_CreditCardModel;

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
  _$$_CreditCardModelCopyWith<_$_CreditCardModel> get copyWith =>
      throw _privateConstructorUsedError;
}
