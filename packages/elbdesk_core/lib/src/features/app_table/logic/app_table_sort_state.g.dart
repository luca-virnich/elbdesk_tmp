// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_table_sort_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appTableSortStateHash() => r'b20a38dc8e9992b82462869b48d80cbb061afa2e';

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

abstract class _$AppTableSortState extends BuildlessAutoDisposeNotifier<Sort?> {
  late final String sessionId;

  Sort? build(
    String sessionId,
  );
}

/// Holds the sort state for a table.
///
/// Copied from [AppTableSortState].
@ProviderFor(AppTableSortState)
const appTableSortStateProvider = AppTableSortStateFamily();

/// Holds the sort state for a table.
///
/// Copied from [AppTableSortState].
class AppTableSortStateFamily extends Family<Sort?> {
  /// Holds the sort state for a table.
  ///
  /// Copied from [AppTableSortState].
  const AppTableSortStateFamily();

  /// Holds the sort state for a table.
  ///
  /// Copied from [AppTableSortState].
  AppTableSortStateProvider call(
    String sessionId,
  ) {
    return AppTableSortStateProvider(
      sessionId,
    );
  }

  @override
  AppTableSortStateProvider getProviderOverride(
    covariant AppTableSortStateProvider provider,
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
  String? get name => r'appTableSortStateProvider';
}

/// Holds the sort state for a table.
///
/// Copied from [AppTableSortState].
class AppTableSortStateProvider
    extends AutoDisposeNotifierProviderImpl<AppTableSortState, Sort?> {
  /// Holds the sort state for a table.
  ///
  /// Copied from [AppTableSortState].
  AppTableSortStateProvider(
    String sessionId,
  ) : this._internal(
          () => AppTableSortState()..sessionId = sessionId,
          from: appTableSortStateProvider,
          name: r'appTableSortStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$appTableSortStateHash,
          dependencies: AppTableSortStateFamily._dependencies,
          allTransitiveDependencies:
              AppTableSortStateFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  AppTableSortStateProvider._internal(
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
  Sort? runNotifierBuild(
    covariant AppTableSortState notifier,
  ) {
    return notifier.build(
      sessionId,
    );
  }

  @override
  Override overrideWith(AppTableSortState Function() create) {
    return ProviderOverride(
      origin: this,
      override: AppTableSortStateProvider._internal(
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
  AutoDisposeNotifierProviderElement<AppTableSortState, Sort?> createElement() {
    return _AppTableSortStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AppTableSortStateProvider && other.sessionId == sessionId;
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
mixin AppTableSortStateRef on AutoDisposeNotifierProviderRef<Sort?> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _AppTableSortStateProviderElement
    extends AutoDisposeNotifierProviderElement<AppTableSortState, Sort?>
    with AppTableSortStateRef {
  _AppTableSortStateProviderElement(super.provider);

  @override
  String get sessionId => (origin as AppTableSortStateProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
