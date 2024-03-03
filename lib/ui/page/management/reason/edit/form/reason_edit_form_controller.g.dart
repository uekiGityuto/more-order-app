// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reason_edit_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$reasonEditFormControllerHash() =>
    r'abd05ca3b6673c9aa5b3376b47b55faf898e8b2a';

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

abstract class _$ReasonEditFormController
    extends BuildlessAutoDisposeNotifier<ReasonEditForm> {
  late final Reason reason;

  ReasonEditForm build(
    Reason reason,
  );
}

/// See also [ReasonEditFormController].
@ProviderFor(ReasonEditFormController)
const reasonEditFormControllerProvider = ReasonEditFormControllerFamily();

/// See also [ReasonEditFormController].
class ReasonEditFormControllerFamily extends Family<ReasonEditForm> {
  /// See also [ReasonEditFormController].
  const ReasonEditFormControllerFamily();

  /// See also [ReasonEditFormController].
  ReasonEditFormControllerProvider call(
    Reason reason,
  ) {
    return ReasonEditFormControllerProvider(
      reason,
    );
  }

  @override
  ReasonEditFormControllerProvider getProviderOverride(
    covariant ReasonEditFormControllerProvider provider,
  ) {
    return call(
      provider.reason,
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
  String? get name => r'reasonEditFormControllerProvider';
}

/// See also [ReasonEditFormController].
class ReasonEditFormControllerProvider extends AutoDisposeNotifierProviderImpl<
    ReasonEditFormController, ReasonEditForm> {
  /// See also [ReasonEditFormController].
  ReasonEditFormControllerProvider(
    Reason reason,
  ) : this._internal(
          () => ReasonEditFormController()..reason = reason,
          from: reasonEditFormControllerProvider,
          name: r'reasonEditFormControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$reasonEditFormControllerHash,
          dependencies: ReasonEditFormControllerFamily._dependencies,
          allTransitiveDependencies:
              ReasonEditFormControllerFamily._allTransitiveDependencies,
          reason: reason,
        );

  ReasonEditFormControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.reason,
  }) : super.internal();

  final Reason reason;

  @override
  ReasonEditForm runNotifierBuild(
    covariant ReasonEditFormController notifier,
  ) {
    return notifier.build(
      reason,
    );
  }

  @override
  Override overrideWith(ReasonEditFormController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ReasonEditFormControllerProvider._internal(
        () => create()..reason = reason,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        reason: reason,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ReasonEditFormController, ReasonEditForm>
      createElement() {
    return _ReasonEditFormControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ReasonEditFormControllerProvider && other.reason == reason;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, reason.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ReasonEditFormControllerRef
    on AutoDisposeNotifierProviderRef<ReasonEditForm> {
  /// The parameter `reason` of this provider.
  Reason get reason;
}

class _ReasonEditFormControllerProviderElement
    extends AutoDisposeNotifierProviderElement<ReasonEditFormController,
        ReasonEditForm> with ReasonEditFormControllerRef {
  _ReasonEditFormControllerProviderElement(super.provider);

  @override
  Reason get reason => (origin as ReasonEditFormControllerProvider).reason;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
