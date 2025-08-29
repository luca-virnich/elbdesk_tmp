import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'window_highlight_provider.g.dart';

/// Provider for window highlight/flash state
@riverpod
class WindowHighlight extends _$WindowHighlight {
  @override
  Set<String> build() {
    return {};
  }

  void startHighlight(String windowId) {
    state = {...state, windowId};
  }
  
  void stopHighlight(String windowId) {
    state = state.where((id) => id != windowId).toSet();
  }
  
  bool isHighlighted(String windowId) {
    return state.contains(windowId);
  }
}