// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_reason_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddReasonForm {
  ReasonInput get reasonInput => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddReasonFormCopyWith<AddReasonForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddReasonFormCopyWith<$Res> {
  factory $AddReasonFormCopyWith(
          AddReasonForm value, $Res Function(AddReasonForm) then) =
      _$AddReasonFormCopyWithImpl<$Res, AddReasonForm>;
  @useResult
  $Res call({ReasonInput reasonInput, bool isDefault, bool isValid});
}

/// @nodoc
class _$AddReasonFormCopyWithImpl<$Res, $Val extends AddReasonForm>
    implements $AddReasonFormCopyWith<$Res> {
  _$AddReasonFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reasonInput = null,
    Object? isDefault = null,
    Object? isValid = null,
  }) {
    return _then(_value.copyWith(
      reasonInput: null == reasonInput
          ? _value.reasonInput
          : reasonInput // ignore: cast_nullable_to_non_nullable
              as ReasonInput,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddReasonFormImplCopyWith<$Res>
    implements $AddReasonFormCopyWith<$Res> {
  factory _$$AddReasonFormImplCopyWith(
          _$AddReasonFormImpl value, $Res Function(_$AddReasonFormImpl) then) =
      __$$AddReasonFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ReasonInput reasonInput, bool isDefault, bool isValid});
}

/// @nodoc
class __$$AddReasonFormImplCopyWithImpl<$Res>
    extends _$AddReasonFormCopyWithImpl<$Res, _$AddReasonFormImpl>
    implements _$$AddReasonFormImplCopyWith<$Res> {
  __$$AddReasonFormImplCopyWithImpl(
      _$AddReasonFormImpl _value, $Res Function(_$AddReasonFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reasonInput = null,
    Object? isDefault = null,
    Object? isValid = null,
  }) {
    return _then(_$AddReasonFormImpl(
      reasonInput: null == reasonInput
          ? _value.reasonInput
          : reasonInput // ignore: cast_nullable_to_non_nullable
              as ReasonInput,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AddReasonFormImpl implements _AddReasonForm {
  _$AddReasonFormImpl(
      {required this.reasonInput,
      required this.isDefault,
      required this.isValid});

  @override
  final ReasonInput reasonInput;
  @override
  final bool isDefault;
  @override
  final bool isValid;

  @override
  String toString() {
    return 'AddReasonForm(reasonInput: $reasonInput, isDefault: $isDefault, isValid: $isValid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddReasonFormImpl &&
            (identical(other.reasonInput, reasonInput) ||
                other.reasonInput == reasonInput) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.isValid, isValid) || other.isValid == isValid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reasonInput, isDefault, isValid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddReasonFormImplCopyWith<_$AddReasonFormImpl> get copyWith =>
      __$$AddReasonFormImplCopyWithImpl<_$AddReasonFormImpl>(this, _$identity);
}

abstract class _AddReasonForm implements AddReasonForm {
  factory _AddReasonForm(
      {required final ReasonInput reasonInput,
      required final bool isDefault,
      required final bool isValid}) = _$AddReasonFormImpl;

  @override
  ReasonInput get reasonInput;
  @override
  bool get isDefault;
  @override
  bool get isValid;
  @override
  @JsonKey(ignore: true)
  _$$AddReasonFormImplCopyWith<_$AddReasonFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
