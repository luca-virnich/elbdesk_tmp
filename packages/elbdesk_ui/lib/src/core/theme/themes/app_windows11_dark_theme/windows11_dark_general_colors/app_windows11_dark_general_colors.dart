import 'package:elbdesk_ui/src/core/constants/app_color_palette.dart';
import 'package:elbdesk_ui/src/core/theme/properties/app_general_colors/app_general_colors.dart';

final appWindows11DarkGeneralColors = AppGeneralColors(
  background: AppColorPalette.win11BackgroundPrimary,
  primary: AppColorPalette.win11AccentBlue,
  onPrimary: AppColorPalette.white,
  primarySurface: AppColorPalette.win11BackgroundSecondary,
  windowTitleBarBackground: AppColorPalette.win11BackgroundPrimary,
  primarySurfaceBorder: AppColorPalette.win11Grey800,
  onBackground: AppColorPalette.win11Grey100,
  danger: AppColorPalette.red400,
  dangerForeground: AppColorPalette.red50,
  divider: AppColorPalette.win11Grey800,
  titleDivider: AppColorPalette.win11Grey100,
  barrierColor: AppColorPalette.withOpacity(AppColorPalette.black, 0.4),
  overlayColorWhileDragging:
      AppColorPalette.withOpacity(AppColorPalette.win11Grey700, 0.3),
  dialogOverlayColor:
      AppColorPalette.withOpacity(AppColorPalette.win11Grey900, 0.6),
  tooltipBackground:
      AppColorPalette.withOpacity(AppColorPalette.neutral200, 0.9),
  tooltipForeground: AppColorPalette.black,
);
