import 'dart:ui';

import 'package:elbdesk_ui/src/core/constants/app_color_palette.dart';
import 'package:elbdesk_ui/src/core/theme/properties/app_button_styles/app_button_style_properties.dart';
import 'package:elbdesk_ui/src/core/theme/properties/app_button_styles/app_button_styles.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_dark_theme/dark_general_colors/app_dark_general_colors.dart';

part 'app_dark_button_style_properties.dart';

final appDarkButtonStyles = AppButtonStyles(
  primary: _primaryButtonStyle,
  secondary: _secondaryButtonStyle,
  text: _textButtonStyle,
  danger: _dangerButtonStyle,
  blank: _blankButtonStyle,
  outline: _outlineButtonStyle,
  dangerText: _dangerTextButtonStyle,
  addEntityInCard: _addEntityInCardButtonStyle,
  checkbox: _checkboxButtonStyle,
);
