// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multi_nutzenlayout_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$multiNutzenLayoutStateHash() =>
    r'd2b3005cf3dadddd9204e89607f58e31d4f10b0b';

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

abstract class _$MultiNutzenLayoutState
    extends BuildlessAutoDisposeNotifier<Nutzenlayout> {
  late final String sessionId;

  Nutzenlayout build(
    String sessionId,
  );
}

/// See also [MultiNutzenLayoutState].
@ProviderFor(MultiNutzenLayoutState)
const multiNutzenLayoutStateProvider = MultiNutzenLayoutStateFamily();

/// See also [MultiNutzenLayoutState].
class MultiNutzenLayoutStateFamily extends Family<Nutzenlayout> {
  /// See also [MultiNutzenLayoutState].
  const MultiNutzenLayoutStateFamily();

  /// See also [MultiNutzenLayoutState].
  MultiNutzenLayoutStateProvider call(
    String sessionId,
  ) {
    return MultiNutzenLayoutStateProvider(
      sessionId,
    );
  }

  @override
  MultiNutzenLayoutStateProvider getProviderOverride(
    covariant MultiNutzenLayoutStateProvider provider,
  ) {
    return call(
      provider.sessionId,
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
  String? get name => r'multiNutzenLayoutStateProvider';
}

/// See also [MultiNutzenLayoutState].
class MultiNutzenLayoutStateProvider extends AutoDisposeNotifierProviderImpl<
    MultiNutzenLayoutState, Nutzenlayout> {
  /// See also [MultiNutzenLayoutState].
  MultiNutzenLayoutStateProvider(
    String sessionId,
  ) : this._internal(
          () => MultiNutzenLayoutState()..sessionId = sessionId,
          from: multiNutzenLayoutStateProvider,
          name: r'multiNutzenLayoutStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$multiNutzenLayoutStateHash,
          dependencies: MultiNutzenLayoutStateFamily._dependencies,
          allTransitiveDependencies:
              MultiNutzenLayoutStateFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  MultiNutzenLayoutStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
  }) : super.internal();

  final String sessionId;

  @override
  Nutzenlayout runNotifierBuild(
    covariant MultiNutzenLayoutState notifier,
  ) {
    return notifier.build(
      sessionId,
    );
  }

  @override
  Override overrideWith(MultiNutzenLayoutState Function() create) {
    return ProviderOverride(
      origin: this,
      override: MultiNutzenLayoutStateProvider._internal(
        () => create()..sessionId = sessionId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<MultiNutzenLayoutState, Nutzenlayout>
      createElement() {
    return _MultiNutzenLayoutStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MultiNutzenLayoutStateProvider &&
        other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MultiNutzenLayoutStateRef
    on AutoDisposeNotifierProviderRef<Nutzenlayout> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _MultiNutzenLayoutStateProviderElement
    extends AutoDisposeNotifierProviderElement<MultiNutzenLayoutState,
        Nutzenlayout> with MultiNutzenLayoutStateRef {
  _MultiNutzenLayoutStateProviderElement(super.provider);

  @override
  String get sessionId => (origin as MultiNutzenLayoutStateProvider).sessionId;
}

String _$selectedExistingMultiNutzenlayoutStateHash() =>
    r'465cef03b1ea710f7a38bdf0f1577559f864b6e8';

abstract class _$SelectedExistingMultiNutzenlayoutState
    extends BuildlessAutoDisposeNotifier<Nutzenlayout?> {
  late final String sessionId;

  Nutzenlayout? build(
    String sessionId,
  );
}

/// See also [SelectedExistingMultiNutzenlayoutState].
@ProviderFor(SelectedExistingMultiNutzenlayoutState)
const selectedExistingMultiNutzenlayoutStateProvider =
    SelectedExistingMultiNutzenlayoutStateFamily();

/// See also [SelectedExistingMultiNutzenlayoutState].
class SelectedExistingMultiNutzenlayoutStateFamily
    extends Family<Nutzenlayout?> {
  /// See also [SelectedExistingMultiNutzenlayoutState].
  const SelectedExistingMultiNutzenlayoutStateFamily();

  /// See also [SelectedExistingMultiNutzenlayoutState].
  SelectedExistingMultiNutzenlayoutStateProvider call(
    String sessionId,
  ) {
    return SelectedExistingMultiNutzenlayoutStateProvider(
      sessionId,
    );
  }

  @override
  SelectedExistingMultiNutzenlayoutStateProvider getProviderOverride(
    covariant SelectedExistingMultiNutzenlayoutStateProvider provider,
  ) {
    return call(
      provider.sessionId,
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
  String? get name => r'selectedExistingMultiNutzenlayoutStateProvider';
}

/// See also [SelectedExistingMultiNutzenlayoutState].
class SelectedExistingMultiNutzenlayoutStateProvider
    extends AutoDisposeNotifierProviderImpl<
        SelectedExistingMultiNutzenlayoutState, Nutzenlayout?> {
  /// See also [SelectedExistingMultiNutzenlayoutState].
  SelectedExistingMultiNutzenlayoutStateProvider(
    String sessionId,
  ) : this._internal(
          () => SelectedExistingMultiNutzenlayoutState()..sessionId = sessionId,
          from: selectedExistingMultiNutzenlayoutStateProvider,
          name: r'selectedExistingMultiNutzenlayoutStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$selectedExistingMultiNutzenlayoutStateHash,
          dependencies:
              SelectedExistingMultiNutzenlayoutStateFamily._dependencies,
          allTransitiveDependencies:
              SelectedExistingMultiNutzenlayoutStateFamily
                  ._allTransitiveDependencies,
          sessionId: sessionId,
        );

  SelectedExistingMultiNutzenlayoutStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
  }) : super.internal();

  final String sessionId;

  @override
  Nutzenlayout? runNotifierBuild(
    covariant SelectedExistingMultiNutzenlayoutState notifier,
  ) {
    return notifier.build(
      sessionId,
    );
  }

  @override
  Override overrideWith(
      SelectedExistingMultiNutzenlayoutState Function() create) {
    return ProviderOverride(
      origin: this,
      override: SelectedExistingMultiNutzenlayoutStateProvider._internal(
        () => create()..sessionId = sessionId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<SelectedExistingMultiNutzenlayoutState,
      Nutzenlayout?> createElement() {
    return _SelectedExistingMultiNutzenlayoutStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SelectedExistingMultiNutzenlayoutStateProvider &&
        other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SelectedExistingMultiNutzenlayoutStateRef
    on AutoDisposeNotifierProviderRef<Nutzenlayout?> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _SelectedExistingMultiNutzenlayoutStateProviderElement
    extends AutoDisposeNotifierProviderElement<
        SelectedExistingMultiNutzenlayoutState,
        Nutzenlayout?> with SelectedExistingMultiNutzenlayoutStateRef {
  _SelectedExistingMultiNutzenlayoutStateProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as SelectedExistingMultiNutzenlayoutStateProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
