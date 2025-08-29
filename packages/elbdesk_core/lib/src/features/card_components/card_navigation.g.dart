// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_navigation.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cardNavigationExpandedStateHash() =>
    r'a8c42efbad51889ca08f1de12024fca775d0b94b';

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

abstract class _$CardNavigationExpandedState
    extends BuildlessAutoDisposeNotifier<bool> {
  late final String floatingWindowId;

  bool build(
    String floatingWindowId,
  );
}

/// See also [CardNavigationExpandedState].
@ProviderFor(CardNavigationExpandedState)
const cardNavigationExpandedStateProvider = CardNavigationExpandedStateFamily();

/// See also [CardNavigationExpandedState].
class CardNavigationExpandedStateFamily extends Family<bool> {
  /// See also [CardNavigationExpandedState].
  const CardNavigationExpandedStateFamily();

  /// See also [CardNavigationExpandedState].
  CardNavigationExpandedStateProvider call(
    String floatingWindowId,
  ) {
    return CardNavigationExpandedStateProvider(
      floatingWindowId,
    );
  }

  @override
  CardNavigationExpandedStateProvider getProviderOverride(
    covariant CardNavigationExpandedStateProvider provider,
  ) {
    return call(
      provider.floatingWindowId,
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
  String? get name => r'cardNavigationExpandedStateProvider';
}

/// See also [CardNavigationExpandedState].
class CardNavigationExpandedStateProvider
    extends AutoDisposeNotifierProviderImpl<CardNavigationExpandedState, bool> {
  /// See also [CardNavigationExpandedState].
  CardNavigationExpandedStateProvider(
    String floatingWindowId,
  ) : this._internal(
          () => CardNavigationExpandedState()
            ..floatingWindowId = floatingWindowId,
          from: cardNavigationExpandedStateProvider,
          name: r'cardNavigationExpandedStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$cardNavigationExpandedStateHash,
          dependencies: CardNavigationExpandedStateFamily._dependencies,
          allTransitiveDependencies:
              CardNavigationExpandedStateFamily._allTransitiveDependencies,
          floatingWindowId: floatingWindowId,
        );

  CardNavigationExpandedStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.floatingWindowId,
  }) : super.internal();

  final String floatingWindowId;

  @override
  bool runNotifierBuild(
    covariant CardNavigationExpandedState notifier,
  ) {
    return notifier.build(
      floatingWindowId,
    );
  }

  @override
  Override overrideWith(CardNavigationExpandedState Function() create) {
    return ProviderOverride(
      origin: this,
      override: CardNavigationExpandedStateProvider._internal(
        () => create()..floatingWindowId = floatingWindowId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        floatingWindowId: floatingWindowId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CardNavigationExpandedState, bool>
      createElement() {
    return _CardNavigationExpandedStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CardNavigationExpandedStateProvider &&
        other.floatingWindowId == floatingWindowId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, floatingWindowId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CardNavigationExpandedStateRef on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `floatingWindowId` of this provider.
  String get floatingWindowId;
}

class _CardNavigationExpandedStateProviderElement
    extends AutoDisposeNotifierProviderElement<CardNavigationExpandedState,
        bool> with CardNavigationExpandedStateRef {
  _CardNavigationExpandedStateProviderElement(super.provider);

  @override
  String get floatingWindowId =>
      (origin as CardNavigationExpandedStateProvider).floatingWindowId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
