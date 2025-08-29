import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dragging_mouse_cursor_state.g.dart';

@riverpod
class DraggingMouseCursorState extends _$DraggingMouseCursorState {
  @override
  MouseCursor? build() {
    return null;
  }

  void update(MouseCursor cursor) {
    state = cursor;
  }

  void reset() {
    state = null;
  }
}
