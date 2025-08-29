// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floating_window_remove_from_taskbar_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$floatingWindowRemoveFromTaskbarStateHash() =>
    r'5eb17e8e4efb03018f76656962e0aa3e4bf05ffe';

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

abstract class _$FloatingWindowRemoveFromTaskbarState
    extends BuildlessAutoDisposeNotifier<bool> {
  late final String? windowId;

  bool build(
    String? windowId,
  );
}

/// See also [FloatingWindowRemoveFromTaskbarState].
@ProviderFor(FloatingWindowRemoveFromTaskbarState)
const floatingWindowRemoveFromTaskbarStateProvider =
    FloatingWindowRemoveFromTaskbarStateFamily();

/// See also [FloatingWindowRemoveFromTaskbarState].
class FloatingWindowRemoveFromTaskbarStateFamily extends Family<bool> {
  /// See also [FloatingWindowRemoveFromTaskbarState].
  const FloatingWindowRemoveFromTaskbarStateFamily();

  /// See also [FloatingWindowRemoveFromTaskbarState].
  FloatingWindowRemoveFromTaskbarStateProvider call(
    String? windowId,
  ) {
    return FloatingWindowRemoveFromTaskbarStateProvider(
      windowId,
    );
  }

  @override
  FloatingWindowRemoveFromTaskbarStateProvider getProviderOverride(
    covariant FloatingWindowRemoveFromTaskbarStateProvider provider,
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
  String? get name => r'floatingWindowRemoveFromTaskbarStateProvider';
}

/// See also [FloatingWindowRemoveFromTaskbarState].
class FloatingWindowRemoveFromTaskbarStateProvider
    extends AutoDisposeNotifierProviderImpl<
        FloatingWindowRemoveFromTaskbarState, bool> {
  /// See also [FloatingWindowRemoveFromTaskbarState].
  FloatingWindowRemoveFromTaskbarStateProvider(
    String? windowId,
  ) : this._internal(
          () => FloatingWindowRemoveFromTaskbarState()..windowId = windowId,
          from: floatingWindowRemoveFromTaskbarStateProvider,
          name: r'floatingWindowRemoveFromTaskbarStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$floatingWindowRemoveFromTaskbarStateHash,
          dependencies:
              FloatingWindowRemoveFromTaskbarStateFamily._dependencies,
          allTransitiveDependencies: FloatingWindowRemoveFromTaskbarStateFamily
              ._allTransitiveDependencies,
          windowId: windowId,
        );

  FloatingWindowRemoveFromTaskbarStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.windowId,
  }) : super.internal();

  final String? windowId;

  @override
  bool runNotifierBuild(
    covariant FloatingWindowRemoveFromTaskbarState notifier,
  ) {
    return notifier.build(
      windowId,
    );
  }

  @override
  Override overrideWith(
      FloatingWindowRemoveFromTaskbarState Function() create) {
    return ProviderOverride(
      origin: this,
      override: FloatingWindowRemoveFromTaskbarStateProvider._internal(
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
  AutoDisposeNotifierProviderElement<FloatingWindowRemoveFromTaskbarState, bool>
      createElement() {
    return _FloatingWindowRemoveFromTaskbarStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FloatingWindowRemoveFromTaskbarStateProvider &&
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
mixin FloatingWindowRemoveFromTaskbarStateRef
    on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `windowId` of this provider.
  String? get windowId;
}

class _FloatingWindowRemoveFromTaskbarStateProviderElement
    extends AutoDisposeNotifierProviderElement<
        FloatingWindowRemoveFromTaskbarState,
        bool> with FloatingWindowRemoveFromTaskbarStateRef {
  _FloatingWindowRemoveFromTaskbarStateProviderElement(super.provider);

  @override
  String? get windowId =>
      (origin as FloatingWindowRemoveFromTaskbarStateProvider).windowId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
