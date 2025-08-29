// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taskbar_tile_positions_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$taskbarTilePositionHash() =>
    r'de7cff034b451e3a6f7f270a4e5edeeb9e06575a';

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

abstract class _$TaskbarTilePosition
    extends BuildlessAutoDisposeNotifier<GlobalKey?> {
  late final String windowId;

  GlobalKey? build(String windowId);
}

/// Tracks the position of a specific taskbar tile for minimize animations
///
/// Copied from [TaskbarTilePosition].
@ProviderFor(TaskbarTilePosition)
const taskbarTilePositionProvider = TaskbarTilePositionFamily();

/// Tracks the position of a specific taskbar tile for minimize animations
///
/// Copied from [TaskbarTilePosition].
class TaskbarTilePositionFamily extends Family<GlobalKey?> {
  /// Tracks the position of a specific taskbar tile for minimize animations
  ///
  /// Copied from [TaskbarTilePosition].
  const TaskbarTilePositionFamily();

  /// Tracks the position of a specific taskbar tile for minimize animations
  ///
  /// Copied from [TaskbarTilePosition].
  TaskbarTilePositionProvider call(String windowId) {
    return TaskbarTilePositionProvider(windowId);
  }

  @override
  TaskbarTilePositionProvider getProviderOverride(
    covariant TaskbarTilePositionProvider provider,
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
  String? get name => r'taskbarTilePositionProvider';
}

/// Tracks the position of a specific taskbar tile for minimize animations
///
/// Copied from [TaskbarTilePosition].
class TaskbarTilePositionProvider
    extends AutoDisposeNotifierProviderImpl<TaskbarTilePosition, GlobalKey?> {
  /// Tracks the position of a specific taskbar tile for minimize animations
  ///
  /// Copied from [TaskbarTilePosition].
  TaskbarTilePositionProvider(String windowId)
    : this._internal(
        () => TaskbarTilePosition()..windowId = windowId,
        from: taskbarTilePositionProvider,
        name: r'taskbarTilePositionProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$taskbarTilePositionHash,
        dependencies: TaskbarTilePositionFamily._dependencies,
        allTransitiveDependencies:
            TaskbarTilePositionFamily._allTransitiveDependencies,
        windowId: windowId,
      );

  TaskbarTilePositionProvider._internal(
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
  GlobalKey? runNotifierBuild(covariant TaskbarTilePosition notifier) {
    return notifier.build(windowId);
  }

  @override
  Override overrideWith(TaskbarTilePosition Function() create) {
    return ProviderOverride(
      origin: this,
      override: TaskbarTilePositionProvider._internal(
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
  AutoDisposeNotifierProviderElement<TaskbarTilePosition, GlobalKey?>
  createElement() {
    return _TaskbarTilePositionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TaskbarTilePositionProvider && other.windowId == windowId;
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
mixin TaskbarTilePositionRef on AutoDisposeNotifierProviderRef<GlobalKey?> {
  /// The parameter `windowId` of this provider.
  String get windowId;
}

class _TaskbarTilePositionProviderElement
    extends AutoDisposeNotifierProviderElement<TaskbarTilePosition, GlobalKey?>
    with TaskbarTilePositionRef {
  _TaskbarTilePositionProviderElement(super.provider);

  @override
  String get windowId => (origin as TaskbarTilePositionProvider).windowId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
