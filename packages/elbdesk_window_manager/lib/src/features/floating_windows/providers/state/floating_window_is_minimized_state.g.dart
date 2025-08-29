// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floating_window_is_minimized_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$allFloatingWindowsMinimizedStateHash() =>
    r'ccb9a80a62744cd6b0fbea9d13d445836e69cf92';

/// See also [AllFloatingWindowsMinimizedState].
@ProviderFor(AllFloatingWindowsMinimizedState)
final allFloatingWindowsMinimizedStateProvider = AutoDisposeNotifierProvider<
  AllFloatingWindowsMinimizedState,
  Set<String>
>.internal(
  AllFloatingWindowsMinimizedState.new,
  name: r'allFloatingWindowsMinimizedStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$allFloatingWindowsMinimizedStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AllFloatingWindowsMinimizedState = AutoDisposeNotifier<Set<String>>;
String _$floatingWindowIsMinimizedStateHash() =>
    r'e570f1674de81ef06c809c52d171360697ef4ba7';

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

abstract class _$FloatingWindowIsMinimizedState
    extends BuildlessAutoDisposeNotifier<bool> {
  late final String windowId;

  bool build(String windowId);
}

/// See also [FloatingWindowIsMinimizedState].
@ProviderFor(FloatingWindowIsMinimizedState)
const floatingWindowIsMinimizedStateProvider =
    FloatingWindowIsMinimizedStateFamily();

/// See also [FloatingWindowIsMinimizedState].
class FloatingWindowIsMinimizedStateFamily extends Family<bool> {
  /// See also [FloatingWindowIsMinimizedState].
  const FloatingWindowIsMinimizedStateFamily();

  /// See also [FloatingWindowIsMinimizedState].
  FloatingWindowIsMinimizedStateProvider call(String windowId) {
    return FloatingWindowIsMinimizedStateProvider(windowId);
  }

  @override
  FloatingWindowIsMinimizedStateProvider getProviderOverride(
    covariant FloatingWindowIsMinimizedStateProvider provider,
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
  String? get name => r'floatingWindowIsMinimizedStateProvider';
}

/// See also [FloatingWindowIsMinimizedState].
class FloatingWindowIsMinimizedStateProvider
    extends
        AutoDisposeNotifierProviderImpl<FloatingWindowIsMinimizedState, bool> {
  /// See also [FloatingWindowIsMinimizedState].
  FloatingWindowIsMinimizedStateProvider(String windowId)
    : this._internal(
        () => FloatingWindowIsMinimizedState()..windowId = windowId,
        from: floatingWindowIsMinimizedStateProvider,
        name: r'floatingWindowIsMinimizedStateProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$floatingWindowIsMinimizedStateHash,
        dependencies: FloatingWindowIsMinimizedStateFamily._dependencies,
        allTransitiveDependencies:
            FloatingWindowIsMinimizedStateFamily._allTransitiveDependencies,
        windowId: windowId,
      );

  FloatingWindowIsMinimizedStateProvider._internal(
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
  bool runNotifierBuild(covariant FloatingWindowIsMinimizedState notifier) {
    return notifier.build(windowId);
  }

  @override
  Override overrideWith(FloatingWindowIsMinimizedState Function() create) {
    return ProviderOverride(
      origin: this,
      override: FloatingWindowIsMinimizedStateProvider._internal(
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
  AutoDisposeNotifierProviderElement<FloatingWindowIsMinimizedState, bool>
  createElement() {
    return _FloatingWindowIsMinimizedStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FloatingWindowIsMinimizedStateProvider &&
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
mixin FloatingWindowIsMinimizedStateRef
    on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `windowId` of this provider.
  String get windowId;
}

class _FloatingWindowIsMinimizedStateProviderElement
    extends
        AutoDisposeNotifierProviderElement<FloatingWindowIsMinimizedState, bool>
    with FloatingWindowIsMinimizedStateRef {
  _FloatingWindowIsMinimizedStateProviderElement(super.provider);

  @override
  String get windowId =>
      (origin as FloatingWindowIsMinimizedStateProvider).windowId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
