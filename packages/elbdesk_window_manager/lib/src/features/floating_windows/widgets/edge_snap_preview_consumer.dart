import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/ui_state/edge_snap_preview_provider.dart';
import 'edge_snap_preview.dart';

/// Consumer widget that watches for edge snap preview state
class EdgeSnapPreviewConsumer extends ConsumerWidget {
  const EdgeSnapPreviewConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final edgeSnapPosition = ref.watch(edgeSnapPreviewProvider);

    if (edgeSnapPosition != null) {
      return EdgeSnapPreviewWidget(
        position: edgeSnapPosition,
        screenSize: MediaQuery.of(context).size,
      );
    }

    return Positioned(
      left: 0,
      top: 0,
      child: const SizedBox.shrink(),
    );
  }
}
