// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snapshot_request_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$snapshotRequestHash() => r'116b8e2f14438346496c991e7c77e7d904cbfb42';

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

abstract class _$SnapshotRequest extends BuildlessAutoDisposeNotifier<bool> {
  late final String windowId;

  bool build(String windowId);
}

/// Provider to request snapshot capture for windows
///
/// Copied from [SnapshotRequest].
@ProviderFor(SnapshotRequest)
const snapshotRequestProvider = SnapshotRequestFamily();

/// Provider to request snapshot capture for windows
///
/// Copied from [SnapshotRequest].
class SnapshotRequestFamily extends Family<bool> {
  /// Provider to request snapshot capture for windows
  ///
  /// Copied from [SnapshotRequest].
  const SnapshotRequestFamily();

  /// Provider to request snapshot capture for windows
  ///
  /// Copied from [SnapshotRequest].
  SnapshotRequestProvider call(String windowId) {
    return SnapshotRequestProvider(windowId);
  }

  @override
  SnapshotRequestProvider getProviderOverride(
    covariant SnapshotRequestProvider provider,
  ) {
    return call(provider.windowId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'snapshotRequestProvider';
}

/// Provider to request snapshot capture for windows
///
/// Copied from [SnapshotRequest].
class SnapshotRequestProvider
    extends AutoDisposeNotifierProviderImpl<SnapshotRequest, bool> {
  /// Provider to request snapshot capture for windows
  ///
  /// Copied from [SnapshotRequest].
  SnapshotRequestProvider(String windowId)
    : this._internal(
        () => SnapshotRequest()..windowId = windowId,
        from: snapshotRequestProvider,
        name: r'snapshotRequestProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$snapshotRequestHash,
        dependencies: SnapshotRequestFamily._dependencies,
        allTransitiveDependencies:
            SnapshotRequestFamily._allTransitiveDependencies,
        windowId: windowId,
      );

  SnapshotRequestProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.windowId,
  }) : super.internal();

  final String windowId;

  @override
  bool runNotifierBuild(covariant SnapshotRequest notifier) {
    return notifier.build(windowId);
  }

  @override
  Override overrideWith(SnapshotRequest Function() create) {
    return ProviderOverride(
      origin: this,
      override: SnapshotRequestProvider._internal(
        () => create()..windowId = windowId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        windowId: windowId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<SnapshotRequest, bool> createElement() {
    return _SnapshotRequestProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SnapshotRequestProvider && other.windowId == windowId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, windowId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SnapshotRequestRef on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `windowId` of this provider.
  String get windowId;
}

class _SnapshotRequestProviderElement
    extends AutoDisposeNotifierProviderElement<SnapshotRequest, bool>
    with SnapshotRequestRef {
  _SnapshotRequestProviderElement(super.provider);

  @override
  String get windowId => (origin as SnapshotRequestProvider).windowId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
