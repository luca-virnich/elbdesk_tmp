import 'package:elbdesk_ui/src/core/constants/app_color_palette.dart';
import 'package:elbdesk_ui/src/core/theme/properties/app_navigation_properties/app_navigation_properties.dart';

final appLightNavigationProperties = AppNavigationProperties(
  //backgroundColor: AppColorPaletteNew.todo,
  //backgroundActiveColor: AppColorPaletteNew.todo,
  foregroundTextColor: AppColorPalette.slate500,
  foregroundIconColor: AppColorPalette.slate500,
  foregroundActiveTextColor: AppColorPalette.slate700,
  borderRadius: 4,
  overlayColor: AppColorPalette.withOpacity(
    AppColorPalette.black,
    0.08,
  ),
  foregroundActiveIconColor: AppColorPalette.blue600,
  errorBadgeBackgroundColor: AppColorPalette.red700,
  errorBadgeForegroundColor: AppColorPalette.red50,
  //hoverColor: AppColorPaletteNew.todo,
);
