import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/floating_window_data.dart';
import '../providers/state/floating_window_is_minimized_state.dart';
import '../providers/state/floating_window_is_maximized_state.dart';
import '../providers/state/window_position_provider.dart';

/// Extension to add state properties to FloatingWindowData
extension WindowStateExtension on FloatingWindowData {
  /// Check if window is minimized
  bool isMinimized(WidgetRef ref) {
    return ref.watch(floatingWindowIsMinimizedStateProvider(floatingWindowId));
  }

  /// Check if window is maximized
  bool isMaximized(WidgetRef ref) {
    return ref.watch(floatingWindowIsMaximizedStateProvider(floatingWindowId));
  }

  /// Get window position
  Offset? position(WidgetRef ref) {
    final positionUpdate = ref.watch(windowPositionNotifierProvider(floatingWindowId));
    return positionUpdate?.position;
  }

  /// Get window size
  Size? size(WidgetRef ref) {
    final positionUpdate = ref.watch(windowPositionNotifierProvider(floatingWindowId));
    return positionUpdate?.size;
  }
}

