import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/snap_position.dart';

part 'edge_snap_preview_provider.g.dart';

/// Provider for edge snap preview position
/// Shows preview when dragging window near screen edges

@riverpod
class EdgeSnapPreview extends _$EdgeSnapPreview {
  @override
  SnapPosition? build() => null;

  void update(SnapPosition? value) {
    state = value;
  }
}
