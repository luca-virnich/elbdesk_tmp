// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spotlight_dialog.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$actionsSpotlightItemsHash() =>
    r'0f9c39646f0bef06287dfa47bf95f8cdaa3011a5';

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

/// See also [actionsSpotlightItems].
@ProviderFor(actionsSpotlightItems)
const actionsSpotlightItemsProvider = ActionsSpotlightItemsFamily();

/// See also [actionsSpotlightItems].
class ActionsSpotlightItemsFamily extends Family<List<SpotlightItem>> {
  /// See also [actionsSpotlightItems].
  const ActionsSpotlightItemsFamily();

  /// See also [actionsSpotlightItems].
  ActionsSpotlightItemsProvider call(
    ElbCoreLocalizations l10n,
  ) {
    return ActionsSpotlightItemsProvider(
      l10n,
    );
  }

  @override
  ActionsSpotlightItemsProvider getProviderOverride(
    covariant ActionsSpotlightItemsProvider provider,
  ) {
    return call(
      provider.l10n,
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
  String? get name => r'actionsSpotlightItemsProvider';
}

/// See also [actionsSpotlightItems].
class ActionsSpotlightItemsProvider
    extends AutoDisposeProvider<List<SpotlightItem>> {
  /// See also [actionsSpotlightItems].
  ActionsSpotlightItemsProvider(
    ElbCoreLocalizations l10n,
  ) : this._internal(
          (ref) => actionsSpotlightItems(
            ref as ActionsSpotlightItemsRef,
            l10n,
          ),
          from: actionsSpotlightItemsProvider,
          name: r'actionsSpotlightItemsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$actionsSpotlightItemsHash,
          dependencies: ActionsSpotlightItemsFamily._dependencies,
          allTransitiveDependencies:
              ActionsSpotlightItemsFamily._allTransitiveDependencies,
          l10n: l10n,
        );

  ActionsSpotlightItemsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.l10n,
  }) : super.internal();

  final ElbCoreLocalizations l10n;

  @override
  Override overrideWith(
    List<SpotlightItem> Function(ActionsSpotlightItemsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ActionsSpotlightItemsProvider._internal(
        (ref) => create(ref as ActionsSpotlightItemsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        l10n: l10n,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<List<SpotlightItem>> createElement() {
    return _ActionsSpotlightItemsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ActionsSpotlightItemsProvider && other.l10n == l10n;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, l10n.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ActionsSpotlightItemsRef on AutoDisposeProviderRef<List<SpotlightItem>> {
  /// The parameter `l10n` of this provider.
  ElbCoreLocalizations get l10n;
}

class _ActionsSpotlightItemsProviderElement
    extends AutoDisposeProviderElement<List<SpotlightItem>>
    with ActionsSpotlightItemsRef {
  _ActionsSpotlightItemsProviderElement(super.provider);

  @override
  ElbCoreLocalizations get l10n =>
      (origin as ActionsSpotlightItemsProvider).l10n;
}

String _$showSpotlightItemsHash() =>
    r'08c7f86a508928c7bf726455f3e56f8972fb650f';

/// See also [showSpotlightItems].
@ProviderFor(showSpotlightItems)
const showSpotlightItemsProvider = ShowSpotlightItemsFamily();

/// See also [showSpotlightItems].
class ShowSpotlightItemsFamily extends Family<AsyncValue<List<SpotlightItem>>> {
  /// See also [showSpotlightItems].
  const ShowSpotlightItemsFamily();

  /// See also [showSpotlightItems].
  ShowSpotlightItemsProvider call(
    ElbCoreLocalizations l10n,
  ) {
    return ShowSpotlightItemsProvider(
      l10n,
    );
  }

  @override
  ShowSpotlightItemsProvider getProviderOverride(
    covariant ShowSpotlightItemsProvider provider,
  ) {
    return call(
      provider.l10n,
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
  String? get name => r'showSpotlightItemsProvider';
}

/// See also [showSpotlightItems].
class ShowSpotlightItemsProvider
    extends AutoDisposeFutureProvider<List<SpotlightItem>> {
  /// See also [showSpotlightItems].
  ShowSpotlightItemsProvider(
    ElbCoreLocalizations l10n,
  ) : this._internal(
          (ref) => showSpotlightItems(
            ref as ShowSpotlightItemsRef,
            l10n,
          ),
          from: showSpotlightItemsProvider,
          name: r'showSpotlightItemsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$showSpotlightItemsHash,
          dependencies: ShowSpotlightItemsFamily._dependencies,
          allTransitiveDependencies:
              ShowSpotlightItemsFamily._allTransitiveDependencies,
          l10n: l10n,
        );

  ShowSpotlightItemsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.l10n,
  }) : super.internal();

  final ElbCoreLocalizations l10n;

  @override
  Override overrideWith(
    FutureOr<List<SpotlightItem>> Function(ShowSpotlightItemsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ShowSpotlightItemsProvider._internal(
        (ref) => create(ref as ShowSpotlightItemsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        l10n: l10n,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<SpotlightItem>> createElement() {
    return _ShowSpotlightItemsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ShowSpotlightItemsProvider && other.l10n == l10n;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, l10n.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ShowSpotlightItemsRef
    on AutoDisposeFutureProviderRef<List<SpotlightItem>> {
  /// The parameter `l10n` of this provider.
  ElbCoreLocalizations get l10n;
}

class _ShowSpotlightItemsProviderElement
    extends AutoDisposeFutureProviderElement<List<SpotlightItem>>
    with ShowSpotlightItemsRef {
  _ShowSpotlightItemsProviderElement(super.provider);

  @override
  ElbCoreLocalizations get l10n => (origin as ShowSpotlightItemsProvider).l10n;
}

String _$selectedSearchModeHash() =>
    r'8c5a94806c9bef29d994395b0a8bd8acbc2d4c5d';

/// See also [SelectedSearchMode].
@ProviderFor(SelectedSearchMode)
final selectedSearchModeProvider =
    AutoDisposeNotifierProvider<SelectedSearchMode, SearchMode>.internal(
  SelectedSearchMode.new,
  name: r'selectedSearchModeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedSearchModeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedSearchMode = AutoDisposeNotifier<SearchMode>;
String _$searchQueryHash() => r'df15a0773f111ae1641bdf5d6f8595de9b95142c';

/// See also [SearchQuery].
@ProviderFor(SearchQuery)
final searchQueryProvider =
    AutoDisposeNotifierProvider<SearchQuery, String>.internal(
  SearchQuery.new,
  name: r'searchQueryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$searchQueryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchQuery = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
