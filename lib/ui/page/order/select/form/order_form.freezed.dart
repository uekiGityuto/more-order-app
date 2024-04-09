// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderForm {
  FormCreationStatus get creationStatus => throw _privateConstructorUsedError;
  List<Reason>? get reasons => throw _privateConstructorUsedError;
  Id? get reasonInput => throw _privateConstructorUsedError;
  Scene? get scene => throw _privateConstructorUsedError;
  Map<Id, int> get phrasesInput => throw _privateConstructorUsedError;
  List<PaymentMethod>? get paymentMethods => throw _privateConstructorUsedError;
  Id? get paymentMethodInput => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderFormCopyWith<OrderForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderFormCopyWith<$Res> {
  factory $OrderFormCopyWith(OrderForm value, $Res Function(OrderForm) then) =
      _$OrderFormCopyWithImpl<$Res, OrderForm>;
  @useResult
  $Res call(
      {FormCreationStatus creationStatus,
      List<Reason>? reasons,
      Id? reasonInput,
      Scene? scene,
      Map<Id, int> phrasesInput,
      List<PaymentMethod>? paymentMethods,
      Id? paymentMethodInput});

  $IdCopyWith<$Res>? get reasonInput;
  $SceneCopyWith<$Res>? get scene;
  $IdCopyWith<$Res>? get paymentMethodInput;
}

/// @nodoc
class _$OrderFormCopyWithImpl<$Res, $Val extends OrderForm>
    implements $OrderFormCopyWith<$Res> {
  _$OrderFormCopyWithImpl(this._value, this._then);

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
    Object? scene = freezed,
    Object? phrasesInput = null,
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
      scene: freezed == scene
          ? _value.scene
          : scene // ignore: cast_nullable_to_non_nullable
              as Scene?,
      phrasesInput: null == phrasesInput
          ? _value.phrasesInput
          : phrasesInput // ignore: cast_nullable_to_non_nullable
              as Map<Id, int>,
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
  $SceneCopyWith<$Res>? get scene {
    if (_value.scene == null) {
      return null;
    }

    return $SceneCopyWith<$Res>(_value.scene!, (value) {
      return _then(_value.copyWith(scene: value) as $Val);
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
abstract class _$$OrderFormImplCopyWith<$Res>
    implements $OrderFormCopyWith<$Res> {
  factory _$$OrderFormImplCopyWith(
          _$OrderFormImpl value, $Res Function(_$OrderFormImpl) then) =
      __$$OrderFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormCreationStatus creationStatus,
      List<Reason>? reasons,
      Id? reasonInput,
      Scene? scene,
      Map<Id, int> phrasesInput,
      List<PaymentMethod>? paymentMethods,
      Id? paymentMethodInput});

  @override
  $IdCopyWith<$Res>? get reasonInput;
  @override
  $SceneCopyWith<$Res>? get scene;
  @override
  $IdCopyWith<$Res>? get paymentMethodInput;
}

/// @nodoc
class __$$OrderFormImplCopyWithImpl<$Res>
    extends _$OrderFormCopyWithImpl<$Res, _$OrderFormImpl>
    implements _$$OrderFormImplCopyWith<$Res> {
  __$$OrderFormImplCopyWithImpl(
      _$OrderFormImpl _value, $Res Function(_$OrderFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creationStatus = null,
    Object? reasons = freezed,
    Object? reasonInput = freezed,
    Object? scene = freezed,
    Object? phrasesInput = null,
    Object? paymentMethods = freezed,
    Object? paymentMethodInput = freezed,
  }) {
    return _then(_$OrderFormImpl(
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
      scene: freezed == scene
          ? _value.scene
          : scene // ignore: cast_nullable_to_non_nullable
              as Scene?,
      phrasesInput: null == phrasesInput
          ? _value._phrasesInput
          : phrasesInput // ignore: cast_nullable_to_non_nullable
              as Map<Id, int>,
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

class _$OrderFormImpl implements _OrderForm {
  _$OrderFormImpl(
      {required this.creationStatus,
      required final List<Reason>? reasons,
      required this.reasonInput,
      required this.scene,
      required final Map<Id, int> phrasesInput,
      required final List<PaymentMethod>? paymentMethods,
      required this.paymentMethodInput})
      : _reasons = reasons,
        _phrasesInput = phrasesInput,
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
  @override
  final Scene? scene;
  final Map<Id, int> _phrasesInput;
  @override
  Map<Id, int> get phrasesInput {
    if (_phrasesInput is EqualUnmodifiableMapView) return _phrasesInput;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_phrasesInput);
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
    return 'OrderForm(creationStatus: $creationStatus, reasons: $reasons, reasonInput: $reasonInput, scene: $scene, phrasesInput: $phrasesInput, paymentMethods: $paymentMethods, paymentMethodInput: $paymentMethodInput)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderFormImpl &&
            (identical(other.creationStatus, creationStatus) ||
                other.creationStatus == creationStatus) &&
            const DeepCollectionEquality().equals(other._reasons, _reasons) &&
            (identical(other.reasonInput, reasonInput) ||
                other.reasonInput == reasonInput) &&
            (identical(other.scene, scene) || other.scene == scene) &&
            const DeepCollectionEquality()
                .equals(other._phrasesInput, _phrasesInput) &&
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
      scene,
      const DeepCollectionEquality().hash(_phrasesInput),
      const DeepCollectionEquality().hash(_paymentMethods),
      paymentMethodInput);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderFormImplCopyWith<_$OrderFormImpl> get copyWith =>
      __$$OrderFormImplCopyWithImpl<_$OrderFormImpl>(this, _$identity);
}

abstract class _OrderForm implements OrderForm {
  factory _OrderForm(
      {required final FormCreationStatus creationStatus,
      required final List<Reason>? reasons,
      required final Id? reasonInput,
      required final Scene? scene,
      required final Map<Id, int> phrasesInput,
      required final List<PaymentMethod>? paymentMethods,
      required final Id? paymentMethodInput}) = _$OrderFormImpl;

  @override
  FormCreationStatus get creationStatus;
  @override
  List<Reason>? get reasons;
  @override
  Id? get reasonInput;
  @override
  Scene? get scene;
  @override
  Map<Id, int> get phrasesInput;
  @override
  List<PaymentMethod>? get paymentMethods;
  @override
  Id? get paymentMethodInput;
  @override
  @JsonKey(ignore: true)
  _$$OrderFormImplCopyWith<_$OrderFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
