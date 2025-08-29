import 'package:elbdesk_ui/src/core/constants/app_color_palette.dart';
import 'package:elbdesk_ui/src/core/theme/properties/app_general_colors/app_general_colors.dart';

final appDraculaGeneralColors = AppGeneralColors(
  background: AppColorPalette.neutral900,
  primary: AppColorPalette.purple500,
  onPrimary: AppColorPalette.white,
  primarySurface: AppColorPalette.neutral800,
  windowTitleBarBackground: AppColorPalette.neutral800,
  primarySurfaceBorder: AppColorPalette.neutral700,
  onBackground: AppColorPalette.neutral100,
  danger: AppColorPalette.red400,
  dangerForeground: AppColorPalette.red50,
  divider: AppColorPalette.neutral700,
  titleDivider: AppColorPalette.neutral100,
  barrierColor: AppColorPalette.withOpacity(AppColorPalette.black, 0.3),
  overlayColorWhileDragging:
      AppColorPalette.withOpacity(AppColorPalette.white, 0.08),
  dialogOverlayColor: AppColorPalette.withOpacity(AppColorPalette.black, 0.5),
  tooltipBackground:
      AppColorPalette.withOpacity(AppColorPalette.neutral200, 0.9),
  tooltipForeground: AppColorPalette.black,
);
