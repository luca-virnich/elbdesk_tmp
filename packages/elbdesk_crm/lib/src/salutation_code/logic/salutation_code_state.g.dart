// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salutation_code_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$salutationCodeStateHash() =>
    r'033f3a70e1b7e321983a0fb91327220029a00f6f';

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

abstract class _$SalutationCodeState
    extends BuildlessAutoDisposeAsyncNotifier<SalutationCode> {
  late final int entityId;
  late final String sessionId;

  FutureOr<SalutationCode> build(
    int entityId,
    String sessionId,
  );
}

/// The State of the current salutation code.
///
/// Copied from [SalutationCodeState].
@ProviderFor(SalutationCodeState)
const salutationCodeStateProvider = SalutationCodeStateFamily();

/// The State of the current salutation code.
///
/// Copied from [SalutationCodeState].
class SalutationCodeStateFamily extends Family<AsyncValue<SalutationCode>> {
  /// The State of the current salutation code.
  ///
  /// Copied from [SalutationCodeState].
  const SalutationCodeStateFamily();

  /// The State of the current salutation code.
  ///
  /// Copied from [SalutationCodeState].
  SalutationCodeStateProvider call(
    int entityId,
    String sessionId,
  ) {
    return SalutationCodeStateProvider(
      entityId,
      sessionId,
    );
  }

  @override
  SalutationCodeStateProvider getProviderOverride(
    covariant SalutationCodeStateProvider provider,
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
  String? get name => r'salutationCodeStateProvider';
}

/// The State of the current salutation code.
///
/// Copied from [SalutationCodeState].
class SalutationCodeStateProvider extends AutoDisposeAsyncNotifierProviderImpl<
    SalutationCodeState, SalutationCode> {
  /// The State of the current salutation code.
  ///
  /// Copied from [SalutationCodeState].
  SalutationCodeStateProvider(
    int entityId,
    String sessionId,
  ) : this._internal(
          () => SalutationCodeState()
            ..entityId = entityId
            ..sessionId = sessionId,
          from: salutationCodeStateProvider,
          name: r'salutationCodeStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$salutationCodeStateHash,
          dependencies: SalutationCodeStateFamily._dependencies,
          allTransitiveDependencies:
              SalutationCodeStateFamily._allTransitiveDependencies,
          entityId: entityId,
          sessionId: sessionId,
        );

  SalutationCodeStateProvider._internal(
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
  FutureOr<SalutationCode> runNotifierBuild(
    covariant SalutationCodeState notifier,
  ) {
    return notifier.build(
      entityId,
      sessionId,
    );
  }

  @override
  Override overrideWith(SalutationCodeState Function() create) {
    return ProviderOverride(
      origin: this,
      override: SalutationCodeStateProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<SalutationCodeState, SalutationCode>
      createElement() {
    return _SalutationCodeStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SalutationCodeStateProvider &&
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
mixin SalutationCodeStateRef
    on AutoDisposeAsyncNotifierProviderRef<SalutationCode> {
  /// The parameter `entityId` of this provider.
  int get entityId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _SalutationCodeStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SalutationCodeState,
        SalutationCode> with SalutationCodeStateRef {
  _SalutationCodeStateProviderElement(super.provider);

  @override
  int get entityId => (origin as SalutationCodeStateProvider).entityId;
  @override
  String get sessionId => (origin as SalutationCodeStateProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
