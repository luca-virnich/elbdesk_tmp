import 'package:flutter/material.dart';

/// Model for custom mobile taskbar items
class MobileTaskbarItem {
  const MobileTaskbarItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.badge,
    this.isEnabled = true,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final String? badge;
  final bool isEnabled;
}