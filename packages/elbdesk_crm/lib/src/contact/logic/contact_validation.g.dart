// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_validation.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$contactGeneralValidationHash() =>
    r'47852dd64ec346c846f3d6b1dc8d53b9c3041793';

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

abstract class _$ContactGeneralValidation
    extends BuildlessAutoDisposeNotifier<List<String>> {
  late final String sessionId;

  List<String> build(
    String sessionId,
  );
}

/// Contact General Validation
///
/// Used to validate the communication fields
///
/// Copied from [ContactGeneralValidation].
@ProviderFor(ContactGeneralValidation)
const contactGeneralValidationProvider = ContactGeneralValidationFamily();

/// Contact General Validation
///
/// Used to validate the communication fields
///
/// Copied from [ContactGeneralValidation].
class ContactGeneralValidationFamily extends Family<List<String>> {
  /// Contact General Validation
  ///
  /// Used to validate the communication fields
  ///
  /// Copied from [ContactGeneralValidation].
  const ContactGeneralValidationFamily();

  /// Contact General Validation
  ///
  /// Used to validate the communication fields
  ///
  /// Copied from [ContactGeneralValidation].
  ContactGeneralValidationProvider call(
    String sessionId,
  ) {
    return ContactGeneralValidationProvider(
      sessionId,
    );
  }

  @override
  ContactGeneralValidationProvider getProviderOverride(
    covariant ContactGeneralValidationProvider provider,
  ) {
    return call(
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
  String? get name => r'contactGeneralValidationProvider';
}

/// Contact General Validation
///
/// Used to validate the communication fields
///
/// Copied from [ContactGeneralValidation].
class ContactGeneralValidationProvider extends AutoDisposeNotifierProviderImpl<
    ContactGeneralValidation, List<String>> {
  /// Contact General Validation
  ///
  /// Used to validate the communication fields
  ///
  /// Copied from [ContactGeneralValidation].
  ContactGeneralValidationProvider(
    String sessionId,
  ) : this._internal(
          () => ContactGeneralValidation()..sessionId = sessionId,
          from: contactGeneralValidationProvider,
          name: r'contactGeneralValidationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$contactGeneralValidationHash,
          dependencies: ContactGeneralValidationFamily._dependencies,
          allTransitiveDependencies:
              ContactGeneralValidationFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  ContactGeneralValidationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
  }) : super.internal();

  final String sessionId;

  @override
  List<String> runNotifierBuild(
    covariant ContactGeneralValidation notifier,
  ) {
    return notifier.build(
      sessionId,
    );
  }

  @override
  Override overrideWith(ContactGeneralValidation Function() create) {
    return ProviderOverride(
      origin: this,
      override: ContactGeneralValidationProvider._internal(
        () => create()..sessionId = sessionId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ContactGeneralValidation, List<String>>
      createElement() {
    return _ContactGeneralValidationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ContactGeneralValidationProvider &&
        other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ContactGeneralValidationRef
    on AutoDisposeNotifierProviderRef<List<String>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _ContactGeneralValidationProviderElement
    extends AutoDisposeNotifierProviderElement<ContactGeneralValidation,
        List<String>> with ContactGeneralValidationRef {
  _ContactGeneralValidationProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as ContactGeneralValidationProvider).sessionId;
}

String _$contactCommunicationValidationHash() =>
    r'154b793ccb9a0692975a9e1e61c1783742a688d4';

abstract class _$ContactCommunicationValidation
    extends BuildlessAutoDisposeNotifier<List<String>> {
  late final String sessionId;

  List<String> build(
    String sessionId,
  );
}

/// Communication Validation
///
/// Used to validate the communication fields
///
/// Copied from [ContactCommunicationValidation].
@ProviderFor(ContactCommunicationValidation)
const contactCommunicationValidationProvider =
    ContactCommunicationValidationFamily();

/// Communication Validation
///
/// Used to validate the communication fields
///
/// Copied from [ContactCommunicationValidation].
class ContactCommunicationValidationFamily extends Family<List<String>> {
  /// Communication Validation
  ///
  /// Used to validate the communication fields
  ///
  /// Copied from [ContactCommunicationValidation].
  const ContactCommunicationValidationFamily();

  /// Communication Validation
  ///
  /// Used to validate the communication fields
  ///
  /// Copied from [ContactCommunicationValidation].
  ContactCommunicationValidationProvider call(
    String sessionId,
  ) {
    return ContactCommunicationValidationProvider(
      sessionId,
    );
  }

  @override
  ContactCommunicationValidationProvider getProviderOverride(
    covariant ContactCommunicationValidationProvider provider,
  ) {
    return call(
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
  String? get name => r'contactCommunicationValidationProvider';
}

/// Communication Validation
///
/// Used to validate the communication fields
///
/// Copied from [ContactCommunicationValidation].
class ContactCommunicationValidationProvider
    extends AutoDisposeNotifierProviderImpl<ContactCommunicationValidation,
        List<String>> {
  /// Communication Validation
  ///
  /// Used to validate the communication fields
  ///
  /// Copied from [ContactCommunicationValidation].
  ContactCommunicationValidationProvider(
    String sessionId,
  ) : this._internal(
          () => ContactCommunicationValidation()..sessionId = sessionId,
          from: contactCommunicationValidationProvider,
          name: r'contactCommunicationValidationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$contactCommunicationValidationHash,
          dependencies: ContactCommunicationValidationFamily._dependencies,
          allTransitiveDependencies:
              ContactCommunicationValidationFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  ContactCommunicationValidationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
  }) : super.internal();

  final String sessionId;

  @override
  List<String> runNotifierBuild(
    covariant ContactCommunicationValidation notifier,
  ) {
    return notifier.build(
      sessionId,
    );
  }

  @override
  Override overrideWith(ContactCommunicationValidation Function() create) {
    return ProviderOverride(
      origin: this,
      override: ContactCommunicationValidationProvider._internal(
        () => create()..sessionId = sessionId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ContactCommunicationValidation,
      List<String>> createElement() {
    return _ContactCommunicationValidationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ContactCommunicationValidationProvider &&
        other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ContactCommunicationValidationRef
    on AutoDisposeNotifierProviderRef<List<String>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _ContactCommunicationValidationProviderElement
    extends AutoDisposeNotifierProviderElement<ContactCommunicationValidation,
        List<String>> with ContactCommunicationValidationRef {
  _ContactCommunicationValidationProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as ContactCommunicationValidationProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
