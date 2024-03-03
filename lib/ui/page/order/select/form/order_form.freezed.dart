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
  Scene? get scene => throw _privateConstructorUsedError;
  Map<Id, bool> get phrasesInput => throw _privateConstructorUsedError;

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
      Scene? scene,
      Map<Id, bool> phrasesInput});

  $SceneCopyWith<$Res>? get scene;
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
    Object? scene = freezed,
    Object? phrasesInput = null,
  }) {
    return _then(_value.copyWith(
      creationStatus: null == creationStatus
          ? _value.creationStatus
          : creationStatus // ignore: cast_nullable_to_non_nullable
              as FormCreationStatus,
      scene: freezed == scene
          ? _value.scene
          : scene // ignore: cast_nullable_to_non_nullable
              as Scene?,
      phrasesInput: null == phrasesInput
          ? _value.phrasesInput
          : phrasesInput // ignore: cast_nullable_to_non_nullable
              as Map<Id, bool>,
    ) as $Val);
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
      Scene? scene,
      Map<Id, bool> phrasesInput});

  @override
  $SceneCopyWith<$Res>? get scene;
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
    Object? scene = freezed,
    Object? phrasesInput = null,
  }) {
    return _then(_$OrderFormImpl(
      creationStatus: null == creationStatus
          ? _value.creationStatus
          : creationStatus // ignore: cast_nullable_to_non_nullable
              as FormCreationStatus,
      scene: freezed == scene
          ? _value.scene
          : scene // ignore: cast_nullable_to_non_nullable
              as Scene?,
      phrasesInput: null == phrasesInput
          ? _value._phrasesInput
          : phrasesInput // ignore: cast_nullable_to_non_nullable
              as Map<Id, bool>,
    ));
  }
}

/// @nodoc

class _$OrderFormImpl implements _OrderForm {
  _$OrderFormImpl(
      {required this.creationStatus,
      required this.scene,
      required final Map<Id, bool> phrasesInput})
      : _phrasesInput = phrasesInput;

  @override
  final FormCreationStatus creationStatus;
  @override
  final Scene? scene;
  final Map<Id, bool> _phrasesInput;
  @override
  Map<Id, bool> get phrasesInput {
    if (_phrasesInput is EqualUnmodifiableMapView) return _phrasesInput;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_phrasesInput);
  }

  @override
  String toString() {
    return 'OrderForm(creationStatus: $creationStatus, scene: $scene, phrasesInput: $phrasesInput)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderFormImpl &&
            (identical(other.creationStatus, creationStatus) ||
                other.creationStatus == creationStatus) &&
            (identical(other.scene, scene) || other.scene == scene) &&
            const DeepCollectionEquality()
                .equals(other._phrasesInput, _phrasesInput));
  }

  @override
  int get hashCode => Object.hash(runtimeType, creationStatus, scene,
      const DeepCollectionEquality().hash(_phrasesInput));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderFormImplCopyWith<_$OrderFormImpl> get copyWith =>
      __$$OrderFormImplCopyWithImpl<_$OrderFormImpl>(this, _$identity);
}

abstract class _OrderForm implements OrderForm {
  factory _OrderForm(
      {required final FormCreationStatus creationStatus,
      required final Scene? scene,
      required final Map<Id, bool> phrasesInput}) = _$OrderFormImpl;

  @override
  FormCreationStatus get creationStatus;
  @override
  Scene? get scene;
  @override
  Map<Id, bool> get phrasesInput;
  @override
  @JsonKey(ignore: true)
  _$$OrderFormImplCopyWith<_$OrderFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
