// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_utils.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$entityViewOnlyHash() => r'9a6bd390f68219c245c5ecb43ca9b62ac77d8624';

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

abstract class _$EntityViewOnly extends BuildlessAutoDisposeNotifier<bool> {
  late final String sessionId;

  bool build(
    String sessionId,
  );
}

/// See also [EntityViewOnly].
@ProviderFor(EntityViewOnly)
const entityViewOnlyProvider = EntityViewOnlyFamily();

/// See also [EntityViewOnly].
class EntityViewOnlyFamily extends Family<bool> {
  /// See also [EntityViewOnly].
  const EntityViewOnlyFamily();

  /// See also [EntityViewOnly].
  EntityViewOnlyProvider call(
    String sessionId,
  ) {
    return EntityViewOnlyProvider(
      sessionId,
    );
  }

  @override
  EntityViewOnlyProvider getProviderOverride(
    covariant EntityViewOnlyProvider provider,
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
  String? get name => r'entityViewOnlyProvider';
}

/// See also [EntityViewOnly].
class EntityViewOnlyProvider
    extends AutoDisposeNotifierProviderImpl<EntityViewOnly, bool> {
  /// See also [EntityViewOnly].
  EntityViewOnlyProvider(
    String sessionId,
  ) : this._internal(
          () => EntityViewOnly()..sessionId = sessionId,
          from: entityViewOnlyProvider,
          name: r'entityViewOnlyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$entityViewOnlyHash,
          dependencies: EntityViewOnlyFamily._dependencies,
          allTransitiveDependencies:
              EntityViewOnlyFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  EntityViewOnlyProvider._internal(
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
  bool runNotifierBuild(
    covariant EntityViewOnly notifier,
  ) {
    return notifier.build(
      sessionId,
    );
  }

  @override
  Override overrideWith(EntityViewOnly Function() create) {
    return ProviderOverride(
      origin: this,
      override: EntityViewOnlyProvider._internal(
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
  AutoDisposeNotifierProviderElement<EntityViewOnly, bool> createElement() {
    return _EntityViewOnlyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EntityViewOnlyProvider && other.sessionId == sessionId;
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
mixin EntityViewOnlyRef on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _EntityViewOnlyProviderElement
    extends AutoDisposeNotifierProviderElement<EntityViewOnly, bool>
    with EntityViewOnlyRef {
  _EntityViewOnlyProviderElement(super.provider);

  @override
  String get sessionId => (origin as EntityViewOnlyProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
