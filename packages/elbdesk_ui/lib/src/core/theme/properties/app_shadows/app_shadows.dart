import 'package:flutter/material.dart';

class AppShadows {
  const AppShadows({
    required this.todoShadow,
    required this.windowShadow,
    required this.windowTitleBarShadow,
    required this.dashboardBoxShadow,
  });

  final List<BoxShadow>? todoShadow;
  final List<BoxShadow>? windowShadow;
  final BoxShadow windowTitleBarShadow;
  final List<BoxShadow>? dashboardBoxShadow;
}
