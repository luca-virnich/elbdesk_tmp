// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_nutzenlayout_metrics_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$singleNutzenLayoutMetricsStateHash() =>
    r'cabbdccea406a80fe0e2f505403ec3caff5376d7';

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

abstract class _$SingleNutzenLayoutMetricsState
    extends BuildlessAutoDisposeNotifier<NutzenlayoutMetrics> {
  late final String sessionId;

  NutzenlayoutMetrics build(
    String sessionId,
  );
}

/// See also [SingleNutzenLayoutMetricsState].
@ProviderFor(SingleNutzenLayoutMetricsState)
const singleNutzenLayoutMetricsStateProvider =
    SingleNutzenLayoutMetricsStateFamily();

/// See also [SingleNutzenLayoutMetricsState].
class SingleNutzenLayoutMetricsStateFamily extends Family<NutzenlayoutMetrics> {
  /// See also [SingleNutzenLayoutMetricsState].
  const SingleNutzenLayoutMetricsStateFamily();

  /// See also [SingleNutzenLayoutMetricsState].
  SingleNutzenLayoutMetricsStateProvider call(
    String sessionId,
  ) {
    return SingleNutzenLayoutMetricsStateProvider(
      sessionId,
    );
  }

  @override
  SingleNutzenLayoutMetricsStateProvider getProviderOverride(
    covariant SingleNutzenLayoutMetricsStateProvider provider,
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
  String? get name => r'singleNutzenLayoutMetricsStateProvider';
}

/// See also [SingleNutzenLayoutMetricsState].
class SingleNutzenLayoutMetricsStateProvider
    extends AutoDisposeNotifierProviderImpl<SingleNutzenLayoutMetricsState,
        NutzenlayoutMetrics> {
  /// See also [SingleNutzenLayoutMetricsState].
  SingleNutzenLayoutMetricsStateProvider(
    String sessionId,
  ) : this._internal(
          () => SingleNutzenLayoutMetricsState()..sessionId = sessionId,
          from: singleNutzenLayoutMetricsStateProvider,
          name: r'singleNutzenLayoutMetricsStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$singleNutzenLayoutMetricsStateHash,
          dependencies: SingleNutzenLayoutMetricsStateFamily._dependencies,
          allTransitiveDependencies:
              SingleNutzenLayoutMetricsStateFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  SingleNutzenLayoutMetricsStateProvider._internal(
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
  NutzenlayoutMetrics runNotifierBuild(
    covariant SingleNutzenLayoutMetricsState notifier,
  ) {
    return notifier.build(
      sessionId,
    );
  }

  @override
  Override overrideWith(SingleNutzenLayoutMetricsState Function() create) {
    return ProviderOverride(
      origin: this,
      override: SingleNutzenLayoutMetricsStateProvider._internal(
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
  AutoDisposeNotifierProviderElement<SingleNutzenLayoutMetricsState,
      NutzenlayoutMetrics> createElement() {
    return _SingleNutzenLayoutMetricsStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SingleNutzenLayoutMetricsStateProvider &&
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
mixin SingleNutzenLayoutMetricsStateRef
    on AutoDisposeNotifierProviderRef<NutzenlayoutMetrics> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _SingleNutzenLayoutMetricsStateProviderElement
    extends AutoDisposeNotifierProviderElement<SingleNutzenLayoutMetricsState,
        NutzenlayoutMetrics> with SingleNutzenLayoutMetricsStateRef {
  _SingleNutzenLayoutMetricsStateProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as SingleNutzenLayoutMetricsStateProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
