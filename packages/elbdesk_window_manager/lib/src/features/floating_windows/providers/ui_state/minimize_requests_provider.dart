import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'minimize_requests_provider.g.dart';

/// Provider for tracking minimize requests
/// When a window ID is added to this list, the window should start its minimize animation
@riverpod
class MinimizeRequests extends _$MinimizeRequests {
  @override
  bool build(String windowId) => false;

  /// Request a window to minimize
  void requestMinimize() {
    state = true;
  }

  /// Clear a minimize request after it's been handled
  void clearRequest() {
    state = false;
  }
}
