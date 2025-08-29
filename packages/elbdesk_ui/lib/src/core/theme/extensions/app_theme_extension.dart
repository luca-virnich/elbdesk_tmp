import 'package:elbdesk_ui/src/core/theme/properties/app_border_radiuses/app_border_radiuses.dart';
import 'package:elbdesk_ui/src/core/theme/properties/app_button_styles/app_button_styles.dart';
import 'package:elbdesk_ui/src/core/theme/properties/app_calender_properties/app_calender_properties.dart';
import 'package:elbdesk_ui/src/core/theme/properties/app_general_colors/app_general_colors.dart';
import 'package:elbdesk_ui/src/core/theme/properties/app_icon_button_properties/app_icon_button_properties.dart';
import 'package:elbdesk_ui/src/core/theme/properties/app_navigation_properties/app_navigation_properties.dart';
import 'package:elbdesk_ui/src/core/theme/properties/app_shadows/app_shadows.dart';
import 'package:elbdesk_ui/src/core/theme/properties/app_status_colors/app_status_colors.dart';
import 'package:elbdesk_ui/src/core/theme/properties/app_table_properties/app_table_properties.dart';
import 'package:elbdesk_ui/src/core/theme/properties/app_temporary_properties/app_temporary_properties.dart';
import 'package:elbdesk_ui/src/core/theme/properties/app_text_styles/app_text_styles.dart';
import 'package:elbdesk_ui/src/core/theme/properties/app_textfield_properties/app_textfield_properties.dart';
import 'package:flutter/material.dart';

class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  const AppThemeExtension({
    required this.buttonStyles,
    required this.generalColors,
    required this.statusColors,
    required this.tableProperties,
    required this.textFieldProperties,
    required this.textStyles,
    required this.navigationProperties,
    required this.temporaryProperties,
    required this.iconButtonProperties,
    required this.calenderProperties,
    required this.shadows,
    required this.borderRadiuses,
  });

  final AppButtonStyles buttonStyles;
  final AppGeneralColors generalColors;
  final AppStatusColors statusColors;
  final AppTableProperties tableProperties;
  final AppTextFieldProperties textFieldProperties;
  final AppTextStyles textStyles;
  final AppNavigationProperties navigationProperties;
  final AppTemporaryProperties temporaryProperties;
  final AppIconButtonProperties iconButtonProperties;
  final AppCalenderProperties calenderProperties;
  final AppShadows shadows;
  final AppBorderRadiuses borderRadiuses;
  // this may be usefull when creating a new theme
  // but you only want to change one of the values
  @override
  ThemeExtension<AppThemeExtension> copyWith({
    AppButtonStyles? buttonStyles,
    AppGeneralColors? generalColors,
    AppStatusColors? statusColors,
    AppTableProperties? tableProperties,
    AppTextFieldProperties? textFieldProperties,
    AppTextStyles? textStyles,
    AppNavigationProperties? navigationProperties,
    AppTemporaryProperties? temporaryProperties,
    AppIconButtonProperties? iconButtonProperties,
    AppCalenderProperties? calenderProperties,
    AppShadows? shadows,
    AppBorderRadiuses? borderRadiuses,
  }) {
    return AppThemeExtension(
      buttonStyles: buttonStyles ?? this.buttonStyles,
      generalColors: generalColors ?? this.generalColors,
      statusColors: statusColors ?? this.statusColors,
      tableProperties: tableProperties ?? this.tableProperties,
      textFieldProperties: textFieldProperties ?? this.textFieldProperties,
      textStyles: textStyles ?? this.textStyles,
      navigationProperties: navigationProperties ?? this.navigationProperties,
      temporaryProperties: temporaryProperties ?? this.temporaryProperties,
      iconButtonProperties: iconButtonProperties ?? this.iconButtonProperties,
      calenderProperties: calenderProperties ?? this.calenderProperties,
      shadows: shadows ?? this.shadows,
      borderRadiuses: borderRadiuses ?? this.borderRadiuses,
    );
  }

  @override
  ThemeExtension<AppThemeExtension> lerp(
    ThemeExtension<AppThemeExtension>? other,
    double t,
  ) {
    if (other is! AppThemeExtension) {
      // maybe add proper lerp later
      return this;
    }
    return this;
  }
}
