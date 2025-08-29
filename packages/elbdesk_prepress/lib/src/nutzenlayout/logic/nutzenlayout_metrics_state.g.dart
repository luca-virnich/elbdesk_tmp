// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutzenlayout_metrics_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$nutzenLayoutMetricsStateHash() =>
    r'd78978aec9a76002fd42a8add9cb85e3c9bedb98';

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

abstract class _$NutzenLayoutMetricsState
    extends BuildlessAutoDisposeNotifier<NutzenlayoutMetrics> {
  late final String sessionId;

  NutzenlayoutMetrics build(
    String sessionId,
  );
}

/// See also [NutzenLayoutMetricsState].
@ProviderFor(NutzenLayoutMetricsState)
const nutzenLayoutMetricsStateProvider = NutzenLayoutMetricsStateFamily();

/// See also [NutzenLayoutMetricsState].
class NutzenLayoutMetricsStateFamily extends Family<NutzenlayoutMetrics> {
  /// See also [NutzenLayoutMetricsState].
  const NutzenLayoutMetricsStateFamily();

  /// See also [NutzenLayoutMetricsState].
  NutzenLayoutMetricsStateProvider call(
    String sessionId,
  ) {
    return NutzenLayoutMetricsStateProvider(
      sessionId,
    );
  }

  @override
  NutzenLayoutMetricsStateProvider getProviderOverride(
    covariant NutzenLayoutMetricsStateProvider provider,
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
  String? get name => r'nutzenLayoutMetricsStateProvider';
}

/// See also [NutzenLayoutMetricsState].
class NutzenLayoutMetricsStateProvider extends AutoDisposeNotifierProviderImpl<
    NutzenLayoutMetricsState, NutzenlayoutMetrics> {
  /// See also [NutzenLayoutMetricsState].
  NutzenLayoutMetricsStateProvider(
    String sessionId,
  ) : this._internal(
          () => NutzenLayoutMetricsState()..sessionId = sessionId,
          from: nutzenLayoutMetricsStateProvider,
          name: r'nutzenLayoutMetricsStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$nutzenLayoutMetricsStateHash,
          dependencies: NutzenLayoutMetricsStateFamily._dependencies,
          allTransitiveDependencies:
              NutzenLayoutMetricsStateFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  NutzenLayoutMetricsStateProvider._internal(
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
    covariant NutzenLayoutMetricsState notifier,
  ) {
    return notifier.build(
      sessionId,
    );
  }

  @override
  Override overrideWith(NutzenLayoutMetricsState Function() create) {
    return ProviderOverride(
      origin: this,
      override: NutzenLayoutMetricsStateProvider._internal(
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
  AutoDisposeNotifierProviderElement<NutzenLayoutMetricsState,
      NutzenlayoutMetrics> createElement() {
    return _NutzenLayoutMetricsStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NutzenLayoutMetricsStateProvider &&
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
mixin NutzenLayoutMetricsStateRef
    on AutoDisposeNotifierProviderRef<NutzenlayoutMetrics> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _NutzenLayoutMetricsStateProviderElement
    extends AutoDisposeNotifierProviderElement<NutzenLayoutMetricsState,
        NutzenlayoutMetrics> with NutzenLayoutMetricsStateRef {
  _NutzenLayoutMetricsStateProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as NutzenLayoutMetricsStateProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
