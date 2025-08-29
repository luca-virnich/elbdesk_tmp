import 'package:flutter/material.dart';

class MobileTableToolbarActionItem {
  const MobileTableToolbarActionItem({
    required this.onPressed,
    required this.label,
    required this.icon,
  });
  final VoidCallback? onPressed;
  final String label;
  final IconData icon;
}
