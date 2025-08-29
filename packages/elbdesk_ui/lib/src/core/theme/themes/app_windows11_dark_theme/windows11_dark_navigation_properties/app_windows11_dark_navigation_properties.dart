import 'package:elbdesk_ui/src/core/constants/app_color_palette.dart';
import 'package:elbdesk_ui/src/core/theme/properties/app_navigation_properties/app_navigation_properties.dart';

final appWindows11DarkNavigationProperties = AppNavigationProperties(
  foregroundTextColor: AppColorPalette.win11Grey300,
  foregroundActiveTextColor: AppColorPalette.white,
  foregroundIconColor: AppColorPalette.win11Grey300,
  foregroundActiveIconColor: AppColorPalette.win11AccentBlue,
  borderRadius: 4,
  overlayColor: AppColorPalette.withOpacity(AppColorPalette.win11Grey700, 0.3),
  errorBadgeBackgroundColor: AppColorPalette.red600,
  errorBadgeForegroundColor: AppColorPalette.white,
);
