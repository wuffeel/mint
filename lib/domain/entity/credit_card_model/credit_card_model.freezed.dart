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
  String get number => throw _privateConstructorUsedError;
  int get expirationMonth => throw _privateConstructorUsedError;
  int get expirationYear => throw _privateConstructorUsedError;
  int get cvv => throw _privateConstructorUsedError;

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
  $Res call({String number, int expirationMonth, int expirationYear, int cvv});
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
    Object? number = null,
    Object? expirationMonth = null,
    Object? expirationYear = null,
    Object? cvv = null,
  }) {
    return _then(_value.copyWith(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      expirationMonth: null == expirationMonth
          ? _value.expirationMonth
          : expirationMonth // ignore: cast_nullable_to_non_nullable
              as int,
      expirationYear: null == expirationYear
          ? _value.expirationYear
          : expirationYear // ignore: cast_nullable_to_non_nullable
              as int,
      cvv: null == cvv
          ? _value.cvv
          : cvv // ignore: cast_nullable_to_non_nullable
              as int,
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
  $Res call({String number, int expirationMonth, int expirationYear, int cvv});
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
    Object? number = null,
    Object? expirationMonth = null,
    Object? expirationYear = null,
    Object? cvv = null,
  }) {
    return _then(_$_CreditCardModel(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      expirationMonth: null == expirationMonth
          ? _value.expirationMonth
          : expirationMonth // ignore: cast_nullable_to_non_nullable
              as int,
      expirationYear: null == expirationYear
          ? _value.expirationYear
          : expirationYear // ignore: cast_nullable_to_non_nullable
              as int,
      cvv: null == cvv
          ? _value.cvv
          : cvv // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_CreditCardModel
    with DiagnosticableTreeMixin
    implements _CreditCardModel {
  const _$_CreditCardModel(
      {required this.number,
      required this.expirationMonth,
      required this.expirationYear,
      required this.cvv});

  @override
  final String number;
  @override
  final int expirationMonth;
  @override
  final int expirationYear;
  @override
  final int cvv;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CreditCardModel(number: $number, expirationMonth: $expirationMonth, expirationYear: $expirationYear, cvv: $cvv)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CreditCardModel'))
      ..add(DiagnosticsProperty('number', number))
      ..add(DiagnosticsProperty('expirationMonth', expirationMonth))
      ..add(DiagnosticsProperty('expirationYear', expirationYear))
      ..add(DiagnosticsProperty('cvv', cvv));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreditCardModel &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.expirationMonth, expirationMonth) ||
                other.expirationMonth == expirationMonth) &&
            (identical(other.expirationYear, expirationYear) ||
                other.expirationYear == expirationYear) &&
            (identical(other.cvv, cvv) || other.cvv == cvv));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, number, expirationMonth, expirationYear, cvv);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreditCardModelCopyWith<_$_CreditCardModel> get copyWith =>
      __$$_CreditCardModelCopyWithImpl<_$_CreditCardModel>(this, _$identity);
}

abstract class _CreditCardModel implements CreditCardModel {
  const factory _CreditCardModel(
      {required final String number,
      required final int expirationMonth,
      required final int expirationYear,
      required final int cvv}) = _$_CreditCardModel;

  @override
  String get number;
  @override
  int get expirationMonth;
  @override
  int get expirationYear;
  @override
  int get cvv;
  @override
  @JsonKey(ignore: true)
  _$$_CreditCardModelCopyWith<_$_CreditCardModel> get copyWith =>
      throw _privateConstructorUsedError;
}
