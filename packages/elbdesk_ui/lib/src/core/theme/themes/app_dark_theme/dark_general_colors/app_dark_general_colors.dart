import 'dart:ui';

import 'package:elbdesk_ui/src/core/constants/app_color_palette.dart';
import 'package:elbdesk_ui/src/core/theme/properties/app_general_colors/app_general_colors.dart';

final appDarkGeneralColors = AppGeneralColors(
  background: const Color(0xff0d1117),
  windowTitleBarBackground: const Color(0xff35404F),
  primary: const Color(0xff4493f8),
  onPrimary: AppColorPalette.white,
  primarySurface: const Color(0xff212831),
  primarySurfaceBorder: AppColorPalette.neutral700,
  onBackground: AppColorPalette.neutral300,
  danger: AppColorPalette.red600,
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
