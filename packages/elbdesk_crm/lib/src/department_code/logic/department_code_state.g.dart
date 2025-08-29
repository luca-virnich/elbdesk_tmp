// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_code_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$departmentCodeStateHash() =>
    r'd71371d5adec6e9aba276b8702d615897b150959';

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

abstract class _$DepartmentCodeState
    extends BuildlessAutoDisposeAsyncNotifier<DepartmentCode> {
  late final int entityId;
  late final String sessionId;

  FutureOr<DepartmentCode> build(
    int entityId,
    String sessionId,
  );
}

/// See also [DepartmentCodeState].
@ProviderFor(DepartmentCodeState)
const departmentCodeStateProvider = DepartmentCodeStateFamily();

/// See also [DepartmentCodeState].
class DepartmentCodeStateFamily extends Family<AsyncValue<DepartmentCode>> {
  /// See also [DepartmentCodeState].
  const DepartmentCodeStateFamily();

  /// See also [DepartmentCodeState].
  DepartmentCodeStateProvider call(
    int entityId,
    String sessionId,
  ) {
    return DepartmentCodeStateProvider(
      entityId,
      sessionId,
    );
  }

  @override
  DepartmentCodeStateProvider getProviderOverride(
    covariant DepartmentCodeStateProvider provider,
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
  String? get name => r'departmentCodeStateProvider';
}

/// See also [DepartmentCodeState].
class DepartmentCodeStateProvider extends AutoDisposeAsyncNotifierProviderImpl<
    DepartmentCodeState, DepartmentCode> {
  /// See also [DepartmentCodeState].
  DepartmentCodeStateProvider(
    int entityId,
    String sessionId,
  ) : this._internal(
          () => DepartmentCodeState()
            ..entityId = entityId
            ..sessionId = sessionId,
          from: departmentCodeStateProvider,
          name: r'departmentCodeStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$departmentCodeStateHash,
          dependencies: DepartmentCodeStateFamily._dependencies,
          allTransitiveDependencies:
              DepartmentCodeStateFamily._allTransitiveDependencies,
          entityId: entityId,
          sessionId: sessionId,
        );

  DepartmentCodeStateProvider._internal(
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
  FutureOr<DepartmentCode> runNotifierBuild(
    covariant DepartmentCodeState notifier,
  ) {
    return notifier.build(
      entityId,
      sessionId,
    );
  }

  @override
  Override overrideWith(DepartmentCodeState Function() create) {
    return ProviderOverride(
      origin: this,
      override: DepartmentCodeStateProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<DepartmentCodeState, DepartmentCode>
      createElement() {
    return _DepartmentCodeStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DepartmentCodeStateProvider &&
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
mixin DepartmentCodeStateRef
    on AutoDisposeAsyncNotifierProviderRef<DepartmentCode> {
  /// The parameter `entityId` of this provider.
  int get entityId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _DepartmentCodeStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<DepartmentCodeState,
        DepartmentCode> with DepartmentCodeStateRef {
  _DepartmentCodeStateProviderElement(super.provider);

  @override
  int get entityId => (origin as DepartmentCodeStateProvider).entityId;
  @override
  String get sessionId => (origin as DepartmentCodeStateProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
