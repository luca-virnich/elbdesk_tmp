import 'package:elbdesk_ui/src/core/constants/app_color_palette.dart';
import 'package:elbdesk_ui/src/core/theme/properties/app_general_colors/app_general_colors.dart';

final appLightGeneralColors = AppGeneralColors(
  background: AppColorPalette.white,
  primary: AppColorPalette.blue600,
  onPrimary: AppColorPalette.white,
  primarySurface: AppColorPalette.neutral100,
  primarySurfaceBorder: AppColorPalette.slate200,
  onBackground: AppColorPalette.neutral800,
  windowTitleBarBackground: AppColorPalette.neutral100,
  danger: AppColorPalette.red700,
  dangerForeground: AppColorPalette.red50,
  divider: AppColorPalette.slate200,
  titleDivider: AppColorPalette.neutral850,
  barrierColor: AppColorPalette.withOpacity(AppColorPalette.black, 0.3),
  overlayColorWhileDragging: AppColorPalette.withOpacity(
    AppColorPalette.black,
    0.08,
  ),
  dialogOverlayColor: AppColorPalette.withOpacity(AppColorPalette.black, 0.5),
  tooltipBackground: AppColorPalette.withOpacity(AppColorPalette.gray600, 0.9),
  tooltipForeground: AppColorPalette.white,
);
