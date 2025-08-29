import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/product/config/floating_product_master_window_data.dart';
import 'package:elbdesk_prepress/src/product/widgets/product_card/product_card.dart';
import 'package:elbdesk_prepress/src/product/widgets/product_master_card/product_master_card.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FloatingProductMasterCard extends HookConsumerWidget {
  /// Creates a new [ProductCard]
  const FloatingProductMasterCard({
    required this.data,
    super.key,
  });
  final FloatingProductMasterWindowData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingWindowFocus =
        ref.watch(windowFocusNodeProvider(data.floatingWindowId));
    return ProductMasterCard(
      floatingWindowFocus: floatingWindowFocus,
      floatingWindowId: data.floatingWindowId,
      productMasterId: data.productMasterId,
      floatingWindowType: data.windowType,
    );
  }
}
