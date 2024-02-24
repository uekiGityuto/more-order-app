// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phrase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PhraseDTO _$PhraseDTOFromJson(Map<String, dynamic> json) {
  return _Phrase.fromJson(json);
}

/// @nodoc
mixin _$PhraseDTO {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'phrase')
  String get phrase => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhraseDTOCopyWith<PhraseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhraseDTOCopyWith<$Res> {
  factory $PhraseDTOCopyWith(PhraseDTO value, $Res Function(PhraseDTO) then) =
      _$PhraseDTOCopyWithImpl<$Res, PhraseDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'phrase') String phrase,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class _$PhraseDTOCopyWithImpl<$Res, $Val extends PhraseDTO>
    implements $PhraseDTOCopyWith<$Res> {
  _$PhraseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? phrase = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      phrase: null == phrase
          ? _value.phrase
          : phrase // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhraseImplCopyWith<$Res> implements $PhraseDTOCopyWith<$Res> {
  factory _$$PhraseImplCopyWith(
          _$PhraseImpl value, $Res Function(_$PhraseImpl) then) =
      __$$PhraseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'phrase') String phrase,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class __$$PhraseImplCopyWithImpl<$Res>
    extends _$PhraseDTOCopyWithImpl<$Res, _$PhraseImpl>
    implements _$$PhraseImplCopyWith<$Res> {
  __$$PhraseImplCopyWithImpl(
      _$PhraseImpl _value, $Res Function(_$PhraseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? phrase = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$PhraseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      phrase: null == phrase
          ? _value.phrase
          : phrase // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhraseImpl extends _Phrase {
  const _$PhraseImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'phrase') required this.phrase,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt})
      : super._();

  factory _$PhraseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhraseImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'phrase')
  final String phrase;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'PhraseDTO(id: $id, phrase: $phrase, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhraseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.phrase, phrase) || other.phrase == phrase) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, phrase, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhraseImplCopyWith<_$PhraseImpl> get copyWith =>
      __$$PhraseImplCopyWithImpl<_$PhraseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhraseImplToJson(
      this,
    );
  }
}

abstract class _Phrase extends PhraseDTO {
  const factory _Phrase(
          {@JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'phrase') required final String phrase,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt}) =
      _$PhraseImpl;
  const _Phrase._() : super._();

  factory _Phrase.fromJson(Map<String, dynamic> json) = _$PhraseImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'phrase')
  String get phrase;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$PhraseImplCopyWith<_$PhraseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
