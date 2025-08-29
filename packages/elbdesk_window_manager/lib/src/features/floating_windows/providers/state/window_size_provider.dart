import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'window_size_provider.g.dart';

/// Family provider for tracking the size of a specific window
/// Auto-disposes when the window is closed
@riverpod
class WindowSize extends _$WindowSize {
  @override
  Size? build(String windowId) => null;

  void updateSize(Size size) {
    state = size;
  }
}