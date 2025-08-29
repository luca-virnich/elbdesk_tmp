// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bearer_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bearerStateHash() => r'475e633d845eb4eeca7587bf8bcd53091d1c63eb';

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

abstract class _$BearerState extends BuildlessAutoDisposeAsyncNotifier<Bearer> {
  late final int? id;
  late final String sessionId;

  FutureOr<Bearer> build(
    int? id,
    String sessionId,
  );
}

/// Bearer State
///
/// This state is used to manage and update the bearer details
///
/// Copied from [BearerState].
@ProviderFor(BearerState)
const bearerStateProvider = BearerStateFamily();

/// Bearer State
///
/// This state is used to manage and update the bearer details
///
/// Copied from [BearerState].
class BearerStateFamily extends Family<AsyncValue<Bearer>> {
  /// Bearer State
  ///
  /// This state is used to manage and update the bearer details
  ///
  /// Copied from [BearerState].
  const BearerStateFamily();

  /// Bearer State
  ///
  /// This state is used to manage and update the bearer details
  ///
  /// Copied from [BearerState].
  BearerStateProvider call(
    int? id,
    String sessionId,
  ) {
    return BearerStateProvider(
      id,
      sessionId,
    );
  }

  @override
  BearerStateProvider getProviderOverride(
    covariant BearerStateProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'bearerStateProvider';
}

/// Bearer State
///
/// This state is used to manage and update the bearer details
///
/// Copied from [BearerState].
class BearerStateProvider
    extends AutoDisposeAsyncNotifierProviderImpl<BearerState, Bearer> {
  /// Bearer State
  ///
  /// This state is used to manage and update the bearer details
  ///
  /// Copied from [BearerState].
  BearerStateProvider(
    int? id,
    String sessionId,
  ) : this._internal(
          () => BearerState()
            ..id = id
            ..sessionId = sessionId,
          from: bearerStateProvider,
          name: r'bearerStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$bearerStateHash,
          dependencies: BearerStateFamily._dependencies,
          allTransitiveDependencies:
              BearerStateFamily._allTransitiveDependencies,
          id: id,
          sessionId: sessionId,
        );

  BearerStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.sessionId,
  }) : super.internal();

  final int? id;
  final String sessionId;

  @override
  FutureOr<Bearer> runNotifierBuild(
    covariant BearerState notifier,
  ) {
    return notifier.build(
      id,
      sessionId,
    );
  }

  @override
  Override overrideWith(BearerState Function() create) {
    return ProviderOverride(
      origin: this,
      override: BearerStateProvider._internal(
        () => create()
          ..id = id
          ..sessionId = sessionId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<BearerState, Bearer> createElement() {
    return _BearerStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BearerStateProvider &&
        other.id == id &&
        other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin BearerStateRef on AutoDisposeAsyncNotifierProviderRef<Bearer> {
  /// The parameter `id` of this provider.
  int? get id;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _BearerStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<BearerState, Bearer>
    with BearerStateRef {
  _BearerStateProviderElement(super.provider);

  @override
  int? get id => (origin as BearerStateProvider).id;
  @override
  String get sessionId => (origin as BearerStateProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
