// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_order_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CustomOrderForm {
  FormCreationStatus get creationStatus => throw _privateConstructorUsedError;
  List<Reason>? get reasons => throw _privateConstructorUsedError;
  Id? get reasonInput => throw _privateConstructorUsedError;
  Map<int, Order> get ordersInput => throw _privateConstructorUsedError;
  List<PaymentMethod>? get paymentMethods => throw _privateConstructorUsedError;
  Id? get paymentMethodInput => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomOrderFormCopyWith<CustomOrderForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomOrderFormCopyWith<$Res> {
  factory $CustomOrderFormCopyWith(
          CustomOrderForm value, $Res Function(CustomOrderForm) then) =
      _$CustomOrderFormCopyWithImpl<$Res, CustomOrderForm>;
  @useResult
  $Res call(
      {FormCreationStatus creationStatus,
      List<Reason>? reasons,
      Id? reasonInput,
      Map<int, Order> ordersInput,
      List<PaymentMethod>? paymentMethods,
      Id? paymentMethodInput});

  $IdCopyWith<$Res>? get reasonInput;
  $IdCopyWith<$Res>? get paymentMethodInput;
}

/// @nodoc
class _$CustomOrderFormCopyWithImpl<$Res, $Val extends CustomOrderForm>
    implements $CustomOrderFormCopyWith<$Res> {
  _$CustomOrderFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creationStatus = null,
    Object? reasons = freezed,
    Object? reasonInput = freezed,
    Object? ordersInput = null,
    Object? paymentMethods = freezed,
    Object? paymentMethodInput = freezed,
  }) {
    return _then(_value.copyWith(
      creationStatus: null == creationStatus
          ? _value.creationStatus
          : creationStatus // ignore: cast_nullable_to_non_nullable
              as FormCreationStatus,
      reasons: freezed == reasons
          ? _value.reasons
          : reasons // ignore: cast_nullable_to_non_nullable
              as List<Reason>?,
      reasonInput: freezed == reasonInput
          ? _value.reasonInput
          : reasonInput // ignore: cast_nullable_to_non_nullable
              as Id?,
      ordersInput: null == ordersInput
          ? _value.ordersInput
          : ordersInput // ignore: cast_nullable_to_non_nullable
              as Map<int, Order>,
      paymentMethods: freezed == paymentMethods
          ? _value.paymentMethods
          : paymentMethods // ignore: cast_nullable_to_non_nullable
              as List<PaymentMethod>?,
      paymentMethodInput: freezed == paymentMethodInput
          ? _value.paymentMethodInput
          : paymentMethodInput // ignore: cast_nullable_to_non_nullable
              as Id?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $IdCopyWith<$Res>? get reasonInput {
    if (_value.reasonInput == null) {
      return null;
    }

    return $IdCopyWith<$Res>(_value.reasonInput!, (value) {
      return _then(_value.copyWith(reasonInput: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $IdCopyWith<$Res>? get paymentMethodInput {
    if (_value.paymentMethodInput == null) {
      return null;
    }

    return $IdCopyWith<$Res>(_value.paymentMethodInput!, (value) {
      return _then(_value.copyWith(paymentMethodInput: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CustomOrderFormImplCopyWith<$Res>
    implements $CustomOrderFormCopyWith<$Res> {
  factory _$$CustomOrderFormImplCopyWith(_$CustomOrderFormImpl value,
          $Res Function(_$CustomOrderFormImpl) then) =
      __$$CustomOrderFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormCreationStatus creationStatus,
      List<Reason>? reasons,
      Id? reasonInput,
      Map<int, Order> ordersInput,
      List<PaymentMethod>? paymentMethods,
      Id? paymentMethodInput});

  @override
  $IdCopyWith<$Res>? get reasonInput;
  @override
  $IdCopyWith<$Res>? get paymentMethodInput;
}

/// @nodoc
class __$$CustomOrderFormImplCopyWithImpl<$Res>
    extends _$CustomOrderFormCopyWithImpl<$Res, _$CustomOrderFormImpl>
    implements _$$CustomOrderFormImplCopyWith<$Res> {
  __$$CustomOrderFormImplCopyWithImpl(
      _$CustomOrderFormImpl _value, $Res Function(_$CustomOrderFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creationStatus = null,
    Object? reasons = freezed,
    Object? reasonInput = freezed,
    Object? ordersInput = null,
    Object? paymentMethods = freezed,
    Object? paymentMethodInput = freezed,
  }) {
    return _then(_$CustomOrderFormImpl(
      creationStatus: null == creationStatus
          ? _value.creationStatus
          : creationStatus // ignore: cast_nullable_to_non_nullable
              as FormCreationStatus,
      reasons: freezed == reasons
          ? _value._reasons
          : reasons // ignore: cast_nullable_to_non_nullable
              as List<Reason>?,
      reasonInput: freezed == reasonInput
          ? _value.reasonInput
          : reasonInput // ignore: cast_nullable_to_non_nullable
              as Id?,
      ordersInput: null == ordersInput
          ? _value._ordersInput
          : ordersInput // ignore: cast_nullable_to_non_nullable
              as Map<int, Order>,
      paymentMethods: freezed == paymentMethods
          ? _value._paymentMethods
          : paymentMethods // ignore: cast_nullable_to_non_nullable
              as List<PaymentMethod>?,
      paymentMethodInput: freezed == paymentMethodInput
          ? _value.paymentMethodInput
          : paymentMethodInput // ignore: cast_nullable_to_non_nullable
              as Id?,
    ));
  }
}

/// @nodoc

class _$CustomOrderFormImpl implements _CustomOrderForm {
  _$CustomOrderFormImpl(
      {required this.creationStatus,
      required final List<Reason>? reasons,
      required this.reasonInput,
      required final Map<int, Order> ordersInput,
      required final List<PaymentMethod>? paymentMethods,
      required this.paymentMethodInput})
      : _reasons = reasons,
        _ordersInput = ordersInput,
        _paymentMethods = paymentMethods;

  @override
  final FormCreationStatus creationStatus;
  final List<Reason>? _reasons;
  @override
  List<Reason>? get reasons {
    final value = _reasons;
    if (value == null) return null;
    if (_reasons is EqualUnmodifiableListView) return _reasons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Id? reasonInput;
  final Map<int, Order> _ordersInput;
  @override
  Map<int, Order> get ordersInput {
    if (_ordersInput is EqualUnmodifiableMapView) return _ordersInput;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_ordersInput);
  }

  final List<PaymentMethod>? _paymentMethods;
  @override
  List<PaymentMethod>? get paymentMethods {
    final value = _paymentMethods;
    if (value == null) return null;
    if (_paymentMethods is EqualUnmodifiableListView) return _paymentMethods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Id? paymentMethodInput;

  @override
  String toString() {
    return 'CustomOrderForm(creationStatus: $creationStatus, reasons: $reasons, reasonInput: $reasonInput, ordersInput: $ordersInput, paymentMethods: $paymentMethods, paymentMethodInput: $paymentMethodInput)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomOrderFormImpl &&
            (identical(other.creationStatus, creationStatus) ||
                other.creationStatus == creationStatus) &&
            const DeepCollectionEquality().equals(other._reasons, _reasons) &&
            (identical(other.reasonInput, reasonInput) ||
                other.reasonInput == reasonInput) &&
            const DeepCollectionEquality()
                .equals(other._ordersInput, _ordersInput) &&
            const DeepCollectionEquality()
                .equals(other._paymentMethods, _paymentMethods) &&
            (identical(other.paymentMethodInput, paymentMethodInput) ||
                other.paymentMethodInput == paymentMethodInput));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      creationStatus,
      const DeepCollectionEquality().hash(_reasons),
      reasonInput,
      const DeepCollectionEquality().hash(_ordersInput),
      const DeepCollectionEquality().hash(_paymentMethods),
      paymentMethodInput);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomOrderFormImplCopyWith<_$CustomOrderFormImpl> get copyWith =>
      __$$CustomOrderFormImplCopyWithImpl<_$CustomOrderFormImpl>(
          this, _$identity);
}

abstract class _CustomOrderForm implements CustomOrderForm {
  factory _CustomOrderForm(
      {required final FormCreationStatus creationStatus,
      required final List<Reason>? reasons,
      required final Id? reasonInput,
      required final Map<int, Order> ordersInput,
      required final List<PaymentMethod>? paymentMethods,
      required final Id? paymentMethodInput}) = _$CustomOrderFormImpl;

  @override
  FormCreationStatus get creationStatus;
  @override
  List<Reason>? get reasons;
  @override
  Id? get reasonInput;
  @override
  Map<int, Order> get ordersInput;
  @override
  List<PaymentMethod>? get paymentMethods;
  @override
  Id? get paymentMethodInput;
  @override
  @JsonKey(ignore: true)
  _$$CustomOrderFormImplCopyWith<_$CustomOrderFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
