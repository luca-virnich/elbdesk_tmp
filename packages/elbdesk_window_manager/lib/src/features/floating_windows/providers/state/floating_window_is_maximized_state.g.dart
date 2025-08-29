// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floating_window_is_maximized_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$floatingWindowIsMaximizedStateHash() =>
    r'9e01621cafaa1a24e138503dae5a0ef81fb229ab';

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

abstract class _$FloatingWindowIsMaximizedState
    extends BuildlessAutoDisposeNotifier<bool> {
  late final String windowId;

  bool build(String windowId);
}

/// See also [FloatingWindowIsMaximizedState].
@ProviderFor(FloatingWindowIsMaximizedState)
const floatingWindowIsMaximizedStateProvider =
    FloatingWindowIsMaximizedStateFamily();

/// See also [FloatingWindowIsMaximizedState].
class FloatingWindowIsMaximizedStateFamily extends Family<bool> {
  /// See also [FloatingWindowIsMaximizedState].
  const FloatingWindowIsMaximizedStateFamily();

  /// See also [FloatingWindowIsMaximizedState].
  FloatingWindowIsMaximizedStateProvider call(String windowId) {
    return FloatingWindowIsMaximizedStateProvider(windowId);
  }

  @override
  FloatingWindowIsMaximizedStateProvider getProviderOverride(
    covariant FloatingWindowIsMaximizedStateProvider provider,
  ) {
    return call(provider.windowId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'floatingWindowIsMaximizedStateProvider';
}

/// See also [FloatingWindowIsMaximizedState].
class FloatingWindowIsMaximizedStateProvider
    extends
        AutoDisposeNotifierProviderImpl<FloatingWindowIsMaximizedState, bool> {
  /// See also [FloatingWindowIsMaximizedState].
  FloatingWindowIsMaximizedStateProvider(String windowId)
    : this._internal(
        () => FloatingWindowIsMaximizedState()..windowId = windowId,
        from: floatingWindowIsMaximizedStateProvider,
        name: r'floatingWindowIsMaximizedStateProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$floatingWindowIsMaximizedStateHash,
        dependencies: FloatingWindowIsMaximizedStateFamily._dependencies,
        allTransitiveDependencies:
            FloatingWindowIsMaximizedStateFamily._allTransitiveDependencies,
        windowId: windowId,
      );

  FloatingWindowIsMaximizedStateProvider._internal(
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
  bool runNotifierBuild(covariant FloatingWindowIsMaximizedState notifier) {
    return notifier.build(windowId);
  }

  @override
  Override overrideWith(FloatingWindowIsMaximizedState Function() create) {
    return ProviderOverride(
      origin: this,
      override: FloatingWindowIsMaximizedStateProvider._internal(
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
  AutoDisposeNotifierProviderElement<FloatingWindowIsMaximizedState, bool>
  createElement() {
    return _FloatingWindowIsMaximizedStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FloatingWindowIsMaximizedStateProvider &&
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
mixin FloatingWindowIsMaximizedStateRef
    on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `windowId` of this provider.
  String get windowId;
}

class _FloatingWindowIsMaximizedStateProviderElement
    extends
        AutoDisposeNotifierProviderElement<FloatingWindowIsMaximizedState, bool>
    with FloatingWindowIsMaximizedStateRef {
  _FloatingWindowIsMaximizedStateProviderElement(super.provider);

  @override
  String get windowId =>
      (origin as FloatingWindowIsMaximizedStateProvider).windowId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
