import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/product/config/floating_product_window_data.dart';
import 'package:elbdesk_prepress/src/product/widgets/product_card/product_card.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Floating Product Card
///
/// Displays a [ProductCard] in a [FloatingWindow]
class FloatingProductCard extends HookConsumerWidget {
  /// Creates a new [ProductCard]
  const FloatingProductCard({
    required this.data,
    super.key,
  });
  final FloatingProductWindowData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingWindowFocus =
        ref.watch(windowFocusNodeProvider(data.floatingWindowId));
    return ProductCard(
      floatingWindowType: data.windowType,
      floatingWindowFocus: floatingWindowFocus,
      floatingWindowId: data.floatingWindowId,
      productId: data.productId,
      salesOrderId: data.salesOrderId,
      tableSessionId: data.tableSessionId,
      initialNoteId: data.initialNoteId,
      initialNoteParentId: data.initialNoteParentId,
    );
  }
}
