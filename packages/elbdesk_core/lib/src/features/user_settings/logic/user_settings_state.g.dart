// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userSettingsStateHash() => r'0dc6023fab532184c4c10e0d4891543d7718a4eb';

/// Settings State
///
/// This state is used to manage and update the settings details
///
/// Copied from [UserSettingsState].
@ProviderFor(UserSettingsState)
final userSettingsStateProvider =
    AutoDisposeAsyncNotifierProvider<UserSettingsState, UserSettings>.internal(
  UserSettingsState.new,
  name: r'userSettingsStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userSettingsStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserSettingsState = AutoDisposeAsyncNotifier<UserSettings>;
String _$isDarkThemeStateHash() => r'769e887cc3007563aa9db78095f73600be967743';

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

abstract class _$IsDarkThemeState extends BuildlessAutoDisposeNotifier<bool> {
  late final Brightness brightness;

  bool build(
    Brightness brightness,
  );
}

/// Theme Mode State
///
/// To fetch the current theme mode
///
/// Copied from [IsDarkThemeState].
@ProviderFor(IsDarkThemeState)
const isDarkThemeStateProvider = IsDarkThemeStateFamily();

/// Theme Mode State
///
/// To fetch the current theme mode
///
/// Copied from [IsDarkThemeState].
class IsDarkThemeStateFamily extends Family<bool> {
  /// Theme Mode State
  ///
  /// To fetch the current theme mode
  ///
  /// Copied from [IsDarkThemeState].
  const IsDarkThemeStateFamily();

  /// Theme Mode State
  ///
  /// To fetch the current theme mode
  ///
  /// Copied from [IsDarkThemeState].
  IsDarkThemeStateProvider call(
    Brightness brightness,
  ) {
    return IsDarkThemeStateProvider(
      brightness,
    );
  }

  @override
  IsDarkThemeStateProvider getProviderOverride(
    covariant IsDarkThemeStateProvider provider,
  ) {
    return call(
      provider.brightness,
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
  String? get name => r'isDarkThemeStateProvider';
}

/// Theme Mode State
///
/// To fetch the current theme mode
///
/// Copied from [IsDarkThemeState].
class IsDarkThemeStateProvider
    extends AutoDisposeNotifierProviderImpl<IsDarkThemeState, bool> {
  /// Theme Mode State
  ///
  /// To fetch the current theme mode
  ///
  /// Copied from [IsDarkThemeState].
  IsDarkThemeStateProvider(
    Brightness brightness,
  ) : this._internal(
          () => IsDarkThemeState()..brightness = brightness,
          from: isDarkThemeStateProvider,
          name: r'isDarkThemeStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$isDarkThemeStateHash,
          dependencies: IsDarkThemeStateFamily._dependencies,
          allTransitiveDependencies:
              IsDarkThemeStateFamily._allTransitiveDependencies,
          brightness: brightness,
        );

  IsDarkThemeStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.brightness,
  }) : super.internal();

  final Brightness brightness;

  @override
  bool runNotifierBuild(
    covariant IsDarkThemeState notifier,
  ) {
    return notifier.build(
      brightness,
    );
  }

  @override
  Override overrideWith(IsDarkThemeState Function() create) {
    return ProviderOverride(
      origin: this,
      override: IsDarkThemeStateProvider._internal(
        () => create()..brightness = brightness,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        brightness: brightness,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<IsDarkThemeState, bool> createElement() {
    return _IsDarkThemeStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IsDarkThemeStateProvider && other.brightness == brightness;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, brightness.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin IsDarkThemeStateRef on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `brightness` of this provider.
  Brightness get brightness;
}

class _IsDarkThemeStateProviderElement
    extends AutoDisposeNotifierProviderElement<IsDarkThemeState, bool>
    with IsDarkThemeStateRef {
  _IsDarkThemeStateProviderElement(super.provider);

  @override
  Brightness get brightness => (origin as IsDarkThemeStateProvider).brightness;
}

String _$currentLocaleHash() => r'fe60cb5b3ca7aa446aa214c0a9b0969e42123a9a';

/// Current Locale State
///
/// To fetch the current locale
///
/// Copied from [CurrentLocale].
@ProviderFor(CurrentLocale)
final currentLocaleProvider =
    AutoDisposeNotifierProvider<CurrentLocale, Locale>.internal(
  CurrentLocale.new,
  name: r'currentLocaleProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentLocaleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentLocale = AutoDisposeNotifier<Locale>;
String _$reduceMotionStateHash() => r'129f598748ae1a7ff97aa7324bd6fa555e8ce8f1';

/// Reduce Motion State
///
/// To fetch the current reduce motion
///
/// Copied from [ReduceMotionState].
@ProviderFor(ReduceMotionState)
final reduceMotionStateProvider =
    AutoDisposeNotifierProvider<ReduceMotionState, bool>.internal(
  ReduceMotionState.new,
  name: r'reduceMotionStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$reduceMotionStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ReduceMotionState = AutoDisposeNotifier<bool>;
String _$tooltipStateHash() => r'94cfa1b2354513d2f162af6d286b276633cdac67';

/// Tooltip State
///
/// To fetch the current tooltip state
///
/// Copied from [TooltipState].
@ProviderFor(TooltipState)
final tooltipStateProvider =
    AutoDisposeNotifierProvider<TooltipState, bool>.internal(
  TooltipState.new,
  name: r'tooltipStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$tooltipStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TooltipState = AutoDisposeNotifier<bool>;
String _$tablePrefixStateHash() => r'9b17db7f621fd05985fe14ffad27d92800c128a2';

/// Table Prefix State
///
/// To fetch the current table prefix state
///
/// Copied from [TablePrefixState].
@ProviderFor(TablePrefixState)
final tablePrefixStateProvider =
    AutoDisposeNotifierProvider<TablePrefixState, bool>.internal(
  TablePrefixState.new,
  name: r'tablePrefixStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tablePrefixStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TablePrefixState = AutoDisposeNotifier<bool>;
String _$dragWindowOutOfMainWindowStateHash() =>
    r'204f58193c8ca55b602bf2201ce96175d4615a79';

/// Drag Window Out Of Main Window State
///
/// To fetch the current drag window out of main window
///
/// Copied from [DragWindowOutOfMainWindowState].
@ProviderFor(DragWindowOutOfMainWindowState)
final dragWindowOutOfMainWindowStateProvider =
    AutoDisposeNotifierProvider<DragWindowOutOfMainWindowState, bool>.internal(
  DragWindowOutOfMainWindowState.new,
  name: r'dragWindowOutOfMainWindowStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dragWindowOutOfMainWindowStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DragWindowOutOfMainWindowState = AutoDisposeNotifier<bool>;
String _$defaultCollapseCardSectionsStateHash() =>
    r'ac54897f6f990d54bc18c425c5243d8cb93dc0ff';

/// Collapse Card Sections State
///
/// To fetch the current collapse card sections state
///
/// Copied from [DefaultCollapseCardSectionsState].
@ProviderFor(DefaultCollapseCardSectionsState)
final defaultCollapseCardSectionsStateProvider = AutoDisposeNotifierProvider<
    DefaultCollapseCardSectionsState, bool>.internal(
  DefaultCollapseCardSectionsState.new,
  name: r'defaultCollapseCardSectionsStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$defaultCollapseCardSectionsStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DefaultCollapseCardSectionsState = AutoDisposeNotifier<bool>;
String _$collapseCardSectionStateHash() =>
    r'761a584e9b8420442e17919b4fa476e62fa92eda';

/// Collapse Card Sections State
///
/// To fetch the current collapse card sections state
///
/// Copied from [CollapseCardSectionState].
@ProviderFor(CollapseCardSectionState)
final collapseCardSectionStateProvider = AutoDisposeNotifierProvider<
    CollapseCardSectionState, Map<String, bool>>.internal(
  CollapseCardSectionState.new,
  name: r'collapseCardSectionStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$collapseCardSectionStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CollapseCardSectionState = AutoDisposeNotifier<Map<String, bool>>;
String _$recentWindowFilterValuesStateHash() =>
    r'b293f07c2774c2d148fc8f69b65a93137b758c4d';

/// See also [RecentWindowFilterValuesState].
@ProviderFor(RecentWindowFilterValuesState)
final recentWindowFilterValuesStateProvider = AutoDisposeNotifierProvider<
    RecentWindowFilterValuesState, Map<String, bool>>.internal(
  RecentWindowFilterValuesState.new,
  name: r'recentWindowFilterValuesStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$recentWindowFilterValuesStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RecentWindowFilterValuesState
    = AutoDisposeNotifier<Map<String, bool>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
