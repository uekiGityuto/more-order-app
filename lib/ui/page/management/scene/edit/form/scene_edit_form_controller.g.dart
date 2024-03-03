// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scene_edit_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sceneEditFormControllerHash() =>
    r'dd872ccd3f593581270647418cc0bbd24eceff21';

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

abstract class _$SceneEditFormController
    extends BuildlessAutoDisposeNotifier<SceneEditForm> {
  late final Scene scene;

  SceneEditForm build(
    Scene scene,
  );
}

/// See also [SceneEditFormController].
@ProviderFor(SceneEditFormController)
const sceneEditFormControllerProvider = SceneEditFormControllerFamily();

/// See also [SceneEditFormController].
class SceneEditFormControllerFamily extends Family<SceneEditForm> {
  /// See also [SceneEditFormController].
  const SceneEditFormControllerFamily();

  /// See also [SceneEditFormController].
  SceneEditFormControllerProvider call(
    Scene scene,
  ) {
    return SceneEditFormControllerProvider(
      scene,
    );
  }

  @override
  SceneEditFormControllerProvider getProviderOverride(
    covariant SceneEditFormControllerProvider provider,
  ) {
    return call(
      provider.scene,
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
  String? get name => r'sceneEditFormControllerProvider';
}

/// See also [SceneEditFormController].
class SceneEditFormControllerProvider extends AutoDisposeNotifierProviderImpl<
    SceneEditFormController, SceneEditForm> {
  /// See also [SceneEditFormController].
  SceneEditFormControllerProvider(
    Scene scene,
  ) : this._internal(
          () => SceneEditFormController()..scene = scene,
          from: sceneEditFormControllerProvider,
          name: r'sceneEditFormControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sceneEditFormControllerHash,
          dependencies: SceneEditFormControllerFamily._dependencies,
          allTransitiveDependencies:
              SceneEditFormControllerFamily._allTransitiveDependencies,
          scene: scene,
        );

  SceneEditFormControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.scene,
  }) : super.internal();

  final Scene scene;

  @override
  SceneEditForm runNotifierBuild(
    covariant SceneEditFormController notifier,
  ) {
    return notifier.build(
      scene,
    );
  }

  @override
  Override overrideWith(SceneEditFormController Function() create) {
    return ProviderOverride(
      origin: this,
      override: SceneEditFormControllerProvider._internal(
        () => create()..scene = scene,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        scene: scene,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<SceneEditFormController, SceneEditForm>
      createElement() {
    return _SceneEditFormControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SceneEditFormControllerProvider && other.scene == scene;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, scene.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SceneEditFormControllerRef
    on AutoDisposeNotifierProviderRef<SceneEditForm> {
  /// The parameter `scene` of this provider.
  Scene get scene;
}

class _SceneEditFormControllerProviderElement
    extends AutoDisposeNotifierProviderElement<SceneEditFormController,
        SceneEditForm> with SceneEditFormControllerRef {
  _SceneEditFormControllerProviderElement(super.provider);

  @override
  Scene get scene => (origin as SceneEditFormControllerProvider).scene;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
