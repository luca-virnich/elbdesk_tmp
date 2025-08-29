// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'window_snapshot_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$windowSnapshotHash() => r'8246f0d370e9a548ff1c619dc192d754a992ba23';

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

abstract class _$WindowSnapshot
    extends BuildlessAutoDisposeNotifier<WindowSnapshotData?> {
  late final String windowId;

  WindowSnapshotData? build(String windowId);
}

/// Family provider for window snapshots that auto-disposes when not used
///
/// Copied from [WindowSnapshot].
@ProviderFor(WindowSnapshot)
const windowSnapshotProvider = WindowSnapshotFamily();

/// Family provider for window snapshots that auto-disposes when not used
///
/// Copied from [WindowSnapshot].
class WindowSnapshotFamily extends Family<WindowSnapshotData?> {
  /// Family provider for window snapshots that auto-disposes when not used
  ///
  /// Copied from [WindowSnapshot].
  const WindowSnapshotFamily();

  /// Family provider for window snapshots that auto-disposes when not used
  ///
  /// Copied from [WindowSnapshot].
  WindowSnapshotProvider call(String windowId) {
    return WindowSnapshotProvider(windowId);
  }

  @override
  WindowSnapshotProvider getProviderOverride(
    covariant WindowSnapshotProvider provider,
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
  String? get name => r'windowSnapshotProvider';
}

/// Family provider for window snapshots that auto-disposes when not used
///
/// Copied from [WindowSnapshot].
class WindowSnapshotProvider
    extends
        AutoDisposeNotifierProviderImpl<WindowSnapshot, WindowSnapshotData?> {
  /// Family provider for window snapshots that auto-disposes when not used
  ///
  /// Copied from [WindowSnapshot].
  WindowSnapshotProvider(String windowId)
    : this._internal(
        () => WindowSnapshot()..windowId = windowId,
        from: windowSnapshotProvider,
        name: r'windowSnapshotProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$windowSnapshotHash,
        dependencies: WindowSnapshotFamily._dependencies,
        allTransitiveDependencies:
            WindowSnapshotFamily._allTransitiveDependencies,
        windowId: windowId,
      );

  WindowSnapshotProvider._internal(
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
  WindowSnapshotData? runNotifierBuild(covariant WindowSnapshot notifier) {
    return notifier.build(windowId);
  }

  @override
  Override overrideWith(WindowSnapshot Function() create) {
    return ProviderOverride(
      origin: this,
      override: WindowSnapshotProvider._internal(
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
  AutoDisposeNotifierProviderElement<WindowSnapshot, WindowSnapshotData?>
  createElement() {
    return _WindowSnapshotProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WindowSnapshotProvider && other.windowId == windowId;
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
mixin WindowSnapshotRef on AutoDisposeNotifierProviderRef<WindowSnapshotData?> {
  /// The parameter `windowId` of this provider.
  String get windowId;
}

class _WindowSnapshotProviderElement
    extends
        AutoDisposeNotifierProviderElement<WindowSnapshot, WindowSnapshotData?>
    with WindowSnapshotRef {
  _WindowSnapshotProviderElement(super.provider);

  @override
  String get windowId => (origin as WindowSnapshotProvider).windowId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
