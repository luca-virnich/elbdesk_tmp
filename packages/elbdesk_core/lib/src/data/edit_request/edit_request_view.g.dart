// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_request_view.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dataHasUpdatesHash() => r'51f1c4f3ed47041846a2b9725fc2563b55a7ae4f';

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

abstract class _$DataHasUpdates extends BuildlessAutoDisposeNotifier<bool> {
  late final String sessionId;

  bool build(
    String sessionId,
  );
}

/// See also [DataHasUpdates].
@ProviderFor(DataHasUpdates)
const dataHasUpdatesProvider = DataHasUpdatesFamily();

/// See also [DataHasUpdates].
class DataHasUpdatesFamily extends Family<bool> {
  /// See also [DataHasUpdates].
  const DataHasUpdatesFamily();

  /// See also [DataHasUpdates].
  DataHasUpdatesProvider call(
    String sessionId,
  ) {
    return DataHasUpdatesProvider(
      sessionId,
    );
  }

  @override
  DataHasUpdatesProvider getProviderOverride(
    covariant DataHasUpdatesProvider provider,
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
  String? get name => r'dataHasUpdatesProvider';
}

/// See also [DataHasUpdates].
class DataHasUpdatesProvider
    extends AutoDisposeNotifierProviderImpl<DataHasUpdates, bool> {
  /// See also [DataHasUpdates].
  DataHasUpdatesProvider(
    String sessionId,
  ) : this._internal(
          () => DataHasUpdates()..sessionId = sessionId,
          from: dataHasUpdatesProvider,
          name: r'dataHasUpdatesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dataHasUpdatesHash,
          dependencies: DataHasUpdatesFamily._dependencies,
          allTransitiveDependencies:
              DataHasUpdatesFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  DataHasUpdatesProvider._internal(
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
  bool runNotifierBuild(
    covariant DataHasUpdates notifier,
  ) {
    return notifier.build(
      sessionId,
    );
  }

  @override
  Override overrideWith(DataHasUpdates Function() create) {
    return ProviderOverride(
      origin: this,
      override: DataHasUpdatesProvider._internal(
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
  AutoDisposeNotifierProviderElement<DataHasUpdates, bool> createElement() {
    return _DataHasUpdatesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DataHasUpdatesProvider && other.sessionId == sessionId;
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
mixin DataHasUpdatesRef on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _DataHasUpdatesProviderElement
    extends AutoDisposeNotifierProviderElement<DataHasUpdates, bool>
    with DataHasUpdatesRef {
  _DataHasUpdatesProviderElement(super.provider);

  @override
  String get sessionId => (origin as DataHasUpdatesProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
