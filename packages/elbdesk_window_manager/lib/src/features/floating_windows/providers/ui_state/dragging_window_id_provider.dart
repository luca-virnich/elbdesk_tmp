import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dragging_window_id_provider.g.dart';

/// Provider to track which window is currently being dragged
@riverpod
class DraggingWindowId extends _$DraggingWindowId {
  @override
  String? build() => null;

  void update(String? value) {
    state = value;
  }
}
