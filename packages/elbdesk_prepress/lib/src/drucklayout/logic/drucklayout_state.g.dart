// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drucklayout_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$drucklayoutStateHash() => r'bcaf62fbd9b938e11c16d07dd497b01f6f7df7b1';

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

abstract class _$DrucklayoutState
    extends BuildlessAutoDisposeAsyncNotifier<Drucklayout> {
  late final int entityId;
  late final String sessionId;

  FutureOr<Drucklayout> build(
    int entityId,
    String sessionId,
  );
}

/// Drucklayout State
///
/// This state is used to manage and update the drucklayout details
///
/// Copied from [DrucklayoutState].
@ProviderFor(DrucklayoutState)
const drucklayoutStateProvider = DrucklayoutStateFamily();

/// Drucklayout State
///
/// This state is used to manage and update the drucklayout details
///
/// Copied from [DrucklayoutState].
class DrucklayoutStateFamily extends Family<AsyncValue<Drucklayout>> {
  /// Drucklayout State
  ///
  /// This state is used to manage and update the drucklayout details
  ///
  /// Copied from [DrucklayoutState].
  const DrucklayoutStateFamily();

  /// Drucklayout State
  ///
  /// This state is used to manage and update the drucklayout details
  ///
  /// Copied from [DrucklayoutState].
  DrucklayoutStateProvider call(
    int entityId,
    String sessionId,
  ) {
    return DrucklayoutStateProvider(
      entityId,
      sessionId,
    );
  }

  @override
  DrucklayoutStateProvider getProviderOverride(
    covariant DrucklayoutStateProvider provider,
  ) {
    return call(
      provider.entityId,
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
  String? get name => r'drucklayoutStateProvider';
}

/// Drucklayout State
///
/// This state is used to manage and update the drucklayout details
///
/// Copied from [DrucklayoutState].
class DrucklayoutStateProvider extends AutoDisposeAsyncNotifierProviderImpl<
    DrucklayoutState, Drucklayout> {
  /// Drucklayout State
  ///
  /// This state is used to manage and update the drucklayout details
  ///
  /// Copied from [DrucklayoutState].
  DrucklayoutStateProvider(
    int entityId,
    String sessionId,
  ) : this._internal(
          () => DrucklayoutState()
            ..entityId = entityId
            ..sessionId = sessionId,
          from: drucklayoutStateProvider,
          name: r'drucklayoutStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$drucklayoutStateHash,
          dependencies: DrucklayoutStateFamily._dependencies,
          allTransitiveDependencies:
              DrucklayoutStateFamily._allTransitiveDependencies,
          entityId: entityId,
          sessionId: sessionId,
        );

  DrucklayoutStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.entityId,
    required this.sessionId,
  }) : super.internal();

  final int entityId;
  final String sessionId;

  @override
  FutureOr<Drucklayout> runNotifierBuild(
    covariant DrucklayoutState notifier,
  ) {
    return notifier.build(
      entityId,
      sessionId,
    );
  }

  @override
  Override overrideWith(DrucklayoutState Function() create) {
    return ProviderOverride(
      origin: this,
      override: DrucklayoutStateProvider._internal(
        () => create()
          ..entityId = entityId
          ..sessionId = sessionId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        entityId: entityId,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<DrucklayoutState, Drucklayout>
      createElement() {
    return _DrucklayoutStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DrucklayoutStateProvider &&
        other.entityId == entityId &&
        other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, entityId.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DrucklayoutStateRef on AutoDisposeAsyncNotifierProviderRef<Drucklayout> {
  /// The parameter `entityId` of this provider.
  int get entityId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _DrucklayoutStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<DrucklayoutState,
        Drucklayout> with DrucklayoutStateRef {
  _DrucklayoutStateProviderElement(super.provider);

  @override
  int get entityId => (origin as DrucklayoutStateProvider).entityId;
  @override
  String get sessionId => (origin as DrucklayoutStateProvider).sessionId;
}

String _$selectedExistingDrucklayoutStateHash() =>
    r'4ee3a541f3b2e05d4d9cfc74506c13d3be9ebb68';

abstract class _$SelectedExistingDrucklayoutState
    extends BuildlessAutoDisposeNotifier<Drucklayout?> {
  late final String sessionId;

  Drucklayout? build(
    String sessionId,
  );
}

/// State provider for selected existing Drucklayout during Drucklayout
/// assignment
///
/// Copied from [SelectedExistingDrucklayoutState].
@ProviderFor(SelectedExistingDrucklayoutState)
const selectedExistingDrucklayoutStateProvider =
    SelectedExistingDrucklayoutStateFamily();

/// State provider for selected existing Drucklayout during Drucklayout
/// assignment
///
/// Copied from [SelectedExistingDrucklayoutState].
class SelectedExistingDrucklayoutStateFamily extends Family<Drucklayout?> {
  /// State provider for selected existing Drucklayout during Drucklayout
  /// assignment
  ///
  /// Copied from [SelectedExistingDrucklayoutState].
  const SelectedExistingDrucklayoutStateFamily();

  /// State provider for selected existing Drucklayout during Drucklayout
  /// assignment
  ///
  /// Copied from [SelectedExistingDrucklayoutState].
  SelectedExistingDrucklayoutStateProvider call(
    String sessionId,
  ) {
    return SelectedExistingDrucklayoutStateProvider(
      sessionId,
    );
  }

  @override
  SelectedExistingDrucklayoutStateProvider getProviderOverride(
    covariant SelectedExistingDrucklayoutStateProvider provider,
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
  String? get name => r'selectedExistingDrucklayoutStateProvider';
}

/// State provider for selected existing Drucklayout during Drucklayout
/// assignment
///
/// Copied from [SelectedExistingDrucklayoutState].
class SelectedExistingDrucklayoutStateProvider
    extends AutoDisposeNotifierProviderImpl<SelectedExistingDrucklayoutState,
        Drucklayout?> {
  /// State provider for selected existing Drucklayout during Drucklayout
  /// assignment
  ///
  /// Copied from [SelectedExistingDrucklayoutState].
  SelectedExistingDrucklayoutStateProvider(
    String sessionId,
  ) : this._internal(
          () => SelectedExistingDrucklayoutState()..sessionId = sessionId,
          from: selectedExistingDrucklayoutStateProvider,
          name: r'selectedExistingDrucklayoutStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$selectedExistingDrucklayoutStateHash,
          dependencies: SelectedExistingDrucklayoutStateFamily._dependencies,
          allTransitiveDependencies:
              SelectedExistingDrucklayoutStateFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  SelectedExistingDrucklayoutStateProvider._internal(
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
  Drucklayout? runNotifierBuild(
    covariant SelectedExistingDrucklayoutState notifier,
  ) {
    return notifier.build(
      sessionId,
    );
  }

  @override
  Override overrideWith(SelectedExistingDrucklayoutState Function() create) {
    return ProviderOverride(
      origin: this,
      override: SelectedExistingDrucklayoutStateProvider._internal(
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
  AutoDisposeNotifierProviderElement<SelectedExistingDrucklayoutState,
      Drucklayout?> createElement() {
    return _SelectedExistingDrucklayoutStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SelectedExistingDrucklayoutStateProvider &&
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
mixin SelectedExistingDrucklayoutStateRef
    on AutoDisposeNotifierProviderRef<Drucklayout?> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _SelectedExistingDrucklayoutStateProviderElement
    extends AutoDisposeNotifierProviderElement<SelectedExistingDrucklayoutState,
        Drucklayout?> with SelectedExistingDrucklayoutStateRef {
  _SelectedExistingDrucklayoutStateProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as SelectedExistingDrucklayoutStateProvider).sessionId;
}

String _$selectedNutzenlayoutsForDrucklayoutStateHash() =>
    r'5b7c4928f4f18ebf68cc06e7ef2c92338d725681';

abstract class _$SelectedNutzenlayoutsForDrucklayoutState
    extends BuildlessAutoDisposeNotifier<Set<int>> {
  late final String sessionId;

  Set<int> build(
    String sessionId,
  );
}

/// State provider for selecting Nutzenlayouts during Drucklayout assignment
///
/// Copied from [SelectedNutzenlayoutsForDrucklayoutState].
@ProviderFor(SelectedNutzenlayoutsForDrucklayoutState)
const selectedNutzenlayoutsForDrucklayoutStateProvider =
    SelectedNutzenlayoutsForDrucklayoutStateFamily();

/// State provider for selecting Nutzenlayouts during Drucklayout assignment
///
/// Copied from [SelectedNutzenlayoutsForDrucklayoutState].
class SelectedNutzenlayoutsForDrucklayoutStateFamily extends Family<Set<int>> {
  /// State provider for selecting Nutzenlayouts during Drucklayout assignment
  ///
  /// Copied from [SelectedNutzenlayoutsForDrucklayoutState].
  const SelectedNutzenlayoutsForDrucklayoutStateFamily();

  /// State provider for selecting Nutzenlayouts during Drucklayout assignment
  ///
  /// Copied from [SelectedNutzenlayoutsForDrucklayoutState].
  SelectedNutzenlayoutsForDrucklayoutStateProvider call(
    String sessionId,
  ) {
    return SelectedNutzenlayoutsForDrucklayoutStateProvider(
      sessionId,
    );
  }

  @override
  SelectedNutzenlayoutsForDrucklayoutStateProvider getProviderOverride(
    covariant SelectedNutzenlayoutsForDrucklayoutStateProvider provider,
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
  String? get name => r'selectedNutzenlayoutsForDrucklayoutStateProvider';
}

/// State provider for selecting Nutzenlayouts during Drucklayout assignment
///
/// Copied from [SelectedNutzenlayoutsForDrucklayoutState].
class SelectedNutzenlayoutsForDrucklayoutStateProvider
    extends AutoDisposeNotifierProviderImpl<
        SelectedNutzenlayoutsForDrucklayoutState, Set<int>> {
  /// State provider for selecting Nutzenlayouts during Drucklayout assignment
  ///
  /// Copied from [SelectedNutzenlayoutsForDrucklayoutState].
  SelectedNutzenlayoutsForDrucklayoutStateProvider(
    String sessionId,
  ) : this._internal(
          () =>
              SelectedNutzenlayoutsForDrucklayoutState()..sessionId = sessionId,
          from: selectedNutzenlayoutsForDrucklayoutStateProvider,
          name: r'selectedNutzenlayoutsForDrucklayoutStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$selectedNutzenlayoutsForDrucklayoutStateHash,
          dependencies:
              SelectedNutzenlayoutsForDrucklayoutStateFamily._dependencies,
          allTransitiveDependencies:
              SelectedNutzenlayoutsForDrucklayoutStateFamily
                  ._allTransitiveDependencies,
          sessionId: sessionId,
        );

  SelectedNutzenlayoutsForDrucklayoutStateProvider._internal(
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
  Set<int> runNotifierBuild(
    covariant SelectedNutzenlayoutsForDrucklayoutState notifier,
  ) {
    return notifier.build(
      sessionId,
    );
  }

  @override
  Override overrideWith(
      SelectedNutzenlayoutsForDrucklayoutState Function() create) {
    return ProviderOverride(
      origin: this,
      override: SelectedNutzenlayoutsForDrucklayoutStateProvider._internal(
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
  AutoDisposeNotifierProviderElement<SelectedNutzenlayoutsForDrucklayoutState,
      Set<int>> createElement() {
    return _SelectedNutzenlayoutsForDrucklayoutStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SelectedNutzenlayoutsForDrucklayoutStateProvider &&
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
mixin SelectedNutzenlayoutsForDrucklayoutStateRef
    on AutoDisposeNotifierProviderRef<Set<int>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _SelectedNutzenlayoutsForDrucklayoutStateProviderElement
    extends AutoDisposeNotifierProviderElement<
        SelectedNutzenlayoutsForDrucklayoutState,
        Set<int>> with SelectedNutzenlayoutsForDrucklayoutStateRef {
  _SelectedNutzenlayoutsForDrucklayoutStateProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as SelectedNutzenlayoutsForDrucklayoutStateProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
