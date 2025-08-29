// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'minimized_window_positions_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$minimizedWindowPositionsHash() =>
    r'79bbe0ef841e32d82f13379ec6227d2829d4df7b';

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

abstract class _$MinimizedWindowPositions
    extends BuildlessAutoDisposeNotifier<Rect> {
  late final String windowId;

  Rect build(String windowId);
}

/// Stores window positions when minimized for restore animation
///
/// Copied from [MinimizedWindowPositions].
@ProviderFor(MinimizedWindowPositions)
const minimizedWindowPositionsProvider = MinimizedWindowPositionsFamily();

/// Stores window positions when minimized for restore animation
///
/// Copied from [MinimizedWindowPositions].
class MinimizedWindowPositionsFamily extends Family<Rect> {
  /// Stores window positions when minimized for restore animation
  ///
  /// Copied from [MinimizedWindowPositions].
  const MinimizedWindowPositionsFamily();

  /// Stores window positions when minimized for restore animation
  ///
  /// Copied from [MinimizedWindowPositions].
  MinimizedWindowPositionsProvider call(String windowId) {
    return MinimizedWindowPositionsProvider(windowId);
  }

  @override
  MinimizedWindowPositionsProvider getProviderOverride(
    covariant MinimizedWindowPositionsProvider provider,
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
  String? get name => r'minimizedWindowPositionsProvider';
}

/// Stores window positions when minimized for restore animation
///
/// Copied from [MinimizedWindowPositions].
class MinimizedWindowPositionsProvider
    extends AutoDisposeNotifierProviderImpl<MinimizedWindowPositions, Rect> {
  /// Stores window positions when minimized for restore animation
  ///
  /// Copied from [MinimizedWindowPositions].
  MinimizedWindowPositionsProvider(String windowId)
    : this._internal(
        () => MinimizedWindowPositions()..windowId = windowId,
        from: minimizedWindowPositionsProvider,
        name: r'minimizedWindowPositionsProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$minimizedWindowPositionsHash,
        dependencies: MinimizedWindowPositionsFamily._dependencies,
        allTransitiveDependencies:
            MinimizedWindowPositionsFamily._allTransitiveDependencies,
        windowId: windowId,
      );

  MinimizedWindowPositionsProvider._internal(
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
  Rect runNotifierBuild(covariant MinimizedWindowPositions notifier) {
    return notifier.build(windowId);
  }

  @override
  Override overrideWith(MinimizedWindowPositions Function() create) {
    return ProviderOverride(
      origin: this,
      override: MinimizedWindowPositionsProvider._internal(
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
  AutoDisposeNotifierProviderElement<MinimizedWindowPositions, Rect>
  createElement() {
    return _MinimizedWindowPositionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MinimizedWindowPositionsProvider &&
        other.windowId == windowId;
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
mixin MinimizedWindowPositionsRef on AutoDisposeNotifierProviderRef<Rect> {
  /// The parameter `windowId` of this provider.
  String get windowId;
}

class _MinimizedWindowPositionsProviderElement
    extends AutoDisposeNotifierProviderElement<MinimizedWindowPositions, Rect>
    with MinimizedWindowPositionsRef {
  _MinimizedWindowPositionsProviderElement(super.provider);

  @override
  String get windowId => (origin as MinimizedWindowPositionsProvider).windowId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
