import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/elbdesk_sales.dart';
import 'package:elbdesk_sales/src/sales_order/_export_sales_order.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Floating Sales Order Card
///
/// Displays a [SalesOrderCard] in a FloatingWindow
class FloatingSalesOrderCard extends HookConsumerWidget {
  /// Constructor
  const FloatingSalesOrderCard({
    required this.data,
    super.key,
  });

  /// The data for the floating window
  final FloatingSalesOrderWindowData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingWindowFocus =
        ref.watch(windowFocusNodeProvider(data.floatingWindowId));
    return SalesOrderCard(
      floatingWindowId: data.floatingWindowId,
      floatingWindowFocus: floatingWindowFocus,
      floatingWindowType: data.windowType,
      onSave: () {},
      customerId: data.customerId,
      salesOrderId: data.salesOrderId,
      onClose: () => ref.removeWindow(data.floatingWindowId),
      initialNoteId: data.initialNoteId,
      initialNoteParentId: data.initialNoteParentId,
    );
  }
}
