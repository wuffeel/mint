// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_data_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionDataDto _$TransactionDataDtoFromJson(Map<String, dynamic> json) {
  return _TransactionDataDto.fromJson(json);
}

/// @nodoc
mixin _$TransactionDataDto {
  String get id => throw _privateConstructorUsedError;
  String get bookingId => throw _privateConstructorUsedError;
  String get specialistId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  @JsonKey(toJson: _toDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionDataDtoCopyWith<TransactionDataDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionDataDtoCopyWith<$Res> {
  factory $TransactionDataDtoCopyWith(
          TransactionDataDto value, $Res Function(TransactionDataDto) then) =
      _$TransactionDataDtoCopyWithImpl<$Res, TransactionDataDto>;
  @useResult
  $Res call(
      {String id,
      String bookingId,
      String specialistId,
      String userId,
      int price,
      @JsonKey(toJson: _toDateTime) DateTime createdAt});
}

/// @nodoc
class _$TransactionDataDtoCopyWithImpl<$Res, $Val extends TransactionDataDto>
    implements $TransactionDataDtoCopyWith<$Res> {
  _$TransactionDataDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bookingId = null,
    Object? specialistId = null,
    Object? userId = null,
    Object? price = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      bookingId: null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String,
      specialistId: null == specialistId
          ? _value.specialistId
          : specialistId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionDataDtoCopyWith<$Res>
    implements $TransactionDataDtoCopyWith<$Res> {
  factory _$$_TransactionDataDtoCopyWith(_$_TransactionDataDto value,
          $Res Function(_$_TransactionDataDto) then) =
      __$$_TransactionDataDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String bookingId,
      String specialistId,
      String userId,
      int price,
      @JsonKey(toJson: _toDateTime) DateTime createdAt});
}

/// @nodoc
class __$$_TransactionDataDtoCopyWithImpl<$Res>
    extends _$TransactionDataDtoCopyWithImpl<$Res, _$_TransactionDataDto>
    implements _$$_TransactionDataDtoCopyWith<$Res> {
  __$$_TransactionDataDtoCopyWithImpl(
      _$_TransactionDataDto _value, $Res Function(_$_TransactionDataDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bookingId = null,
    Object? specialistId = null,
    Object? userId = null,
    Object? price = null,
    Object? createdAt = null,
  }) {
    return _then(_$_TransactionDataDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      bookingId: null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String,
      specialistId: null == specialistId
          ? _value.specialistId
          : specialistId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionDataDto extends _TransactionDataDto
    with DiagnosticableTreeMixin {
  const _$_TransactionDataDto(
      {required this.id,
      required this.bookingId,
      required this.specialistId,
      required this.userId,
      required this.price,
      @JsonKey(toJson: _toDateTime) required this.createdAt})
      : super._();

  factory _$_TransactionDataDto.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionDataDtoFromJson(json);

  @override
  final String id;
  @override
  final String bookingId;
  @override
  final String specialistId;
  @override
  final String userId;
  @override
  final int price;
  @override
  @JsonKey(toJson: _toDateTime)
  final DateTime createdAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TransactionDataDto(id: $id, bookingId: $bookingId, specialistId: $specialistId, userId: $userId, price: $price, createdAt: $createdAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TransactionDataDto'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('bookingId', bookingId))
      ..add(DiagnosticsProperty('specialistId', specialistId))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('createdAt', createdAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionDataDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.specialistId, specialistId) ||
                other.specialistId == specialistId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, bookingId, specialistId, userId, price, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionDataDtoCopyWith<_$_TransactionDataDto> get copyWith =>
      __$$_TransactionDataDtoCopyWithImpl<_$_TransactionDataDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionDataDtoToJson(
      this,
    );
  }
}

abstract class _TransactionDataDto extends TransactionDataDto {
  const factory _TransactionDataDto(
          {required final String id,
          required final String bookingId,
          required final String specialistId,
          required final String userId,
          required final int price,
          @JsonKey(toJson: _toDateTime) required final DateTime createdAt}) =
      _$_TransactionDataDto;
  const _TransactionDataDto._() : super._();

  factory _TransactionDataDto.fromJson(Map<String, dynamic> json) =
      _$_TransactionDataDto.fromJson;

  @override
  String get id;
  @override
  String get bookingId;
  @override
  String get specialistId;
  @override
  String get userId;
  @override
  int get price;
  @override
  @JsonKey(toJson: _toDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionDataDtoCopyWith<_$_TransactionDataDto> get copyWith =>
      throw _privateConstructorUsedError;
}
