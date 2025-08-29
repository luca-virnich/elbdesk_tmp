// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_nutzenlayout_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$singleNutzenLayoutStateHash() =>
    r'bd2a824e5f808c4f7e00131137c803d82b40a0ac';

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

abstract class _$SingleNutzenLayoutState
    extends BuildlessAutoDisposeNotifier<Nutzenlayout> {
  late final String sessionId;

  Nutzenlayout build(
    String sessionId,
  );
}

/// See also [SingleNutzenLayoutState].
@ProviderFor(SingleNutzenLayoutState)
const singleNutzenLayoutStateProvider = SingleNutzenLayoutStateFamily();

/// See also [SingleNutzenLayoutState].
class SingleNutzenLayoutStateFamily extends Family<Nutzenlayout> {
  /// See also [SingleNutzenLayoutState].
  const SingleNutzenLayoutStateFamily();

  /// See also [SingleNutzenLayoutState].
  SingleNutzenLayoutStateProvider call(
    String sessionId,
  ) {
    return SingleNutzenLayoutStateProvider(
      sessionId,
    );
  }

  @override
  SingleNutzenLayoutStateProvider getProviderOverride(
    covariant SingleNutzenLayoutStateProvider provider,
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
  String? get name => r'singleNutzenLayoutStateProvider';
}

/// See also [SingleNutzenLayoutState].
class SingleNutzenLayoutStateProvider extends AutoDisposeNotifierProviderImpl<
    SingleNutzenLayoutState, Nutzenlayout> {
  /// See also [SingleNutzenLayoutState].
  SingleNutzenLayoutStateProvider(
    String sessionId,
  ) : this._internal(
          () => SingleNutzenLayoutState()..sessionId = sessionId,
          from: singleNutzenLayoutStateProvider,
          name: r'singleNutzenLayoutStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$singleNutzenLayoutStateHash,
          dependencies: SingleNutzenLayoutStateFamily._dependencies,
          allTransitiveDependencies:
              SingleNutzenLayoutStateFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  SingleNutzenLayoutStateProvider._internal(
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
  Nutzenlayout runNotifierBuild(
    covariant SingleNutzenLayoutState notifier,
  ) {
    return notifier.build(
      sessionId,
    );
  }

  @override
  Override overrideWith(SingleNutzenLayoutState Function() create) {
    return ProviderOverride(
      origin: this,
      override: SingleNutzenLayoutStateProvider._internal(
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
  AutoDisposeNotifierProviderElement<SingleNutzenLayoutState, Nutzenlayout>
      createElement() {
    return _SingleNutzenLayoutStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SingleNutzenLayoutStateProvider &&
        other.sessionId == sessionId;
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
mixin SingleNutzenLayoutStateRef
    on AutoDisposeNotifierProviderRef<Nutzenlayout> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _SingleNutzenLayoutStateProviderElement
    extends AutoDisposeNotifierProviderElement<SingleNutzenLayoutState,
        Nutzenlayout> with SingleNutzenLayoutStateRef {
  _SingleNutzenLayoutStateProviderElement(super.provider);

  @override
  String get sessionId => (origin as SingleNutzenLayoutStateProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
