// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floating_window_reset_position_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$floatingWindowResetPositionHash() =>
    r'fdc272f04c2fec57fe1160818cd5f737a2e5ffb1';

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

abstract class _$FloatingWindowResetPosition
    extends BuildlessAutoDisposeNotifier<bool> {
  late final String windowId;

  bool build(
    String windowId,
  );
}

/// See also [FloatingWindowResetPosition].
@ProviderFor(FloatingWindowResetPosition)
const floatingWindowResetPositionProvider = FloatingWindowResetPositionFamily();

/// See also [FloatingWindowResetPosition].
class FloatingWindowResetPositionFamily extends Family<bool> {
  /// See also [FloatingWindowResetPosition].
  const FloatingWindowResetPositionFamily();

  /// See also [FloatingWindowResetPosition].
  FloatingWindowResetPositionProvider call(
    String windowId,
  ) {
    return FloatingWindowResetPositionProvider(
      windowId,
    );
  }

  @override
  FloatingWindowResetPositionProvider getProviderOverride(
    covariant FloatingWindowResetPositionProvider provider,
  ) {
    return call(
      provider.windowId,
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
  String? get name => r'floatingWindowResetPositionProvider';
}

/// See also [FloatingWindowResetPosition].
class FloatingWindowResetPositionProvider
    extends AutoDisposeNotifierProviderImpl<FloatingWindowResetPosition, bool> {
  /// See also [FloatingWindowResetPosition].
  FloatingWindowResetPositionProvider(
    String windowId,
  ) : this._internal(
          () => FloatingWindowResetPosition()..windowId = windowId,
          from: floatingWindowResetPositionProvider,
          name: r'floatingWindowResetPositionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$floatingWindowResetPositionHash,
          dependencies: FloatingWindowResetPositionFamily._dependencies,
          allTransitiveDependencies:
              FloatingWindowResetPositionFamily._allTransitiveDependencies,
          windowId: windowId,
        );

  FloatingWindowResetPositionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.windowId,
  }) : super.internal();

  final String windowId;

  @override
  bool runNotifierBuild(
    covariant FloatingWindowResetPosition notifier,
  ) {
    return notifier.build(
      windowId,
    );
  }

  @override
  Override overrideWith(FloatingWindowResetPosition Function() create) {
    return ProviderOverride(
      origin: this,
      override: FloatingWindowResetPositionProvider._internal(
        () => create()..windowId = windowId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        windowId: windowId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<FloatingWindowResetPosition, bool>
      createElement() {
    return _FloatingWindowResetPositionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FloatingWindowResetPositionProvider &&
        other.windowId == windowId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, windowId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FloatingWindowResetPositionRef on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `windowId` of this provider.
  String get windowId;
}

class _FloatingWindowResetPositionProviderElement
    extends AutoDisposeNotifierProviderElement<FloatingWindowResetPosition,
        bool> with FloatingWindowResetPositionRef {
  _FloatingWindowResetPositionProviderElement(super.provider);

  @override
  String get windowId =>
      (origin as FloatingWindowResetPositionProvider).windowId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
