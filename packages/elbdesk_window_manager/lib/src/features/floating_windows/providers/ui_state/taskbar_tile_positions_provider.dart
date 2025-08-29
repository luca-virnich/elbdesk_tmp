import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'taskbar_tile_positions_provider.g.dart';

/// Tracks the position of a specific taskbar tile for minimize animations
@riverpod
class TaskbarTilePosition extends _$TaskbarTilePosition {
  @override
  GlobalKey? build(String windowId) => null;

  /// Set the GlobalKey for this window's taskbar tile
  void setKey(GlobalKey key) {
    state = key;
  }

  /// Clear the key
  void clearKey() {
    state = null;
  }

  /// Get the bounds of this taskbar tile
  Rect? getTileBounds() {
    final key = state;
    if (key == null) return null;

    final renderBox = key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null || !renderBox.hasSize) return null;

    final size = renderBox.size;
    final position = renderBox.localToGlobal(Offset.zero);

    return Rect.fromLTWH(
      position.dx,
      position.dy,
      size.width,
      size.height,
    );
  }
}
