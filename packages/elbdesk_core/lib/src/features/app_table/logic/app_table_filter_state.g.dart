// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_table_filter_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appTableFilterStateHash() =>
    r'46548306eb69c9fbeb9b2e74f9041214c939c74d';

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

abstract class _$AppTableFilterState
    extends BuildlessAutoDisposeNotifier<Filter?> {
  late final String tableType;
  late final String sessionId;

  Filter? build(
    String tableType,
    String sessionId,
  );
}

/// Holds the filter state for a table.
///
/// Copied from [AppTableFilterState].
@ProviderFor(AppTableFilterState)
const appTableFilterStateProvider = AppTableFilterStateFamily();

/// Holds the filter state for a table.
///
/// Copied from [AppTableFilterState].
class AppTableFilterStateFamily extends Family<Filter?> {
  /// Holds the filter state for a table.
  ///
  /// Copied from [AppTableFilterState].
  const AppTableFilterStateFamily();

  /// Holds the filter state for a table.
  ///
  /// Copied from [AppTableFilterState].
  AppTableFilterStateProvider call(
    String tableType,
    String sessionId,
  ) {
    return AppTableFilterStateProvider(
      tableType,
      sessionId,
    );
  }

  @override
  AppTableFilterStateProvider getProviderOverride(
    covariant AppTableFilterStateProvider provider,
  ) {
    return call(
      provider.tableType,
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
  String? get name => r'appTableFilterStateProvider';
}

/// Holds the filter state for a table.
///
/// Copied from [AppTableFilterState].
class AppTableFilterStateProvider
    extends AutoDisposeNotifierProviderImpl<AppTableFilterState, Filter?> {
  /// Holds the filter state for a table.
  ///
  /// Copied from [AppTableFilterState].
  AppTableFilterStateProvider(
    String tableType,
    String sessionId,
  ) : this._internal(
          () => AppTableFilterState()
            ..tableType = tableType
            ..sessionId = sessionId,
          from: appTableFilterStateProvider,
          name: r'appTableFilterStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$appTableFilterStateHash,
          dependencies: AppTableFilterStateFamily._dependencies,
          allTransitiveDependencies:
              AppTableFilterStateFamily._allTransitiveDependencies,
          tableType: tableType,
          sessionId: sessionId,
        );

  AppTableFilterStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tableType,
    required this.sessionId,
  }) : super.internal();

  final String tableType;
  final String sessionId;

  @override
  Filter? runNotifierBuild(
    covariant AppTableFilterState notifier,
  ) {
    return notifier.build(
      tableType,
      sessionId,
    );
  }

  @override
  Override overrideWith(AppTableFilterState Function() create) {
    return ProviderOverride(
      origin: this,
      override: AppTableFilterStateProvider._internal(
        () => create()
          ..tableType = tableType
          ..sessionId = sessionId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tableType: tableType,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<AppTableFilterState, Filter?>
      createElement() {
    return _AppTableFilterStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AppTableFilterStateProvider &&
        other.tableType == tableType &&
        other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tableType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AppTableFilterStateRef on AutoDisposeNotifierProviderRef<Filter?> {
  /// The parameter `tableType` of this provider.
  String get tableType;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _AppTableFilterStateProviderElement
    extends AutoDisposeNotifierProviderElement<AppTableFilterState, Filter?>
    with AppTableFilterStateRef {
  _AppTableFilterStateProviderElement(super.provider);

  @override
  String get tableType => (origin as AppTableFilterStateProvider).tableType;
  @override
  String get sessionId => (origin as AppTableFilterStateProvider).sessionId;
}

String _$hiddenAppTableFilterGroupStateHash() =>
    r'26bd35a2ad792156766bd11e861e11b49f12e041';

abstract class _$HiddenAppTableFilterGroupState
    extends BuildlessAutoDisposeNotifier<FilterGroup?> {
  late final String tableType;
  late final String sessionId;

  FilterGroup? build(
    String tableType,
    String sessionId,
  );
}

/// See also [HiddenAppTableFilterGroupState].
@ProviderFor(HiddenAppTableFilterGroupState)
const hiddenAppTableFilterGroupStateProvider =
    HiddenAppTableFilterGroupStateFamily();

/// See also [HiddenAppTableFilterGroupState].
class HiddenAppTableFilterGroupStateFamily extends Family<FilterGroup?> {
  /// See also [HiddenAppTableFilterGroupState].
  const HiddenAppTableFilterGroupStateFamily();

  /// See also [HiddenAppTableFilterGroupState].
  HiddenAppTableFilterGroupStateProvider call(
    String tableType,
    String sessionId,
  ) {
    return HiddenAppTableFilterGroupStateProvider(
      tableType,
      sessionId,
    );
  }

  @override
  HiddenAppTableFilterGroupStateProvider getProviderOverride(
    covariant HiddenAppTableFilterGroupStateProvider provider,
  ) {
    return call(
      provider.tableType,
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
  String? get name => r'hiddenAppTableFilterGroupStateProvider';
}

/// See also [HiddenAppTableFilterGroupState].
class HiddenAppTableFilterGroupStateProvider
    extends AutoDisposeNotifierProviderImpl<HiddenAppTableFilterGroupState,
        FilterGroup?> {
  /// See also [HiddenAppTableFilterGroupState].
  HiddenAppTableFilterGroupStateProvider(
    String tableType,
    String sessionId,
  ) : this._internal(
          () => HiddenAppTableFilterGroupState()
            ..tableType = tableType
            ..sessionId = sessionId,
          from: hiddenAppTableFilterGroupStateProvider,
          name: r'hiddenAppTableFilterGroupStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$hiddenAppTableFilterGroupStateHash,
          dependencies: HiddenAppTableFilterGroupStateFamily._dependencies,
          allTransitiveDependencies:
              HiddenAppTableFilterGroupStateFamily._allTransitiveDependencies,
          tableType: tableType,
          sessionId: sessionId,
        );

  HiddenAppTableFilterGroupStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tableType,
    required this.sessionId,
  }) : super.internal();

  final String tableType;
  final String sessionId;

  @override
  FilterGroup? runNotifierBuild(
    covariant HiddenAppTableFilterGroupState notifier,
  ) {
    return notifier.build(
      tableType,
      sessionId,
    );
  }

  @override
  Override overrideWith(HiddenAppTableFilterGroupState Function() create) {
    return ProviderOverride(
      origin: this,
      override: HiddenAppTableFilterGroupStateProvider._internal(
        () => create()
          ..tableType = tableType
          ..sessionId = sessionId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tableType: tableType,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<HiddenAppTableFilterGroupState,
      FilterGroup?> createElement() {
    return _HiddenAppTableFilterGroupStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HiddenAppTableFilterGroupStateProvider &&
        other.tableType == tableType &&
        other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tableType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin HiddenAppTableFilterGroupStateRef
    on AutoDisposeNotifierProviderRef<FilterGroup?> {
  /// The parameter `tableType` of this provider.
  String get tableType;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _HiddenAppTableFilterGroupStateProviderElement
    extends AutoDisposeNotifierProviderElement<HiddenAppTableFilterGroupState,
        FilterGroup?> with HiddenAppTableFilterGroupStateRef {
  _HiddenAppTableFilterGroupStateProviderElement(super.provider);

  @override
  String get tableType =>
      (origin as HiddenAppTableFilterGroupStateProvider).tableType;
  @override
  String get sessionId =>
      (origin as HiddenAppTableFilterGroupStateProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
