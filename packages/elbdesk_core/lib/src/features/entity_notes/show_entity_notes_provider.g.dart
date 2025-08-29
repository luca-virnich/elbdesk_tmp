// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_entity_notes_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$showEntityNotesHash() => r'6241931390d8a9a6de6e625ab474ebbfd0430142';

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

abstract class _$ShowEntityNotes extends BuildlessAutoDisposeNotifier<bool> {
  late final String floatingWindowId;

  bool build(
    String floatingWindowId,
  );
}

/// See also [ShowEntityNotes].
@ProviderFor(ShowEntityNotes)
const showEntityNotesProvider = ShowEntityNotesFamily();

/// See also [ShowEntityNotes].
class ShowEntityNotesFamily extends Family<bool> {
  /// See also [ShowEntityNotes].
  const ShowEntityNotesFamily();

  /// See also [ShowEntityNotes].
  ShowEntityNotesProvider call(
    String floatingWindowId,
  ) {
    return ShowEntityNotesProvider(
      floatingWindowId,
    );
  }

  @override
  ShowEntityNotesProvider getProviderOverride(
    covariant ShowEntityNotesProvider provider,
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
  String? get name => r'showEntityNotesProvider';
}

/// See also [ShowEntityNotes].
class ShowEntityNotesProvider
    extends AutoDisposeNotifierProviderImpl<ShowEntityNotes, bool> {
  /// See also [ShowEntityNotes].
  ShowEntityNotesProvider(
    String floatingWindowId,
  ) : this._internal(
          () => ShowEntityNotes()..floatingWindowId = floatingWindowId,
          from: showEntityNotesProvider,
          name: r'showEntityNotesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$showEntityNotesHash,
          dependencies: ShowEntityNotesFamily._dependencies,
          allTransitiveDependencies:
              ShowEntityNotesFamily._allTransitiveDependencies,
          floatingWindowId: floatingWindowId,
        );

  ShowEntityNotesProvider._internal(
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
  bool runNotifierBuild(
    covariant ShowEntityNotes notifier,
  ) {
    return notifier.build(
      floatingWindowId,
    );
  }

  @override
  Override overrideWith(ShowEntityNotes Function() create) {
    return ProviderOverride(
      origin: this,
      override: ShowEntityNotesProvider._internal(
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
  AutoDisposeNotifierProviderElement<ShowEntityNotes, bool> createElement() {
    return _ShowEntityNotesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ShowEntityNotesProvider &&
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
mixin ShowEntityNotesRef on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `floatingWindowId` of this provider.
  String get floatingWindowId;
}

class _ShowEntityNotesProviderElement
    extends AutoDisposeNotifierProviderElement<ShowEntityNotes, bool>
    with ShowEntityNotesRef {
  _ShowEntityNotesProviderElement(super.provider);

  @override
  String get floatingWindowId =>
      (origin as ShowEntityNotesProvider).floatingWindowId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
