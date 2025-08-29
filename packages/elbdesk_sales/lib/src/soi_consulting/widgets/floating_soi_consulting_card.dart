import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/elbdesk_sales.dart';
import 'package:elbdesk_sales/src/soi_consulting/widgets/soi_consulting_card.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FloatingSoiConsultingCard extends HookConsumerWidget {
  const FloatingSoiConsultingCard({
    required this.data,
    super.key,
  });

  /// The data for the floating window
  final FloatingSoiConsultingWindowData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final (width, height) = useMemoized(
    //   () {
    //     final size = MediaQuery.sizeOf(context);
    //     final width = size.width;

    //     final height = size.height;
    //     final halfScreenMinusElementMargin =
    //         (width / 2) - (UiConstants.elementMargin * 1.5);
    //     final heightWithoutBottomBar = height - 100;

    //     return (halfScreenMinusElementMargin, heightWithoutBottomBar);
    //   },
    //   [],
    // );
    final floatingWindowFocus =
        ref.watch(windowFocusNodeProvider(data.floatingWindowId));
    return SoiConsultingCard(
      entityId: data.entityId,
      salesOrderId: data.salesOrderId,
      customerId: data.customerId,
      floatingWindowId: data.floatingWindowId,
      floatingWindowFocus: floatingWindowFocus,
      floatingWindowType: data.windowType,
      initialNoteId: data.initialNoteId,
      initialNoteParentId: data.initialNoteParentId,
    );
  }
}
