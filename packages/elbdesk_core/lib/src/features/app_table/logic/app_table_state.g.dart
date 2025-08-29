// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_table_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appTableStateHash() => r'c9f3c47f51ec04d9c0519124b5b919c94cbade54';

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

abstract class _$AppTableState
    extends BuildlessAutoDisposeNotifier<AppTableData> {
  late final String tableId;

  AppTableData build(
    String tableId,
  );
}

/// AppTableState
///
/// Holds the state for a table
///
/// Copied from [AppTableState].
@ProviderFor(AppTableState)
const appTableStateProvider = AppTableStateFamily();

/// AppTableState
///
/// Holds the state for a table
///
/// Copied from [AppTableState].
class AppTableStateFamily extends Family<AppTableData> {
  /// AppTableState
  ///
  /// Holds the state for a table
  ///
  /// Copied from [AppTableState].
  const AppTableStateFamily();

  /// AppTableState
  ///
  /// Holds the state for a table
  ///
  /// Copied from [AppTableState].
  AppTableStateProvider call(
    String tableId,
  ) {
    return AppTableStateProvider(
      tableId,
    );
  }

  @override
  AppTableStateProvider getProviderOverride(
    covariant AppTableStateProvider provider,
  ) {
    return call(
      provider.tableId,
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
  String? get name => r'appTableStateProvider';
}

/// AppTableState
///
/// Holds the state for a table
///
/// Copied from [AppTableState].
class AppTableStateProvider
    extends AutoDisposeNotifierProviderImpl<AppTableState, AppTableData> {
  /// AppTableState
  ///
  /// Holds the state for a table
  ///
  /// Copied from [AppTableState].
  AppTableStateProvider(
    String tableId,
  ) : this._internal(
          () => AppTableState()..tableId = tableId,
          from: appTableStateProvider,
          name: r'appTableStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$appTableStateHash,
          dependencies: AppTableStateFamily._dependencies,
          allTransitiveDependencies:
              AppTableStateFamily._allTransitiveDependencies,
          tableId: tableId,
        );

  AppTableStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tableId,
  }) : super.internal();

  final String tableId;

  @override
  AppTableData runNotifierBuild(
    covariant AppTableState notifier,
  ) {
    return notifier.build(
      tableId,
    );
  }

  @override
  Override overrideWith(AppTableState Function() create) {
    return ProviderOverride(
      origin: this,
      override: AppTableStateProvider._internal(
        () => create()..tableId = tableId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tableId: tableId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<AppTableState, AppTableData>
      createElement() {
    return _AppTableStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AppTableStateProvider && other.tableId == tableId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tableId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AppTableStateRef on AutoDisposeNotifierProviderRef<AppTableData> {
  /// The parameter `tableId` of this provider.
  String get tableId;
}

class _AppTableStateProviderElement
    extends AutoDisposeNotifierProviderElement<AppTableState, AppTableData>
    with AppTableStateRef {
  _AppTableStateProviderElement(super.provider);

  @override
  String get tableId => (origin as AppTableStateProvider).tableId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
