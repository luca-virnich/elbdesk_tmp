// This class is used to store temporary properties that have not
// been added to a proper theme class yet.

import 'package:flutter/widgets.dart';

class AppTemporaryProperties {
  const AppTemporaryProperties({
    // required this.appCalenderDayButtonPrimaryColor,
    // required this.appCalenderDayButtonSecondaryColor,
    // required this.appCalenderDayButtonBorderColor,
    // required this.appCalenderDayButtonOverlayColor,
    // required this.appCalenderDayButtonSelectedForegorundColor,
    required this.appNextDropdownMenuBorderColor,
    required this.appNextDropdownMenuBackgroundColor,
    required this.appNextDropdownMenuForegroundColor,
    required this.appNextDropdownMenuReadOnlyColor,
    required this.appNextDropdownMenuBorderRadius,
  });

  // calendar
  //final Color appCalenderDayButtonPrimaryColor;
  // final Color appCalenderDayButtonSecondaryColor;
  // final Color appCalenderDayButtonBorderColor;
  // final Color appCalenderDayButtonOverlayColor;
  // final Color appCalenderDayButtonSelectedForegorundColor;

  // next dropdown menu, also used for new assign users dropdown, etc
  final Color appNextDropdownMenuBorderColor;
  final Color appNextDropdownMenuBackgroundColor;
  final Color appNextDropdownMenuForegroundColor;
  final Color appNextDropdownMenuReadOnlyColor;
  final double appNextDropdownMenuBorderRadius;
}
