import 'package:elbdesk_ui/src/core/constants/app_color_palette.dart';
import 'package:elbdesk_ui/src/core/theme/properties/app_shadows/app_shadows.dart';
import 'package:flutter/material.dart';

final appWindows11DarkShadows = AppShadows(
  todoShadow: [
    const BoxShadow(
      color: AppColorPalette.red500,
      offset: Offset(5, 15),
      blurRadius: 30,
    ),
  ],
  windowShadow: [
    BoxShadow(
      color: AppColorPalette.withOpacity(AppColorPalette.black, 0.8),
      blurRadius: 12,
      spreadRadius: 2,
    ),
  ],
  windowTitleBarShadow: BoxShadow(
    blurRadius: 4,
    color: AppColorPalette.withOpacity(AppColorPalette.win11Grey900, 0.3),
  ),
  dashboardBoxShadow: [
    BoxShadow(
      color: AppColorPalette.withOpacity(AppColorPalette.win11Grey900, 0.2),
      offset: const Offset(0, 2),
      blurRadius: 6,
    ),
  ],
);
