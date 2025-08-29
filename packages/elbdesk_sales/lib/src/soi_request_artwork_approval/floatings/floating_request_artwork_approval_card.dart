import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/src/soi_request_artwork_approval/_export_soi_request_artwork_approval.dart';
import 'package:elbdesk_sales/src/soi_request_artwork_approval/widgets/soi_request_artwork_approval_card.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FloatingSoiRequestArtworkApprovalCard extends HookConsumerWidget {
  const FloatingSoiRequestArtworkApprovalCard({
    required this.data,
    super.key,
  });

  /// The data for the floating window
  final FloatingSoiRequestArtworkApprovalWindowData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingWindowFocus =
        ref.watch(windowFocusNodeProvider(data.floatingWindowId));
    return SoiRequestArtworkApprovalCard(
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
