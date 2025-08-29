// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_table_filter_temp_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appTableFilterTempStateHash() =>
    r'61726befc47a125123ec3ef93ed946c304cfbdb6';

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

abstract class _$AppTableFilterTempState
    extends BuildlessAutoDisposeNotifier<Filter> {
  late final String tableType;
  late final String tableId;

  Filter build(
    String tableType,
    String tableId,
  );
}

/// Holds the temporary filter state for a table.
///
/// Copied from [AppTableFilterTempState].
@ProviderFor(AppTableFilterTempState)
const appTableFilterTempStateProvider = AppTableFilterTempStateFamily();

/// Holds the temporary filter state for a table.
///
/// Copied from [AppTableFilterTempState].
class AppTableFilterTempStateFamily extends Family<Filter> {
  /// Holds the temporary filter state for a table.
  ///
  /// Copied from [AppTableFilterTempState].
  const AppTableFilterTempStateFamily();

  /// Holds the temporary filter state for a table.
  ///
  /// Copied from [AppTableFilterTempState].
  AppTableFilterTempStateProvider call(
    String tableType,
    String tableId,
  ) {
    return AppTableFilterTempStateProvider(
      tableType,
      tableId,
    );
  }

  @override
  AppTableFilterTempStateProvider getProviderOverride(
    covariant AppTableFilterTempStateProvider provider,
  ) {
    return call(
      provider.tableType,
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
  String? get name => r'appTableFilterTempStateProvider';
}

/// Holds the temporary filter state for a table.
///
/// Copied from [AppTableFilterTempState].
class AppTableFilterTempStateProvider
    extends AutoDisposeNotifierProviderImpl<AppTableFilterTempState, Filter> {
  /// Holds the temporary filter state for a table.
  ///
  /// Copied from [AppTableFilterTempState].
  AppTableFilterTempStateProvider(
    String tableType,
    String tableId,
  ) : this._internal(
          () => AppTableFilterTempState()
            ..tableType = tableType
            ..tableId = tableId,
          from: appTableFilterTempStateProvider,
          name: r'appTableFilterTempStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$appTableFilterTempStateHash,
          dependencies: AppTableFilterTempStateFamily._dependencies,
          allTransitiveDependencies:
              AppTableFilterTempStateFamily._allTransitiveDependencies,
          tableType: tableType,
          tableId: tableId,
        );

  AppTableFilterTempStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tableType,
    required this.tableId,
  }) : super.internal();

  final String tableType;
  final String tableId;

  @override
  Filter runNotifierBuild(
    covariant AppTableFilterTempState notifier,
  ) {
    return notifier.build(
      tableType,
      tableId,
    );
  }

  @override
  Override overrideWith(AppTableFilterTempState Function() create) {
    return ProviderOverride(
      origin: this,
      override: AppTableFilterTempStateProvider._internal(
        () => create()
          ..tableType = tableType
          ..tableId = tableId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tableType: tableType,
        tableId: tableId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<AppTableFilterTempState, Filter>
      createElement() {
    return _AppTableFilterTempStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AppTableFilterTempStateProvider &&
        other.tableType == tableType &&
        other.tableId == tableId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tableType.hashCode);
    hash = _SystemHash.combine(hash, tableId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AppTableFilterTempStateRef on AutoDisposeNotifierProviderRef<Filter> {
  /// The parameter `tableType` of this provider.
  String get tableType;

  /// The parameter `tableId` of this provider.
  String get tableId;
}

class _AppTableFilterTempStateProviderElement
    extends AutoDisposeNotifierProviderElement<AppTableFilterTempState, Filter>
    with AppTableFilterTempStateRef {
  _AppTableFilterTempStateProviderElement(super.provider);

  @override
  String get tableType => (origin as AppTableFilterTempStateProvider).tableType;
  @override
  String get tableId => (origin as AppTableFilterTempStateProvider).tableId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
