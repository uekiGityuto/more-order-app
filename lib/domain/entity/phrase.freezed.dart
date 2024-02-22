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

/// @nodoc
mixin _$Phrase {
  Id get id => throw _privateConstructorUsedError;
  String get phrase => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PhraseCopyWith<Phrase> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhraseCopyWith<$Res> {
  factory $PhraseCopyWith(Phrase value, $Res Function(Phrase) then) =
      _$PhraseCopyWithImpl<$Res, Phrase>;
  @useResult
  $Res call({Id id, String phrase});

  $IdCopyWith<$Res> get id;
}

/// @nodoc
class _$PhraseCopyWithImpl<$Res, $Val extends Phrase>
    implements $PhraseCopyWith<$Res> {
  _$PhraseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? phrase = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as Id,
      phrase: null == phrase
          ? _value.phrase
          : phrase // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $IdCopyWith<$Res> get id {
    return $IdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PhraseImplCopyWith<$Res> implements $PhraseCopyWith<$Res> {
  factory _$$PhraseImplCopyWith(
          _$PhraseImpl value, $Res Function(_$PhraseImpl) then) =
      __$$PhraseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Id id, String phrase});

  @override
  $IdCopyWith<$Res> get id;
}

/// @nodoc
class __$$PhraseImplCopyWithImpl<$Res>
    extends _$PhraseCopyWithImpl<$Res, _$PhraseImpl>
    implements _$$PhraseImplCopyWith<$Res> {
  __$$PhraseImplCopyWithImpl(
      _$PhraseImpl _value, $Res Function(_$PhraseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? phrase = null,
  }) {
    return _then(_$PhraseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as Id,
      phrase: null == phrase
          ? _value.phrase
          : phrase // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PhraseImpl extends _Phrase {
  const _$PhraseImpl({required this.id, required this.phrase}) : super._();

  @override
  final Id id;
  @override
  final String phrase;

  @override
  String toString() {
    return 'Phrase(id: $id, phrase: $phrase)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhraseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.phrase, phrase) || other.phrase == phrase));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, phrase);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhraseImplCopyWith<_$PhraseImpl> get copyWith =>
      __$$PhraseImplCopyWithImpl<_$PhraseImpl>(this, _$identity);
}

abstract class _Phrase extends Phrase {
  const factory _Phrase({required final Id id, required final String phrase}) =
      _$PhraseImpl;
  const _Phrase._() : super._();

  @override
  Id get id;
  @override
  String get phrase;
  @override
  @JsonKey(ignore: true)
  _$$PhraseImplCopyWith<_$PhraseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
