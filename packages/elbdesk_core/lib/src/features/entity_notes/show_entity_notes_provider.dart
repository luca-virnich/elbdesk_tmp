import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'show_entity_notes_provider.g.dart';

@riverpod
class ShowEntityNotes extends _$ShowEntityNotes {
  @override
  bool build(String floatingWindowId) {
    ref.cacheFor(const Duration(seconds: 10));
    return false;
  }

  void toggle() {
    state = !state;
  }

  void show() {
    state = true;
  }

  void hide() {
    state = false;
  }
}
