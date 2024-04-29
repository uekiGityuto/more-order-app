// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registered_order_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$registeredOrderFormControllerHash() =>
    r'e8e3835212826ae45ccb61b1bf3b86cb1d8aff2f';

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

abstract class _$RegisteredOrderFormController
    extends BuildlessAutoDisposeNotifier<RegisteredOrderForm> {
  late final String sceneName;

  RegisteredOrderForm build(
    String sceneName,
  );
}

/// See also [RegisteredOrderFormController].
@ProviderFor(RegisteredOrderFormController)
const registeredOrderFormControllerProvider =
    RegisteredOrderFormControllerFamily();

/// See also [RegisteredOrderFormController].
class RegisteredOrderFormControllerFamily extends Family<RegisteredOrderForm> {
  /// See also [RegisteredOrderFormController].
  const RegisteredOrderFormControllerFamily();

  /// See also [RegisteredOrderFormController].
  RegisteredOrderFormControllerProvider call(
    String sceneName,
  ) {
    return RegisteredOrderFormControllerProvider(
      sceneName,
    );
  }

  @override
  RegisteredOrderFormControllerProvider getProviderOverride(
    covariant RegisteredOrderFormControllerProvider provider,
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
  String? get name => r'registeredOrderFormControllerProvider';
}

/// See also [RegisteredOrderFormController].
class RegisteredOrderFormControllerProvider
    extends AutoDisposeNotifierProviderImpl<RegisteredOrderFormController,
        RegisteredOrderForm> {
  /// See also [RegisteredOrderFormController].
  RegisteredOrderFormControllerProvider(
    String sceneName,
  ) : this._internal(
          () => RegisteredOrderFormController()..sceneName = sceneName,
          from: registeredOrderFormControllerProvider,
          name: r'registeredOrderFormControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$registeredOrderFormControllerHash,
          dependencies: RegisteredOrderFormControllerFamily._dependencies,
          allTransitiveDependencies:
              RegisteredOrderFormControllerFamily._allTransitiveDependencies,
          sceneName: sceneName,
        );

  RegisteredOrderFormControllerProvider._internal(
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
  RegisteredOrderForm runNotifierBuild(
    covariant RegisteredOrderFormController notifier,
  ) {
    return notifier.build(
      sceneName,
    );
  }

  @override
  Override overrideWith(RegisteredOrderFormController Function() create) {
    return ProviderOverride(
      origin: this,
      override: RegisteredOrderFormControllerProvider._internal(
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
  AutoDisposeNotifierProviderElement<RegisteredOrderFormController,
      RegisteredOrderForm> createElement() {
    return _RegisteredOrderFormControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RegisteredOrderFormControllerProvider &&
        other.sceneName == sceneName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sceneName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RegisteredOrderFormControllerRef
    on AutoDisposeNotifierProviderRef<RegisteredOrderForm> {
  /// The parameter `sceneName` of this provider.
  String get sceneName;
}

class _RegisteredOrderFormControllerProviderElement
    extends AutoDisposeNotifierProviderElement<RegisteredOrderFormController,
        RegisteredOrderForm> with RegisteredOrderFormControllerRef {
  _RegisteredOrderFormControllerProviderElement(super.provider);

  @override
  String get sceneName =>
      (origin as RegisteredOrderFormControllerProvider).sceneName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
