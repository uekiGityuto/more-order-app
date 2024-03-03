// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_scene_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$editSceneFormControllerHash() =>
    r'0fa4596eaba491f50e1fc7620d2413f016bec7dc';

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

abstract class _$EditSceneFormController
    extends BuildlessAutoDisposeNotifier<EditSceneForm> {
  late final Scene scene;

  EditSceneForm build(
    Scene scene,
  );
}

/// See also [EditSceneFormController].
@ProviderFor(EditSceneFormController)
const editSceneFormControllerProvider = EditSceneFormControllerFamily();

/// See also [EditSceneFormController].
class EditSceneFormControllerFamily extends Family<EditSceneForm> {
  /// See also [EditSceneFormController].
  const EditSceneFormControllerFamily();

  /// See also [EditSceneFormController].
  EditSceneFormControllerProvider call(
    Scene scene,
  ) {
    return EditSceneFormControllerProvider(
      scene,
    );
  }

  @override
  EditSceneFormControllerProvider getProviderOverride(
    covariant EditSceneFormControllerProvider provider,
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
  String? get name => r'editSceneFormControllerProvider';
}

/// See also [EditSceneFormController].
class EditSceneFormControllerProvider extends AutoDisposeNotifierProviderImpl<
    EditSceneFormController, EditSceneForm> {
  /// See also [EditSceneFormController].
  EditSceneFormControllerProvider(
    Scene scene,
  ) : this._internal(
          () => EditSceneFormController()..scene = scene,
          from: editSceneFormControllerProvider,
          name: r'editSceneFormControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$editSceneFormControllerHash,
          dependencies: EditSceneFormControllerFamily._dependencies,
          allTransitiveDependencies:
              EditSceneFormControllerFamily._allTransitiveDependencies,
          scene: scene,
        );

  EditSceneFormControllerProvider._internal(
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
  EditSceneForm runNotifierBuild(
    covariant EditSceneFormController notifier,
  ) {
    return notifier.build(
      scene,
    );
  }

  @override
  Override overrideWith(EditSceneFormController Function() create) {
    return ProviderOverride(
      origin: this,
      override: EditSceneFormControllerProvider._internal(
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
  AutoDisposeNotifierProviderElement<EditSceneFormController, EditSceneForm>
      createElement() {
    return _EditSceneFormControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EditSceneFormControllerProvider && other.scene == scene;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, scene.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin EditSceneFormControllerRef
    on AutoDisposeNotifierProviderRef<EditSceneForm> {
  /// The parameter `scene` of this provider.
  Scene get scene;
}

class _EditSceneFormControllerProviderElement
    extends AutoDisposeNotifierProviderElement<EditSceneFormController,
        EditSceneForm> with EditSceneFormControllerRef {
  _EditSceneFormControllerProviderElement(super.provider);

  @override
  Scene get scene => (origin as EditSceneFormControllerProvider).scene;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
