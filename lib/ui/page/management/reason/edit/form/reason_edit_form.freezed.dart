// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reason_edit_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReasonEditForm {
  ReasonInput get reasonInput => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReasonEditFormCopyWith<ReasonEditForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReasonEditFormCopyWith<$Res> {
  factory $ReasonEditFormCopyWith(
          ReasonEditForm value, $Res Function(ReasonEditForm) then) =
      _$ReasonEditFormCopyWithImpl<$Res, ReasonEditForm>;
  @useResult
  $Res call({ReasonInput reasonInput, bool isDefault, bool isValid});
}

/// @nodoc
class _$ReasonEditFormCopyWithImpl<$Res, $Val extends ReasonEditForm>
    implements $ReasonEditFormCopyWith<$Res> {
  _$ReasonEditFormCopyWithImpl(this._value, this._then);

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
abstract class _$$ReasonEditFormImplCopyWith<$Res>
    implements $ReasonEditFormCopyWith<$Res> {
  factory _$$ReasonEditFormImplCopyWith(_$ReasonEditFormImpl value,
          $Res Function(_$ReasonEditFormImpl) then) =
      __$$ReasonEditFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ReasonInput reasonInput, bool isDefault, bool isValid});
}

/// @nodoc
class __$$ReasonEditFormImplCopyWithImpl<$Res>
    extends _$ReasonEditFormCopyWithImpl<$Res, _$ReasonEditFormImpl>
    implements _$$ReasonEditFormImplCopyWith<$Res> {
  __$$ReasonEditFormImplCopyWithImpl(
      _$ReasonEditFormImpl _value, $Res Function(_$ReasonEditFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reasonInput = null,
    Object? isDefault = null,
    Object? isValid = null,
  }) {
    return _then(_$ReasonEditFormImpl(
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

class _$ReasonEditFormImpl implements _ReasonEditForm {
  _$ReasonEditFormImpl(
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
    return 'ReasonEditForm(reasonInput: $reasonInput, isDefault: $isDefault, isValid: $isValid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReasonEditFormImpl &&
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
  _$$ReasonEditFormImplCopyWith<_$ReasonEditFormImpl> get copyWith =>
      __$$ReasonEditFormImplCopyWithImpl<_$ReasonEditFormImpl>(
          this, _$identity);
}

abstract class _ReasonEditForm implements ReasonEditForm {
  factory _ReasonEditForm(
      {required final ReasonInput reasonInput,
      required final bool isDefault,
      required final bool isValid}) = _$ReasonEditFormImpl;

  @override
  ReasonInput get reasonInput;
  @override
  bool get isDefault;
  @override
  bool get isValid;
  @override
  @JsonKey(ignore: true)
  _$$ReasonEditFormImplCopyWith<_$ReasonEditFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
