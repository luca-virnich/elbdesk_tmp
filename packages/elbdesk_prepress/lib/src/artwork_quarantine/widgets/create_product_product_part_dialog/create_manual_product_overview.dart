part of 'create_product_product_dialog.dart';

class _CreateManualProductOverview extends HookConsumerWidget {
  const _CreateManualProductOverview({
    required this.customerId,
    required this.salesOrderId,
    required this.sessionId,
    required this.selectedSerienIndexNotifier,
    required this.selectedProductMasterNotifier,
    required this.navigatorKey,
    required this.pageController,
    required this.selectedArtworkTemplateNotifier,
    required this.selectedArtworkTypeNotifier,
    required this.selectedPrintProcessTypeNotifier,
    required this.selectedLayerIdNotifier,
    required this.selectedProductTypeNotifier,
    required this.isLoading,
  });
  final int customerId;
  final int salesOrderId;
  final String sessionId;
  final ValueNotifier<int> selectedSerienIndexNotifier;
  final ValueNotifier<Product?> selectedProductMasterNotifier;
  final GlobalKey<NavigatorState> navigatorKey;
  final PageController pageController;
  final ValueNotifier<ArtworkTemplate?> selectedArtworkTemplateNotifier;
  final ValueNotifier<ArtworkType?> selectedArtworkTypeNotifier;
  final ValueNotifier<ArtworkPrintProcessType?>
      selectedPrintProcessTypeNotifier;
  final ValueNotifier<int?> selectedLayerIdNotifier;
  final ValueNotifier<ProductType> selectedProductTypeNotifier;
  final ValueNotifier<bool> isLoading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useValueListenable(selectedLayerIdNotifier);

    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;
    return LayoutBuilder(
      builder: (context, constraints) {
        return ListViewWithFooter(
          footer: Padding(
            padding: const EdgeInsets.only(right: UiConstants.defaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppButton.secondary(
                  onPressed: () {
                    pageController.previousPage(
                      duration: AnimationConstants.shortDuration,
                      curve: AnimationConstants.defaultCurve,
                    );
                  },
                  label: l10n.gen_back,
                ),
                AppApplyButton(
                  isLoading: isLoading.value,
                  onPressed: isLoading.value
                      ? null
                      : () async {
                          isLoading.value = true;
                          final (:success, :data, :exception) =
                              await AsyncHandler.handleAsyncOperation<int>(
                            context,
                            () => ref
                                .read(productRepositoryProvider)
                                .createManually(
                                  sessionId: sessionId,
                                  salesOrderId: salesOrderId,
                                  customerId: customerId,
                                  productType:
                                      selectedProductTypeNotifier.value,
                                  serienId: selectedProductMasterNotifier
                                      .value?.serienId,
                                  serienIndex:
                                      selectedSerienIndexNotifier.value,
                                  artworkType:
                                      selectedArtworkTypeNotifier.value!,
                                  printProcessType:
                                      selectedPrintProcessTypeNotifier.value!,
                                  layerId: selectedLayerIdNotifier.value!,
                                  artworkTemplateId:
                                      selectedArtworkTemplateNotifier
                                          .value!.meta.id!,
                                ),
                          );
                          if (success) {
                            if (context.mounted) {
                              AppNotificationOverlay.success(
                                context,
                                l10n.gen_create_entity(
                                  ppL10n.product_singular,
                                ),
                                navigatorKey: navigatorKey,
                              );

                              Navigator.of(context).pop(data);
                            }
                          }
                          if (context.mounted) {
                            isLoading.value = false;
                          }
                        },
                  label: l10n.gen_create,
                ),
              ],
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.only(right: UiConstants.defaultPadding),
              child: CardSectionTitle(
                title: l10n.gen_summary,
              ),
            ),
            ElbTwoColumnWrap(
              width: constraints.maxWidth,
              readOnly: true,
              validationGroupId: null,
              customL10n: ppL10n,
              columnLeft: [
                if (selectedProductMasterNotifier.value == null)
                  ElbTwoColumnItem.text(
                    field: ProductFields.fromEnum(
                      ProductField.serienIdString,
                    ),
                    readOnly: true,
                    onChanged: (p0) {},
                    initialValue: ppL10n.product_new_series,
                  ),
                if (selectedProductMasterNotifier.value != null)
                  ElbTwoColumnItem.text(
                    field: ProductFields.fromEnum(
                      ProductField.productId,
                    ),
                    readOnly: true,
                    onChanged: (p0) {},
                    initialValue:
                        selectedProductMasterNotifier.value!.productId,
                  ),
                if (selectedProductMasterNotifier.value != null)
                  ElbTwoColumnItem.integer(
                    field: ProductFields.fromEnum(
                      ProductField.serienIndex,
                    ),
                    readOnly: true,
                    onChanged: (v) {},
                    initialValue: selectedSerienIndexNotifier.value,
                  ),
                ElbTwoColumnItem.text(
                  field: ProductFields.fromEnum(
                    ProductField.description,
                  ),
                  readOnly: true,
                  onChanged: (p0) {},
                  initialValue:
                      selectedArtworkTemplateNotifier.value?.description ?? '',
                ),
              ],
              columnRight: [
                ElbTwoColumnItem.text(
                  field: ProductFields.fromEnum(
                    ProductField.printProcessType,
                  ),
                  readOnly: true,
                  onChanged: (p0) {},
                  initialValue: selectedPrintProcessTypeNotifier.value
                          ?.readable(ppL10n) ??
                      '',
                ),
                ElbTwoColumnItem.text(
                  field: ProductFields.fromEnum(
                    ProductField.productType,
                  ),
                  readOnly: true,
                  onChanged: (p0) {},
                  initialValue:
                      selectedProductTypeNotifier.value.readable(ppL10n),
                ),
                if (selectedProductTypeNotifier.value == ProductType.multilayer)
                  ElbTwoColumnItem.text(
                    field: ArtworkLayerFields.fromEnum(
                      ArtworkLayerField.id,
                    ),
                    readOnly: true,
                    onChanged: (p0) {},
                    initialValue: selectedLayerIdNotifier.value == 0
                        ? l10n.bearer_singular
                        : selectedLayerIdNotifier.value.toString(),
                  ),
                ElbTwoColumnItem.text(
                  field: ArtworkFields.fromEnum(
                    ArtworkField.artworkType,
                  ),
                  readOnly: true,
                  onChanged: (p0) {},
                  initialValue:
                      selectedArtworkTypeNotifier.value?.readable(ppL10n) ?? '',
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
