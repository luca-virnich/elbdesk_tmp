import 'package:elbdesk_ui/src/core/constants/app_color_palette.dart';
import 'package:elbdesk_ui/src/core/theme/properties/app_navigation_properties/app_navigation_properties.dart';

final appDraculaNavigationProperties = AppNavigationProperties(
  foregroundTextColor: AppColorPalette.neutral400,
  foregroundActiveTextColor: AppColorPalette.neutral100,
  foregroundIconColor: AppColorPalette.neutral400,
  foregroundActiveIconColor: AppColorPalette.purple400,
  borderRadius: 4,
  overlayColor: AppColorPalette.withOpacity(AppColorPalette.white, 0.08),
  errorBadgeBackgroundColor: AppColorPalette.red400,
  errorBadgeForegroundColor: AppColorPalette.neutral100,
);
