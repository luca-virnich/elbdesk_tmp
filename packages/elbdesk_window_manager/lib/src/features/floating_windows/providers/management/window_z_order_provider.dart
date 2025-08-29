import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'window_z_order_provider.g.dart';

/// Optimized provider that manages the z-order of windows
/// The last item in the list is the topmost window
@riverpod
class WindowZOrder extends _$WindowZOrder {
  @override
  List<String> build() => [];

  void addWindow(String windowId) {
    // Use List.from for better performance
    final newState = List<String>.from(state);
    newState.add(windowId);
    state = newState;
  }

  void removeWindow(String windowId) {
    final index = state.indexOf(windowId);
    if (index == -1) return;
    
    // More efficient removal
    final newState = List<String>.from(state);
    newState.removeAt(index);
    state = newState;
  }

  void bringToFront(String windowId) {
    final index = state.indexOf(windowId);
    if (index == -1) return;
    
    // Already at front
    if (index == state.length - 1) return;
    
    // Efficient reordering
    final newState = List<String>.from(state);
    newState.removeAt(index);
    newState.add(windowId);
    state = newState;
  }

  /// Batch update z-order for multiple windows
  void batchUpdateZOrder(Map<String, int> windowOrder) {
    final newState = List<String>.from(state);
    
    // Sort based on provided order
    newState.sort((a, b) {
      final orderA = windowOrder[a] ?? 999;
      final orderB = windowOrder[b] ?? 999;
      return orderA.compareTo(orderB);
    });
    
    state = newState;
  }

  /// Move window to specific position in z-order
  void moveToPosition(String windowId, int position) {
    final index = state.indexOf(windowId);
    if (index == -1) return;
    
    final newState = List<String>.from(state);
    newState.removeAt(index);
    
    // Clamp position to valid range
    final targetPosition = position.clamp(0, newState.length);
    newState.insert(targetPosition, windowId);
    
    state = newState;
  }

  /// Swap z-order of two windows
  void swapWindows(String windowId1, String windowId2) {
    final index1 = state.indexOf(windowId1);
    final index2 = state.indexOf(windowId2);
    
    if (index1 == -1 || index2 == -1) return;
    
    final newState = List<String>.from(state);
    newState[index1] = windowId2;
    newState[index2] = windowId1;
    
    state = newState;
  }

  String? get topWindowId => state.isEmpty ? null : state.last;
  
  /// Get windows in reverse order (top to bottom)
  List<String> get topToBottom => state.reversed.toList();
  
  /// Check if window is on top
  bool isOnTop(String windowId) => state.isNotEmpty && state.last == windowId;
  
  /// Get z-index of window (-1 if not found)
  int getZIndex(String windowId) => state.indexOf(windowId);
}