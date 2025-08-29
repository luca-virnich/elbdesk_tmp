// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_order_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$salesOrderStateHash() => r'389e6ac233f7bee5b05128421c132c3efcdd5860';

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

abstract class _$SalesOrderState
    extends BuildlessAutoDisposeAsyncNotifier<SalesOrder> {
  late final int entityId;
  late final String sessionId;

  FutureOr<SalesOrder> build(
    int entityId,
    String sessionId,
  );
}

/// Sales Order State
///
/// This state is used to manage and update the sales order details
///
/// Copied from [SalesOrderState].
@ProviderFor(SalesOrderState)
const salesOrderStateProvider = SalesOrderStateFamily();

/// Sales Order State
///
/// This state is used to manage and update the sales order details
///
/// Copied from [SalesOrderState].
class SalesOrderStateFamily extends Family<AsyncValue<SalesOrder>> {
  /// Sales Order State
  ///
  /// This state is used to manage and update the sales order details
  ///
  /// Copied from [SalesOrderState].
  const SalesOrderStateFamily();

  /// Sales Order State
  ///
  /// This state is used to manage and update the sales order details
  ///
  /// Copied from [SalesOrderState].
  SalesOrderStateProvider call(
    int entityId,
    String sessionId,
  ) {
    return SalesOrderStateProvider(
      entityId,
      sessionId,
    );
  }

  @override
  SalesOrderStateProvider getProviderOverride(
    covariant SalesOrderStateProvider provider,
  ) {
    return call(
      provider.entityId,
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
  String? get name => r'salesOrderStateProvider';
}

/// Sales Order State
///
/// This state is used to manage and update the sales order details
///
/// Copied from [SalesOrderState].
class SalesOrderStateProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SalesOrderState, SalesOrder> {
  /// Sales Order State
  ///
  /// This state is used to manage and update the sales order details
  ///
  /// Copied from [SalesOrderState].
  SalesOrderStateProvider(
    int entityId,
    String sessionId,
  ) : this._internal(
          () => SalesOrderState()
            ..entityId = entityId
            ..sessionId = sessionId,
          from: salesOrderStateProvider,
          name: r'salesOrderStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$salesOrderStateHash,
          dependencies: SalesOrderStateFamily._dependencies,
          allTransitiveDependencies:
              SalesOrderStateFamily._allTransitiveDependencies,
          entityId: entityId,
          sessionId: sessionId,
        );

  SalesOrderStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.entityId,
    required this.sessionId,
  }) : super.internal();

  final int entityId;
  final String sessionId;

  @override
  FutureOr<SalesOrder> runNotifierBuild(
    covariant SalesOrderState notifier,
  ) {
    return notifier.build(
      entityId,
      sessionId,
    );
  }

  @override
  Override overrideWith(SalesOrderState Function() create) {
    return ProviderOverride(
      origin: this,
      override: SalesOrderStateProvider._internal(
        () => create()
          ..entityId = entityId
          ..sessionId = sessionId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        entityId: entityId,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<SalesOrderState, SalesOrder>
      createElement() {
    return _SalesOrderStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SalesOrderStateProvider &&
        other.entityId == entityId &&
        other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, entityId.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SalesOrderStateRef on AutoDisposeAsyncNotifierProviderRef<SalesOrder> {
  /// The parameter `entityId` of this provider.
  int get entityId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _SalesOrderStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SalesOrderState, SalesOrder>
    with SalesOrderStateRef {
  _SalesOrderStateProviderElement(super.provider);

  @override
  int get entityId => (origin as SalesOrderStateProvider).entityId;
  @override
  String get sessionId => (origin as SalesOrderStateProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
