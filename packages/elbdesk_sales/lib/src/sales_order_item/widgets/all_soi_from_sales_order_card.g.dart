// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_soi_from_sales_order_card.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$selectedSoiTypesHash() => r'62c19364cf311f3c95231a75ca59ebad7fb97843';

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

abstract class _$SelectedSoiTypes
    extends BuildlessAutoDisposeNotifier<Set<SalesOrderItemType>> {
  late final String sessionId;

  Set<SalesOrderItemType> build(
    String sessionId,
  );
}

/// See also [SelectedSoiTypes].
@ProviderFor(SelectedSoiTypes)
const selectedSoiTypesProvider = SelectedSoiTypesFamily();

/// See also [SelectedSoiTypes].
class SelectedSoiTypesFamily extends Family<Set<SalesOrderItemType>> {
  /// See also [SelectedSoiTypes].
  const SelectedSoiTypesFamily();

  /// See also [SelectedSoiTypes].
  SelectedSoiTypesProvider call(
    String sessionId,
  ) {
    return SelectedSoiTypesProvider(
      sessionId,
    );
  }

  @override
  SelectedSoiTypesProvider getProviderOverride(
    covariant SelectedSoiTypesProvider provider,
  ) {
    return call(
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
  String? get name => r'selectedSoiTypesProvider';
}

/// See also [SelectedSoiTypes].
class SelectedSoiTypesProvider extends AutoDisposeNotifierProviderImpl<
    SelectedSoiTypes, Set<SalesOrderItemType>> {
  /// See also [SelectedSoiTypes].
  SelectedSoiTypesProvider(
    String sessionId,
  ) : this._internal(
          () => SelectedSoiTypes()..sessionId = sessionId,
          from: selectedSoiTypesProvider,
          name: r'selectedSoiTypesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$selectedSoiTypesHash,
          dependencies: SelectedSoiTypesFamily._dependencies,
          allTransitiveDependencies:
              SelectedSoiTypesFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  SelectedSoiTypesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
  }) : super.internal();

  final String sessionId;

  @override
  Set<SalesOrderItemType> runNotifierBuild(
    covariant SelectedSoiTypes notifier,
  ) {
    return notifier.build(
      sessionId,
    );
  }

  @override
  Override overrideWith(SelectedSoiTypes Function() create) {
    return ProviderOverride(
      origin: this,
      override: SelectedSoiTypesProvider._internal(
        () => create()..sessionId = sessionId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<SelectedSoiTypes, Set<SalesOrderItemType>>
      createElement() {
    return _SelectedSoiTypesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SelectedSoiTypesProvider && other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SelectedSoiTypesRef
    on AutoDisposeNotifierProviderRef<Set<SalesOrderItemType>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _SelectedSoiTypesProviderElement
    extends AutoDisposeNotifierProviderElement<SelectedSoiTypes,
        Set<SalesOrderItemType>> with SelectedSoiTypesRef {
  _SelectedSoiTypesProviderElement(super.provider);

  @override
  String get sessionId => (origin as SelectedSoiTypesProvider).sessionId;
}

String _$selectedSoiStatusHash() => r'cd88a612ab77cf36fde30618d75379be45720a8a';

abstract class _$SelectedSoiStatus
    extends BuildlessAutoDisposeNotifier<Set<SalesOrderItemStatus>> {
  late final String sessionId;

  Set<SalesOrderItemStatus> build(
    String sessionId,
  );
}

/// See also [SelectedSoiStatus].
@ProviderFor(SelectedSoiStatus)
const selectedSoiStatusProvider = SelectedSoiStatusFamily();

/// See also [SelectedSoiStatus].
class SelectedSoiStatusFamily extends Family<Set<SalesOrderItemStatus>> {
  /// See also [SelectedSoiStatus].
  const SelectedSoiStatusFamily();

  /// See also [SelectedSoiStatus].
  SelectedSoiStatusProvider call(
    String sessionId,
  ) {
    return SelectedSoiStatusProvider(
      sessionId,
    );
  }

  @override
  SelectedSoiStatusProvider getProviderOverride(
    covariant SelectedSoiStatusProvider provider,
  ) {
    return call(
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
  String? get name => r'selectedSoiStatusProvider';
}

/// See also [SelectedSoiStatus].
class SelectedSoiStatusProvider extends AutoDisposeNotifierProviderImpl<
    SelectedSoiStatus, Set<SalesOrderItemStatus>> {
  /// See also [SelectedSoiStatus].
  SelectedSoiStatusProvider(
    String sessionId,
  ) : this._internal(
          () => SelectedSoiStatus()..sessionId = sessionId,
          from: selectedSoiStatusProvider,
          name: r'selectedSoiStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$selectedSoiStatusHash,
          dependencies: SelectedSoiStatusFamily._dependencies,
          allTransitiveDependencies:
              SelectedSoiStatusFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  SelectedSoiStatusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
  }) : super.internal();

  final String sessionId;

  @override
  Set<SalesOrderItemStatus> runNotifierBuild(
    covariant SelectedSoiStatus notifier,
  ) {
    return notifier.build(
      sessionId,
    );
  }

  @override
  Override overrideWith(SelectedSoiStatus Function() create) {
    return ProviderOverride(
      origin: this,
      override: SelectedSoiStatusProvider._internal(
        () => create()..sessionId = sessionId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<SelectedSoiStatus,
      Set<SalesOrderItemStatus>> createElement() {
    return _SelectedSoiStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SelectedSoiStatusProvider && other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SelectedSoiStatusRef
    on AutoDisposeNotifierProviderRef<Set<SalesOrderItemStatus>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _SelectedSoiStatusProviderElement
    extends AutoDisposeNotifierProviderElement<SelectedSoiStatus,
        Set<SalesOrderItemStatus>> with SelectedSoiStatusRef {
  _SelectedSoiStatusProviderElement(super.provider);

  @override
  String get sessionId => (origin as SelectedSoiStatusProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
