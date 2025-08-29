part of 'create_product_product_dialog.dart';

class _SelectProductForProductPart extends HookWidget {
  const _SelectProductForProductPart({
    required this.isLoadingNotifier,
    required this.pageController,
    required this.navigatorKey,
    required this.customerId,
    required this.salesOrderId,
    required this.selectedProductNotifier,
    required this.selectedPrintProcessTypeNotifier,
  });

  final PageController pageController;
  final GlobalKey<NavigatorState> navigatorKey;
  final int customerId;
  final int salesOrderId;
  final ValueNotifier<Product?> selectedProductNotifier;
  final ValueNotifier<bool> isLoadingNotifier;
  final ValueNotifier<ArtworkPrintProcessType?>
      selectedPrintProcessTypeNotifier;
  @override
  Widget build(BuildContext context) {
    final ppL10n = context.prepressL10n;
    useValueListenable(isLoadingNotifier);
    return SmallAppLoadingOverlay(
      isLoading: isLoadingNotifier.value,
      child: Padding(
        padding: const EdgeInsets.only(right: UiConstants.defaultPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Consumer(
                builder: (context, ref, child) {
                  return ProductTable(
                    componentIdentifier:
                        ComponentIdentifier.productTableSelectProductPart,
                    isCollapsible: false,
                    fixedTableName: ppL10n.product_select,
                    customerId: customerId,
                    salesOrderId: salesOrderId,
                    navigatorKey: navigatorKey,
                    dataProvider: (sessionId) =>
                        findProductsBySalesOrderIdWithMultiLayerProvider(
                      salesOrderId,
                      sessionId,
                    ),
                    onSelect: isLoadingNotifier.value
                        ? null
                        : (product) async {
                            isLoadingNotifier.value = true;

                            final (:success, :exception, :data) =
                                await AsyncHandler.handleAsyncOperation(
                              context,
                              () => ref
                                  .read(productRepositoryProvider)
                                  .fetchById(product.meta.id!),
                            );
                            if (success) {
                              selectedProductNotifier.value = data;
                              final printProcessType =
                                  data!.artworks.first.printProcessType;
                              selectedPrintProcessTypeNotifier.value =
                                  printProcessType;

                              await pageController.nextPage(
                                duration: AnimationConstants.shortDuration,
                                curve: AnimationConstants.defaultCurve,
                              );
                              isLoadingNotifier.value = false;
                            } else {
                              isLoadingNotifier.value = false;
                            }
                          },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
