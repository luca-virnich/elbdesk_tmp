import 'package:elbdesk_ui/src/core/constants/app_color_palette.dart';
import 'package:elbdesk_ui/src/core/theme/extensions/app_theme_extension.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_dracula_theme/dracula_border_radiuses/app_dracula_border_radiuses.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_dracula_theme/dracula_button_styles/app_dracula_button_styles.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_dracula_theme/dracula_calender_properties/app_dracula_calender_properties.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_dracula_theme/dracula_general_colors/app_dracula_general_colors.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_dracula_theme/dracula_icon_button_properties/app_dracula_icon_button_properties.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_dracula_theme/dracula_navigation_properties/app_dracula_navigation_properties.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_dracula_theme/dracula_shadows/app_dracula_shadows.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_dracula_theme/dracula_status_colors/app_dracula_status_colors.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_dracula_theme/dracula_table_properties/app_dracula_table_properties.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_dracula_theme/dracula_temporary_properties/app_dracula_temporary_properties.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_dracula_theme/dracula_text_styles/app_dracula_text_styles.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_dracula_theme/dracula_textfield_properties/app_dracula_textfield_properties.dart';
import 'package:elbdesk_ui/src/extensions/color_ext.dart';
import 'package:flutter/material.dart';

final appDraculaTheme = ThemeData(
  fontFamily: 'Lato',
  useMaterial3: true,
  brightness: Brightness.dark,
  textTheme: const TextTheme().apply(fontFamily: 'Lato'),
  scrollbarTheme: ScrollbarThemeData(
    thumbColor: WidgetStateProperty.resolveWith<Color>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.hovered)) {
          return AppColorPalette.neutral400;
        }
        return AppColorPalette.neutral500;
      },
    ),
    thumbVisibility: WidgetStateProperty.all(true),
    radius: const Radius.circular(2),
    thickness: WidgetStateProperty.all(2),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: appDraculaGeneralColors.primary,
    selectionColor: appDraculaGeneralColors.primary.withAppOpacity(0.5),
    selectionHandleColor: appDraculaGeneralColors.primary,
  ),
  extensions: [
    AppThemeExtension(
      buttonStyles: appDraculaButtonStyles,
      generalColors: appDraculaGeneralColors,
      statusColors: appDraculaStatusColors,
      tableProperties: appDraculaTableProperties,
      textFieldProperties: appDraculaTextFieldProperties,
      textStyles: appDraculaTextStyles,
      navigationProperties: appDraculaNavigationProperties,
      temporaryProperties: appDraculaTemporaryProperties,
      iconButtonProperties: appDraculaIconButtonProperties,
      calenderProperties: appDraculaCalenderProperties,
      shadows: appDraculaShadows,
      borderRadiuses: appDraculaBorderRadiuses,
    ),
  ],
);
