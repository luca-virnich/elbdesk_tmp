// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_department_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$companyDepartmentStateHash() =>
    r'9949e28a0dd9cc4bb797e4945c5bc7b396799bb2';

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

abstract class _$CompanyDepartmentState
    extends BuildlessAutoDisposeAsyncNotifier<CompanyDepartment> {
  late final int entityId;
  late final String sessionId;

  FutureOr<CompanyDepartment> build(
    int entityId,
    String sessionId,
  );
}

/// CompanyDepartment State
///
/// This state is used to manage and update the company_department details
///
/// Copied from [CompanyDepartmentState].
@ProviderFor(CompanyDepartmentState)
const companyDepartmentStateProvider = CompanyDepartmentStateFamily();

/// CompanyDepartment State
///
/// This state is used to manage and update the company_department details
///
/// Copied from [CompanyDepartmentState].
class CompanyDepartmentStateFamily
    extends Family<AsyncValue<CompanyDepartment>> {
  /// CompanyDepartment State
  ///
  /// This state is used to manage and update the company_department details
  ///
  /// Copied from [CompanyDepartmentState].
  const CompanyDepartmentStateFamily();

  /// CompanyDepartment State
  ///
  /// This state is used to manage and update the company_department details
  ///
  /// Copied from [CompanyDepartmentState].
  CompanyDepartmentStateProvider call(
    int entityId,
    String sessionId,
  ) {
    return CompanyDepartmentStateProvider(
      entityId,
      sessionId,
    );
  }

  @override
  CompanyDepartmentStateProvider getProviderOverride(
    covariant CompanyDepartmentStateProvider provider,
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
  String? get name => r'companyDepartmentStateProvider';
}

/// CompanyDepartment State
///
/// This state is used to manage and update the company_department details
///
/// Copied from [CompanyDepartmentState].
class CompanyDepartmentStateProvider
    extends AutoDisposeAsyncNotifierProviderImpl<CompanyDepartmentState,
        CompanyDepartment> {
  /// CompanyDepartment State
  ///
  /// This state is used to manage and update the company_department details
  ///
  /// Copied from [CompanyDepartmentState].
  CompanyDepartmentStateProvider(
    int entityId,
    String sessionId,
  ) : this._internal(
          () => CompanyDepartmentState()
            ..entityId = entityId
            ..sessionId = sessionId,
          from: companyDepartmentStateProvider,
          name: r'companyDepartmentStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$companyDepartmentStateHash,
          dependencies: CompanyDepartmentStateFamily._dependencies,
          allTransitiveDependencies:
              CompanyDepartmentStateFamily._allTransitiveDependencies,
          entityId: entityId,
          sessionId: sessionId,
        );

  CompanyDepartmentStateProvider._internal(
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
  FutureOr<CompanyDepartment> runNotifierBuild(
    covariant CompanyDepartmentState notifier,
  ) {
    return notifier.build(
      entityId,
      sessionId,
    );
  }

  @override
  Override overrideWith(CompanyDepartmentState Function() create) {
    return ProviderOverride(
      origin: this,
      override: CompanyDepartmentStateProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<CompanyDepartmentState,
      CompanyDepartment> createElement() {
    return _CompanyDepartmentStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CompanyDepartmentStateProvider &&
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
mixin CompanyDepartmentStateRef
    on AutoDisposeAsyncNotifierProviderRef<CompanyDepartment> {
  /// The parameter `entityId` of this provider.
  int get entityId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _CompanyDepartmentStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CompanyDepartmentState,
        CompanyDepartment> with CompanyDepartmentStateRef {
  _CompanyDepartmentStateProviderElement(super.provider);

  @override
  int get entityId => (origin as CompanyDepartmentStateProvider).entityId;
  @override
  String get sessionId => (origin as CompanyDepartmentStateProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
