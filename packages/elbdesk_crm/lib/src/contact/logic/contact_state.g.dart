// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$contactStateHash() => r'd18b16692d5c754a4e1d425be1a282b111fdede3';

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

abstract class _$ContactState
    extends BuildlessAutoDisposeAsyncNotifier<Contact> {
  late final int entityId;
  late final String sessionId;

  FutureOr<Contact> build(
    int entityId,
    String sessionId,
  );
}

/// Contact State
///
/// This state is used to manage and update the contact details
///
/// Copied from [ContactState].
@ProviderFor(ContactState)
const contactStateProvider = ContactStateFamily();

/// Contact State
///
/// This state is used to manage and update the contact details
///
/// Copied from [ContactState].
class ContactStateFamily extends Family<AsyncValue<Contact>> {
  /// Contact State
  ///
  /// This state is used to manage and update the contact details
  ///
  /// Copied from [ContactState].
  const ContactStateFamily();

  /// Contact State
  ///
  /// This state is used to manage and update the contact details
  ///
  /// Copied from [ContactState].
  ContactStateProvider call(
    int entityId,
    String sessionId,
  ) {
    return ContactStateProvider(
      entityId,
      sessionId,
    );
  }

  @override
  ContactStateProvider getProviderOverride(
    covariant ContactStateProvider provider,
  ) {
    return call(
      provider.entityId,
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
  String? get name => r'contactStateProvider';
}

/// Contact State
///
/// This state is used to manage and update the contact details
///
/// Copied from [ContactState].
class ContactStateProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ContactState, Contact> {
  /// Contact State
  ///
  /// This state is used to manage and update the contact details
  ///
  /// Copied from [ContactState].
  ContactStateProvider(
    int entityId,
    String sessionId,
  ) : this._internal(
          () => ContactState()
            ..entityId = entityId
            ..sessionId = sessionId,
          from: contactStateProvider,
          name: r'contactStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$contactStateHash,
          dependencies: ContactStateFamily._dependencies,
          allTransitiveDependencies:
              ContactStateFamily._allTransitiveDependencies,
          entityId: entityId,
          sessionId: sessionId,
        );

  ContactStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.entityId,
    required this.sessionId,
  }) : super.internal();

  final int entityId;
  final String sessionId;

  @override
  FutureOr<Contact> runNotifierBuild(
    covariant ContactState notifier,
  ) {
    return notifier.build(
      entityId,
      sessionId,
    );
  }

  @override
  Override overrideWith(ContactState Function() create) {
    return ProviderOverride(
      origin: this,
      override: ContactStateProvider._internal(
        () => create()
          ..entityId = entityId
          ..sessionId = sessionId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        entityId: entityId,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ContactState, Contact>
      createElement() {
    return _ContactStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ContactStateProvider &&
        other.entityId == entityId &&
        other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, entityId.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ContactStateRef on AutoDisposeAsyncNotifierProviderRef<Contact> {
  /// The parameter `entityId` of this provider.
  int get entityId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _ContactStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ContactState, Contact>
    with ContactStateRef {
  _ContactStateProviderElement(super.provider);

  @override
  int get entityId => (origin as ContactStateProvider).entityId;
  @override
  String get sessionId => (origin as ContactStateProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
