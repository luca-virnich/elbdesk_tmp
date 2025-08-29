import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'floating_window_reset_position_provider.g.dart';

@riverpod
class FloatingWindowResetPosition extends _$FloatingWindowResetPosition {
  @override
  bool build(String windowId) {
    return false;
  }

  void resetPosition() {
    state = !state;
  }
}
