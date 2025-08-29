import 'package:elbdesk_ui/src/core/theme/properties/app_button_styles/app_button_style_properties.dart';

class AppButtonStyles {
  const AppButtonStyles({
    required this.primary,
    required this.secondary,
    required this.text,
    required this.danger,
    required this.blank,
    required this.outline,
    required this.dangerText,
    required this.addEntityInCard,
    required this.checkbox,
  });

  final AppButtonStyleProperties primary;
  final AppButtonStyleProperties secondary;
  final AppButtonStyleProperties text;
  final AppButtonStyleProperties danger;
  final AppButtonStyleProperties blank;
  final AppButtonStyleProperties outline;
  final AppButtonStyleProperties dangerText;
  final AppButtonStyleProperties addEntityInCard;
  final AppButtonStyleProperties checkbox;
}
