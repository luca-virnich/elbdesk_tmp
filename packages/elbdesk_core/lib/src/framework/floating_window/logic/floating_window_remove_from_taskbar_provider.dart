import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'floating_window_remove_from_taskbar_provider.g.dart';

@riverpod
class FloatingWindowRemoveFromTaskbarState
    extends _$FloatingWindowRemoveFromTaskbarState {
  @override
  bool build(String? windowId) {
    return false;
  }

  void triggerRemove() {
    state = true;
  }

  void resetRemove() {
    state = false;
  }
}
