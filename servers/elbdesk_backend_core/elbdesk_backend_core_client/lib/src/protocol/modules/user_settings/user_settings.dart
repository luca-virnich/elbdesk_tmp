/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../../modules/user_settings/app_theme.dart' as _i2;
import '../../modules/user_settings/app_locale.dart' as _i3;
import '../../modules/user_settings/user_ribbon_config.dart' as _i4;

abstract class UserSettingsDTO implements _i1.SerializableModel {
  UserSettingsDTO._({
    this.id,
    required this.appTheme,
    required this.appLocale,
    String? inactiveFloatingOverlayColor,
    required this.inactiveFloatingOverlaySavedColors,
    bool? showTooltips,
    bool? enableTablePrefix,
    bool? reduceMotion,
    bool? dragWindowOutOfMainWindow,
    bool? defaultCollapseCardSections,
    this.collapseCardSection,
    this.recentWindowFilterValues,
    this.ribbonConfigs,
  })  : inactiveFloatingOverlayColor =
            inactiveFloatingOverlayColor ?? '28000000',
        showTooltips = showTooltips ?? true,
        enableTablePrefix = enableTablePrefix ?? true,
        reduceMotion = reduceMotion ?? false,
        dragWindowOutOfMainWindow = dragWindowOutOfMainWindow ?? true,
        defaultCollapseCardSections = defaultCollapseCardSections ?? false;

  factory UserSettingsDTO({
    int? id,
    required _i2.AppTheme appTheme,
    required _i3.AppLocale appLocale,
    String? inactiveFloatingOverlayColor,
    required List<String> inactiveFloatingOverlaySavedColors,
    bool? showTooltips,
    bool? enableTablePrefix,
    bool? reduceMotion,
    bool? dragWindowOutOfMainWindow,
    bool? defaultCollapseCardSections,
    Map<String, bool>? collapseCardSection,
    Map<String, bool>? recentWindowFilterValues,
    Map<String, _i4.UserRibbonConfigDTO>? ribbonConfigs,
  }) = _UserSettingsDTOImpl;

  factory UserSettingsDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserSettingsDTO(
      id: jsonSerialization['id'] as int?,
      appTheme:
          _i2.AppTheme.fromJson((jsonSerialization['appTheme'] as String)),
      appLocale:
          _i3.AppLocale.fromJson((jsonSerialization['appLocale'] as String)),
      inactiveFloatingOverlayColor:
          jsonSerialization['inactiveFloatingOverlayColor'] as String,
      inactiveFloatingOverlaySavedColors:
          (jsonSerialization['inactiveFloatingOverlaySavedColors'] as List)
              .map((e) => e as String)
              .toList(),
      showTooltips: jsonSerialization['showTooltips'] as bool,
      enableTablePrefix: jsonSerialization['enableTablePrefix'] as bool,
      reduceMotion: jsonSerialization['reduceMotion'] as bool,
      dragWindowOutOfMainWindow:
          jsonSerialization['dragWindowOutOfMainWindow'] as bool,
      defaultCollapseCardSections:
          jsonSerialization['defaultCollapseCardSections'] as bool?,
      collapseCardSection: (jsonSerialization['collapseCardSection'] as Map?)
          ?.map((k, v) => MapEntry(
                k as String,
                v as bool,
              )),
      recentWindowFilterValues:
          (jsonSerialization['recentWindowFilterValues'] as Map?)
              ?.map((k, v) => MapEntry(
                    k as String,
                    v as bool,
                  )),
      ribbonConfigs:
          (jsonSerialization['ribbonConfigs'] as Map?)?.map((k, v) => MapEntry(
                k as String,
                _i4.UserRibbonConfigDTO.fromJson((v as Map<String, dynamic>)),
              )),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  _i2.AppTheme appTheme;

  _i3.AppLocale appLocale;

  String inactiveFloatingOverlayColor;

  List<String> inactiveFloatingOverlaySavedColors;

  bool showTooltips;

  bool enableTablePrefix;

  bool reduceMotion;

  bool dragWindowOutOfMainWindow;

  bool? defaultCollapseCardSections;

  Map<String, bool>? collapseCardSection;

  Map<String, bool>? recentWindowFilterValues;

  Map<String, _i4.UserRibbonConfigDTO>? ribbonConfigs;

  /// Returns a shallow copy of this [UserSettingsDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserSettingsDTO copyWith({
    int? id,
    _i2.AppTheme? appTheme,
    _i3.AppLocale? appLocale,
    String? inactiveFloatingOverlayColor,
    List<String>? inactiveFloatingOverlaySavedColors,
    bool? showTooltips,
    bool? enableTablePrefix,
    bool? reduceMotion,
    bool? dragWindowOutOfMainWindow,
    bool? defaultCollapseCardSections,
    Map<String, bool>? collapseCardSection,
    Map<String, bool>? recentWindowFilterValues,
    Map<String, _i4.UserRibbonConfigDTO>? ribbonConfigs,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'appTheme': appTheme.toJson(),
      'appLocale': appLocale.toJson(),
      'inactiveFloatingOverlayColor': inactiveFloatingOverlayColor,
      'inactiveFloatingOverlaySavedColors':
          inactiveFloatingOverlaySavedColors.toJson(),
      'showTooltips': showTooltips,
      'enableTablePrefix': enableTablePrefix,
      'reduceMotion': reduceMotion,
      'dragWindowOutOfMainWindow': dragWindowOutOfMainWindow,
      if (defaultCollapseCardSections != null)
        'defaultCollapseCardSections': defaultCollapseCardSections,
      if (collapseCardSection != null)
        'collapseCardSection': collapseCardSection?.toJson(),
      if (recentWindowFilterValues != null)
        'recentWindowFilterValues': recentWindowFilterValues?.toJson(),
      if (ribbonConfigs != null)
        'ribbonConfigs': ribbonConfigs?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserSettingsDTOImpl extends UserSettingsDTO {
  _UserSettingsDTOImpl({
    int? id,
    required _i2.AppTheme appTheme,
    required _i3.AppLocale appLocale,
    String? inactiveFloatingOverlayColor,
    required List<String> inactiveFloatingOverlaySavedColors,
    bool? showTooltips,
    bool? enableTablePrefix,
    bool? reduceMotion,
    bool? dragWindowOutOfMainWindow,
    bool? defaultCollapseCardSections,
    Map<String, bool>? collapseCardSection,
    Map<String, bool>? recentWindowFilterValues,
    Map<String, _i4.UserRibbonConfigDTO>? ribbonConfigs,
  }) : super._(
          id: id,
          appTheme: appTheme,
          appLocale: appLocale,
          inactiveFloatingOverlayColor: inactiveFloatingOverlayColor,
          inactiveFloatingOverlaySavedColors:
              inactiveFloatingOverlaySavedColors,
          showTooltips: showTooltips,
          enableTablePrefix: enableTablePrefix,
          reduceMotion: reduceMotion,
          dragWindowOutOfMainWindow: dragWindowOutOfMainWindow,
          defaultCollapseCardSections: defaultCollapseCardSections,
          collapseCardSection: collapseCardSection,
          recentWindowFilterValues: recentWindowFilterValues,
          ribbonConfigs: ribbonConfigs,
        );

  /// Returns a shallow copy of this [UserSettingsDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserSettingsDTO copyWith({
    Object? id = _Undefined,
    _i2.AppTheme? appTheme,
    _i3.AppLocale? appLocale,
    String? inactiveFloatingOverlayColor,
    List<String>? inactiveFloatingOverlaySavedColors,
    bool? showTooltips,
    bool? enableTablePrefix,
    bool? reduceMotion,
    bool? dragWindowOutOfMainWindow,
    Object? defaultCollapseCardSections = _Undefined,
    Object? collapseCardSection = _Undefined,
    Object? recentWindowFilterValues = _Undefined,
    Object? ribbonConfigs = _Undefined,
  }) {
    return UserSettingsDTO(
      id: id is int? ? id : this.id,
      appTheme: appTheme ?? this.appTheme,
      appLocale: appLocale ?? this.appLocale,
      inactiveFloatingOverlayColor:
          inactiveFloatingOverlayColor ?? this.inactiveFloatingOverlayColor,
      inactiveFloatingOverlaySavedColors: inactiveFloatingOverlaySavedColors ??
          this.inactiveFloatingOverlaySavedColors.map((e0) => e0).toList(),
      showTooltips: showTooltips ?? this.showTooltips,
      enableTablePrefix: enableTablePrefix ?? this.enableTablePrefix,
      reduceMotion: reduceMotion ?? this.reduceMotion,
      dragWindowOutOfMainWindow:
          dragWindowOutOfMainWindow ?? this.dragWindowOutOfMainWindow,
      defaultCollapseCardSections: defaultCollapseCardSections is bool?
          ? defaultCollapseCardSections
          : this.defaultCollapseCardSections,
      collapseCardSection: collapseCardSection is Map<String, bool>?
          ? collapseCardSection
          : this.collapseCardSection?.map((
                key0,
                value0,
              ) =>
                  MapEntry(
                    key0,
                    value0,
                  )),
      recentWindowFilterValues: recentWindowFilterValues is Map<String, bool>?
          ? recentWindowFilterValues
          : this.recentWindowFilterValues?.map((
                key0,
                value0,
              ) =>
                  MapEntry(
                    key0,
                    value0,
                  )),
      ribbonConfigs: ribbonConfigs is Map<String, _i4.UserRibbonConfigDTO>?
          ? ribbonConfigs
          : this.ribbonConfigs?.map((
                key0,
                value0,
              ) =>
                  MapEntry(
                    key0,
                    value0.copyWith(),
                  )),
    );
  }
}
