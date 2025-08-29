import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

class ProductTableCard extends ConsumerWidget {
  const ProductTableCard({
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.componentIdentifier,
    required this.floatingWindowType,
    this.isCollapsible = true,
    super.key,
  });
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  final ComponentIdentifier componentIdentifier;
  final String floatingWindowType;
  final bool isCollapsible;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ppL10n = context.prepressL10n;
    return CustomCard(
      floatingWindowType: floatingWindowType,
      floatingWindowFocus: floatingWindowFocus,
      baseTitle: ppL10n.product_plural,
      iconData: AppIcons.product,
      floatingWindowId: floatingWindowId,
      childBuilder: (
        context,
        selectedNavIndexRef,
        navigatorKey,
      ) {
        return FloatingCardBody(
          floatingWindowType: FloatingWindowType.productTable.name,
          isFirstRun: true,
          floatingWindowId: floatingWindowId,
          navigatorKey: navigatorKey,
          children: [
            CardBodyItem(
              child: TableCardItem(
                table: ProductTable.all(
                  isCollapsible: isCollapsible,
                  selfGrowable: false,
                  navigatorKey: navigatorKey,
                  componentIdentifier: componentIdentifier,
                  dataProvider: (sessionId) => findMasterProductsProvider(
                    sessionId,
                  ),
                  onSelect: (product) {
                    ref.openWindow(
                      FloatingProductMasterWindowData(
                        productMasterId: product.productMasterId!,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
