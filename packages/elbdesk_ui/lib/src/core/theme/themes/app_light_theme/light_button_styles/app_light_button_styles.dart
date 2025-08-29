import 'package:elbdesk_ui/src/core/constants/app_color_palette.dart';
import 'package:elbdesk_ui/src/core/theme/properties/app_button_styles/app_button_style_properties.dart';
import 'package:elbdesk_ui/src/core/theme/properties/app_button_styles/app_button_styles.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_light_theme/light_general_colors/app_light_general_colors.dart';

part 'app_button_style_properties.dart';

final appLightButtonStyles = AppButtonStyles(
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
