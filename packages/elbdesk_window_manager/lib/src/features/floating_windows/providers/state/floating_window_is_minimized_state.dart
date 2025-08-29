import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'floating_window_is_minimized_state.g.dart';

@riverpod
class AllFloatingWindowsMinimizedState
    extends _$AllFloatingWindowsMinimizedState {
  @override
  Set<String> build() {
    return {};
  }

  void addWindow(String windowId) {
    state = {...state, windowId};
  }

  void removeWindow(String windowId) {
    state = {...state}..remove(windowId);
  }

  void removeAllWindows() {
    state = {};
  }

  void expandAllWindows() {
    state = {};
  }

  void toggleMinimize(String windowId) {
    if (state.contains(windowId)) {
      removeWindow(windowId);
    } else {
      addWindow(windowId);
    }
  }

  void minimizeAllWindows() {
    // final allFloatingWindows = ref.read(floatingWindowDataStateProvider);
    // state = {
    //   ...state,
    //   ...allFloatingWindows.map((window) => window.floatingWindowId),
    // };
  }
}

@riverpod
class FloatingWindowIsMinimizedState extends _$FloatingWindowIsMinimizedState {
  @override
  bool build(String windowId) {
    final isMinimized = ref.watch(
      allFloatingWindowsMinimizedStateProvider.select(
        (state) => state.contains(windowId),
      ),
    );
    return isMinimized;
  }

  void toggleMinimize() {
    ref
        .read(allFloatingWindowsMinimizedStateProvider.notifier)
        .toggleMinimize(windowId);
  }

  void minimize() {
    ref
        .read(allFloatingWindowsMinimizedStateProvider.notifier)
        .addWindow(windowId);
  }

  void maximize() {
    ref
        .read(allFloatingWindowsMinimizedStateProvider.notifier)
        .removeWindow(windowId);
  }
}
