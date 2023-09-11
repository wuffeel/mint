// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_model_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReviewModelDto _$ReviewModelDtoFromJson(Map<String, dynamic> json) {
  return _ReviewModelDto.fromJson(json);
}

/// @nodoc
mixin _$ReviewModelDto {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get specialistId => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewModelDtoCopyWith<ReviewModelDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewModelDtoCopyWith<$Res> {
  factory $ReviewModelDtoCopyWith(
          ReviewModelDto value, $Res Function(ReviewModelDto) then) =
      _$ReviewModelDtoCopyWithImpl<$Res, ReviewModelDto>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String specialistId,
      double rating,
      @DateTimeConverter() DateTime createdAt,
      String? content});
}

/// @nodoc
class _$ReviewModelDtoCopyWithImpl<$Res, $Val extends ReviewModelDto>
    implements $ReviewModelDtoCopyWith<$Res> {
  _$ReviewModelDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? specialistId = null,
    Object? rating = null,
    Object? createdAt = null,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      specialistId: null == specialistId
          ? _value.specialistId
          : specialistId // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReviewModelDtoCopyWith<$Res>
    implements $ReviewModelDtoCopyWith<$Res> {
  factory _$$_ReviewModelDtoCopyWith(
          _$_ReviewModelDto value, $Res Function(_$_ReviewModelDto) then) =
      __$$_ReviewModelDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String specialistId,
      double rating,
      @DateTimeConverter() DateTime createdAt,
      String? content});
}

/// @nodoc
class __$$_ReviewModelDtoCopyWithImpl<$Res>
    extends _$ReviewModelDtoCopyWithImpl<$Res, _$_ReviewModelDto>
    implements _$$_ReviewModelDtoCopyWith<$Res> {
  __$$_ReviewModelDtoCopyWithImpl(
      _$_ReviewModelDto _value, $Res Function(_$_ReviewModelDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? specialistId = null,
    Object? rating = null,
    Object? createdAt = null,
    Object? content = freezed,
  }) {
    return _then(_$_ReviewModelDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      specialistId: null == specialistId
          ? _value.specialistId
          : specialistId // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReviewModelDto extends _ReviewModelDto with DiagnosticableTreeMixin {
  const _$_ReviewModelDto(
      {required this.id,
      required this.userId,
      required this.specialistId,
      required this.rating,
      @DateTimeConverter() required this.createdAt,
      this.content})
      : super._();

  factory _$_ReviewModelDto.fromJson(Map<String, dynamic> json) =>
      _$$_ReviewModelDtoFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String specialistId;
  @override
  final double rating;
  @override
  @DateTimeConverter()
  final DateTime createdAt;
  @override
  final String? content;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReviewModelDto(id: $id, userId: $userId, specialistId: $specialistId, rating: $rating, createdAt: $createdAt, content: $content)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReviewModelDto'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('specialistId', specialistId))
      ..add(DiagnosticsProperty('rating', rating))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('content', content));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReviewModelDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.specialistId, specialistId) ||
                other.specialistId == specialistId) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, specialistId, rating, createdAt, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReviewModelDtoCopyWith<_$_ReviewModelDto> get copyWith =>
      __$$_ReviewModelDtoCopyWithImpl<_$_ReviewModelDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReviewModelDtoToJson(
      this,
    );
  }
}

abstract class _ReviewModelDto extends ReviewModelDto {
  const factory _ReviewModelDto(
      {required final String id,
      required final String userId,
      required final String specialistId,
      required final double rating,
      @DateTimeConverter() required final DateTime createdAt,
      final String? content}) = _$_ReviewModelDto;
  const _ReviewModelDto._() : super._();

  factory _ReviewModelDto.fromJson(Map<String, dynamic> json) =
      _$_ReviewModelDto.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get specialistId;
  @override
  double get rating;
  @override
  @DateTimeConverter()
  DateTime get createdAt;
  @override
  String? get content;
  @override
  @JsonKey(ignore: true)
  _$$_ReviewModelDtoCopyWith<_$_ReviewModelDto> get copyWith =>
      throw _privateConstructorUsedError;
}
