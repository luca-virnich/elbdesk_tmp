import 'dart:async';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:elbdesk_window_manager/elbdesk_window_manager.dart';
// ignore: no_flutter_material_import

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_settings_state.g.dart';

/// Settings State

///

/// This state is used to manage and update the settings details

@riverpod
class UserSettingsState extends _$UserSettingsState {
  Timer? _saveDebounceTimer;

  @override
  Future<UserSettings> build() async {
    ref.onDispose(() {
      _saveDebounceTimer?.cancel();
    });

    final appUser = ref.watch(authUserStateProvider);

    if (appUser == null) {
      return UserSettings.initial();
    }

    final settings = await ref.read(fetchUserSettingsProvider.future);

    ref.read(windowManagerProvider).setBackgroundWindowOverlayColor(
          settings.inactiveFloatingOverlayColor,
        );

    ref.read(windowManagerProvider).setShowTitlebarBaseTitle(
          settings.enableTablePrefix,
        );

    ref.read(userRibbonConfigProvider.notifier).update(
          settings.ribbonConfigs,
        );

    ref.listen(
      userRibbonConfigProvider,
      (previous, next) {
        // save to server when changes

        _saveRibbonConfigToServer(next);
      },
    );

    return settings;
  }

  /// Toggle the theme mode between light and dark

  void toggleTheme() {
    final currentAppTheme = state.value?.appTheme;

    if (currentAppTheme == AppTheme.dark) {
      updateTheme(AppTheme.light);
    } else {
      updateTheme(AppTheme.dark);
    }
  }

  /// Update the theme mode

  void updateTheme(AppTheme appTheme) {
    // state cannot be null (I think)

    final updatedState = state.value!.copyWith(appTheme: appTheme);

    state = AsyncData(updatedState);

    _saveToServer();
  }

  /// Toggle the locale between de and en

  void toggleLocaleBetweenDeAndEn() {
    final currentLocale = state.value?.locale;

    if (currentLocale == const Locale('de')) {
      updateLocale(AppLocale.en);
    } else {
      updateLocale(AppLocale.de);
    }
  }

  /// Update the inactive floating overlay color

  void updateInactiveFloatingOverlayColor(Color color) {
    final updatedState =
        state.value!.copyWith(inactiveFloatingOverlayColor: color);

    state = AsyncData(updatedState);

    ref.read(windowManagerProvider).setBackgroundWindowOverlayColor(color);

    _saveToServer();
  }

  /// Update the inactive floating overlay safed colors

  void updateInactiveFloatingOverlaySavedColors(List<Color> colors) {
    final updatedState =
        state.value!.copyWith(inactiveFloatingOverlaySavedColors: colors);

    state = AsyncData(updatedState);

    _saveToServer();
  }

  /// Update the locale

  void updateLocale(AppLocale appLocale) {
    // state cannot be null (I think)

    final updatedState = state.value!.copyWith(appLocale: appLocale);

    state = AsyncData(updatedState);

    _saveToServer();
  }

  /// Updates dashboard configuration with optional debounced save

  /// updates a single color in the safed colors list

  void updateSingleColorInSafedColors(Color newColor, Color previousColor) {
    // Update the selected color

    updateInactiveFloatingOverlayColor(newColor);

    // update it in the saved colors list

    final safedColors = state.value!.inactiveFloatingOverlaySavedColors;

    final updatedColors = List<Color>.from(safedColors);

    final index = updatedColors.indexOf(previousColor);

    if (index != -1) {
      updatedColors[index] = newColor;

      updateInactiveFloatingOverlaySavedColors(updatedColors);
    }
  }

  /// Update the reduce motion

  void updateReduceMotion(bool reduceMotion) {
    final updatedState = state.value!.copyWith(reduceMotion: reduceMotion);

    state = AsyncData(updatedState);

    _saveToServer();
  }

  /// Update the drag window out of main window

  void updateDragWindowOutOfMainWindow(bool dragWindowOutOfMainWindow) {
    final updatedState = state.value!
        .copyWith(dragWindowOutOfMainWindow: dragWindowOutOfMainWindow);

    state = AsyncData(updatedState);

    _saveToServer();
  }

  /// Toggle the tooltips

  void toggleTooltipFeature() {
    final updatedState = state.value!.copyWith(
      showTooltips: !state.value!.showTooltips,
    );

    state = AsyncData(updatedState);

    _saveToServer();
  }

  /// Toggle the table prefix strings

  void toggleTablePrefixFeature() {
    final updatedState = state.value!.copyWith(
      enableTablePrefix: !state.value!.enableTablePrefix,
    );

    state = AsyncData(updatedState);

    ref.read(windowManagerProvider).setShowTitlebarBaseTitle(
          updatedState.enableTablePrefix,
        );

    _saveToServer();
  }

  /// Toggle the collapse card sections

  void toggleCollapseCardSections() {
    final updatedState = state.value!.copyWith(
      defaultCollapseCardSections: !state.value!.defaultCollapseCardSections,
    );

    state = AsyncData(updatedState);

    _saveToServer();
  }

  /// Reset the collapse card sections

  void resetCollapseCardSections() {
    final updatedState = state.value!.copyWith(
      collapseCardSection: {},
    );

    state = AsyncData(updatedState);

    _resetCollapsibleToServer();
  }

  /// Update the collapse card section

  void updateCollapseCardSection(
    String componentIdentifier,
    bool isCollapsed,
  ) {
    final updatedState = state.value!.copyWith(
      collapseCardSection: {
        ...state.value!.collapseCardSection,
        componentIdentifier: isCollapsed,
      },
    );

    state = AsyncData(updatedState);

    _saveCollapsibleToServer(componentIdentifier, isCollapsed);
  }

  void updateRecentWindowFilterValues(
    String floatingWindowType,
    bool isVisible,
  ) {
    final updatedState = state.value!.copyWith(
      recentWindowFilterValues: {
        ...state.value!.recentWindowFilterValues,
        floatingWindowType: isVisible,
      },
    );

    state = AsyncData(updatedState);

    _saveRecentWindowFilterValuesToServer(floatingWindowType, isVisible);
  }

  Future<void> _saveToServer() async {
    final isLoggedIn = ref.read(authUserStateProvider) != null;

    if (!isLoggedIn) {
      return;
    } else {
      await ref
          .read(userSettingsRepositoryProvider)
          .updateUserSettings(state.value!);
    }
  }

  Future<void> _saveCollapsibleToServer(
    String componentIdentifier,
    bool isCollapsed,
  ) async {
    await ref
        .read(userSettingsRepositoryProvider)
        .saveCollapsibleToServer(componentIdentifier, isCollapsed);
  }

  Future<void> _saveRibbonConfigToServer(
    Map<String, RibbonConfig> ribbonConfig,
  ) async {
    await ref
        .read(userSettingsRepositoryProvider)
        .saveRibbonConfigToServer(ribbonConfig);
  }

  Future<void> _resetCollapsibleToServer() async {
    await ref.read(userSettingsRepositoryProvider).resetCollapsibleIdentifier();
  }

  Future<void> _saveRecentWindowFilterValuesToServer(
    String floatingWindowType,
    bool isVisible,
  ) async {
    await ref.read(userSettingsRepositoryProvider).saveRecentWindowFilterValues(
          floatingWindowType,
          isVisible,
        );
  }
}

/// Theme Mode State

///

/// To fetch the current theme mode

@riverpod
class IsDarkThemeState extends _$IsDarkThemeState {
  @override
  bool build(Brightness brightness) {
    final appTheme = ref.watch(
      userSettingsStateProvider.select((settings) => settings.value?.appTheme),
    );

    return switch (appTheme) {
      AppTheme.dark => true,
      AppTheme.light => false,
      AppTheme.windows11 => brightness == Brightness.dark,
      AppTheme.dracula => brightness == Brightness.dark,
      AppTheme.system => brightness == Brightness.dark,
      null => brightness == Brightness.dark,
    };
  }
}

/// Current Locale State

///

/// To fetch the current locale

@riverpod
class CurrentLocale extends _$CurrentLocale {
  @override
  Locale build() {
    ref.keepAlive();

    final locale = ref.watch(
      userSettingsStateProvider.select((settings) => settings.value?.locale),
    );

    return locale ?? const Locale('de');
  }
}

/// Reduce Motion State

///

/// To fetch the current reduce motion

@riverpod
class ReduceMotionState extends _$ReduceMotionState {
  @override
  bool build() {
    final reduceMotion = ref.watch(
      userSettingsStateProvider
          .select((settings) => settings.value?.reduceMotion),
    );

    return reduceMotion ?? false;
  }
}

/// Tooltip State

///

/// To fetch the current tooltip state

@riverpod
class TooltipState extends _$TooltipState {
  @override
  bool build() {
    return ref.watch(
      userSettingsStateProvider
          .select((settings) => settings.value?.showTooltips ?? true),
    );
  }
}

/// Table Prefix State

///

/// To fetch the current table prefix state

@riverpod
class TablePrefixState extends _$TablePrefixState {
  @override
  bool build() {
    return ref.watch(
      userSettingsStateProvider
          .select((settings) => settings.value?.enableTablePrefix ?? true),
    );
  }
}

/// Drag Window Out Of Main Window State

///

/// To fetch the current drag window out of main window

@riverpod
class DragWindowOutOfMainWindowState extends _$DragWindowOutOfMainWindowState {
  @override
  bool build() {
    final dragWindowOutOfMainWindow = ref.watch(
      userSettingsStateProvider
          .select((settings) => settings.value?.dragWindowOutOfMainWindow),
    );

    return dragWindowOutOfMainWindow ?? false;
  }
}

/// Collapse Card Sections State

///

/// To fetch the current collapse card sections state

@riverpod
class DefaultCollapseCardSectionsState
    extends _$DefaultCollapseCardSectionsState {
  @override
  bool build() {
    return ref.watch(
      userSettingsStateProvider.select(
        (settings) => settings.value?.defaultCollapseCardSections ?? false,
      ),
    );
  }
}

/// Collapse Card Sections State

///

/// To fetch the current collapse card sections state

@riverpod
class CollapseCardSectionState extends _$CollapseCardSectionState {
  @override
  Map<String, bool> build() {
    return ref.watch(
      userSettingsStateProvider
          .select((settings) => settings.value?.collapseCardSection ?? {}),
    );
  }
}

extension FloatingWindowCollapseSectionIdentifierExtension
    on Map<String, bool> {
  Map<String, bool> toDTO() {
    return Map.fromEntries(
      entries.map((entry) => MapEntry(entry.key, entry.value)),
    );
  }

  bool? findIsCollapsedByIdentifier(
    String identifier,
  ) {
    final entry = entries.cast<MapEntry<String, bool>?>().firstWhere(
          (entry) => entry?.key == identifier,
          orElse: () => null,
        );
    return entry?.value;
  }
}

@riverpod
class RecentWindowFilterValuesState extends _$RecentWindowFilterValuesState {
  @override
  Map<String, bool> build() {
    final recentWindowFilterValues = ref.watch(
      userSettingsStateProvider
          .select((settings) => settings.value?.recentWindowFilterValues),
    );

    return recentWindowFilterValues ?? {};
  }
}
