// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'window_size_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$windowSizeHash() => r'180f540edbde866a710de8fc0d8ef9ec4f6eaa8d';

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

abstract class _$WindowSize extends BuildlessAutoDisposeNotifier<Size?> {
  late final String windowId;

  Size? build(String windowId);
}

/// Family provider for tracking the size of a specific window
/// Auto-disposes when the window is closed
///
/// Copied from [WindowSize].
@ProviderFor(WindowSize)
const windowSizeProvider = WindowSizeFamily();

/// Family provider for tracking the size of a specific window
/// Auto-disposes when the window is closed
///
/// Copied from [WindowSize].
class WindowSizeFamily extends Family<Size?> {
  /// Family provider for tracking the size of a specific window
  /// Auto-disposes when the window is closed
  ///
  /// Copied from [WindowSize].
  const WindowSizeFamily();

  /// Family provider for tracking the size of a specific window
  /// Auto-disposes when the window is closed
  ///
  /// Copied from [WindowSize].
  WindowSizeProvider call(String windowId) {
    return WindowSizeProvider(windowId);
  }

  @override
  WindowSizeProvider getProviderOverride(
    covariant WindowSizeProvider provider,
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
  String? get name => r'windowSizeProvider';
}

/// Family provider for tracking the size of a specific window
/// Auto-disposes when the window is closed
///
/// Copied from [WindowSize].
class WindowSizeProvider
    extends AutoDisposeNotifierProviderImpl<WindowSize, Size?> {
  /// Family provider for tracking the size of a specific window
  /// Auto-disposes when the window is closed
  ///
  /// Copied from [WindowSize].
  WindowSizeProvider(String windowId)
    : this._internal(
        () => WindowSize()..windowId = windowId,
        from: windowSizeProvider,
        name: r'windowSizeProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$windowSizeHash,
        dependencies: WindowSizeFamily._dependencies,
        allTransitiveDependencies: WindowSizeFamily._allTransitiveDependencies,
        windowId: windowId,
      );

  WindowSizeProvider._internal(
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
  Size? runNotifierBuild(covariant WindowSize notifier) {
    return notifier.build(windowId);
  }

  @override
  Override overrideWith(WindowSize Function() create) {
    return ProviderOverride(
      origin: this,
      override: WindowSizeProvider._internal(
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
  AutoDisposeNotifierProviderElement<WindowSize, Size?> createElement() {
    return _WindowSizeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WindowSizeProvider && other.windowId == windowId;
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
mixin WindowSizeRef on AutoDisposeNotifierProviderRef<Size?> {
  /// The parameter `windowId` of this provider.
  String get windowId;
}

class _WindowSizeProviderElement
    extends AutoDisposeNotifierProviderElement<WindowSize, Size?>
    with WindowSizeRef {
  _WindowSizeProviderElement(super.provider);

  @override
  String get windowId => (origin as WindowSizeProvider).windowId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
