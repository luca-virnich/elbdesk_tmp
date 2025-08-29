import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'window_position_provider.g.dart';

/// Represents a window position and size update
@immutable
class WindowPositionUpdate {
  const WindowPositionUpdate({
    required this.position,
    required this.size,
  });

  final Offset position;
  final Size size;
}

/// Provider for managing window position updates
/// When a new position is set, the FloatingWindow widget will animate to it
@riverpod
class WindowPositionNotifier extends _$WindowPositionNotifier {
  @override
  WindowPositionUpdate? build(String windowId) => null;

  void updatePosition(Offset position, Size size) {
    state = WindowPositionUpdate(position: position, size: size);
  }

  void clearUpdate() {
    state = null;
  }
}
