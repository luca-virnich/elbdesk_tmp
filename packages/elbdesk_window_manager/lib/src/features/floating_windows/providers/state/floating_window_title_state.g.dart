// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floating_window_title_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$floatingWindowTitleStateHash() =>
    r'122f7f89067a57a4ec0ee804b3b41a479029d269';

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

abstract class _$FloatingWindowTitleState
    extends BuildlessAutoDisposeNotifier<FloatingWindowTitlebarData> {
  late final String floatingWindowId;

  FloatingWindowTitlebarData build(String floatingWindowId);
}

/// FloatingWindowTitleState
///
/// Holds the title for a floating window
///
/// This way the title can easily be changed from everywhere, even from the
/// content of the window itself
///
/// Copied from [FloatingWindowTitleState].
@ProviderFor(FloatingWindowTitleState)
const floatingWindowTitleStateProvider = FloatingWindowTitleStateFamily();

/// FloatingWindowTitleState
///
/// Holds the title for a floating window
///
/// This way the title can easily be changed from everywhere, even from the
/// content of the window itself
///
/// Copied from [FloatingWindowTitleState].
class FloatingWindowTitleStateFamily
    extends Family<FloatingWindowTitlebarData> {
  /// FloatingWindowTitleState
  ///
  /// Holds the title for a floating window
  ///
  /// This way the title can easily be changed from everywhere, even from the
  /// content of the window itself
  ///
  /// Copied from [FloatingWindowTitleState].
  const FloatingWindowTitleStateFamily();

  /// FloatingWindowTitleState
  ///
  /// Holds the title for a floating window
  ///
  /// This way the title can easily be changed from everywhere, even from the
  /// content of the window itself
  ///
  /// Copied from [FloatingWindowTitleState].
  FloatingWindowTitleStateProvider call(String floatingWindowId) {
    return FloatingWindowTitleStateProvider(floatingWindowId);
  }

  @override
  FloatingWindowTitleStateProvider getProviderOverride(
    covariant FloatingWindowTitleStateProvider provider,
  ) {
    return call(provider.floatingWindowId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'floatingWindowTitleStateProvider';
}

/// FloatingWindowTitleState
///
/// Holds the title for a floating window
///
/// This way the title can easily be changed from everywhere, even from the
/// content of the window itself
///
/// Copied from [FloatingWindowTitleState].
class FloatingWindowTitleStateProvider
    extends
        AutoDisposeNotifierProviderImpl<
          FloatingWindowTitleState,
          FloatingWindowTitlebarData
        > {
  /// FloatingWindowTitleState
  ///
  /// Holds the title for a floating window
  ///
  /// This way the title can easily be changed from everywhere, even from the
  /// content of the window itself
  ///
  /// Copied from [FloatingWindowTitleState].
  FloatingWindowTitleStateProvider(String floatingWindowId)
    : this._internal(
        () => FloatingWindowTitleState()..floatingWindowId = floatingWindowId,
        from: floatingWindowTitleStateProvider,
        name: r'floatingWindowTitleStateProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$floatingWindowTitleStateHash,
        dependencies: FloatingWindowTitleStateFamily._dependencies,
        allTransitiveDependencies:
            FloatingWindowTitleStateFamily._allTransitiveDependencies,
        floatingWindowId: floatingWindowId,
      );

  FloatingWindowTitleStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.floatingWindowId,
  }) : super.internal();

  final String floatingWindowId;

  @override
  FloatingWindowTitlebarData runNotifierBuild(
    covariant FloatingWindowTitleState notifier,
  ) {
    return notifier.build(floatingWindowId);
  }

  @override
  Override overrideWith(FloatingWindowTitleState Function() create) {
    return ProviderOverride(
      origin: this,
      override: FloatingWindowTitleStateProvider._internal(
        () => create()..floatingWindowId = floatingWindowId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        floatingWindowId: floatingWindowId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<
    FloatingWindowTitleState,
    FloatingWindowTitlebarData
  >
  createElement() {
    return _FloatingWindowTitleStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FloatingWindowTitleStateProvider &&
        other.floatingWindowId == floatingWindowId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, floatingWindowId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FloatingWindowTitleStateRef
    on AutoDisposeNotifierProviderRef<FloatingWindowTitlebarData> {
  /// The parameter `floatingWindowId` of this provider.
  String get floatingWindowId;
}

class _FloatingWindowTitleStateProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          FloatingWindowTitleState,
          FloatingWindowTitlebarData
        >
    with FloatingWindowTitleStateRef {
  _FloatingWindowTitleStateProviderElement(super.provider);

  @override
  String get floatingWindowId =>
      (origin as FloatingWindowTitleStateProvider).floatingWindowId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
