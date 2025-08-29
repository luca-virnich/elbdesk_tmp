import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/elbdesk_sales.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/project_core.dart';

class CustomerCraeteSalesOrderRibbon extends ConsumerWidget {
  const CustomerCraeteSalesOrderRibbon({
    required this.customerId,
    required this.floatingWindowId,
    super.key,
  });
  final int customerId;
  final String floatingWindowId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final salesL10n = context.salesL10n;
    return Ribbon(
      floatingWindowId: floatingWindowId,
      floatingWindowType: FloatingWindowType.customer.name,
      onPressed: () {
        ref.openWindow(
          FloatingSalesOrderWindowData(
            salesOrderId: null,
            customerId: customerId,
          ),
        );
      },
      label: l10n.gen_add_entity_multiline(salesL10n.sales_order_singular),
      icon: AppIcons.shopping_bag,
    );
  }
}
