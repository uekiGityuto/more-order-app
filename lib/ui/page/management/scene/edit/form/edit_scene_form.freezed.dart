// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_scene_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditSceneForm {
  SceneInput get sceneInput => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditSceneFormCopyWith<EditSceneForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditSceneFormCopyWith<$Res> {
  factory $EditSceneFormCopyWith(
          EditSceneForm value, $Res Function(EditSceneForm) then) =
      _$EditSceneFormCopyWithImpl<$Res, EditSceneForm>;
  @useResult
  $Res call({SceneInput sceneInput, bool isValid});
}

/// @nodoc
class _$EditSceneFormCopyWithImpl<$Res, $Val extends EditSceneForm>
    implements $EditSceneFormCopyWith<$Res> {
  _$EditSceneFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sceneInput = null,
    Object? isValid = null,
  }) {
    return _then(_value.copyWith(
      sceneInput: null == sceneInput
          ? _value.sceneInput
          : sceneInput // ignore: cast_nullable_to_non_nullable
              as SceneInput,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditSceneFormImplCopyWith<$Res>
    implements $EditSceneFormCopyWith<$Res> {
  factory _$$EditSceneFormImplCopyWith(
          _$EditSceneFormImpl value, $Res Function(_$EditSceneFormImpl) then) =
      __$$EditSceneFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SceneInput sceneInput, bool isValid});
}

/// @nodoc
class __$$EditSceneFormImplCopyWithImpl<$Res>
    extends _$EditSceneFormCopyWithImpl<$Res, _$EditSceneFormImpl>
    implements _$$EditSceneFormImplCopyWith<$Res> {
  __$$EditSceneFormImplCopyWithImpl(
      _$EditSceneFormImpl _value, $Res Function(_$EditSceneFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sceneInput = null,
    Object? isValid = null,
  }) {
    return _then(_$EditSceneFormImpl(
      sceneInput: null == sceneInput
          ? _value.sceneInput
          : sceneInput // ignore: cast_nullable_to_non_nullable
              as SceneInput,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$EditSceneFormImpl implements _EditSceneForm {
  _$EditSceneFormImpl({required this.sceneInput, required this.isValid});

  @override
  final SceneInput sceneInput;
  @override
  final bool isValid;

  @override
  String toString() {
    return 'EditSceneForm(sceneInput: $sceneInput, isValid: $isValid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditSceneFormImpl &&
            (identical(other.sceneInput, sceneInput) ||
                other.sceneInput == sceneInput) &&
            (identical(other.isValid, isValid) || other.isValid == isValid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sceneInput, isValid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditSceneFormImplCopyWith<_$EditSceneFormImpl> get copyWith =>
      __$$EditSceneFormImplCopyWithImpl<_$EditSceneFormImpl>(this, _$identity);
}

abstract class _EditSceneForm implements EditSceneForm {
  factory _EditSceneForm(
      {required final SceneInput sceneInput,
      required final bool isValid}) = _$EditSceneFormImpl;

  @override
  SceneInput get sceneInput;
  @override
  bool get isValid;
  @override
  @JsonKey(ignore: true)
  _$$EditSceneFormImplCopyWith<_$EditSceneFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
