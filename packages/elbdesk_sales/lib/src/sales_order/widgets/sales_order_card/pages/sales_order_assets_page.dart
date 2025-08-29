import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/src/sales_order/widgets/multi_nutzenlayouts_by_sales_order_view.dart';
import 'package:elbdesk_sales/src/sales_order/widgets/sales_order_artwork_quarantines.dart';
import 'package:elbdesk_sales/src/sales_order/widgets/sales_order_drucklayout/drucklayouts_by_sales_order_view.dart';
import 'package:elbdesk_sales/src/sales_order/widgets/sales_order_products/sales_order_items_product_based.dart';
import 'package:elbdesk_sales/src/sales_order/widgets/single_nutzenlayouts_by_sales_order_view.dart';
import 'package:elbdesk_sales/src/sales_order_item/widgets/add_product_to_sales_order_dialog.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

/// Sales Order Products View
///
/// Displays the products associated with the sales order
class SalesOrderAssetsPage extends HookConsumerWidget {
  const SalesOrderAssetsPage({
    required this.salesOrderId,
    required this.navigatorKey,
    required this.floatingWindowFocus,
    required this.floatingWindowId,
    required this.sessionId,
    required this.initialEntity,
    required this.customerId,
    super.key,
  });
  final int salesOrderId;
  final int customerId;
  final GlobalKey<NavigatorState> navigatorKey;
  final FocusNode floatingWindowFocus;
  final String floatingWindowId;
  final String sessionId;
  final SalesOrder initialEntity;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final salesL10n = context.salesL10n;
    final ppL10n = context.prepressL10n;
    final showProducts = useValueNotifier<bool>(true);
    return ScrollableCardItem.unconstrained(
      child: Column(
        children: [
          SalesOrderArtworkQuarantines(
            customerId: initialEntity.customer?.meta.id ?? 0,
            navigatorKey: navigatorKey,
            floatingWindowFocus: floatingWindowFocus,
            floatingWindowId: floatingWindowId,
            salesOrderId: salesOrderId,
            componentIdentifier:
                ComponentIdentifier.salesOrderCardItemsPageArtworkQuarantines,
          ),
          const CardSectionDivider(),

          CollapsibleCardSection(
            leadingWidgets: [
              _ShowHideProductButton(showProducts: showProducts),
            ],
            // title: l10n.sales_associated_products,
            title: salesL10n.sales_order_product_plural,
            identifier:
                ComponentIdentifier.salesOrderCardItemsPageProducts.name,
            trailingWidgets: [
              AppIconButton.secondary(
                onPressed: () {
                  ref.openWindow(
                    FloatingAllSoiFromSalesOrderWindowData(
                      salesOrderId: salesOrderId,
                      customerId: customerId,
                      fullSalesOrderId: initialEntity.fullSalesOrderId,
                    ),
                  );
                },
                tooltip: salesL10n.prepress_artwork_listview_soi,
                iconData: AppIcons.list,
              ),
              const SizedBox(width: UiConstants.elementMargin),
              AddEntityInCardButton(
                tooltip: l10n.gen_add_entity(ppL10n.product),
                onPressed: () async {
                  await showElbDialog<void>(
                    context: context,
                    child: AddProductToSalesOrderDialog(
                      customerId: initialEntity.customer!.meta.id!,
                      navigatorKey: navigatorKey,
                      floatingWindowFocus: floatingWindowFocus,
                      floatingWindowId: floatingWindowId,
                      salesOrderId: salesOrderId,
                    ),
                  );
                },
              ),
            ],
            child: SalesOrderItemsProductBased(
              showProducts: showProducts,
              salesOrderId: salesOrderId,
              customerId: initialEntity.customer!.meta.id!,
              navigatorKey: navigatorKey,
              floatingWindowId: floatingWindowId,
              floatingWindowFocus: floatingWindowFocus,
              sessionId: sessionId,
            ),
          ),
          const SizedBox(height: 64),
          // GeneralSalesOrderItemsBySalesOrder(
          //   salesOrderId: salesOrderId,
          //   customerId: customerId,
          //   sessionId: sessionId,
          //   floatingWindowId: floatingWindowId,
          //   floatingWindowFocus: floatingWindowFocus,
          //   navigatorKey: navigatorKey,
          // ),
          SingleNutzenlayoutsBySalesOrderView(
            salesOrderId: salesOrderId,
            customerId: customerId,
            sessionId: sessionId,
            floatingWindowId: floatingWindowId,
            floatingWindowFocus: floatingWindowFocus,
            navigatorKey: navigatorKey,
          ),
          const CardSectionDivider(),
          MultiNutzenlayoutsBySalesOrderView(
            salesOrderId: salesOrderId,
            customerId: customerId,
            sessionId: sessionId,
            floatingWindowId: floatingWindowId,
            floatingWindowFocus: floatingWindowFocus,
            navigatorKey: navigatorKey,
          ),
          const CardSectionDivider(),

          DrucklayoutsBySalesOrderView(
            salesOrderId: salesOrderId,
            customerId: customerId,
            sessionId: sessionId,
            floatingWindowId: floatingWindowId,
            floatingWindowFocus: floatingWindowFocus,
            navigatorKey: navigatorKey,
          ),
        ],
      ),
    );
  }
}

class _ShowHideProductButton extends HookWidget {
  const _ShowHideProductButton({
    required this.showProducts,
  });
  final ValueNotifier<bool> showProducts;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;
    useValueListenable(showProducts);
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 3),
      child: AppIconButton.secondary(
        tooltip: showProducts.value
            ? l10n.gen_show_entity(ppL10n.product)
            : l10n.gen_hide_entity(ppL10n.product),
        onPressed: () {
          showProducts.value = !showProducts.value;
        },
        iconData: showProducts.value ? Icons.visibility : Icons.visibility_off,
      ),
    );
  }
}
