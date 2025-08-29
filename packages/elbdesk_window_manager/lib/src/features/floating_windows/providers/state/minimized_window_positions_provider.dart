import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'minimized_window_positions_provider.g.dart';

/// Stores window positions when minimized for restore animation
@riverpod
class MinimizedWindowPositions extends _$MinimizedWindowPositions {
  @override
  Rect build(String windowId) => Rect.fromLTWH(0, 0, 0, 0);

  void storePosition(Offset position, Size size) {
    state = Rect.fromLTWH(
      position.dx,
      position.dy,
      size.width,
      size.height,
    );
  }
}
