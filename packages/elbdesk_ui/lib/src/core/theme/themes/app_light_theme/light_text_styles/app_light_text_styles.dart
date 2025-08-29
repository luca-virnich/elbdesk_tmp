import 'package:elbdesk_ui/src/core/constants/app_color_palette.dart';
import 'package:elbdesk_ui/src/core/theme/properties/app_text_styles/app_text_styles.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_light_theme/light_general_colors/app_light_general_colors.dart';
import 'package:flutter/widgets.dart';

part 'app_light_text_style_properties.dart';

final appLightTextStyles = AppTextStyles(
  h1: _h1,
  h2: _h2,
  h3: _h3,
  defaultText: _defaultText,
  defaultTextLight: _defaultTextLight,
  textFieldStyle: _textFieldStyle,
  prefixTextTextFieldStyle: _prefixTextTextFieldStyle,
  buttonStyle: _buttonStyle,
  imageButtonStyle: _imageButtonStyle,
  imageButtonSelectedStyle: _imageButtonSelectedStyle,
  popupTitleStyle: _popupTitleStyle,
  navBarTitleStyle: _navBarTitleStyle,
  tableTitleStyle: _tableTitleStyle,
  tableCellStyle: _tableCellStyle,
  tableCellButtonStyle: _tableCellButtonStyle,
  windowTitleStyle: _windowTitleStyle,
  elbCardBottomStatusBarStyle: _elbCardBottomStatusBarStyle,
  addEntityInCardButtonStyle: _addEntityInCardButtonStyle,
  tooltipStyle: _tooltipStyle,
);
