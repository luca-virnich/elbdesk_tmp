import 'package:elbdesk_ui/src/core/constants/app_color_palette.dart';
import 'package:elbdesk_ui/src/core/theme/properties/app_calender_properties/app_calender_properties.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_dark_theme/dark_general_colors/app_dark_general_colors.dart';

final appDarkCalenderProperties = AppCalenderProperties(
  dayButtonPrimaryColor: appDarkGeneralColors.primary,
  dayButtonSecondaryColor: AppColorPalette.white,
  dayButtonBorderColor: AppColorPalette.neutral600,
  dayButtonOverlayColor:
      AppColorPalette.withOpacity(AppColorPalette.white, 0.1),
  dayButtonSelectedForegroundColor: AppColorPalette.white,
);
