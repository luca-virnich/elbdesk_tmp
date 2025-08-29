import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

class AddProductToSalesOrderDialog extends ConsumerWidget {
  const AddProductToSalesOrderDialog({
    required this.navigatorKey,
    required this.floatingWindowFocus,
    required this.floatingWindowId,
    required this.customerId,
    required this.salesOrderId,
    super.key,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final FocusNode floatingWindowFocus;
  final String floatingWindowId;
  final int customerId;
  final int salesOrderId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;
    return ElbDialog(
      floatingWindowId: floatingWindowId,
      title: l10n.gen_add_entity(ppL10n.product_plural),
      child: ProductTable.selectForSalesOrder(
        navigatorKey: navigatorKey,
        salesOrderId: salesOrderId,
        componentIdentifier:
            ComponentIdentifier.productTableAddProductToSalesOrderDialog,
        isCollapsible: false,
        customerId: customerId,
        floatingWindowId: floatingWindowId,
        floatingWindowFocus: floatingWindowFocus,
        onSelect: (product) async {
          final (:success, :data, :exception) =
              await AsyncHandler.handleAsyncOperation(
            context,
            () => ref
                .read(productRepositoryProvider)
                .addExistingProductToSalesOrder(
                  productMasterId: product.meta.id!,
                  salesOrderId: salesOrderId,
                ),
          );

          if (success) {
            navigatorKey.currentState?.pop();
          }
        },
        dataProvider: (sessionId) => findMasterProductsByCustomerProvider(
          customerId,
          sessionId,
        ),
      ),
    );
  }
}
