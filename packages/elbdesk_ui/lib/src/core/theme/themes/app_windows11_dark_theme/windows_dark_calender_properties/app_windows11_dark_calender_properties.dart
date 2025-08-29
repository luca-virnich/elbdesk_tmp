import 'package:elbdesk_ui/src/core/constants/app_color_palette.dart';
import 'package:elbdesk_ui/src/core/theme/properties/app_calender_properties/app_calender_properties.dart';

final appWindows11DarkCalenderProperties = AppCalenderProperties(
  dayButtonPrimaryColor: AppColorPalette.win11AccentBlue,
  dayButtonSecondaryColor: AppColorPalette.white,
  dayButtonBorderColor: AppColorPalette.win11Grey700,
  dayButtonOverlayColor:
      AppColorPalette.withOpacity(AppColorPalette.win11Grey700, 0.3),
  dayButtonSelectedForegroundColor: AppColorPalette.white,
);
