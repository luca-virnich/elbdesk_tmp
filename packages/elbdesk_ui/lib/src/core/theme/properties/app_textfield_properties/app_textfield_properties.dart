import 'package:flutter/material.dart';

class AppTextFieldProperties {
  const AppTextFieldProperties({
    required this.borderColor,
    required this.clearButtonColor,
    required this.successButtonColor,
    required this.hintTextColor,
    required this.disabledBorderColor,
    required this.disabledForegroundColor,
  });

  final Color borderColor;
  final Color clearButtonColor;
  final Color successButtonColor;
  final Color hintTextColor;
  final Color disabledBorderColor;
  final Color disabledForegroundColor;
}
