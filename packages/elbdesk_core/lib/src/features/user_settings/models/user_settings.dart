import 'package:elbdesk_core/elbdesk_core.dart';
// ignore: no_flutter_material_import
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_settings.freezed.dart';

/// Predefined inactive floating overlay safed colors
///
/// These colors are predefined and cannot be changed by the user
const List<Color> predefinedInactiveFloatingOverlaySavedColors = [
  Color.fromARGB(20, 0, 0, 0),
  Color.fromARGB(35, 0, 0, 40),
  Color.fromARGB(30, 40, 0, 0),
];

/// User Settings model
///
/// The UserSettings model is used to store the user settings for the app
@freezed
class UserSettings with _$UserSettings {
  /// UserSettings constructor
  const factory UserSettings({
    required AppTheme appTheme,
    required AppLocale appLocale,
    required Color inactiveFloatingOverlayColor,
    required List<Color> inactiveFloatingOverlaySavedColors,
    required bool reduceMotion,
    required bool showTooltips,
    required bool enableTablePrefix,
    required bool dragWindowOutOfMainWindow,
    required bool defaultCollapseCardSections,
    required Map<String, bool> collapseCardSection,
    required Map<String, bool> recentWindowFilterValues,
    required Map<String, RibbonConfig> ribbonConfigs,
  }) = _UserSettings;

  const UserSettings._();

  /// Initial UserSettings
  ///
  /// Initializes UserSettings with the following settings:
  factory UserSettings.initial() => const UserSettings(
        appTheme: AppTheme.system,
        appLocale: AppLocale.de,
        inactiveFloatingOverlayColor: Color.fromARGB(20, 0, 0, 0),
        inactiveFloatingOverlaySavedColors: [
          Color.fromARGB(30, 0, 40, 0),
        ],
        reduceMotion: false,
        showTooltips: true,
        enableTablePrefix: true,
        dragWindowOutOfMainWindow: true,
        defaultCollapseCardSections: false,
        collapseCardSection: {},
        recentWindowFilterValues: {},
        ribbonConfigs: {},
      );

  /// UserSettings from DTO
  factory UserSettings.fromDTO(UserSettingsDTO dto) => UserSettings(
        appTheme: dto.appTheme,
        appLocale: dto.appLocale,
        inactiveFloatingOverlayColor:
            dto.inactiveFloatingOverlayColor.radixDbToColor,
        inactiveFloatingOverlaySavedColors: dto
            .inactiveFloatingOverlaySavedColors
            .map((color) => color.radixDbToColor)
            .toList(),
        reduceMotion: dto.reduceMotion,
        showTooltips: dto.showTooltips,
        enableTablePrefix: dto.enableTablePrefix,
        dragWindowOutOfMainWindow: dto.dragWindowOutOfMainWindow,
        defaultCollapseCardSections: dto.defaultCollapseCardSections ?? false,
        collapseCardSection: dto.collapseCardSection ?? {},
        recentWindowFilterValues: dto.recentWindowFilterValues ?? {},
        ribbonConfigs: dto.ribbonConfigs?.entries
                .map(
              (entry) => MapEntry(
                entry.key,
                RibbonConfig.fromDTO(entry.value),
              ),
            )
                .fold<Map<String, RibbonConfig>>(
              {},
              (map, entry) => map..[entry.key] = entry.value,
            ) ??
            {},
      );

  /// UserSettings to DTO
  UserSettingsDTO toDTO() => UserSettingsDTO(
        appTheme: appTheme,
        appLocale: appLocale,
        inactiveFloatingOverlayColor:
            inactiveFloatingOverlayColor.toRadixDbString,
        inactiveFloatingOverlaySavedColors: inactiveFloatingOverlaySavedColors
            .map((color) => color.toRadixDbString)
            .toList(),
        reduceMotion: reduceMotion,
        showTooltips: showTooltips,
        enableTablePrefix: enableTablePrefix,
        dragWindowOutOfMainWindow: dragWindowOutOfMainWindow,
        defaultCollapseCardSections: defaultCollapseCardSections,
        collapseCardSection: collapseCardSection.toDTO(),
        recentWindowFilterValues: recentWindowFilterValues,
      );

  /// UserSettings current locale
  Locale get locale {
    return Locale.fromSubtags(
      languageCode: appLocale.name,
    );
  }
}
