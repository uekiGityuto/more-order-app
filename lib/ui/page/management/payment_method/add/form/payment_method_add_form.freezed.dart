// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_method_add_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaymentMethodAddForm {
  MethodInput get methodInput => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentMethodAddFormCopyWith<PaymentMethodAddForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodAddFormCopyWith<$Res> {
  factory $PaymentMethodAddFormCopyWith(PaymentMethodAddForm value,
          $Res Function(PaymentMethodAddForm) then) =
      _$PaymentMethodAddFormCopyWithImpl<$Res, PaymentMethodAddForm>;
  @useResult
  $Res call({MethodInput methodInput, bool isDefault, bool isValid});
}

/// @nodoc
class _$PaymentMethodAddFormCopyWithImpl<$Res,
        $Val extends PaymentMethodAddForm>
    implements $PaymentMethodAddFormCopyWith<$Res> {
  _$PaymentMethodAddFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? methodInput = null,
    Object? isDefault = null,
    Object? isValid = null,
  }) {
    return _then(_value.copyWith(
      methodInput: null == methodInput
          ? _value.methodInput
          : methodInput // ignore: cast_nullable_to_non_nullable
              as MethodInput,
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
abstract class _$$PaymentMethodAddFormImplCopyWith<$Res>
    implements $PaymentMethodAddFormCopyWith<$Res> {
  factory _$$PaymentMethodAddFormImplCopyWith(_$PaymentMethodAddFormImpl value,
          $Res Function(_$PaymentMethodAddFormImpl) then) =
      __$$PaymentMethodAddFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MethodInput methodInput, bool isDefault, bool isValid});
}

/// @nodoc
class __$$PaymentMethodAddFormImplCopyWithImpl<$Res>
    extends _$PaymentMethodAddFormCopyWithImpl<$Res, _$PaymentMethodAddFormImpl>
    implements _$$PaymentMethodAddFormImplCopyWith<$Res> {
  __$$PaymentMethodAddFormImplCopyWithImpl(_$PaymentMethodAddFormImpl _value,
      $Res Function(_$PaymentMethodAddFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? methodInput = null,
    Object? isDefault = null,
    Object? isValid = null,
  }) {
    return _then(_$PaymentMethodAddFormImpl(
      methodInput: null == methodInput
          ? _value.methodInput
          : methodInput // ignore: cast_nullable_to_non_nullable
              as MethodInput,
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

class _$PaymentMethodAddFormImpl implements _PaymentMethodAddForm {
  _$PaymentMethodAddFormImpl(
      {required this.methodInput,
      required this.isDefault,
      required this.isValid});

  @override
  final MethodInput methodInput;
  @override
  final bool isDefault;
  @override
  final bool isValid;

  @override
  String toString() {
    return 'PaymentMethodAddForm(methodInput: $methodInput, isDefault: $isDefault, isValid: $isValid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodAddFormImpl &&
            (identical(other.methodInput, methodInput) ||
                other.methodInput == methodInput) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.isValid, isValid) || other.isValid == isValid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, methodInput, isDefault, isValid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodAddFormImplCopyWith<_$PaymentMethodAddFormImpl>
      get copyWith =>
          __$$PaymentMethodAddFormImplCopyWithImpl<_$PaymentMethodAddFormImpl>(
              this, _$identity);
}

abstract class _PaymentMethodAddForm implements PaymentMethodAddForm {
  factory _PaymentMethodAddForm(
      {required final MethodInput methodInput,
      required final bool isDefault,
      required final bool isValid}) = _$PaymentMethodAddFormImpl;

  @override
  MethodInput get methodInput;
  @override
  bool get isDefault;
  @override
  bool get isValid;
  @override
  @JsonKey(ignore: true)
  _$$PaymentMethodAddFormImplCopyWith<_$PaymentMethodAddFormImpl>
      get copyWith => throw _privateConstructorUsedError;
}
