import 'package:elbdesk_ui/src/core/constants/app_color_palette.dart';
import 'package:elbdesk_ui/src/core/theme/properties/app_shadows/app_shadows.dart';
import 'package:flutter/material.dart';

final appDarkShadows = AppShadows(
  todoShadow: [
    const BoxShadow(
      color: AppColorPalette.red500,
      offset: Offset(5, 15),
      blurRadius: 30,
    ),
  ],
  windowShadow: [
    BoxShadow(
      color: AppColorPalette.withOpacity(AppColorPalette.black, 0.3),
      offset: const Offset(5, 15),
      blurRadius: 30,
    ),
    BoxShadow(
      color: AppColorPalette.withOpacity(AppColorPalette.black, 0.3),
      blurRadius: 3,
      offset: const Offset(2, 2),
    ),
  ],
  windowTitleBarShadow: BoxShadow(
    blurRadius: 2,
    color: AppColorPalette.withOpacity(AppColorPalette.black, 0.26),
  ),
  dashboardBoxShadow: [
    BoxShadow(
      color: AppColorPalette.withOpacity(AppColorPalette.black, 0.02),
      offset: const Offset(0, -2),
      blurRadius: 4,
    ),
    BoxShadow(
      color: AppColorPalette.withOpacity(AppColorPalette.black, 0.06),
      offset: const Offset(0, 2),
      blurRadius: 8,
    ),
  ],
);
