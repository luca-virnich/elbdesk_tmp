import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/src/sales_order_item/config/floating_all_soi_from_sales_order_window_data.dart';
import 'package:elbdesk_sales/src/sales_order_item/widgets/all_soi_from_sales_order_card.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Floating Admin Settings Card
///
class FloatingAllSoiFromSalesOrder extends HookConsumerWidget {
  /// Constructor for the FloatingAdminSettingsCard
  const FloatingAllSoiFromSalesOrder({
    required this.data,
    super.key,
  });

  /// The data for the floating window
  final FloatingAllSoiFromSalesOrderWindowData data;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingWindowFocus =
        ref.watch(windowFocusNodeProvider(data.floatingWindowId));
    return AllSoiFromSalesOrderCard(
      floatingWindowId: data.floatingWindowId,
      floatingWindowFocus: floatingWindowFocus,
      salesOrderId: data.salesOrderId,
      customerId: data.customerId,
      fullSalesOrderId: data.fullSalesOrderId,
      floatingWindowType: data.windowType,
    );
  }
}
