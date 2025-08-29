import 'package:elbdesk_ui/src/core/theme/extensions/app_theme_extension.dart';
import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  AppThemeExtension get appTheme =>
      Theme.of(this).extension<AppThemeExtension>()!;
}
