// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_employee_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$companyEmployeeStateHash() =>
    r'e38cf3545a5486b9356dcf933cffccfa5122d38b';

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

abstract class _$CompanyEmployeeState
    extends BuildlessAutoDisposeAsyncNotifier<CompanyEmployee> {
  late final int entityId;
  late final String sessionId;

  FutureOr<CompanyEmployee> build(
    int entityId,
    String sessionId,
  );
}

/// The State of the current company employee.
///
/// Copied from [CompanyEmployeeState].
@ProviderFor(CompanyEmployeeState)
const companyEmployeeStateProvider = CompanyEmployeeStateFamily();

/// The State of the current company employee.
///
/// Copied from [CompanyEmployeeState].
class CompanyEmployeeStateFamily extends Family<AsyncValue<CompanyEmployee>> {
  /// The State of the current company employee.
  ///
  /// Copied from [CompanyEmployeeState].
  const CompanyEmployeeStateFamily();

  /// The State of the current company employee.
  ///
  /// Copied from [CompanyEmployeeState].
  CompanyEmployeeStateProvider call(
    int entityId,
    String sessionId,
  ) {
    return CompanyEmployeeStateProvider(
      entityId,
      sessionId,
    );
  }

  @override
  CompanyEmployeeStateProvider getProviderOverride(
    covariant CompanyEmployeeStateProvider provider,
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
  String? get name => r'companyEmployeeStateProvider';
}

/// The State of the current company employee.
///
/// Copied from [CompanyEmployeeState].
class CompanyEmployeeStateProvider extends AutoDisposeAsyncNotifierProviderImpl<
    CompanyEmployeeState, CompanyEmployee> {
  /// The State of the current company employee.
  ///
  /// Copied from [CompanyEmployeeState].
  CompanyEmployeeStateProvider(
    int entityId,
    String sessionId,
  ) : this._internal(
          () => CompanyEmployeeState()
            ..entityId = entityId
            ..sessionId = sessionId,
          from: companyEmployeeStateProvider,
          name: r'companyEmployeeStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$companyEmployeeStateHash,
          dependencies: CompanyEmployeeStateFamily._dependencies,
          allTransitiveDependencies:
              CompanyEmployeeStateFamily._allTransitiveDependencies,
          entityId: entityId,
          sessionId: sessionId,
        );

  CompanyEmployeeStateProvider._internal(
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
  FutureOr<CompanyEmployee> runNotifierBuild(
    covariant CompanyEmployeeState notifier,
  ) {
    return notifier.build(
      entityId,
      sessionId,
    );
  }

  @override
  Override overrideWith(CompanyEmployeeState Function() create) {
    return ProviderOverride(
      origin: this,
      override: CompanyEmployeeStateProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<CompanyEmployeeState, CompanyEmployee>
      createElement() {
    return _CompanyEmployeeStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CompanyEmployeeStateProvider &&
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
mixin CompanyEmployeeStateRef
    on AutoDisposeAsyncNotifierProviderRef<CompanyEmployee> {
  /// The parameter `entityId` of this provider.
  int get entityId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _CompanyEmployeeStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CompanyEmployeeState,
        CompanyEmployee> with CompanyEmployeeStateRef {
  _CompanyEmployeeStateProviderElement(super.provider);

  @override
  int get entityId => (origin as CompanyEmployeeStateProvider).entityId;
  @override
  String get sessionId => (origin as CompanyEmployeeStateProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
