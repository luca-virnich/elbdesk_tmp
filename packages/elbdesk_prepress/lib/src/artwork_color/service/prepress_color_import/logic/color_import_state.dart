import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'color_import_state.g.dart';

/// ColorImportState
///
/// Holds colors to import them
/// FloatingWindowId is needed to make sure the state is unique
/// for each floating window
@riverpod
class ColorImportState extends _$ColorImportState {
  @override
  List<ArtworkColor>? build(String floatingWindowId) {
    return null;
  }

  void update(List<ArtworkColor> value) {
    state = value;
  }

  void clear() {
    state = null;
  }
}
