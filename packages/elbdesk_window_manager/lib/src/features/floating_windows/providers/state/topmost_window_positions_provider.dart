import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'topmost_window_positions_provider.g.dart';

/// Tracks the position of the topmost (most recently used) window of each type
@riverpod
class TopmostWindowPositions extends _$TopmostWindowPositions {
  @override
  Map<String, Offset> build() => {};

  /// Update the position for a window type (called when window is moved/focused)
  void updatePosition(String windowType, Offset position) {
    state = {
      ...state,
      windowType: position,
    };
  }

  /// Get the position for a new window with cascade
  Offset getPositionForNewWindow(
    String windowType,
    Offset defaultPosition,
    Size screenSize,
  ) {
    final lastPosition = state[windowType];
    if (lastPosition != null) {
      // Add cascade offset to the last position
      const cascadeOffset = 30.0;
      const maxCascadeDistance = 300.0; // Maximum cascade before reset

      var newX = lastPosition.dx + cascadeOffset;
      var newY = lastPosition.dy + cascadeOffset;

      // Reset cascade if we've gone too far or off screen
      if (newX > defaultPosition.dx + maxCascadeDistance ||
          newY > defaultPosition.dy + maxCascadeDistance ||
          newX > screenSize.width - 200 || // Keep 200px minimum visible
          newY > screenSize.height - 200) {
        newX = defaultPosition.dx;
        newY = defaultPosition.dy;
      }

      return Offset(newX, newY);
    }
    // No existing window of this type, store and return the default
    Future.microtask(() {
      state = {
        ...state,
        windowType: defaultPosition,
      };
    });

    return defaultPosition;
  }

  /// Remove position when no windows of this type remain
  void removeWindowType(String windowType) {
    state = Map<String, Offset>.from(state)..remove(windowType);
  }

  /// Clear all tracked positions (useful for cleanup)
  void clearAll() {
    state = {};
  }

  /// Get the number of tracked window types
  int get trackedCount => state.length;
}
