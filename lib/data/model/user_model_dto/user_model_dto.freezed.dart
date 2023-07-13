// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModelDto _$UserModelDtoFromJson(Map<String, dynamic> json) {
  return _UserModelDto.fromJson(json);
}

/// @nodoc
mixin _$UserModelDto {
  String get id => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get pinCode => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  String? get nameTag => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(fromJson: DateUtils.tryConvertToDateTime)
  DateTime? get dateOfBirth => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelDtoCopyWith<UserModelDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelDtoCopyWith<$Res> {
  factory $UserModelDtoCopyWith(
          UserModelDto value, $Res Function(UserModelDto) then) =
      _$UserModelDtoCopyWithImpl<$Res, UserModelDto>;
  @useResult
  $Res call(
      {String id,
      String? phoneNumber,
      String? pinCode,
      String? photoUrl,
      String? nameTag,
      String? firstName,
      String? lastName,
      @JsonKey(fromJson: DateUtils.tryConvertToDateTime)
          DateTime? dateOfBirth});
}

/// @nodoc
class _$UserModelDtoCopyWithImpl<$Res, $Val extends UserModelDto>
    implements $UserModelDtoCopyWith<$Res> {
  _$UserModelDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? phoneNumber = freezed,
    Object? pinCode = freezed,
    Object? photoUrl = freezed,
    Object? nameTag = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? dateOfBirth = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      pinCode: freezed == pinCode
          ? _value.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      nameTag: freezed == nameTag
          ? _value.nameTag
          : nameTag // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserModelDtoCopyWith<$Res>
    implements $UserModelDtoCopyWith<$Res> {
  factory _$$_UserModelDtoCopyWith(
          _$_UserModelDto value, $Res Function(_$_UserModelDto) then) =
      __$$_UserModelDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? phoneNumber,
      String? pinCode,
      String? photoUrl,
      String? nameTag,
      String? firstName,
      String? lastName,
      @JsonKey(fromJson: DateUtils.tryConvertToDateTime)
          DateTime? dateOfBirth});
}

/// @nodoc
class __$$_UserModelDtoCopyWithImpl<$Res>
    extends _$UserModelDtoCopyWithImpl<$Res, _$_UserModelDto>
    implements _$$_UserModelDtoCopyWith<$Res> {
  __$$_UserModelDtoCopyWithImpl(
      _$_UserModelDto _value, $Res Function(_$_UserModelDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? phoneNumber = freezed,
    Object? pinCode = freezed,
    Object? photoUrl = freezed,
    Object? nameTag = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? dateOfBirth = freezed,
  }) {
    return _then(_$_UserModelDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      pinCode: freezed == pinCode
          ? _value.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      nameTag: freezed == nameTag
          ? _value.nameTag
          : nameTag // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserModelDto with DiagnosticableTreeMixin implements _UserModelDto {
  const _$_UserModelDto(
      {required this.id,
      this.phoneNumber,
      this.pinCode,
      this.photoUrl,
      this.nameTag,
      this.firstName,
      this.lastName,
      @JsonKey(fromJson: DateUtils.tryConvertToDateTime) this.dateOfBirth});

  factory _$_UserModelDto.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelDtoFromJson(json);

  @override
  final String id;
  @override
  final String? phoneNumber;
  @override
  final String? pinCode;
  @override
  final String? photoUrl;
  @override
  final String? nameTag;
  @override
  final String? firstName;
  @override
  final String? lastName;
// ignore: invalid_annotation_target
  @override
  @JsonKey(fromJson: DateUtils.tryConvertToDateTime)
  final DateTime? dateOfBirth;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserModelDto(id: $id, phoneNumber: $phoneNumber, pinCode: $pinCode, photoUrl: $photoUrl, nameTag: $nameTag, firstName: $firstName, lastName: $lastName, dateOfBirth: $dateOfBirth)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserModelDto'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('phoneNumber', phoneNumber))
      ..add(DiagnosticsProperty('pinCode', pinCode))
      ..add(DiagnosticsProperty('photoUrl', photoUrl))
      ..add(DiagnosticsProperty('nameTag', nameTag))
      ..add(DiagnosticsProperty('firstName', firstName))
      ..add(DiagnosticsProperty('lastName', lastName))
      ..add(DiagnosticsProperty('dateOfBirth', dateOfBirth));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModelDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.pinCode, pinCode) || other.pinCode == pinCode) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.nameTag, nameTag) || other.nameTag == nameTag) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, phoneNumber, pinCode,
      photoUrl, nameTag, firstName, lastName, dateOfBirth);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserModelDtoCopyWith<_$_UserModelDto> get copyWith =>
      __$$_UserModelDtoCopyWithImpl<_$_UserModelDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelDtoToJson(
      this,
    );
  }
}

abstract class _UserModelDto implements UserModelDto {
  const factory _UserModelDto(
      {required final String id,
      final String? phoneNumber,
      final String? pinCode,
      final String? photoUrl,
      final String? nameTag,
      final String? firstName,
      final String? lastName,
      @JsonKey(fromJson: DateUtils.tryConvertToDateTime)
          final DateTime? dateOfBirth}) = _$_UserModelDto;

  factory _UserModelDto.fromJson(Map<String, dynamic> json) =
      _$_UserModelDto.fromJson;

  @override
  String get id;
  @override
  String? get phoneNumber;
  @override
  String? get pinCode;
  @override
  String? get photoUrl;
  @override
  String? get nameTag;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override // ignore: invalid_annotation_target
  @JsonKey(fromJson: DateUtils.tryConvertToDateTime)
  DateTime? get dateOfBirth;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelDtoCopyWith<_$_UserModelDto> get copyWith =>
      throw _privateConstructorUsedError;
}