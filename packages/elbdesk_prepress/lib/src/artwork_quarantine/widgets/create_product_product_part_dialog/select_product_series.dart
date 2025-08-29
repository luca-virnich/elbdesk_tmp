part of 'create_product_product_dialog.dart';

class _SelectProductSerie extends HookConsumerWidget {
  const _SelectProductSerie({
    required this.isLoading,
    required this.selectedSerienIndexNotifier,
    required this.pageController,
    required this.customerId,
    required this.salesOrderId,
    required this.selectedProductMasterNotifier,
    required this.printProcessTypeNotifier,
    required this.productTypeNotifier,
    required this.layerIdNotifier,
    required this.artworkTypeNotifier,
    required this.showBackButton,
    required this.floatingWindowId,
  });
  final ValueNotifier<int> selectedSerienIndexNotifier;
  final PageController pageController;

  final int customerId;
  final int salesOrderId;
  final ValueNotifier<Product?> selectedProductMasterNotifier;
  final ValueNotifier<bool> isLoading;
  final ValueNotifier<ArtworkPrintProcessType?> printProcessTypeNotifier;
  final ValueNotifier<ProductType?> productTypeNotifier;
  final ValueNotifier<int?> layerIdNotifier;
  final ValueNotifier<ArtworkType?> artworkTypeNotifier;
  final bool showBackButton;
  final String floatingWindowId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;
    final navigatorKey = ref.watch(windowNavigatorProvider(floatingWindowId));

    return SmallAppLoadingOverlay(
      isLoading: isLoading.value,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Consumer(
              builder: (context, ref, child) {
                return ProductTable.selectSeries(
                  navigatorKey: navigatorKey,
                  trailingActions: [
                    AppButton.primary(
                      label: null,
                      iconData: AppIcons.add,
                      tooltip: ppL10n.product_new_series,
                      onPressed: isLoading.value
                          ? null
                          : () {
                              selectedProductMasterNotifier.value = null;
                              selectedSerienIndexNotifier.value = 1;
                              pageController.nextPage(
                                duration: AnimationConstants.shortDuration,
                                curve: AnimationConstants.defaultCurve,
                              );
                            },
                    ),
                  ],
                  componentIdentifier:
                      ComponentIdentifier.productTableSelectProductSeries,
                  isCollapsible: false,
                  fixedTableName: ppL10n.product_series_select,
                  customerId: customerId,
                  salesOrderId: salesOrderId,
                  dataProvider: (sessionId) =>
                      findMasterProductsByCustomerProvider(
                    customerId,
                    sessionId,
                  ),
                  onSelect: isLoading.value
                      ? null
                      : (productMaster) async {
                          isLoading.value = true;

                          final (:success, :data, :exception) =
                              await AsyncHandler.handleAsyncOperation<int>(
                            context,
                            () => ref
                                .read(productRepositoryProvider)
                                .fetchNextSerienIndex(productMaster.serienId),
                          );
                          if (success && context.mounted) {
                            selectedProductMasterNotifier.value = productMaster;
                            selectedSerienIndexNotifier.value = data!;

                            isLoading.value = false;

                            // set the product values
                            printProcessTypeNotifier.value =
                                productMaster.printProcessType;

                            productTypeNotifier.value =
                                productMaster.productType;

                            if (productMaster.productType ==
                                ProductType.multilayer) {
                              layerIdNotifier.value = null;
                              artworkTypeNotifier.value = null;
                            } else if (productMaster.productType ==
                                ProductType.kit) {
                              layerIdNotifier.value = 1;
                              artworkTypeNotifier.value = null;
                            } else {
                              layerIdNotifier.value = 1;
                              artworkTypeNotifier.value =
                                  productMaster.artworks.first.artworkType;
                            }

                            await pageController.nextPage(
                              duration: AnimationConstants.shortDuration,
                              curve: AnimationConstants.defaultCurve,
                            );
                          }
                          if (context.mounted) {
                            isLoading.value = false;
                          }
                        },
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppButton.secondary(
                // This is either a back or a cancel button
                // Depends on which dialog it is used in
                label: showBackButton ? l10n.gen_back : l10n.gen_cancel,
                onPressed: !showBackButton
                    ? () {
                        Navigator.of(context).pop();
                      }
                    : isLoading.value
                        ? null
                        : () {
                            pageController.previousPage(
                              duration: AnimationConstants.shortDuration,
                              curve: AnimationConstants.defaultCurve,
                            );
                          },
              ),
              AppButton.primary(
                label: ppL10n.product_new_series,
                onPressed: isLoading.value
                    ? null
                    : () {
                        selectedProductMasterNotifier.value = null;
                        selectedSerienIndexNotifier.value = 1;
                        pageController.nextPage(
                          duration: AnimationConstants.shortDuration,
                          curve: AnimationConstants.defaultCurve,
                        );
                      },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
