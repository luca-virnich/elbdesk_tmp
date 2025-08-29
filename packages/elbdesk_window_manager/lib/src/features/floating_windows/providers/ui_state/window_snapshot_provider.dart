import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'window_snapshot_provider.g.dart';

/// Data class for window snapshot
@immutable
class WindowSnapshotData {
  const WindowSnapshotData({
    required this.image,
    required this.size,
  });

  final ui.Image image;
  final Size size;
}

/// Family provider for window snapshots that auto-disposes when not used
@riverpod
class WindowSnapshot extends _$WindowSnapshot {
  @override
  WindowSnapshotData? build(String windowId) {
    // Auto-dispose when this window's snapshot is no longer watched
    ref.onDispose(() {
      // Dispose of the image if it exists
      final snapshot = state;
      if (snapshot != null) {
        try {
          snapshot.image.dispose();
        } catch (e) {
          // Silently handle disposal errors
        }
      }
    });

    return null;
  }

  /// Capture a window snapshot
  void captureSnapshot(ui.Image image, Size size) {
    // Dispose of old image if exists
    final oldSnapshot = state;
    if (oldSnapshot != null) {
      try {
        oldSnapshot.image.dispose();
      } catch (e) {
        // Silently handle disposal errors
      }
    }

    state = WindowSnapshotData(image: image, size: size);
  }

  /// Clear the snapshot
  void clearSnapshot() {
    final snapshot = state;
    if (snapshot != null) {
      try {
        snapshot.image.dispose();
      } catch (e) {
        // Silently handle disposal errors
      }
    }
    state = null;
  }
}
