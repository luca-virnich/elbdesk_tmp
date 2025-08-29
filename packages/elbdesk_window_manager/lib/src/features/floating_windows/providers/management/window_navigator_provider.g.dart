// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'window_navigator_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$windowNavigatorHash() => r'd23b1eb8f923ca8a1a82d33ce096e400c98ff963';

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

/// See also [windowNavigator].
@ProviderFor(windowNavigator)
const windowNavigatorProvider = WindowNavigatorFamily();

/// See also [windowNavigator].
class WindowNavigatorFamily extends Family<GlobalKey<NavigatorState>> {
  /// See also [windowNavigator].
  const WindowNavigatorFamily();

  /// See also [windowNavigator].
  WindowNavigatorProvider call(String windowId) {
    return WindowNavigatorProvider(windowId);
  }

  @override
  WindowNavigatorProvider getProviderOverride(
    covariant WindowNavigatorProvider provider,
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
  String? get name => r'windowNavigatorProvider';
}

/// See also [windowNavigator].
class WindowNavigatorProvider
    extends AutoDisposeProvider<GlobalKey<NavigatorState>> {
  /// See also [windowNavigator].
  WindowNavigatorProvider(String windowId)
    : this._internal(
        (ref) => windowNavigator(ref as WindowNavigatorRef, windowId),
        from: windowNavigatorProvider,
        name: r'windowNavigatorProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$windowNavigatorHash,
        dependencies: WindowNavigatorFamily._dependencies,
        allTransitiveDependencies:
            WindowNavigatorFamily._allTransitiveDependencies,
        windowId: windowId,
      );

  WindowNavigatorProvider._internal(
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
    GlobalKey<NavigatorState> Function(WindowNavigatorRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WindowNavigatorProvider._internal(
        (ref) => create(ref as WindowNavigatorRef),
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
  AutoDisposeProviderElement<GlobalKey<NavigatorState>> createElement() {
    return _WindowNavigatorProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WindowNavigatorProvider && other.windowId == windowId;
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
mixin WindowNavigatorRef on AutoDisposeProviderRef<GlobalKey<NavigatorState>> {
  /// The parameter `windowId` of this provider.
  String get windowId;
}

class _WindowNavigatorProviderElement
    extends AutoDisposeProviderElement<GlobalKey<NavigatorState>>
    with WindowNavigatorRef {
  _WindowNavigatorProviderElement(super.provider);

  @override
  String get windowId => (origin as WindowNavigatorProvider).windowId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
