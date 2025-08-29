// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_table_sort_and_filter_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tableSortAndFilterHash() =>
    r'6d510b05cceb961cc76181a8e452e297b01fbcfa';

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

/// Table Sort and Filter Provider
///
/// This provider is used to fetch the sort and filter state for a table.
///
/// The sessionId is needed to differentiate between different tables. One
/// table could have filters enabled and another one not. The sessionId is used
/// to be able to fetch both lists with the same provider.
///
/// Copied from [tableSortAndFilter].
@ProviderFor(tableSortAndFilter)
const tableSortAndFilterProvider = TableSortAndFilterFamily();

/// Table Sort and Filter Provider
///
/// This provider is used to fetch the sort and filter state for a table.
///
/// The sessionId is needed to differentiate between different tables. One
/// table could have filters enabled and another one not. The sessionId is used
/// to be able to fetch both lists with the same provider.
///
/// Copied from [tableSortAndFilter].
class TableSortAndFilterFamily extends Family<(Sort?, Filter?)> {
  /// Table Sort and Filter Provider
  ///
  /// This provider is used to fetch the sort and filter state for a table.
  ///
  /// The sessionId is needed to differentiate between different tables. One
  /// table could have filters enabled and another one not. The sessionId is used
  /// to be able to fetch both lists with the same provider.
  ///
  /// Copied from [tableSortAndFilter].
  const TableSortAndFilterFamily();

  /// Table Sort and Filter Provider
  ///
  /// This provider is used to fetch the sort and filter state for a table.
  ///
  /// The sessionId is needed to differentiate between different tables. One
  /// table could have filters enabled and another one not. The sessionId is used
  /// to be able to fetch both lists with the same provider.
  ///
  /// Copied from [tableSortAndFilter].
  TableSortAndFilterProvider call(
    String sessionId,
    String tableType,
  ) {
    return TableSortAndFilterProvider(
      sessionId,
      tableType,
    );
  }

  @override
  TableSortAndFilterProvider getProviderOverride(
    covariant TableSortAndFilterProvider provider,
  ) {
    return call(
      provider.sessionId,
      provider.tableType,
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
  String? get name => r'tableSortAndFilterProvider';
}

/// Table Sort and Filter Provider
///
/// This provider is used to fetch the sort and filter state for a table.
///
/// The sessionId is needed to differentiate between different tables. One
/// table could have filters enabled and another one not. The sessionId is used
/// to be able to fetch both lists with the same provider.
///
/// Copied from [tableSortAndFilter].
class TableSortAndFilterProvider extends AutoDisposeProvider<(Sort?, Filter?)> {
  /// Table Sort and Filter Provider
  ///
  /// This provider is used to fetch the sort and filter state for a table.
  ///
  /// The sessionId is needed to differentiate between different tables. One
  /// table could have filters enabled and another one not. The sessionId is used
  /// to be able to fetch both lists with the same provider.
  ///
  /// Copied from [tableSortAndFilter].
  TableSortAndFilterProvider(
    String sessionId,
    String tableType,
  ) : this._internal(
          (ref) => tableSortAndFilter(
            ref as TableSortAndFilterRef,
            sessionId,
            tableType,
          ),
          from: tableSortAndFilterProvider,
          name: r'tableSortAndFilterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tableSortAndFilterHash,
          dependencies: TableSortAndFilterFamily._dependencies,
          allTransitiveDependencies:
              TableSortAndFilterFamily._allTransitiveDependencies,
          sessionId: sessionId,
          tableType: tableType,
        );

  TableSortAndFilterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
    required this.tableType,
  }) : super.internal();

  final String sessionId;
  final String tableType;

  @override
  Override overrideWith(
    (Sort?, Filter?) Function(TableSortAndFilterRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TableSortAndFilterProvider._internal(
        (ref) => create(ref as TableSortAndFilterRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
        tableType: tableType,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<(Sort?, Filter?)> createElement() {
    return _TableSortAndFilterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TableSortAndFilterProvider &&
        other.sessionId == sessionId &&
        other.tableType == tableType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);
    hash = _SystemHash.combine(hash, tableType.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TableSortAndFilterRef on AutoDisposeProviderRef<(Sort?, Filter?)> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `tableType` of this provider.
  String get tableType;
}

class _TableSortAndFilterProviderElement
    extends AutoDisposeProviderElement<(Sort?, Filter?)>
    with TableSortAndFilterRef {
  _TableSortAndFilterProviderElement(super.provider);

  @override
  String get sessionId => (origin as TableSortAndFilterProvider).sessionId;
  @override
  String get tableType => (origin as TableSortAndFilterProvider).tableType;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
