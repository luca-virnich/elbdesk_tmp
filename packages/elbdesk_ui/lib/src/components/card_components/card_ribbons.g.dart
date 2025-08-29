// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_ribbons.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userRibbonConfigHash() => r'4a20b9a90273ba9e6f86d14a5c80ce271412cc07';

/// See also [UserRibbonConfig].
@ProviderFor(UserRibbonConfig)
final userRibbonConfigProvider =
    NotifierProvider<UserRibbonConfig, Map<String, RibbonConfig>>.internal(
  UserRibbonConfig.new,
  name: r'userRibbonConfigProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userRibbonConfigHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserRibbonConfig = Notifier<Map<String, RibbonConfig>>;
String _$windowRibbonConfigHash() =>
    r'5701c1c534468e81ec50b9a38a2f74faa6fcc40a';

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

abstract class _$WindowRibbonConfig
    extends BuildlessAutoDisposeNotifier<RibbonConfig> {
  late final String floatingWindowId;
  late final String floatingWindowType;

  RibbonConfig build(
    String floatingWindowId,
    String floatingWindowType,
  );
}

/// See also [WindowRibbonConfig].
@ProviderFor(WindowRibbonConfig)
const windowRibbonConfigProvider = WindowRibbonConfigFamily();

/// See also [WindowRibbonConfig].
class WindowRibbonConfigFamily extends Family<RibbonConfig> {
  /// See also [WindowRibbonConfig].
  const WindowRibbonConfigFamily();

  /// See also [WindowRibbonConfig].
  WindowRibbonConfigProvider call(
    String floatingWindowId,
    String floatingWindowType,
  ) {
    return WindowRibbonConfigProvider(
      floatingWindowId,
      floatingWindowType,
    );
  }

  @override
  WindowRibbonConfigProvider getProviderOverride(
    covariant WindowRibbonConfigProvider provider,
  ) {
    return call(
      provider.floatingWindowId,
      provider.floatingWindowType,
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
  String? get name => r'windowRibbonConfigProvider';
}

/// See also [WindowRibbonConfig].
class WindowRibbonConfigProvider
    extends AutoDisposeNotifierProviderImpl<WindowRibbonConfig, RibbonConfig> {
  /// See also [WindowRibbonConfig].
  WindowRibbonConfigProvider(
    String floatingWindowId,
    String floatingWindowType,
  ) : this._internal(
          () => WindowRibbonConfig()
            ..floatingWindowId = floatingWindowId
            ..floatingWindowType = floatingWindowType,
          from: windowRibbonConfigProvider,
          name: r'windowRibbonConfigProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$windowRibbonConfigHash,
          dependencies: WindowRibbonConfigFamily._dependencies,
          allTransitiveDependencies:
              WindowRibbonConfigFamily._allTransitiveDependencies,
          floatingWindowId: floatingWindowId,
          floatingWindowType: floatingWindowType,
        );

  WindowRibbonConfigProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.floatingWindowId,
    required this.floatingWindowType,
  }) : super.internal();

  final String floatingWindowId;
  final String floatingWindowType;

  @override
  RibbonConfig runNotifierBuild(
    covariant WindowRibbonConfig notifier,
  ) {
    return notifier.build(
      floatingWindowId,
      floatingWindowType,
    );
  }

  @override
  Override overrideWith(WindowRibbonConfig Function() create) {
    return ProviderOverride(
      origin: this,
      override: WindowRibbonConfigProvider._internal(
        () => create()
          ..floatingWindowId = floatingWindowId
          ..floatingWindowType = floatingWindowType,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        floatingWindowId: floatingWindowId,
        floatingWindowType: floatingWindowType,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<WindowRibbonConfig, RibbonConfig>
      createElement() {
    return _WindowRibbonConfigProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WindowRibbonConfigProvider &&
        other.floatingWindowId == floatingWindowId &&
        other.floatingWindowType == floatingWindowType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, floatingWindowId.hashCode);
    hash = _SystemHash.combine(hash, floatingWindowType.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WindowRibbonConfigRef on AutoDisposeNotifierProviderRef<RibbonConfig> {
  /// The parameter `floatingWindowId` of this provider.
  String get floatingWindowId;

  /// The parameter `floatingWindowType` of this provider.
  String get floatingWindowType;
}

class _WindowRibbonConfigProviderElement
    extends AutoDisposeNotifierProviderElement<WindowRibbonConfig, RibbonConfig>
    with WindowRibbonConfigRef {
  _WindowRibbonConfigProviderElement(super.provider);

  @override
  String get floatingWindowId =>
      (origin as WindowRibbonConfigProvider).floatingWindowId;
  @override
  String get floatingWindowType =>
      (origin as WindowRibbonConfigProvider).floatingWindowType;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
