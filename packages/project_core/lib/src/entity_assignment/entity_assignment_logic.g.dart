// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_assignment_logic.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchNewEntityAssignmentsHash() =>
    r'9ff4439747c0b71a22561ecbb3612ae85b88c905';

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

/// See also [watchNewEntityAssignments].
@ProviderFor(watchNewEntityAssignments)
const watchNewEntityAssignmentsProvider = WatchNewEntityAssignmentsFamily();

/// See also [watchNewEntityAssignments].
class WatchNewEntityAssignmentsFamily
    extends Family<AsyncValue<EntityAssignment>> {
  /// See also [watchNewEntityAssignments].
  const WatchNewEntityAssignmentsFamily();

  /// See also [watchNewEntityAssignments].
  WatchNewEntityAssignmentsProvider call({
    required int lightUserId,
  }) {
    return WatchNewEntityAssignmentsProvider(
      lightUserId: lightUserId,
    );
  }

  @override
  WatchNewEntityAssignmentsProvider getProviderOverride(
    covariant WatchNewEntityAssignmentsProvider provider,
  ) {
    return call(
      lightUserId: provider.lightUserId,
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
  String? get name => r'watchNewEntityAssignmentsProvider';
}

/// See also [watchNewEntityAssignments].
class WatchNewEntityAssignmentsProvider
    extends AutoDisposeStreamProvider<EntityAssignment> {
  /// See also [watchNewEntityAssignments].
  WatchNewEntityAssignmentsProvider({
    required int lightUserId,
  }) : this._internal(
          (ref) => watchNewEntityAssignments(
            ref as WatchNewEntityAssignmentsRef,
            lightUserId: lightUserId,
          ),
          from: watchNewEntityAssignmentsProvider,
          name: r'watchNewEntityAssignmentsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchNewEntityAssignmentsHash,
          dependencies: WatchNewEntityAssignmentsFamily._dependencies,
          allTransitiveDependencies:
              WatchNewEntityAssignmentsFamily._allTransitiveDependencies,
          lightUserId: lightUserId,
        );

  WatchNewEntityAssignmentsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.lightUserId,
  }) : super.internal();

  final int lightUserId;

  @override
  Override overrideWith(
    Stream<EntityAssignment> Function(WatchNewEntityAssignmentsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchNewEntityAssignmentsProvider._internal(
        (ref) => create(ref as WatchNewEntityAssignmentsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        lightUserId: lightUserId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<EntityAssignment> createElement() {
    return _WatchNewEntityAssignmentsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchNewEntityAssignmentsProvider &&
        other.lightUserId == lightUserId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, lightUserId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchNewEntityAssignmentsRef
    on AutoDisposeStreamProviderRef<EntityAssignment> {
  /// The parameter `lightUserId` of this provider.
  int get lightUserId;
}

class _WatchNewEntityAssignmentsProviderElement
    extends AutoDisposeStreamProviderElement<EntityAssignment>
    with WatchNewEntityAssignmentsRef {
  _WatchNewEntityAssignmentsProviderElement(super.provider);

  @override
  int get lightUserId =>
      (origin as WatchNewEntityAssignmentsProvider).lightUserId;
}

String _$watchRemovedEntityAssignmentsHash() =>
    r'99daa899102c2a94f0218424f1f1824d51c32de4';

/// See also [watchRemovedEntityAssignments].
@ProviderFor(watchRemovedEntityAssignments)
const watchRemovedEntityAssignmentsProvider =
    WatchRemovedEntityAssignmentsFamily();

/// See also [watchRemovedEntityAssignments].
class WatchRemovedEntityAssignmentsFamily
    extends Family<AsyncValue<EntityAssignment>> {
  /// See also [watchRemovedEntityAssignments].
  const WatchRemovedEntityAssignmentsFamily();

  /// See also [watchRemovedEntityAssignments].
  WatchRemovedEntityAssignmentsProvider call({
    required int lightUserId,
  }) {
    return WatchRemovedEntityAssignmentsProvider(
      lightUserId: lightUserId,
    );
  }

  @override
  WatchRemovedEntityAssignmentsProvider getProviderOverride(
    covariant WatchRemovedEntityAssignmentsProvider provider,
  ) {
    return call(
      lightUserId: provider.lightUserId,
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
  String? get name => r'watchRemovedEntityAssignmentsProvider';
}

/// See also [watchRemovedEntityAssignments].
class WatchRemovedEntityAssignmentsProvider
    extends AutoDisposeStreamProvider<EntityAssignment> {
  /// See also [watchRemovedEntityAssignments].
  WatchRemovedEntityAssignmentsProvider({
    required int lightUserId,
  }) : this._internal(
          (ref) => watchRemovedEntityAssignments(
            ref as WatchRemovedEntityAssignmentsRef,
            lightUserId: lightUserId,
          ),
          from: watchRemovedEntityAssignmentsProvider,
          name: r'watchRemovedEntityAssignmentsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchRemovedEntityAssignmentsHash,
          dependencies: WatchRemovedEntityAssignmentsFamily._dependencies,
          allTransitiveDependencies:
              WatchRemovedEntityAssignmentsFamily._allTransitiveDependencies,
          lightUserId: lightUserId,
        );

  WatchRemovedEntityAssignmentsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.lightUserId,
  }) : super.internal();

  final int lightUserId;

  @override
  Override overrideWith(
    Stream<EntityAssignment> Function(WatchRemovedEntityAssignmentsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchRemovedEntityAssignmentsProvider._internal(
        (ref) => create(ref as WatchRemovedEntityAssignmentsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        lightUserId: lightUserId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<EntityAssignment> createElement() {
    return _WatchRemovedEntityAssignmentsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchRemovedEntityAssignmentsProvider &&
        other.lightUserId == lightUserId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, lightUserId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchRemovedEntityAssignmentsRef
    on AutoDisposeStreamProviderRef<EntityAssignment> {
  /// The parameter `lightUserId` of this provider.
  int get lightUserId;
}

class _WatchRemovedEntityAssignmentsProviderElement
    extends AutoDisposeStreamProviderElement<EntityAssignment>
    with WatchRemovedEntityAssignmentsRef {
  _WatchRemovedEntityAssignmentsProviderElement(super.provider);

  @override
  int get lightUserId =>
      (origin as WatchRemovedEntityAssignmentsProvider).lightUserId;
}

String _$entityAssignmentRepositoryHash() =>
    r'086eaee568c0adf6ad13b78f88dc45a9b327b661';

/// See also [entityAssignmentRepository].
@ProviderFor(entityAssignmentRepository)
final entityAssignmentRepositoryProvider =
    AutoDisposeProvider<EntityAssignmentRepository>.internal(
  entityAssignmentRepository,
  name: r'entityAssignmentRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$entityAssignmentRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef EntityAssignmentRepositoryRef
    = AutoDisposeProviderRef<EntityAssignmentRepository>;
String _$watchEntityAssignmentsHash() =>
    r'ce3f2e03708fbd0763919747d176aebc749097a7';

abstract class _$WatchEntityAssignments
    extends BuildlessAutoDisposeAsyncNotifier<List<EntityAssignment>> {
  late final int lightUserId;

  FutureOr<List<EntityAssignment>> build(
    int lightUserId,
  );
}

/// See also [WatchEntityAssignments].
@ProviderFor(WatchEntityAssignments)
const watchEntityAssignmentsProvider = WatchEntityAssignmentsFamily();

/// See also [WatchEntityAssignments].
class WatchEntityAssignmentsFamily
    extends Family<AsyncValue<List<EntityAssignment>>> {
  /// See also [WatchEntityAssignments].
  const WatchEntityAssignmentsFamily();

  /// See also [WatchEntityAssignments].
  WatchEntityAssignmentsProvider call(
    int lightUserId,
  ) {
    return WatchEntityAssignmentsProvider(
      lightUserId,
    );
  }

  @override
  WatchEntityAssignmentsProvider getProviderOverride(
    covariant WatchEntityAssignmentsProvider provider,
  ) {
    return call(
      provider.lightUserId,
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
  String? get name => r'watchEntityAssignmentsProvider';
}

/// See also [WatchEntityAssignments].
class WatchEntityAssignmentsProvider
    extends AutoDisposeAsyncNotifierProviderImpl<WatchEntityAssignments,
        List<EntityAssignment>> {
  /// See also [WatchEntityAssignments].
  WatchEntityAssignmentsProvider(
    int lightUserId,
  ) : this._internal(
          () => WatchEntityAssignments()..lightUserId = lightUserId,
          from: watchEntityAssignmentsProvider,
          name: r'watchEntityAssignmentsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchEntityAssignmentsHash,
          dependencies: WatchEntityAssignmentsFamily._dependencies,
          allTransitiveDependencies:
              WatchEntityAssignmentsFamily._allTransitiveDependencies,
          lightUserId: lightUserId,
        );

  WatchEntityAssignmentsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.lightUserId,
  }) : super.internal();

  final int lightUserId;

  @override
  FutureOr<List<EntityAssignment>> runNotifierBuild(
    covariant WatchEntityAssignments notifier,
  ) {
    return notifier.build(
      lightUserId,
    );
  }

  @override
  Override overrideWith(WatchEntityAssignments Function() create) {
    return ProviderOverride(
      origin: this,
      override: WatchEntityAssignmentsProvider._internal(
        () => create()..lightUserId = lightUserId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        lightUserId: lightUserId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<WatchEntityAssignments,
      List<EntityAssignment>> createElement() {
    return _WatchEntityAssignmentsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchEntityAssignmentsProvider &&
        other.lightUserId == lightUserId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, lightUserId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchEntityAssignmentsRef
    on AutoDisposeAsyncNotifierProviderRef<List<EntityAssignment>> {
  /// The parameter `lightUserId` of this provider.
  int get lightUserId;
}

class _WatchEntityAssignmentsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<WatchEntityAssignments,
        List<EntityAssignment>> with WatchEntityAssignmentsRef {
  _WatchEntityAssignmentsProviderElement(super.provider);

  @override
  int get lightUserId => (origin as WatchEntityAssignmentsProvider).lightUserId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
