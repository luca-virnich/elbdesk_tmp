// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_import_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$colorImportStateHash() => r'c486658ef7e7581e82018b78d6a840d4336685f9';

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

abstract class _$ColorImportState
    extends BuildlessAutoDisposeNotifier<List<ArtworkColor>?> {
  late final String floatingWindowId;

  List<ArtworkColor>? build(
    String floatingWindowId,
  );
}

/// ColorImportState
///
/// Holds colors to import them
/// FloatingWindowId is needed to make sure the state is unique
/// for each floating window
///
/// Copied from [ColorImportState].
@ProviderFor(ColorImportState)
const colorImportStateProvider = ColorImportStateFamily();

/// ColorImportState
///
/// Holds colors to import them
/// FloatingWindowId is needed to make sure the state is unique
/// for each floating window
///
/// Copied from [ColorImportState].
class ColorImportStateFamily extends Family<List<ArtworkColor>?> {
  /// ColorImportState
  ///
  /// Holds colors to import them
  /// FloatingWindowId is needed to make sure the state is unique
  /// for each floating window
  ///
  /// Copied from [ColorImportState].
  const ColorImportStateFamily();

  /// ColorImportState
  ///
  /// Holds colors to import them
  /// FloatingWindowId is needed to make sure the state is unique
  /// for each floating window
  ///
  /// Copied from [ColorImportState].
  ColorImportStateProvider call(
    String floatingWindowId,
  ) {
    return ColorImportStateProvider(
      floatingWindowId,
    );
  }

  @override
  ColorImportStateProvider getProviderOverride(
    covariant ColorImportStateProvider provider,
  ) {
    return call(
      provider.floatingWindowId,
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
  String? get name => r'colorImportStateProvider';
}

/// ColorImportState
///
/// Holds colors to import them
/// FloatingWindowId is needed to make sure the state is unique
/// for each floating window
///
/// Copied from [ColorImportState].
class ColorImportStateProvider extends AutoDisposeNotifierProviderImpl<
    ColorImportState, List<ArtworkColor>?> {
  /// ColorImportState
  ///
  /// Holds colors to import them
  /// FloatingWindowId is needed to make sure the state is unique
  /// for each floating window
  ///
  /// Copied from [ColorImportState].
  ColorImportStateProvider(
    String floatingWindowId,
  ) : this._internal(
          () => ColorImportState()..floatingWindowId = floatingWindowId,
          from: colorImportStateProvider,
          name: r'colorImportStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$colorImportStateHash,
          dependencies: ColorImportStateFamily._dependencies,
          allTransitiveDependencies:
              ColorImportStateFamily._allTransitiveDependencies,
          floatingWindowId: floatingWindowId,
        );

  ColorImportStateProvider._internal(
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
  List<ArtworkColor>? runNotifierBuild(
    covariant ColorImportState notifier,
  ) {
    return notifier.build(
      floatingWindowId,
    );
  }

  @override
  Override overrideWith(ColorImportState Function() create) {
    return ProviderOverride(
      origin: this,
      override: ColorImportStateProvider._internal(
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
  AutoDisposeNotifierProviderElement<ColorImportState, List<ArtworkColor>?>
      createElement() {
    return _ColorImportStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ColorImportStateProvider &&
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
mixin ColorImportStateRef
    on AutoDisposeNotifierProviderRef<List<ArtworkColor>?> {
  /// The parameter `floatingWindowId` of this provider.
  String get floatingWindowId;
}

class _ColorImportStateProviderElement
    extends AutoDisposeNotifierProviderElement<ColorImportState,
        List<ArtworkColor>?> with ColorImportStateRef {
  _ColorImportStateProviderElement(super.provider);

  @override
  String get floatingWindowId =>
      (origin as ColorImportStateProvider).floatingWindowId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
