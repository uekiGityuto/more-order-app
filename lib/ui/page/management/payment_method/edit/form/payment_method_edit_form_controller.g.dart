// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method_edit_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$paymentMethodEditFormControllerHash() =>
    r'd419bbdca01453cf4495ff9701e83a54e0cc2315';

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

abstract class _$PaymentMethodEditFormController
    extends BuildlessAutoDisposeNotifier<PaymentMethodEditForm> {
  late final PaymentMethod paymentMethod;

  PaymentMethodEditForm build(
    PaymentMethod paymentMethod,
  );
}

/// See also [PaymentMethodEditFormController].
@ProviderFor(PaymentMethodEditFormController)
const paymentMethodEditFormControllerProvider =
    PaymentMethodEditFormControllerFamily();

/// See also [PaymentMethodEditFormController].
class PaymentMethodEditFormControllerFamily
    extends Family<PaymentMethodEditForm> {
  /// See also [PaymentMethodEditFormController].
  const PaymentMethodEditFormControllerFamily();

  /// See also [PaymentMethodEditFormController].
  PaymentMethodEditFormControllerProvider call(
    PaymentMethod paymentMethod,
  ) {
    return PaymentMethodEditFormControllerProvider(
      paymentMethod,
    );
  }

  @override
  PaymentMethodEditFormControllerProvider getProviderOverride(
    covariant PaymentMethodEditFormControllerProvider provider,
  ) {
    return call(
      provider.paymentMethod,
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
  String? get name => r'paymentMethodEditFormControllerProvider';
}

/// See also [PaymentMethodEditFormController].
class PaymentMethodEditFormControllerProvider
    extends AutoDisposeNotifierProviderImpl<PaymentMethodEditFormController,
        PaymentMethodEditForm> {
  /// See also [PaymentMethodEditFormController].
  PaymentMethodEditFormControllerProvider(
    PaymentMethod paymentMethod,
  ) : this._internal(
          () =>
              PaymentMethodEditFormController()..paymentMethod = paymentMethod,
          from: paymentMethodEditFormControllerProvider,
          name: r'paymentMethodEditFormControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$paymentMethodEditFormControllerHash,
          dependencies: PaymentMethodEditFormControllerFamily._dependencies,
          allTransitiveDependencies:
              PaymentMethodEditFormControllerFamily._allTransitiveDependencies,
          paymentMethod: paymentMethod,
        );

  PaymentMethodEditFormControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.paymentMethod,
  }) : super.internal();

  final PaymentMethod paymentMethod;

  @override
  PaymentMethodEditForm runNotifierBuild(
    covariant PaymentMethodEditFormController notifier,
  ) {
    return notifier.build(
      paymentMethod,
    );
  }

  @override
  Override overrideWith(PaymentMethodEditFormController Function() create) {
    return ProviderOverride(
      origin: this,
      override: PaymentMethodEditFormControllerProvider._internal(
        () => create()..paymentMethod = paymentMethod,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        paymentMethod: paymentMethod,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<PaymentMethodEditFormController,
      PaymentMethodEditForm> createElement() {
    return _PaymentMethodEditFormControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PaymentMethodEditFormControllerProvider &&
        other.paymentMethod == paymentMethod;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, paymentMethod.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PaymentMethodEditFormControllerRef
    on AutoDisposeNotifierProviderRef<PaymentMethodEditForm> {
  /// The parameter `paymentMethod` of this provider.
  PaymentMethod get paymentMethod;
}

class _PaymentMethodEditFormControllerProviderElement
    extends AutoDisposeNotifierProviderElement<PaymentMethodEditFormController,
        PaymentMethodEditForm> with PaymentMethodEditFormControllerRef {
  _PaymentMethodEditFormControllerProviderElement(super.provider);

  @override
  PaymentMethod get paymentMethod =>
      (origin as PaymentMethodEditFormControllerProvider).paymentMethod;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
