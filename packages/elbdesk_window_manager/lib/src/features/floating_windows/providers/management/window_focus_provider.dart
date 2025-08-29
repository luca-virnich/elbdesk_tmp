import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'window_focus_provider.g.dart';

/// Manages focus nodes for floating windows
@riverpod
class WindowFocusManager extends _$WindowFocusManager {
  final Map<String, FocusNode> _focusNodes = {};

  @override
  void build() {
    // Service provider, no state
    ref.onDispose(() {
      // Dispose all focus nodes when provider is disposed
      for (final focusNode in _focusNodes.values) {
        focusNode.dispose();
      }
      _focusNodes.clear();
    });
  }

  /// Get or create a focus node for a window
  FocusNode getFocusNode(String windowId) {
    return _focusNodes.putIfAbsent(
      windowId,
      () => FocusNode(debugLabel: 'FloatingWindow:$windowId'),
    );
  }

  /// Request focus for a window
  void requestFocus(String windowId) {
    final focusNode = getFocusNode(windowId);
    if (!focusNode.hasFocus) {
      focusNode.requestFocus();
    }
  }

  /// Remove focus node when window is closed
  void removeFocusNode(String windowId) {
    final focusNode = _focusNodes.remove(windowId);
    if (focusNode != null) {
      // Unfocus before disposing to avoid focus manager assertions
      focusNode.unfocus();
      focusNode.dispose();
    }
  }

  /// Check if a window has focus
  bool hasFocus(String windowId) {
    final focusNode = _focusNodes[windowId];
    return focusNode?.hasFocus ?? false;
  }
}

/// Provider to access focus nodes for specific windows
@riverpod
FocusNode windowFocusNode(Ref ref, String windowId) {
  return ref.watch(windowFocusManagerProvider.notifier).getFocusNode(windowId);
}
