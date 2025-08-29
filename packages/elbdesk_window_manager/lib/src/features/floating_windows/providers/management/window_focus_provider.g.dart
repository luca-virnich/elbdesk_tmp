// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'window_focus_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$windowFocusNodeHash() => r'2273fe919a11066efadc6d48f15e6ab4df4385fe';

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

/// Provider to access focus nodes for specific windows
///
/// Copied from [windowFocusNode].
@ProviderFor(windowFocusNode)
const windowFocusNodeProvider = WindowFocusNodeFamily();

/// Provider to access focus nodes for specific windows
///
/// Copied from [windowFocusNode].
class WindowFocusNodeFamily extends Family<FocusNode> {
  /// Provider to access focus nodes for specific windows
  ///
  /// Copied from [windowFocusNode].
  const WindowFocusNodeFamily();

  /// Provider to access focus nodes for specific windows
  ///
  /// Copied from [windowFocusNode].
  WindowFocusNodeProvider call(String windowId) {
    return WindowFocusNodeProvider(windowId);
  }

  @override
  WindowFocusNodeProvider getProviderOverride(
    covariant WindowFocusNodeProvider provider,
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
  String? get name => r'windowFocusNodeProvider';
}

/// Provider to access focus nodes for specific windows
///
/// Copied from [windowFocusNode].
class WindowFocusNodeProvider extends AutoDisposeProvider<FocusNode> {
  /// Provider to access focus nodes for specific windows
  ///
  /// Copied from [windowFocusNode].
  WindowFocusNodeProvider(String windowId)
    : this._internal(
        (ref) => windowFocusNode(ref as WindowFocusNodeRef, windowId),
        from: windowFocusNodeProvider,
        name: r'windowFocusNodeProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$windowFocusNodeHash,
        dependencies: WindowFocusNodeFamily._dependencies,
        allTransitiveDependencies:
            WindowFocusNodeFamily._allTransitiveDependencies,
        windowId: windowId,
      );

  WindowFocusNodeProvider._internal(
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
  Override overrideWith(
    FocusNode Function(WindowFocusNodeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WindowFocusNodeProvider._internal(
        (ref) => create(ref as WindowFocusNodeRef),
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
  AutoDisposeProviderElement<FocusNode> createElement() {
    return _WindowFocusNodeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WindowFocusNodeProvider && other.windowId == windowId;
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
mixin WindowFocusNodeRef on AutoDisposeProviderRef<FocusNode> {
  /// The parameter `windowId` of this provider.
  String get windowId;
}

class _WindowFocusNodeProviderElement
    extends AutoDisposeProviderElement<FocusNode>
    with WindowFocusNodeRef {
  _WindowFocusNodeProviderElement(super.provider);

  @override
  String get windowId => (origin as WindowFocusNodeProvider).windowId;
}

String _$windowFocusManagerHash() =>
    r'afd8fd77fc851d1f1caacd991ef1299b337d9e8b';

/// Manages focus nodes for floating windows
///
/// Copied from [WindowFocusManager].
@ProviderFor(WindowFocusManager)
final windowFocusManagerProvider =
    AutoDisposeNotifierProvider<WindowFocusManager, void>.internal(
      WindowFocusManager.new,
      name: r'windowFocusManagerProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$windowFocusManagerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$WindowFocusManager = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
