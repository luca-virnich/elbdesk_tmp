import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../models/floating_window_data.dart';

part 'open_windows_provider.g.dart';

/// Optimized provider that manages all open windows using a Map for efficient updates
@riverpod
class OpenWindows extends _$OpenWindows {
  @override
  Map<String, FloatingWindowData> build() => {};

  void openWindow(FloatingWindowData window) {
    // More efficient than spread operator for single addition
    final newState = Map<String, FloatingWindowData>.from(state);
    newState[window.floatingWindowId] = window;
    state = newState;
  }

  void closeWindow(String windowId) {
    if (!state.containsKey(windowId)) return;
    
    final newState = Map<String, FloatingWindowData>.from(state);
    newState.remove(windowId);
    state = newState;
  }

  void updateWindow(String windowId, FloatingWindowData window) {
    if (!state.containsKey(windowId)) return;
    
    final newState = Map<String, FloatingWindowData>.from(state);
    newState[windowId] = window;
    state = newState;
  }

  /// Batch update multiple windows
  void batchUpdate(Map<String, FloatingWindowData> updates) {
    final newState = Map<String, FloatingWindowData>.from(state);
    newState.addAll(updates);
    state = newState;
  }

  /// Batch close multiple windows
  void batchClose(List<String> windowIds) {
    final newState = Map<String, FloatingWindowData>.from(state);
    for (final id in windowIds) {
      newState.remove(id);
    }
    state = newState;
  }

  FloatingWindowData? getWindow(String windowId) {
    return state[windowId];
  }

  /// Get windows of a specific type
  List<FloatingWindowData> getWindowsOfType<T extends FloatingWindowData>() {
    return state.values.whereType<T>().toList();
  }

  /// Check if any window of type exists
  bool hasWindowOfType<T extends FloatingWindowData>() {
    return state.values.whereType<T>().isNotEmpty;
  }

  /// Get window count
  int get count => state.length;

  /// Check if any windows are open
  bool get hasWindows => state.isNotEmpty;
}