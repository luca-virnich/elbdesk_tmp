import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/src/soi_prepare_artwork/config/floating_soi_prepare_artwork_window_data.dart';
import 'package:elbdesk_sales/src/soi_prepare_artwork/widgets/soi_prepare_artwork_card/soi_prepare_artwork_card.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FloatingSoiPrepareArtworkCard extends HookConsumerWidget {
  const FloatingSoiPrepareArtworkCard({
    required this.data,
    super.key,
  });

  /// The data for the floating window
  final FloatingSoiPrepareArtworkWindowData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingWindowFocus =
        ref.watch(windowFocusNodeProvider(data.floatingWindowId));
    return SoiPrepareArtworkCard(
      entityId: data.entityId,
      customerId: data.customerId,
      floatingWindowId: data.floatingWindowId,
      floatingWindowFocus: floatingWindowFocus,
      floatingWindowType: data.windowType,
      initialNoteId: data.initialNoteId,
      initialNoteParentId: data.initialNoteParentId,
    );
  }
}
