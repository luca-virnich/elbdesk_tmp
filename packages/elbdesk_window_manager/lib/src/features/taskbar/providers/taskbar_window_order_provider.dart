import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../floating_windows/models/floating_window_data.dart';
import '../../floating_windows/providers/providers.dart';

part 'taskbar_window_order_provider.g.dart';

/// Provider that maintains the order of windows as shown in the taskbar
@riverpod
class TaskbarWindowOrder extends _$TaskbarWindowOrder {
  @override
  List<String> build() {
    // Start with an empty list - windows will be added as they open
    return [];
  }

  /// Update the order when windows are reordered in the taskbar
  void reorderWindows(int oldIndex, int newIndex) {
    final newOrder = List<String>.from(state);
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final windowId = newOrder.removeAt(oldIndex);
    newOrder.insert(newIndex, windowId);
    state = newOrder;
  }

  /// Add a new window to the end of the order
  void addWindow(String windowId) {
    if (!state.contains(windowId)) {
      state = [...state, windowId];
    }
  }

  /// Remove a window from the order
  void removeWindow(String windowId) {
    state = state.where((id) => id != windowId).toList();
  }
}

/// Provider that returns windows in taskbar order
@riverpod
List<FloatingWindowData> windowsInTaskbarOrder(WindowsInTaskbarOrderRef ref) {
  final windows = ref.watch(windowsListProvider);
  final order = ref.watch(taskbarWindowOrderProvider);

  // Create a map for quick lookup
  final windowMap = {
    for (final window in windows) window.floatingWindowId: window,
  };

  // Return windows in the taskbar order
  return order
      .where((id) => windowMap.containsKey(id))
      .map((id) => windowMap[id]!)
      .toList();
}
