// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reason.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Reason {
  Id get id => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReasonCopyWith<Reason> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReasonCopyWith<$Res> {
  factory $ReasonCopyWith(Reason value, $Res Function(Reason) then) =
      _$ReasonCopyWithImpl<$Res, Reason>;
  @useResult
  $Res call({Id id, String reason, bool isDefault});

  $IdCopyWith<$Res> get id;
}

/// @nodoc
class _$ReasonCopyWithImpl<$Res, $Val extends Reason>
    implements $ReasonCopyWith<$Res> {
  _$ReasonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reason = null,
    Object? isDefault = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as Id,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$ReasonImplCopyWith<$Res> implements $ReasonCopyWith<$Res> {
  factory _$$ReasonImplCopyWith(
          _$ReasonImpl value, $Res Function(_$ReasonImpl) then) =
      __$$ReasonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Id id, String reason, bool isDefault});

  @override
  $IdCopyWith<$Res> get id;
}

/// @nodoc
class __$$ReasonImplCopyWithImpl<$Res>
    extends _$ReasonCopyWithImpl<$Res, _$ReasonImpl>
    implements _$$ReasonImplCopyWith<$Res> {
  __$$ReasonImplCopyWithImpl(
      _$ReasonImpl _value, $Res Function(_$ReasonImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reason = null,
    Object? isDefault = null,
  }) {
    return _then(_$ReasonImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as Id,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ReasonImpl extends _Reason {
  const _$ReasonImpl(
      {required this.id, required this.reason, required this.isDefault})
      : super._();

  @override
  final Id id;
  @override
  final String reason;
  @override
  final bool isDefault;

  @override
  String toString() {
    return 'Reason(id: $id, reason: $reason, isDefault: $isDefault)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReasonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, reason, isDefault);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReasonImplCopyWith<_$ReasonImpl> get copyWith =>
      __$$ReasonImplCopyWithImpl<_$ReasonImpl>(this, _$identity);
}

abstract class _Reason extends Reason {
  const factory _Reason(
      {required final Id id,
      required final String reason,
      required final bool isDefault}) = _$ReasonImpl;
  const _Reason._() : super._();

  @override
  Id get id;
  @override
  String get reason;
  @override
  bool get isDefault;
  @override
  @JsonKey(ignore: true)
  _$$ReasonImplCopyWith<_$ReasonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
