import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/product/widgets/history/product_history_card_item.dart';
import 'package:elbdesk_prepress/src/product/widgets/history/product_master_log_table.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

/// Product History
///
/// Shows the Product History, which contains the changes to the
/// Product Master, and also shows the Products that are based on it.
class ProductHistory extends HookConsumerWidget {
  const ProductHistory({
    required this.productMasterId,
    super.key,
  });

  final int productMasterId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionId = useUuid();
    final ppL10n = context.prepressL10n;

    return EntityHistory<Product>(
      masterEntityId: productMasterId,
      historyProvider: fetchProductHistoryProvider(
        productMasterId,
        sessionId,
      ),
      getEntityTitle: (product) => product.salesOrder?.fullSalesOrderId ?? '',
      masterEntityTitle: ppL10n.product_master_singular,
      masterEntityIcon: AppIcons.productMaster,
      entityIcon: AppIcons.product,
      historyCardBuilder: (product) => ProductHistoryCardItem(
        key: Key(product.meta.id.toString()),
        product: product,
        masterProductId: productMasterId,
      ),
      masterHistoryBuilder: (masterId) => SelfScrollableCardItem(
        child: ProductMasterLogTable(
          entityId: masterId,
          componentIdentifier: ComponentIdentifier.productMasterLogTable,
          isCollapsible: false,
        ),
      ),
    );
  }
}
