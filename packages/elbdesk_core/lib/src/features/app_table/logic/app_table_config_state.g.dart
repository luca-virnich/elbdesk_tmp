// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_table_config_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appTableConfigStateHash() =>
    r'4fb694945fccec902c3c254a68a2f6548a30cdbb';

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

abstract class _$AppTableConfigState
    extends BuildlessAutoDisposeAsyncNotifier<TableConfig?> {
  late final String componentIdentifier;
  late final String sessionId;

  FutureOr<TableConfig?> build(
    String componentIdentifier,
    String sessionId,
  );
}

/// Provides the current view for a table.
///
/// Copied from [AppTableConfigState].
@ProviderFor(AppTableConfigState)
const appTableConfigStateProvider = AppTableConfigStateFamily();

/// Provides the current view for a table.
///
/// Copied from [AppTableConfigState].
class AppTableConfigStateFamily extends Family<AsyncValue<TableConfig?>> {
  /// Provides the current view for a table.
  ///
  /// Copied from [AppTableConfigState].
  const AppTableConfigStateFamily();

  /// Provides the current view for a table.
  ///
  /// Copied from [AppTableConfigState].
  AppTableConfigStateProvider call(
    String componentIdentifier,
    String sessionId,
  ) {
    return AppTableConfigStateProvider(
      componentIdentifier,
      sessionId,
    );
  }

  @override
  AppTableConfigStateProvider getProviderOverride(
    covariant AppTableConfigStateProvider provider,
  ) {
    return call(
      provider.componentIdentifier,
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
  String? get name => r'appTableConfigStateProvider';
}

/// Provides the current view for a table.
///
/// Copied from [AppTableConfigState].
class AppTableConfigStateProvider extends AutoDisposeAsyncNotifierProviderImpl<
    AppTableConfigState, TableConfig?> {
  /// Provides the current view for a table.
  ///
  /// Copied from [AppTableConfigState].
  AppTableConfigStateProvider(
    String componentIdentifier,
    String sessionId,
  ) : this._internal(
          () => AppTableConfigState()
            ..componentIdentifier = componentIdentifier
            ..sessionId = sessionId,
          from: appTableConfigStateProvider,
          name: r'appTableConfigStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$appTableConfigStateHash,
          dependencies: AppTableConfigStateFamily._dependencies,
          allTransitiveDependencies:
              AppTableConfigStateFamily._allTransitiveDependencies,
          componentIdentifier: componentIdentifier,
          sessionId: sessionId,
        );

  AppTableConfigStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.componentIdentifier,
    required this.sessionId,
  }) : super.internal();

  final String componentIdentifier;
  final String sessionId;

  @override
  FutureOr<TableConfig?> runNotifierBuild(
    covariant AppTableConfigState notifier,
  ) {
    return notifier.build(
      componentIdentifier,
      sessionId,
    );
  }

  @override
  Override overrideWith(AppTableConfigState Function() create) {
    return ProviderOverride(
      origin: this,
      override: AppTableConfigStateProvider._internal(
        () => create()
          ..componentIdentifier = componentIdentifier
          ..sessionId = sessionId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        componentIdentifier: componentIdentifier,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<AppTableConfigState, TableConfig?>
      createElement() {
    return _AppTableConfigStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AppTableConfigStateProvider &&
        other.componentIdentifier == componentIdentifier &&
        other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, componentIdentifier.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AppTableConfigStateRef
    on AutoDisposeAsyncNotifierProviderRef<TableConfig?> {
  /// The parameter `componentIdentifier` of this provider.
  String get componentIdentifier;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _AppTableConfigStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AppTableConfigState,
        TableConfig?> with AppTableConfigStateRef {
  _AppTableConfigStateProviderElement(super.provider);

  @override
  String get componentIdentifier =>
      (origin as AppTableConfigStateProvider).componentIdentifier;
  @override
  String get sessionId => (origin as AppTableConfigStateProvider).sessionId;
}

String _$appTableConfigsHash() => r'ef9c42008b1ebc4375720971445e57e81199d8be';

abstract class _$AppTableConfigs
    extends BuildlessAutoDisposeAsyncNotifier<List<TableConfig>> {
  late final String componentIdentifier;

  FutureOr<List<TableConfig>> build({
    required String componentIdentifier,
  });
}

/// Holds the current table configs for a table type.
///
/// Copied from [AppTableConfigs].
@ProviderFor(AppTableConfigs)
const appTableConfigsProvider = AppTableConfigsFamily();

/// Holds the current table configs for a table type.
///
/// Copied from [AppTableConfigs].
class AppTableConfigsFamily extends Family<AsyncValue<List<TableConfig>>> {
  /// Holds the current table configs for a table type.
  ///
  /// Copied from [AppTableConfigs].
  const AppTableConfigsFamily();

  /// Holds the current table configs for a table type.
  ///
  /// Copied from [AppTableConfigs].
  AppTableConfigsProvider call({
    required String componentIdentifier,
  }) {
    return AppTableConfigsProvider(
      componentIdentifier: componentIdentifier,
    );
  }

  @override
  AppTableConfigsProvider getProviderOverride(
    covariant AppTableConfigsProvider provider,
  ) {
    return call(
      componentIdentifier: provider.componentIdentifier,
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
  String? get name => r'appTableConfigsProvider';
}

/// Holds the current table configs for a table type.
///
/// Copied from [AppTableConfigs].
class AppTableConfigsProvider extends AutoDisposeAsyncNotifierProviderImpl<
    AppTableConfigs, List<TableConfig>> {
  /// Holds the current table configs for a table type.
  ///
  /// Copied from [AppTableConfigs].
  AppTableConfigsProvider({
    required String componentIdentifier,
  }) : this._internal(
          () => AppTableConfigs()..componentIdentifier = componentIdentifier,
          from: appTableConfigsProvider,
          name: r'appTableConfigsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$appTableConfigsHash,
          dependencies: AppTableConfigsFamily._dependencies,
          allTransitiveDependencies:
              AppTableConfigsFamily._allTransitiveDependencies,
          componentIdentifier: componentIdentifier,
        );

  AppTableConfigsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.componentIdentifier,
  }) : super.internal();

  final String componentIdentifier;

  @override
  FutureOr<List<TableConfig>> runNotifierBuild(
    covariant AppTableConfigs notifier,
  ) {
    return notifier.build(
      componentIdentifier: componentIdentifier,
    );
  }

  @override
  Override overrideWith(AppTableConfigs Function() create) {
    return ProviderOverride(
      origin: this,
      override: AppTableConfigsProvider._internal(
        () => create()..componentIdentifier = componentIdentifier,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        componentIdentifier: componentIdentifier,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<AppTableConfigs, List<TableConfig>>
      createElement() {
    return _AppTableConfigsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AppTableConfigsProvider &&
        other.componentIdentifier == componentIdentifier;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, componentIdentifier.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AppTableConfigsRef
    on AutoDisposeAsyncNotifierProviderRef<List<TableConfig>> {
  /// The parameter `componentIdentifier` of this provider.
  String get componentIdentifier;
}

class _AppTableConfigsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AppTableConfigs,
        List<TableConfig>> with AppTableConfigsRef {
  _AppTableConfigsProviderElement(super.provider);

  @override
  String get componentIdentifier =>
      (origin as AppTableConfigsProvider).componentIdentifier;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
