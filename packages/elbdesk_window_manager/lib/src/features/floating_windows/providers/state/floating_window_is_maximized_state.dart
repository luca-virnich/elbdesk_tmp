import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'floating_window_is_maximized_state.g.dart';

@riverpod
class FloatingWindowIsMaximizedState extends _$FloatingWindowIsMaximizedState {
  @override
  bool build(String windowId) {
    return false;
  }

  void setMaximized(bool isMaximized) {
    state = isMaximized;
  }

  void toggleMaximized() {
    state = !state;
  }
}
