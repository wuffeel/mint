// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fcm_token_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FcmTokenDto _$FcmTokenDtoFromJson(Map<String, dynamic> json) {
  return _FcmTokenDto.fromJson(json);
}

/// @nodoc
mixin _$FcmTokenDto {
  String get token => throw _privateConstructorUsedError;
  @JsonKey(fromJson: DateUtils.convertToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FcmTokenDtoCopyWith<FcmTokenDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FcmTokenDtoCopyWith<$Res> {
  factory $FcmTokenDtoCopyWith(
          FcmTokenDto value, $Res Function(FcmTokenDto) then) =
      _$FcmTokenDtoCopyWithImpl<$Res, FcmTokenDto>;
  @useResult
  $Res call(
      {String token,
      @JsonKey(fromJson: DateUtils.convertToDateTime) DateTime createdAt});
}

/// @nodoc
class _$FcmTokenDtoCopyWithImpl<$Res, $Val extends FcmTokenDto>
    implements $FcmTokenDtoCopyWith<$Res> {
  _$FcmTokenDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FcmTokenDtoCopyWith<$Res>
    implements $FcmTokenDtoCopyWith<$Res> {
  factory _$$_FcmTokenDtoCopyWith(
          _$_FcmTokenDto value, $Res Function(_$_FcmTokenDto) then) =
      __$$_FcmTokenDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String token,
      @JsonKey(fromJson: DateUtils.convertToDateTime) DateTime createdAt});
}

/// @nodoc
class __$$_FcmTokenDtoCopyWithImpl<$Res>
    extends _$FcmTokenDtoCopyWithImpl<$Res, _$_FcmTokenDto>
    implements _$$_FcmTokenDtoCopyWith<$Res> {
  __$$_FcmTokenDtoCopyWithImpl(
      _$_FcmTokenDto _value, $Res Function(_$_FcmTokenDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? createdAt = null,
  }) {
    return _then(_$_FcmTokenDto(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FcmTokenDto with DiagnosticableTreeMixin implements _FcmTokenDto {
  const _$_FcmTokenDto(
      {required this.token,
      @JsonKey(fromJson: DateUtils.convertToDateTime) required this.createdAt});

  factory _$_FcmTokenDto.fromJson(Map<String, dynamic> json) =>
      _$$_FcmTokenDtoFromJson(json);

  @override
  final String token;
  @override
  @JsonKey(fromJson: DateUtils.convertToDateTime)
  final DateTime createdAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FcmTokenDto(token: $token, createdAt: $createdAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FcmTokenDto'))
      ..add(DiagnosticsProperty('token', token))
      ..add(DiagnosticsProperty('createdAt', createdAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FcmTokenDto &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, token, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FcmTokenDtoCopyWith<_$_FcmTokenDto> get copyWith =>
      __$$_FcmTokenDtoCopyWithImpl<_$_FcmTokenDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FcmTokenDtoToJson(
      this,
    );
  }
}

abstract class _FcmTokenDto implements FcmTokenDto {
  const factory _FcmTokenDto(
      {required final String token,
      @JsonKey(fromJson: DateUtils.convertToDateTime)
          required final DateTime createdAt}) = _$_FcmTokenDto;

  factory _FcmTokenDto.fromJson(Map<String, dynamic> json) =
      _$_FcmTokenDto.fromJson;

  @override
  String get token;
  @override
  @JsonKey(fromJson: DateUtils.convertToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_FcmTokenDtoCopyWith<_$_FcmTokenDto> get copyWith =>
      throw _privateConstructorUsedError;
}
