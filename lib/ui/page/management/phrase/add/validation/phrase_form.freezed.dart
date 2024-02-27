// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phrase_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PhraseForm {
  PhraseInput get phraseInput => throw _privateConstructorUsedError;
  ScenesInput get scenesInput => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PhraseFormCopyWith<PhraseForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhraseFormCopyWith<$Res> {
  factory $PhraseFormCopyWith(
          PhraseForm value, $Res Function(PhraseForm) then) =
      _$PhraseFormCopyWithImpl<$Res, PhraseForm>;
  @useResult
  $Res call({PhraseInput phraseInput, ScenesInput scenesInput, bool isValid});
}

/// @nodoc
class _$PhraseFormCopyWithImpl<$Res, $Val extends PhraseForm>
    implements $PhraseFormCopyWith<$Res> {
  _$PhraseFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phraseInput = null,
    Object? scenesInput = null,
    Object? isValid = null,
  }) {
    return _then(_value.copyWith(
      phraseInput: null == phraseInput
          ? _value.phraseInput
          : phraseInput // ignore: cast_nullable_to_non_nullable
              as PhraseInput,
      scenesInput: null == scenesInput
          ? _value.scenesInput
          : scenesInput // ignore: cast_nullable_to_non_nullable
              as ScenesInput,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhraseFormImplCopyWith<$Res>
    implements $PhraseFormCopyWith<$Res> {
  factory _$$PhraseFormImplCopyWith(
          _$PhraseFormImpl value, $Res Function(_$PhraseFormImpl) then) =
      __$$PhraseFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PhraseInput phraseInput, ScenesInput scenesInput, bool isValid});
}

/// @nodoc
class __$$PhraseFormImplCopyWithImpl<$Res>
    extends _$PhraseFormCopyWithImpl<$Res, _$PhraseFormImpl>
    implements _$$PhraseFormImplCopyWith<$Res> {
  __$$PhraseFormImplCopyWithImpl(
      _$PhraseFormImpl _value, $Res Function(_$PhraseFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phraseInput = null,
    Object? scenesInput = null,
    Object? isValid = null,
  }) {
    return _then(_$PhraseFormImpl(
      phraseInput: null == phraseInput
          ? _value.phraseInput
          : phraseInput // ignore: cast_nullable_to_non_nullable
              as PhraseInput,
      scenesInput: null == scenesInput
          ? _value.scenesInput
          : scenesInput // ignore: cast_nullable_to_non_nullable
              as ScenesInput,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PhraseFormImpl implements _PhraseForm {
  _$PhraseFormImpl(
      {required this.phraseInput,
      required this.scenesInput,
      required this.isValid});

  @override
  final PhraseInput phraseInput;
  @override
  final ScenesInput scenesInput;
  @override
  final bool isValid;

  @override
  String toString() {
    return 'PhraseForm(phraseInput: $phraseInput, scenesInput: $scenesInput, isValid: $isValid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhraseFormImpl &&
            (identical(other.phraseInput, phraseInput) ||
                other.phraseInput == phraseInput) &&
            (identical(other.scenesInput, scenesInput) ||
                other.scenesInput == scenesInput) &&
            (identical(other.isValid, isValid) || other.isValid == isValid));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, phraseInput, scenesInput, isValid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhraseFormImplCopyWith<_$PhraseFormImpl> get copyWith =>
      __$$PhraseFormImplCopyWithImpl<_$PhraseFormImpl>(this, _$identity);
}

abstract class _PhraseForm implements PhraseForm {
  factory _PhraseForm(
      {required final PhraseInput phraseInput,
      required final ScenesInput scenesInput,
      required final bool isValid}) = _$PhraseFormImpl;

  @override
  PhraseInput get phraseInput;
  @override
  ScenesInput get scenesInput;
  @override
  bool get isValid;
  @override
  @JsonKey(ignore: true)
  _$$PhraseFormImplCopyWith<_$PhraseFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
