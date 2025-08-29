import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

/// Lightweight window metadata that only contains identity and configuration
/// Window state (position, size, minimized, etc.) is managed separately
@immutable
abstract class FloatingWindowData {
  FloatingWindowData({
    required this.windowType,
    required this.icon,

    required this.minSize,
    required this.defaultSize,
  }) : floatingWindowId = Uuid().v4(),
       createdAt = DateTime.now();

  /// Unique identifier for this window instance (auto-generated)
  final String floatingWindowId;

  /// When the window was created (auto-generated)
  final DateTime createdAt;

  /// Window type identifier (e.g., enum name)
  final String windowType;

  /// Icon to display in taskbar and title bar
  final IconData icon;

  /// Alias for icon to maintain compatibility
  IconData get taskbarIcon => icon;

  /// Minimum allowed size for the window
  final Size minSize;

  /// Default size when window is created
  final Size defaultSize;

  /// Get the window title

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FloatingWindowData &&
          runtimeType == other.runtimeType &&
          floatingWindowId == other.floatingWindowId;

  @override
  int get hashCode => floatingWindowId.hashCode;
}
