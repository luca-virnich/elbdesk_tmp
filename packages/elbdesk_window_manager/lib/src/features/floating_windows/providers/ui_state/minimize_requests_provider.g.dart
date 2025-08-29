// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'minimize_requests_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$minimizeRequestsHash() => r'9bb037dc33ddc92c131f3a876483d4d80ebead0b';

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

abstract class _$MinimizeRequests extends BuildlessAutoDisposeNotifier<bool> {
  late final String windowId;

  bool build(String windowId);
}

/// Provider for tracking minimize requests
/// When a window ID is added to this list, the window should start its minimize animation
///
/// Copied from [MinimizeRequests].
@ProviderFor(MinimizeRequests)
const minimizeRequestsProvider = MinimizeRequestsFamily();

/// Provider for tracking minimize requests
/// When a window ID is added to this list, the window should start its minimize animation
///
/// Copied from [MinimizeRequests].
class MinimizeRequestsFamily extends Family<bool> {
  /// Provider for tracking minimize requests
  /// When a window ID is added to this list, the window should start its minimize animation
  ///
  /// Copied from [MinimizeRequests].
  const MinimizeRequestsFamily();

  /// Provider for tracking minimize requests
  /// When a window ID is added to this list, the window should start its minimize animation
  ///
  /// Copied from [MinimizeRequests].
  MinimizeRequestsProvider call(String windowId) {
    return MinimizeRequestsProvider(windowId);
  }

  @override
  MinimizeRequestsProvider getProviderOverride(
    covariant MinimizeRequestsProvider provider,
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
  String? get name => r'minimizeRequestsProvider';
}

/// Provider for tracking minimize requests
/// When a window ID is added to this list, the window should start its minimize animation
///
/// Copied from [MinimizeRequests].
class MinimizeRequestsProvider
    extends AutoDisposeNotifierProviderImpl<MinimizeRequests, bool> {
  /// Provider for tracking minimize requests
  /// When a window ID is added to this list, the window should start its minimize animation
  ///
  /// Copied from [MinimizeRequests].
  MinimizeRequestsProvider(String windowId)
    : this._internal(
        () => MinimizeRequests()..windowId = windowId,
        from: minimizeRequestsProvider,
        name: r'minimizeRequestsProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$minimizeRequestsHash,
        dependencies: MinimizeRequestsFamily._dependencies,
        allTransitiveDependencies:
            MinimizeRequestsFamily._allTransitiveDependencies,
        windowId: windowId,
      );

  MinimizeRequestsProvider._internal(
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
  bool runNotifierBuild(covariant MinimizeRequests notifier) {
    return notifier.build(windowId);
  }

  @override
  Override overrideWith(MinimizeRequests Function() create) {
    return ProviderOverride(
      origin: this,
      override: MinimizeRequestsProvider._internal(
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
  AutoDisposeNotifierProviderElement<MinimizeRequests, bool> createElement() {
    return _MinimizeRequestsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MinimizeRequestsProvider && other.windowId == windowId;
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
mixin MinimizeRequestsRef on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `windowId` of this provider.
  String get windowId;
}

class _MinimizeRequestsProviderElement
    extends AutoDisposeNotifierProviderElement<MinimizeRequests, bool>
    with MinimizeRequestsRef {
  _MinimizeRequestsProviderElement(super.provider);

  @override
  String get windowId => (origin as MinimizeRequestsProvider).windowId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
