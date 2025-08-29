// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'window_position_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$windowPositionNotifierHash() =>
    r'dc2597b93b136054574f0613a605e5749074b588';

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

abstract class _$WindowPositionNotifier
    extends BuildlessAutoDisposeNotifier<WindowPositionUpdate?> {
  late final String windowId;

  WindowPositionUpdate? build(String windowId);
}

/// Provider for managing window position updates
/// When a new position is set, the FloatingWindow widget will animate to it
///
/// Copied from [WindowPositionNotifier].
@ProviderFor(WindowPositionNotifier)
const windowPositionNotifierProvider = WindowPositionNotifierFamily();

/// Provider for managing window position updates
/// When a new position is set, the FloatingWindow widget will animate to it
///
/// Copied from [WindowPositionNotifier].
class WindowPositionNotifierFamily extends Family<WindowPositionUpdate?> {
  /// Provider for managing window position updates
  /// When a new position is set, the FloatingWindow widget will animate to it
  ///
  /// Copied from [WindowPositionNotifier].
  const WindowPositionNotifierFamily();

  /// Provider for managing window position updates
  /// When a new position is set, the FloatingWindow widget will animate to it
  ///
  /// Copied from [WindowPositionNotifier].
  WindowPositionNotifierProvider call(String windowId) {
    return WindowPositionNotifierProvider(windowId);
  }

  @override
  WindowPositionNotifierProvider getProviderOverride(
    covariant WindowPositionNotifierProvider provider,
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
  String? get name => r'windowPositionNotifierProvider';
}

/// Provider for managing window position updates
/// When a new position is set, the FloatingWindow widget will animate to it
///
/// Copied from [WindowPositionNotifier].
class WindowPositionNotifierProvider
    extends
        AutoDisposeNotifierProviderImpl<
          WindowPositionNotifier,
          WindowPositionUpdate?
        > {
  /// Provider for managing window position updates
  /// When a new position is set, the FloatingWindow widget will animate to it
  ///
  /// Copied from [WindowPositionNotifier].
  WindowPositionNotifierProvider(String windowId)
    : this._internal(
        () => WindowPositionNotifier()..windowId = windowId,
        from: windowPositionNotifierProvider,
        name: r'windowPositionNotifierProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$windowPositionNotifierHash,
        dependencies: WindowPositionNotifierFamily._dependencies,
        allTransitiveDependencies:
            WindowPositionNotifierFamily._allTransitiveDependencies,
        windowId: windowId,
      );

  WindowPositionNotifierProvider._internal(
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
  WindowPositionUpdate? runNotifierBuild(
    covariant WindowPositionNotifier notifier,
  ) {
    return notifier.build(windowId);
  }

  @override
  Override overrideWith(WindowPositionNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: WindowPositionNotifierProvider._internal(
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
  AutoDisposeNotifierProviderElement<
    WindowPositionNotifier,
    WindowPositionUpdate?
  >
  createElement() {
    return _WindowPositionNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WindowPositionNotifierProvider &&
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
mixin WindowPositionNotifierRef
    on AutoDisposeNotifierProviderRef<WindowPositionUpdate?> {
  /// The parameter `windowId` of this provider.
  String get windowId;
}

class _WindowPositionNotifierProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          WindowPositionNotifier,
          WindowPositionUpdate?
        >
    with WindowPositionNotifierRef {
  _WindowPositionNotifierProviderElement(super.provider);

  @override
  String get windowId => (origin as WindowPositionNotifierProvider).windowId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
