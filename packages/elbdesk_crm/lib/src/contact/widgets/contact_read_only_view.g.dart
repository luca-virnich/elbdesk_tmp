// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_read_only_view.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$contactReadOnlyContactHash() =>
    r'e2750b3fa7f47159400599397d7ddc902b0bad80';

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

abstract class _$ContactReadOnlyContact
    extends BuildlessAutoDisposeAsyncNotifier<Contact> {
  late final int id;
  late final bool autoUpdate;

  FutureOr<Contact> build({
    required int id,
    required bool autoUpdate,
  });
}

/// See also [ContactReadOnlyContact].
@ProviderFor(ContactReadOnlyContact)
const contactReadOnlyContactProvider = ContactReadOnlyContactFamily();

/// See also [ContactReadOnlyContact].
class ContactReadOnlyContactFamily extends Family<AsyncValue<Contact>> {
  /// See also [ContactReadOnlyContact].
  const ContactReadOnlyContactFamily();

  /// See also [ContactReadOnlyContact].
  ContactReadOnlyContactProvider call({
    required int id,
    required bool autoUpdate,
  }) {
    return ContactReadOnlyContactProvider(
      id: id,
      autoUpdate: autoUpdate,
    );
  }

  @override
  ContactReadOnlyContactProvider getProviderOverride(
    covariant ContactReadOnlyContactProvider provider,
  ) {
    return call(
      id: provider.id,
      autoUpdate: provider.autoUpdate,
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
  String? get name => r'contactReadOnlyContactProvider';
}

/// See also [ContactReadOnlyContact].
class ContactReadOnlyContactProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ContactReadOnlyContact,
        Contact> {
  /// See also [ContactReadOnlyContact].
  ContactReadOnlyContactProvider({
    required int id,
    required bool autoUpdate,
  }) : this._internal(
          () => ContactReadOnlyContact()
            ..id = id
            ..autoUpdate = autoUpdate,
          from: contactReadOnlyContactProvider,
          name: r'contactReadOnlyContactProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$contactReadOnlyContactHash,
          dependencies: ContactReadOnlyContactFamily._dependencies,
          allTransitiveDependencies:
              ContactReadOnlyContactFamily._allTransitiveDependencies,
          id: id,
          autoUpdate: autoUpdate,
        );

  ContactReadOnlyContactProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.autoUpdate,
  }) : super.internal();

  final int id;
  final bool autoUpdate;

  @override
  FutureOr<Contact> runNotifierBuild(
    covariant ContactReadOnlyContact notifier,
  ) {
    return notifier.build(
      id: id,
      autoUpdate: autoUpdate,
    );
  }

  @override
  Override overrideWith(ContactReadOnlyContact Function() create) {
    return ProviderOverride(
      origin: this,
      override: ContactReadOnlyContactProvider._internal(
        () => create()
          ..id = id
          ..autoUpdate = autoUpdate,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        autoUpdate: autoUpdate,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ContactReadOnlyContact, Contact>
      createElement() {
    return _ContactReadOnlyContactProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ContactReadOnlyContactProvider &&
        other.id == id &&
        other.autoUpdate == autoUpdate;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, autoUpdate.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ContactReadOnlyContactRef
    on AutoDisposeAsyncNotifierProviderRef<Contact> {
  /// The parameter `id` of this provider.
  int get id;

  /// The parameter `autoUpdate` of this provider.
  bool get autoUpdate;
}

class _ContactReadOnlyContactProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ContactReadOnlyContact,
        Contact> with ContactReadOnlyContactRef {
  _ContactReadOnlyContactProviderElement(super.provider);

  @override
  int get id => (origin as ContactReadOnlyContactProvider).id;
  @override
  bool get autoUpdate => (origin as ContactReadOnlyContactProvider).autoUpdate;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
