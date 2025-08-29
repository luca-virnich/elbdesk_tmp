// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'in_window_keyboard_height.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$inWindowKeyboardHeightHash() =>
    r'e04359000a0d6b69e86d5fa80cc7453c038cad97';

/// See also [InWindowKeyboardHeight].
@ProviderFor(InWindowKeyboardHeight)
final inWindowKeyboardHeightProvider =
    AutoDisposeNotifierProvider<InWindowKeyboardHeight, double>.internal(
      InWindowKeyboardHeight.new,
      name: r'inWindowKeyboardHeightProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$inWindowKeyboardHeightHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$InWindowKeyboardHeight = AutoDisposeNotifier<double>;
String _$rootKeyboardHeightHash() =>
    r'2b4e0abcfc78b812e79b2f084903842752ea6471';

/// See also [RootKeyboardHeight].
@ProviderFor(RootKeyboardHeight)
final rootKeyboardHeightProvider =
    AutoDisposeNotifierProvider<RootKeyboardHeight, double>.internal(
      RootKeyboardHeight.new,
      name: r'rootKeyboardHeightProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$rootKeyboardHeightHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$RootKeyboardHeight = AutoDisposeNotifier<double>;
String _$keyboardHeightHash() => r'99095f822cf4755f40a133773456258ebfd77e14';

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

abstract class _$KeyboardHeight extends BuildlessAutoDisposeNotifier<double> {
  late final bool useRootNavigator;

  double build(bool useRootNavigator);
}

/// See also [KeyboardHeight].
@ProviderFor(KeyboardHeight)
const keyboardHeightProvider = KeyboardHeightFamily();

/// See also [KeyboardHeight].
class KeyboardHeightFamily extends Family<double> {
  /// See also [KeyboardHeight].
  const KeyboardHeightFamily();

  /// See also [KeyboardHeight].
  KeyboardHeightProvider call(bool useRootNavigator) {
    return KeyboardHeightProvider(useRootNavigator);
  }

  @override
  KeyboardHeightProvider getProviderOverride(
    covariant KeyboardHeightProvider provider,
  ) {
    return call(provider.useRootNavigator);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'keyboardHeightProvider';
}

/// See also [KeyboardHeight].
class KeyboardHeightProvider
    extends AutoDisposeNotifierProviderImpl<KeyboardHeight, double> {
  /// See also [KeyboardHeight].
  KeyboardHeightProvider(bool useRootNavigator)
    : this._internal(
        () => KeyboardHeight()..useRootNavigator = useRootNavigator,
        from: keyboardHeightProvider,
        name: r'keyboardHeightProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$keyboardHeightHash,
        dependencies: KeyboardHeightFamily._dependencies,
        allTransitiveDependencies:
            KeyboardHeightFamily._allTransitiveDependencies,
        useRootNavigator: useRootNavigator,
      );

  KeyboardHeightProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.useRootNavigator,
  }) : super.internal();

  final bool useRootNavigator;

  @override
  double runNotifierBuild(covariant KeyboardHeight notifier) {
    return notifier.build(useRootNavigator);
  }

  @override
  Override overrideWith(KeyboardHeight Function() create) {
    return ProviderOverride(
      origin: this,
      override: KeyboardHeightProvider._internal(
        () => create()..useRootNavigator = useRootNavigator,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        useRootNavigator: useRootNavigator,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<KeyboardHeight, double> createElement() {
    return _KeyboardHeightProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is KeyboardHeightProvider &&
        other.useRootNavigator == useRootNavigator;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, useRootNavigator.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin KeyboardHeightRef on AutoDisposeNotifierProviderRef<double> {
  /// The parameter `useRootNavigator` of this provider.
  bool get useRootNavigator;
}

class _KeyboardHeightProviderElement
    extends AutoDisposeNotifierProviderElement<KeyboardHeight, double>
    with KeyboardHeightRef {
  _KeyboardHeightProviderElement(super.provider);

  @override
  bool get useRootNavigator =>
      (origin as KeyboardHeightProvider).useRootNavigator;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
