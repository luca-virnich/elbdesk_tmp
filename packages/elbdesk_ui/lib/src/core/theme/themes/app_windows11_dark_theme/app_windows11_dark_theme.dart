import 'package:elbdesk_ui/src/core/constants/app_color_palette.dart';
import 'package:elbdesk_ui/src/core/theme/extensions/app_theme_extension.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_windows11_dark_theme/windows11_dark_border_radiuses/app_windows11_dark_border_radiuses.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_windows11_dark_theme/windows11_dark_button_styles/app_windows11_dark_button_styles.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_windows11_dark_theme/windows11_dark_general_colors/app_windows11_dark_general_colors.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_windows11_dark_theme/windows11_dark_icon_button_properties/app_windows11_dark_icon_button_properties.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_windows11_dark_theme/windows11_dark_navigation_properties/app_windows11_dark_navigation_properties.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_windows11_dark_theme/windows11_dark_shadows/app_windows11_dark_shadows.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_windows11_dark_theme/windows11_dark_status_colors/app_windows11_dark_status_colors.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_windows11_dark_theme/windows11_dark_table_properties/app_windows11_dark_table_properties.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_windows11_dark_theme/windows11_dark_temporary_properties/app_windows11_dark_temporary_properties.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_windows11_dark_theme/windows11_dark_text_styles/app_windows11_dark_text_styles.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_windows11_dark_theme/windows11_dark_textfield_properties/app_windows11_dark_textfield_properties.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_windows11_dark_theme/windows_dark_calender_properties/app_windows11_dark_calender_properties.dart';
import 'package:elbdesk_ui/src/extensions/color_ext.dart';
import 'package:flutter/material.dart';

final appWindows11DarkTheme = ThemeData(
  fontFamily: 'Lato',
  useMaterial3: true,
  brightness: Brightness.dark,
  textTheme: const TextTheme().apply(fontFamily: 'Lato'),
  scrollbarTheme: ScrollbarThemeData(
    thumbColor: WidgetStateProperty.resolveWith<Color>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.hovered)) {
          return AppColorPalette.win11Grey400;
        }
        return AppColorPalette.win11Grey600;
      },
    ),
    thumbVisibility: WidgetStateProperty.all(true),
    radius: const Radius.circular(2),
    thickness: WidgetStateProperty.all(4),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: appWindows11DarkGeneralColors.primary,
    selectionColor: appWindows11DarkGeneralColors.primary.withAppOpacity(0.5),
    selectionHandleColor: appWindows11DarkGeneralColors.primary,
  ),
  extensions: [
    AppThemeExtension(
      buttonStyles: appWindows11DarkButtonStyles,
      generalColors: appWindows11DarkGeneralColors,
      statusColors: appWindows11DarkStatusColors,
      tableProperties: appWindows11DarkTableProperties,
      textFieldProperties: appWindows11DarkTextFieldProperties,
      textStyles: appWindows11DarkTextStyles,
      navigationProperties: appWindows11DarkNavigationProperties,
      temporaryProperties: appWindows11DarkTemporaryProperties,
      iconButtonProperties: appWindows11DarkIconButtonProperties,
      calenderProperties: appWindows11DarkCalenderProperties,
      shadows: appWindows11DarkShadows,
      borderRadiuses: appWindows11DarkBorderRadiuses,
    ),
  ],
);
