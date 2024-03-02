// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phrase_edit_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$phraseEditFormControllerHash() =>
    r'23c6a5f9367e6a379847d3ef49783a8fb8dd9e84';

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

abstract class _$PhraseEditFormController
    extends BuildlessAutoDisposeNotifier<PhraseEditForm> {
  late final Phrase phrase;

  PhraseEditForm build(
    Phrase phrase,
  );
}

/// See also [PhraseEditFormController].
@ProviderFor(PhraseEditFormController)
const phraseEditFormControllerProvider = PhraseEditFormControllerFamily();

/// See also [PhraseEditFormController].
class PhraseEditFormControllerFamily extends Family<PhraseEditForm> {
  /// See also [PhraseEditFormController].
  const PhraseEditFormControllerFamily();

  /// See also [PhraseEditFormController].
  PhraseEditFormControllerProvider call(
    Phrase phrase,
  ) {
    return PhraseEditFormControllerProvider(
      phrase,
    );
  }

  @override
  PhraseEditFormControllerProvider getProviderOverride(
    covariant PhraseEditFormControllerProvider provider,
  ) {
    return call(
      provider.phrase,
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
  String? get name => r'phraseEditFormControllerProvider';
}

/// See also [PhraseEditFormController].
class PhraseEditFormControllerProvider extends AutoDisposeNotifierProviderImpl<
    PhraseEditFormController, PhraseEditForm> {
  /// See also [PhraseEditFormController].
  PhraseEditFormControllerProvider(
    Phrase phrase,
  ) : this._internal(
          () => PhraseEditFormController()..phrase = phrase,
          from: phraseEditFormControllerProvider,
          name: r'phraseEditFormControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$phraseEditFormControllerHash,
          dependencies: PhraseEditFormControllerFamily._dependencies,
          allTransitiveDependencies:
              PhraseEditFormControllerFamily._allTransitiveDependencies,
          phrase: phrase,
        );

  PhraseEditFormControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.phrase,
  }) : super.internal();

  final Phrase phrase;

  @override
  PhraseEditForm runNotifierBuild(
    covariant PhraseEditFormController notifier,
  ) {
    return notifier.build(
      phrase,
    );
  }

  @override
  Override overrideWith(PhraseEditFormController Function() create) {
    return ProviderOverride(
      origin: this,
      override: PhraseEditFormControllerProvider._internal(
        () => create()..phrase = phrase,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        phrase: phrase,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<PhraseEditFormController, PhraseEditForm>
      createElement() {
    return _PhraseEditFormControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PhraseEditFormControllerProvider && other.phrase == phrase;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, phrase.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PhraseEditFormControllerRef
    on AutoDisposeNotifierProviderRef<PhraseEditForm> {
  /// The parameter `phrase` of this provider.
  Phrase get phrase;
}

class _PhraseEditFormControllerProviderElement
    extends AutoDisposeNotifierProviderElement<PhraseEditFormController,
        PhraseEditForm> with PhraseEditFormControllerRef {
  _PhraseEditFormControllerProviderElement(super.provider);

  @override
  Phrase get phrase => (origin as PhraseEditFormControllerProvider).phrase;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
