import 'package:elbdesk_platform_info/elbdesk_platform_info.dart';
import 'package:elbdesk_ui/src/core/theme/extensions/app_theme_extension.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_light_theme/ligh_calender_properties/app_light_calender_properties.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_light_theme/light_border_radiuses/app_light_border_radiuses.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_light_theme/light_button_styles/app_light_button_styles.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_light_theme/light_general_colors/app_light_general_colors.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_light_theme/light_icon_button_properties/app_light_icon_button_properties.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_light_theme/light_navigation_properties/app_light_navigation_properties.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_light_theme/light_shadows/app_light_shadows.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_light_theme/light_status_colors/app_light_status_colors.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_light_theme/light_table_properties/app_light_table_properties.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_light_theme/light_temporary_properties/app_light_temporary_properties.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_light_theme/light_text_styles/app_light_text_styles.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_light_theme/light_textfield_properties/app_light_textfield_properties.dart';
import 'package:elbdesk_ui/src/extensions/color_ext.dart';
import 'package:elbdesk_window_manager/elbdesk_window_manager.dart';
import 'package:flutter/material.dart';

final appLightTheme = ThemeData(
  fontFamily: 'Lato',
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    primary: appLightGeneralColors.background,
    seedColor: appLightGeneralColors.primary,
    brightness: Brightness.light,
  ),
  brightness: Brightness.light,
  textTheme: const TextTheme().apply(fontFamily: 'Lato'),
  scrollbarTheme: ScrollbarThemeData(
    interactive: true,
    crossAxisMargin: 4,
    mainAxisMargin: 2,
    thumbColor: WidgetStateProperty.all(appLightGeneralColors.divider),
    trackColor: WidgetStateProperty.all(Colors.transparent),
    trackBorderColor: WidgetStateProperty.all(Colors.transparent),
    thickness: WidgetStateProperty.all(
      ElbDeskPlatformInfo.isMobileDevice ? 2 : 6,
    ),
    radius: const Radius.circular(3),
    thumbVisibility: WidgetStateProperty.all(true),
    trackVisibility: WidgetStateProperty.all(false),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: appLightGeneralColors.primary,
    selectionColor: appLightGeneralColors.primary.withAppOpacity(0.3),
    selectionHandleColor: appLightGeneralColors.primary,
  ),
  extensions: [
    AppThemeExtension(
      buttonStyles: appLightButtonStyles,
      generalColors: appLightGeneralColors,
      statusColors: appLightStatusColors,
      tableProperties: appLightTableProperties,
      textFieldProperties: appLightTextFieldProperties,
      textStyles: appLightTextStyles,
      navigationProperties: appLightNavigationProperties,
      temporaryProperties: appLightTemporaryProperties,
      iconButtonProperties: appLightIconButtonProperties,
      calenderProperties: appLightCalenderProperties,
      shadows: appLightShadows,
      borderRadiuses: appLightBorderRadiuses,
    ),
    WindowManagerLightThemeExtension.theme,
  ],
);
