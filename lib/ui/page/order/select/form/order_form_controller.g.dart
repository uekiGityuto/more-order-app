// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$orderFormControllerHash() =>
    r'98847d7eb61a6813387568f9aaa1dd36ba50d2fb';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$OrderFormController
    extends BuildlessAutoDisposeNotifier<OrderForm> {
  late final String sceneName;

  OrderForm build(
    String sceneName,
  );
}

/// See also [OrderFormController].
@ProviderFor(OrderFormController)
const orderFormControllerProvider = OrderFormControllerFamily();

/// See also [OrderFormController].
class OrderFormControllerFamily extends Family<OrderForm> {
  /// See also [OrderFormController].
  const OrderFormControllerFamily();

  /// See also [OrderFormController].
  OrderFormControllerProvider call(
    String sceneName,
  ) {
    return OrderFormControllerProvider(
      sceneName,
    );
  }

  @override
  OrderFormControllerProvider getProviderOverride(
    covariant OrderFormControllerProvider provider,
  ) {
    return call(
      provider.sceneName,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'orderFormControllerProvider';
}

/// See also [OrderFormController].
class OrderFormControllerProvider
    extends AutoDisposeNotifierProviderImpl<OrderFormController, OrderForm> {
  /// See also [OrderFormController].
  OrderFormControllerProvider(
    String sceneName,
  ) : this._internal(
          () => OrderFormController()..sceneName = sceneName,
          from: orderFormControllerProvider,
          name: r'orderFormControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$orderFormControllerHash,
          dependencies: OrderFormControllerFamily._dependencies,
          allTransitiveDependencies:
              OrderFormControllerFamily._allTransitiveDependencies,
          sceneName: sceneName,
        );

  OrderFormControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sceneName,
  }) : super.internal();

  final String sceneName;

  @override
  OrderForm runNotifierBuild(
    covariant OrderFormController notifier,
  ) {
    return notifier.build(
      sceneName,
    );
  }

  @override
  Override overrideWith(OrderFormController Function() create) {
    return ProviderOverride(
      origin: this,
      override: OrderFormControllerProvider._internal(
        () => create()..sceneName = sceneName,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sceneName: sceneName,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<OrderFormController, OrderForm>
      createElement() {
    return _OrderFormControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OrderFormControllerProvider && other.sceneName == sceneName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sceneName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin OrderFormControllerRef on AutoDisposeNotifierProviderRef<OrderForm> {
  /// The parameter `sceneName` of this provider.
  String get sceneName;
}

class _OrderFormControllerProviderElement
    extends AutoDisposeNotifierProviderElement<OrderFormController, OrderForm>
    with OrderFormControllerRef {
  _OrderFormControllerProviderElement(super.provider);

  @override
  String get sceneName => (origin as OrderFormControllerProvider).sceneName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
