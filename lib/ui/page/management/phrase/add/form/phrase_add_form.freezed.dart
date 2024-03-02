// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phrase_add_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PhraseAddForm {
  FormCreationStatus get creationStatus => throw _privateConstructorUsedError;
  PhraseInput get phraseInput => throw _privateConstructorUsedError;
  List<Scene>? get scenes => throw _privateConstructorUsedError;
  ScenesInput get scenesInput => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PhraseAddFormCopyWith<PhraseAddForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhraseAddFormCopyWith<$Res> {
  factory $PhraseAddFormCopyWith(
          PhraseAddForm value, $Res Function(PhraseAddForm) then) =
      _$PhraseAddFormCopyWithImpl<$Res, PhraseAddForm>;
  @useResult
  $Res call(
      {FormCreationStatus creationStatus,
      PhraseInput phraseInput,
      List<Scene>? scenes,
      ScenesInput scenesInput,
      bool isValid});
}

/// @nodoc
class _$PhraseAddFormCopyWithImpl<$Res, $Val extends PhraseAddForm>
    implements $PhraseAddFormCopyWith<$Res> {
  _$PhraseAddFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creationStatus = null,
    Object? phraseInput = null,
    Object? scenes = freezed,
    Object? scenesInput = null,
    Object? isValid = null,
  }) {
    return _then(_value.copyWith(
      creationStatus: null == creationStatus
          ? _value.creationStatus
          : creationStatus // ignore: cast_nullable_to_non_nullable
              as FormCreationStatus,
      phraseInput: null == phraseInput
          ? _value.phraseInput
          : phraseInput // ignore: cast_nullable_to_non_nullable
              as PhraseInput,
      scenes: freezed == scenes
          ? _value.scenes
          : scenes // ignore: cast_nullable_to_non_nullable
              as List<Scene>?,
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
abstract class _$$PhraseAddFormImplCopyWith<$Res>
    implements $PhraseAddFormCopyWith<$Res> {
  factory _$$PhraseAddFormImplCopyWith(
          _$PhraseAddFormImpl value, $Res Function(_$PhraseAddFormImpl) then) =
      __$$PhraseAddFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormCreationStatus creationStatus,
      PhraseInput phraseInput,
      List<Scene>? scenes,
      ScenesInput scenesInput,
      bool isValid});
}

/// @nodoc
class __$$PhraseAddFormImplCopyWithImpl<$Res>
    extends _$PhraseAddFormCopyWithImpl<$Res, _$PhraseAddFormImpl>
    implements _$$PhraseAddFormImplCopyWith<$Res> {
  __$$PhraseAddFormImplCopyWithImpl(
      _$PhraseAddFormImpl _value, $Res Function(_$PhraseAddFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creationStatus = null,
    Object? phraseInput = null,
    Object? scenes = freezed,
    Object? scenesInput = null,
    Object? isValid = null,
  }) {
    return _then(_$PhraseAddFormImpl(
      creationStatus: null == creationStatus
          ? _value.creationStatus
          : creationStatus // ignore: cast_nullable_to_non_nullable
              as FormCreationStatus,
      phraseInput: null == phraseInput
          ? _value.phraseInput
          : phraseInput // ignore: cast_nullable_to_non_nullable
              as PhraseInput,
      scenes: freezed == scenes
          ? _value._scenes
          : scenes // ignore: cast_nullable_to_non_nullable
              as List<Scene>?,
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

class _$PhraseAddFormImpl implements _PhraseAddForm {
  _$PhraseAddFormImpl(
      {required this.creationStatus,
      required this.phraseInput,
      required final List<Scene>? scenes,
      required this.scenesInput,
      required this.isValid})
      : _scenes = scenes;

  @override
  final FormCreationStatus creationStatus;
  @override
  final PhraseInput phraseInput;
  final List<Scene>? _scenes;
  @override
  List<Scene>? get scenes {
    final value = _scenes;
    if (value == null) return null;
    if (_scenes is EqualUnmodifiableListView) return _scenes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final ScenesInput scenesInput;
  @override
  final bool isValid;

  @override
  String toString() {
    return 'PhraseAddForm(creationStatus: $creationStatus, phraseInput: $phraseInput, scenes: $scenes, scenesInput: $scenesInput, isValid: $isValid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhraseAddFormImpl &&
            (identical(other.creationStatus, creationStatus) ||
                other.creationStatus == creationStatus) &&
            (identical(other.phraseInput, phraseInput) ||
                other.phraseInput == phraseInput) &&
            const DeepCollectionEquality().equals(other._scenes, _scenes) &&
            (identical(other.scenesInput, scenesInput) ||
                other.scenesInput == scenesInput) &&
            (identical(other.isValid, isValid) || other.isValid == isValid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, creationStatus, phraseInput,
      const DeepCollectionEquality().hash(_scenes), scenesInput, isValid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhraseAddFormImplCopyWith<_$PhraseAddFormImpl> get copyWith =>
      __$$PhraseAddFormImplCopyWithImpl<_$PhraseAddFormImpl>(this, _$identity);
}

abstract class _PhraseAddForm implements PhraseAddForm {
  factory _PhraseAddForm(
      {required final FormCreationStatus creationStatus,
      required final PhraseInput phraseInput,
      required final List<Scene>? scenes,
      required final ScenesInput scenesInput,
      required final bool isValid}) = _$PhraseAddFormImpl;

  @override
  FormCreationStatus get creationStatus;
  @override
  PhraseInput get phraseInput;
  @override
  List<Scene>? get scenes;
  @override
  ScenesInput get scenesInput;
  @override
  bool get isValid;
  @override
  @JsonKey(ignore: true)
  _$$PhraseAddFormImplCopyWith<_$PhraseAddFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
