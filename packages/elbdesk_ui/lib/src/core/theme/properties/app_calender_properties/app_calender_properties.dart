import 'package:flutter/widgets.dart';

class AppCalenderProperties {
  const AppCalenderProperties({
    required this.dayButtonPrimaryColor,
    required this.dayButtonSecondaryColor,
    required this.dayButtonBorderColor,
    required this.dayButtonOverlayColor,
    required this.dayButtonSelectedForegroundColor,
  });

  final Color dayButtonPrimaryColor;
  final Color dayButtonSecondaryColor;
  final Color dayButtonBorderColor;
  final Color dayButtonOverlayColor;
  final Color dayButtonSelectedForegroundColor;
}
