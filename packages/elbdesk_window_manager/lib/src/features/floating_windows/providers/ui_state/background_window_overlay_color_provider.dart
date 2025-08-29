import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'background_window_overlay_color_provider.g.dart';

/// Provider for the overlay color applied to windows that are not in the foreground
/// Set to null to disable the overlay

@Riverpod(keepAlive: true)
class BackgroundWindowOverlayColor extends _$BackgroundWindowOverlayColor {
  @override
  Color? build() => null;

  void update(Color? value) {
    state = value;
  }
}
