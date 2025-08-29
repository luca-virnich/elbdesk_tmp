part of 'create_product_product_dialog.dart';

class _CreateProductOverview extends HookConsumerWidget {
  const _CreateProductOverview({
    required this.customerId,
    required this.salesOrderId,
    required this.artworkQuarantine,
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
  final ArtworkQuarantine artworkQuarantine;
  final ValueNotifier<int> selectedSerienIndexNotifier;
  final ValueNotifier<Product?> selectedProductMasterNotifier;
  final GlobalKey<NavigatorState> navigatorKey;
  final PageController pageController;
  final ValueNotifier<ArtworkTemplate?> selectedArtworkTemplateNotifier;
  final ValueNotifier<ArtworkType?> selectedArtworkTypeNotifier;
  final ValueNotifier<ArtworkPrintProcessType?>
      selectedPrintProcessTypeNotifier;
  final ValueNotifier<int?> selectedLayerIdNotifier;
  final ValueNotifier<ProductType?> selectedProductTypeNotifier;
  final ValueNotifier<bool> isLoading;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useValueListenable(selectedLayerIdNotifier);

    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;
    final suffixColor =
        context.appTheme.generalColors.onBackground.withAppOpacity(0.5);
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
                  label: ppL10n.artwork_back,
                ),
                AppApplyButton(
                  isLoading: isLoading.value,
                  onPressed: isLoading.value
                      ? null
                      : () async {
                          isLoading.value = true;
                          final (:success, :data, :exception) =
                              await AsyncHandler.handleAsyncOperation<Product>(
                            context,
                            () => ref
                                .read(productRepositoryProvider)
                                .createProductFromArtworkQuarantineAndArtworkTemplate(
                                  serienId: selectedProductMasterNotifier
                                      .value?.serienId,
                                  layerId: selectedLayerIdNotifier.value!,
                                  serienIndex:
                                      selectedSerienIndexNotifier.value,
                                  printProcessType:
                                      selectedPrintProcessTypeNotifier.value!,
                                  productType:
                                      selectedProductTypeNotifier.value!,
                                  customerId: customerId,
                                  artworkTemplateId:
                                      selectedArtworkTemplateNotifier
                                          .value!.meta.id!,
                                  artworkQuarantineId:
                                      artworkQuarantine.meta.id!,
                                  salesOrderId: salesOrderId,
                                  types: [],
                                  artworkType:
                                      selectedArtworkTypeNotifier.value!,
                                ),
                          );
                          if (success) {
                            navigatorKey.currentState?.pop();
                            return;
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
                    onChanged: (value) {},
                    initialValue: ppL10n.product_new_series,
                  ),
                if (selectedProductMasterNotifier.value != null)
                  ElbTwoColumnItem.text(
                    field: ProductFields.fromEnum(
                      ProductField.productId,
                    ),
                    readOnly: true,
                    onChanged: (value) {},
                    initialValue:
                        selectedProductMasterNotifier.value!.productId,
                  ),
                if (selectedProductMasterNotifier.value != null)
                  ElbTwoColumnItem.integer(
                    field: ProductFields.fromEnum(
                      ProductField.serienIndex,
                    ),
                    readOnly: true,
                    onChanged: (value) {},
                    initialValue: selectedSerienIndexNotifier.value,
                  ),
                ElbTwoColumnItem.text(
                  field: ArtworkTemplateFields.fromEnum(
                    ArtworkTemplateField.description,
                  ),
                  readOnly: true,
                  onChanged: (value) {},
                  initialValue:
                      selectedArtworkTemplateNotifier.value?.description ?? '',
                ),
                ElbTwoColumnWrapCustomItem<ElbPrepressLocalizations>(
                  label: '',
                  childBuilder: (labelPosition) {
                    return // Dimensions
                        NextCardMultiField(
                      label: ppL10n.artwork_dimensions,
                      labelPosition: labelPosition,
                      fields: [
                        NextCardFormField.double(
                          showLabel: false,
                          initialDouble:
                              artworkQuarantine.artworkData.width ?? 0.0,
                          labelPosition: labelPosition,
                          readOnly: true,
                          label: ppL10n.artwork_width,
                          suffix: AppText(
                            l10n.gen_unit_mm,
                            color: suffixColor,
                          ),
                          onChanged: (value) {},
                          validationGroup: null,
                        ),
                        NextCardFormField.double(
                          initialDouble:
                              artworkQuarantine.artworkData.height ?? 0.0,
                          labelPosition: labelPosition,
                          readOnly: true,
                          label: ppL10n.artwork_height,
                          suffix: AppText(
                            l10n.gen_unit_mm,
                            color: suffixColor,
                          ),
                          showLabel: false,
                          onChanged: (value) {},
                          validationGroup: null,
                        ),
                      ],
                    );
                  },
                ),
              ],
              columnRight: [
                ElbTwoColumnItem.text(
                  field: ProductFields.fromEnum(
                    ProductField.printProcessType,
                  ),
                  readOnly: true,
                  onChanged: (value) {},
                  initialValue: selectedPrintProcessTypeNotifier.value
                          ?.readable(ppL10n) ??
                      '',
                ),
                ElbTwoColumnItem.text(
                  field: ProductFields.fromEnum(
                    ProductField.productType,
                  ),
                  readOnly: true,
                  onChanged: (value) {},
                  initialValue:
                      selectedProductTypeNotifier.value?.readable(ppL10n) ?? '',
                ),
                if (selectedProductTypeNotifier.value == ProductType.multilayer)
                  ElbTwoColumnItem.text(
                    field: ArtworkLayerFields.fromEnum(
                      ArtworkLayerField.id,
                    ),
                    readOnly: true,
                    onChanged: (value) {},
                    initialValue:
                        selectedLayerIdNotifier.value?.toString() ?? '',
                  ),
                ElbTwoColumnItem.text(
                  field: ArtworkFields.fromEnum(
                    ArtworkField.artworkType,
                  ),
                  readOnly: true,
                  onChanged: (value) {},
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
