// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drucklayout_selection_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$drucklayoutSelectionStateHash() =>
    r'56ee0232bc1deca0297b994131c01d8d09506b4b';

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

abstract class _$DrucklayoutSelectionState
    extends BuildlessAutoDisposeAsyncNotifier<DrucklayoutSelection> {
  late final int entityId;
  late final String sessionId;

  FutureOr<DrucklayoutSelection> build(
    int entityId,
    String sessionId,
  );
}

/// See also [DrucklayoutSelectionState].
@ProviderFor(DrucklayoutSelectionState)
const drucklayoutSelectionStateProvider = DrucklayoutSelectionStateFamily();

/// See also [DrucklayoutSelectionState].
class DrucklayoutSelectionStateFamily
    extends Family<AsyncValue<DrucklayoutSelection>> {
  /// See also [DrucklayoutSelectionState].
  const DrucklayoutSelectionStateFamily();

  /// See also [DrucklayoutSelectionState].
  DrucklayoutSelectionStateProvider call(
    int entityId,
    String sessionId,
  ) {
    return DrucklayoutSelectionStateProvider(
      entityId,
      sessionId,
    );
  }

  @override
  DrucklayoutSelectionStateProvider getProviderOverride(
    covariant DrucklayoutSelectionStateProvider provider,
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
  String? get name => r'drucklayoutSelectionStateProvider';
}

/// See also [DrucklayoutSelectionState].
class DrucklayoutSelectionStateProvider
    extends AutoDisposeAsyncNotifierProviderImpl<DrucklayoutSelectionState,
        DrucklayoutSelection> {
  /// See also [DrucklayoutSelectionState].
  DrucklayoutSelectionStateProvider(
    int entityId,
    String sessionId,
  ) : this._internal(
          () => DrucklayoutSelectionState()
            ..entityId = entityId
            ..sessionId = sessionId,
          from: drucklayoutSelectionStateProvider,
          name: r'drucklayoutSelectionStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$drucklayoutSelectionStateHash,
          dependencies: DrucklayoutSelectionStateFamily._dependencies,
          allTransitiveDependencies:
              DrucklayoutSelectionStateFamily._allTransitiveDependencies,
          entityId: entityId,
          sessionId: sessionId,
        );

  DrucklayoutSelectionStateProvider._internal(
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
  FutureOr<DrucklayoutSelection> runNotifierBuild(
    covariant DrucklayoutSelectionState notifier,
  ) {
    return notifier.build(
      entityId,
      sessionId,
    );
  }

  @override
  Override overrideWith(DrucklayoutSelectionState Function() create) {
    return ProviderOverride(
      origin: this,
      override: DrucklayoutSelectionStateProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<DrucklayoutSelectionState,
      DrucklayoutSelection> createElement() {
    return _DrucklayoutSelectionStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DrucklayoutSelectionStateProvider &&
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
mixin DrucklayoutSelectionStateRef
    on AutoDisposeAsyncNotifierProviderRef<DrucklayoutSelection> {
  /// The parameter `entityId` of this provider.
  int get entityId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _DrucklayoutSelectionStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<DrucklayoutSelectionState,
        DrucklayoutSelection> with DrucklayoutSelectionStateRef {
  _DrucklayoutSelectionStateProviderElement(super.provider);

  @override
  int get entityId => (origin as DrucklayoutSelectionStateProvider).entityId;
  @override
  String get sessionId =>
      (origin as DrucklayoutSelectionStateProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
