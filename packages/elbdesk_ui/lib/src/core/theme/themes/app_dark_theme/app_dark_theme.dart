import 'package:elbdesk_platform_info/elbdesk_platform_info.dart';
import 'package:elbdesk_ui/src/core/theme/extensions/app_theme_extension.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_dark_theme/dark_border_radiuses/app_dark_border_radiuses.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_dark_theme/dark_button_styles/app_dark_button_styles.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_dark_theme/dark_calender_properties/app_dark_calender_properties.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_dark_theme/dark_general_colors/app_dark_general_colors.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_dark_theme/dark_icon_button_properties/app_dark_icon_button_properties.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_dark_theme/dark_navigation_properties/app_dark_navigation_properties.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_dark_theme/dark_shadows/app_dark_shadows.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_dark_theme/dark_status_colors/app_dark_status_colors.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_dark_theme/dark_table_properties/app_dark_table_properties.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_dark_theme/dark_temporary_properties/app_dark_temporary_properties.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_dark_theme/dark_text_styles/app_dark_text_styles.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_dark_theme/dark_textfield_properties/app_dark_textfield_properties.dart';
import 'package:elbdesk_ui/src/extensions/color_ext.dart';
import 'package:elbdesk_window_manager/elbdesk_window_manager.dart';
import 'package:flutter/material.dart';

final appScrollbarTheme = ScrollbarThemeData(
  interactive: true,
  crossAxisMargin: 4,
  mainAxisMargin: 2,
  thumbColor: WidgetStateProperty.all(appDarkGeneralColors.divider),
  trackColor: WidgetStateProperty.all(Colors.transparent),
  trackBorderColor: WidgetStateProperty.all(Colors.transparent),
  thickness: WidgetStateProperty.all(
    ElbDeskPlatformInfo.isMobileDevice ? 2 : 6,
  ),
  radius: const Radius.circular(3),
  thumbVisibility: WidgetStateProperty.all(true),
  trackVisibility: WidgetStateProperty.all(false),
);

final appDarkTheme = ThemeData(
  fontFamily: 'Lato',
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    primary: appDarkGeneralColors.background,
    seedColor: appDarkGeneralColors.primary,
    brightness: Brightness.dark,
  ),
  textTheme: const TextTheme().apply(fontFamily: 'Lato'),
  scrollbarTheme: appScrollbarTheme,
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: appDarkGeneralColors.primary,
    selectionColor: appDarkGeneralColors.primary.withAppOpacity(0.5),
    selectionHandleColor: appDarkGeneralColors.primary,
  ),
  extensions: [
    AppThemeExtension(
      buttonStyles: appDarkButtonStyles,
      generalColors: appDarkGeneralColors,
      statusColors: appDarkStatusColors,
      tableProperties: appDarkTableProperties,
      textFieldProperties: appDarkTextFieldProperties,
      textStyles: appDarkTextStyles,
      navigationProperties: appDarkNavigationProperties,
      temporaryProperties: appDarkTemporaryProperties,
      iconButtonProperties: appDarkIconButtonProperties,
      calenderProperties: appDarkCalenderProperties,
      shadows: appDarkShadows,
      borderRadiuses: appDarkBorderRadiuses,
    ),
    WindowManagerDarkThemeExtension.theme,
  ],
);
