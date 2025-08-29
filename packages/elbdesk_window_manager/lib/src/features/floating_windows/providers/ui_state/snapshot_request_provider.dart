import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'snapshot_request_provider.g.dart';

/// Provider to request snapshot capture for windows
@riverpod
class SnapshotRequest extends _$SnapshotRequest {
  @override
  bool build(String windowId) => false;

  void requestSnapshot() {
    state = true;
    // Reset after a frame to allow the window to capture
    Future.microtask(() {
      state = false;
    });
  }
}
