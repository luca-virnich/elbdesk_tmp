import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/drucklayout/config/floating_drucklayout_window_data.dart';
import 'package:elbdesk_prepress/src/drucklayout/widgets/drucklayout_card/drucklayout_card.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FloatingDrucklayoutCard extends HookConsumerWidget {
  const FloatingDrucklayoutCard({
    required this.data,
    super.key,
  });

  /// The data for the floating window
  final FloatingDrucklayoutWindowData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingWindowFocus =
        ref.watch(windowFocusNodeProvider(data.floatingWindowId));
    return DrucklayoutCard(
      entityId: data.entityId,
      customerId: data.customerId,
      salesOrderId: data.salesOrderId,
      floatingWindowId: data.floatingWindowId,
      floatingWindowFocus: floatingWindowFocus,
      floatingWindowType: data.windowType,
      initialNoteId: data.initialNoteId,
      initialNoteParentId: data.initialNoteParentId,
      preSelectionId: data.preSelectionId,
      selectionId: data.selectionId,
    );
  }
}
