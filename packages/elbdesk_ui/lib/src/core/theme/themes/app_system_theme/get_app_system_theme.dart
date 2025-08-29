import 'package:elbdesk_ui/src/core/theme/themes/app_dark_theme/app_dark_theme.dart';
import 'package:elbdesk_ui/src/core/theme/themes/app_light_theme/app_light_theme.dart';
import 'package:flutter/material.dart';

ThemeData getAppSystemTheme(BuildContext context) {
  final brightness = MediaQuery.of(context).platformBrightness;
  switch (brightness) {
    case Brightness.light:
      return appLightTheme;
    case Brightness.dark:
      return appDarkTheme;
  }
}
