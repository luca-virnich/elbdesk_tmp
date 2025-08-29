import 'dart:ui';

import 'package:elbdesk_ui/src/core/constants/app_color_palette.dart';
import 'package:elbdesk_ui/src/core/theme/properties/app_navigation_properties/app_navigation_properties.dart';

final appDarkNavigationProperties = AppNavigationProperties(
  foregroundTextColor: AppColorPalette.neutral350,
  foregroundActiveTextColor: AppColorPalette.neutral200,
  foregroundIconColor: AppColorPalette.neutral350,
  foregroundActiveIconColor: const Color(0xff4493f8),
  borderRadius: 4,
  overlayColor: AppColorPalette.withOpacity(AppColorPalette.white, 0.08),
  errorBadgeBackgroundColor: AppColorPalette.red600,
  errorBadgeForegroundColor: AppColorPalette.red50,
);
