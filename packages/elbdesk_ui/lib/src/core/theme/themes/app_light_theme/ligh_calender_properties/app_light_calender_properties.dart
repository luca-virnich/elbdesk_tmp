import 'package:elbdesk_ui/src/core/constants/app_color_palette.dart';
import 'package:elbdesk_ui/src/core/theme/properties/app_calender_properties/app_calender_properties.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_light_theme/light_general_colors/app_light_general_colors.dart';

final appLightCalenderProperties = AppCalenderProperties(
  dayButtonPrimaryColor: appLightGeneralColors.primary,
  dayButtonSecondaryColor: AppColorPalette.slate500,
  dayButtonBorderColor: AppColorPalette.slate300,
  dayButtonOverlayColor:
      AppColorPalette.withOpacity(AppColorPalette.black, 0.08),
  dayButtonSelectedForegroundColor: AppColorPalette.white,
);
