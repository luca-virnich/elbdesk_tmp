// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field_suggestions_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fieldSuggestionsControllerHash() =>
    r'd1c864e03c1a86e87ddd73e232f9b17d08edc34c';

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

abstract class _$FieldSuggestionsController
    extends BuildlessAutoDisposeAsyncNotifier<List<String>> {
  late final String tableType;
  late final String fieldKey;

  FutureOr<List<String>> build(
    String tableType,
    String fieldKey,
  );
}

/// Controller for field suggestions that handles search term updates with debouncing.
///
/// Copied from [FieldSuggestionsController].
@ProviderFor(FieldSuggestionsController)
const fieldSuggestionsControllerProvider = FieldSuggestionsControllerFamily();

/// Controller for field suggestions that handles search term updates with debouncing.
///
/// Copied from [FieldSuggestionsController].
class FieldSuggestionsControllerFamily
    extends Family<AsyncValue<List<String>>> {
  /// Controller for field suggestions that handles search term updates with debouncing.
  ///
  /// Copied from [FieldSuggestionsController].
  const FieldSuggestionsControllerFamily();

  /// Controller for field suggestions that handles search term updates with debouncing.
  ///
  /// Copied from [FieldSuggestionsController].
  FieldSuggestionsControllerProvider call(
    String tableType,
    String fieldKey,
  ) {
    return FieldSuggestionsControllerProvider(
      tableType,
      fieldKey,
    );
  }

  @override
  FieldSuggestionsControllerProvider getProviderOverride(
    covariant FieldSuggestionsControllerProvider provider,
  ) {
    return call(
      provider.tableType,
      provider.fieldKey,
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
  String? get name => r'fieldSuggestionsControllerProvider';
}

/// Controller for field suggestions that handles search term updates with debouncing.
///
/// Copied from [FieldSuggestionsController].
class FieldSuggestionsControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<FieldSuggestionsController,
        List<String>> {
  /// Controller for field suggestions that handles search term updates with debouncing.
  ///
  /// Copied from [FieldSuggestionsController].
  FieldSuggestionsControllerProvider(
    String tableType,
    String fieldKey,
  ) : this._internal(
          () => FieldSuggestionsController()
            ..tableType = tableType
            ..fieldKey = fieldKey,
          from: fieldSuggestionsControllerProvider,
          name: r'fieldSuggestionsControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fieldSuggestionsControllerHash,
          dependencies: FieldSuggestionsControllerFamily._dependencies,
          allTransitiveDependencies:
              FieldSuggestionsControllerFamily._allTransitiveDependencies,
          tableType: tableType,
          fieldKey: fieldKey,
        );

  FieldSuggestionsControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tableType,
    required this.fieldKey,
  }) : super.internal();

  final String tableType;
  final String fieldKey;

  @override
  FutureOr<List<String>> runNotifierBuild(
    covariant FieldSuggestionsController notifier,
  ) {
    return notifier.build(
      tableType,
      fieldKey,
    );
  }

  @override
  Override overrideWith(FieldSuggestionsController Function() create) {
    return ProviderOverride(
      origin: this,
      override: FieldSuggestionsControllerProvider._internal(
        () => create()
          ..tableType = tableType
          ..fieldKey = fieldKey,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tableType: tableType,
        fieldKey: fieldKey,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<FieldSuggestionsController,
      List<String>> createElement() {
    return _FieldSuggestionsControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FieldSuggestionsControllerProvider &&
        other.tableType == tableType &&
        other.fieldKey == fieldKey;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tableType.hashCode);
    hash = _SystemHash.combine(hash, fieldKey.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FieldSuggestionsControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<String>> {
  /// The parameter `tableType` of this provider.
  String get tableType;

  /// The parameter `fieldKey` of this provider.
  String get fieldKey;
}

class _FieldSuggestionsControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<FieldSuggestionsController,
        List<String>> with FieldSuggestionsControllerRef {
  _FieldSuggestionsControllerProviderElement(super.provider);

  @override
  String get tableType =>
      (origin as FieldSuggestionsControllerProvider).tableType;
  @override
  String get fieldKey =>
      (origin as FieldSuggestionsControllerProvider).fieldKey;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
