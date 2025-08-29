import 'package:elbdesk_ui/src/core/constants/app_color_palette.dart';
import 'package:flutter/material.dart';

class AppGeneralColors {
  const AppGeneralColors({
    required this.background,
    required this.primary,
    required this.onPrimary,
    required this.primarySurface,
    required this.primarySurfaceBorder,
    required this.onBackground,
    required this.danger,
    required this.dangerForeground,
    required this.divider,
    required this.titleDivider,
    required this.barrierColor,
    required this.overlayColorWhileDragging,
    required this.dialogOverlayColor,
    required this.tooltipBackground,
    required this.tooltipForeground,
    required this.windowTitleBarBackground,
    this.chessBoardLightColor = AppColorPalette.white,
    this.chessBoardDarkColor = AppColorPalette.gray300,
    this.transparent = AppColorPalette.transparent,
    this.computeLuminanceLightColor = AppColorPalette.neutral850,
    this.computeLuminanceDarkColor = AppColorPalette.white,
  });
  final Color background;
  final Color onBackground;
  final Color primarySurface;
  final Color primarySurfaceBorder;
  final Color primary;
  final Color onPrimary;
  final Color danger;
  final Color dangerForeground;
  final Color divider;
  final Color titleDivider;
  final Color barrierColor;
  final Color overlayColorWhileDragging;
  final Color chessBoardLightColor;
  final Color chessBoardDarkColor;
  final Color transparent;
  final Color dialogOverlayColor;
  final Color computeLuminanceLightColor;
  final Color computeLuminanceDarkColor;
  final Color tooltipBackground;
  final Color tooltipForeground;
  final Color windowTitleBarBackground;
}
