// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'next_text_form_field.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$validationGroupHash() => r'395ff0c7d11e4c2deab3f3fc7a833908125f17dc';

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

abstract class _$ValidationGroup
    extends BuildlessAutoDisposeNotifier<List<String>> {
  late final String groupId;

  List<String> build(
    String groupId,
  );
}

/// Validation group for the entire App
///
/// Copied from [ValidationGroup].
@ProviderFor(ValidationGroup)
const validationGroupProvider = ValidationGroupFamily();

/// Validation group for the entire App
///
/// Copied from [ValidationGroup].
class ValidationGroupFamily extends Family<List<String>> {
  /// Validation group for the entire App
  ///
  /// Copied from [ValidationGroup].
  const ValidationGroupFamily();

  /// Validation group for the entire App
  ///
  /// Copied from [ValidationGroup].
  ValidationGroupProvider call(
    String groupId,
  ) {
    return ValidationGroupProvider(
      groupId,
    );
  }

  @override
  ValidationGroupProvider getProviderOverride(
    covariant ValidationGroupProvider provider,
  ) {
    return call(
      provider.groupId,
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
  String? get name => r'validationGroupProvider';
}

/// Validation group for the entire App
///
/// Copied from [ValidationGroup].
class ValidationGroupProvider
    extends AutoDisposeNotifierProviderImpl<ValidationGroup, List<String>> {
  /// Validation group for the entire App
  ///
  /// Copied from [ValidationGroup].
  ValidationGroupProvider(
    String groupId,
  ) : this._internal(
          () => ValidationGroup()..groupId = groupId,
          from: validationGroupProvider,
          name: r'validationGroupProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$validationGroupHash,
          dependencies: ValidationGroupFamily._dependencies,
          allTransitiveDependencies:
              ValidationGroupFamily._allTransitiveDependencies,
          groupId: groupId,
        );

  ValidationGroupProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.groupId,
  }) : super.internal();

  final String groupId;

  @override
  List<String> runNotifierBuild(
    covariant ValidationGroup notifier,
  ) {
    return notifier.build(
      groupId,
    );
  }

  @override
  Override overrideWith(ValidationGroup Function() create) {
    return ProviderOverride(
      origin: this,
      override: ValidationGroupProvider._internal(
        () => create()..groupId = groupId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        groupId: groupId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ValidationGroup, List<String>>
      createElement() {
    return _ValidationGroupProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ValidationGroupProvider && other.groupId == groupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ValidationGroupRef on AutoDisposeNotifierProviderRef<List<String>> {
  /// The parameter `groupId` of this provider.
  String get groupId;
}

class _ValidationGroupProviderElement
    extends AutoDisposeNotifierProviderElement<ValidationGroup, List<String>>
    with ValidationGroupRef {
  _ValidationGroupProviderElement(super.provider);

  @override
  String get groupId => (origin as ValidationGroupProvider).groupId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
