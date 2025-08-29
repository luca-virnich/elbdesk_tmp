part of 'create_product_product_dialog.dart';

class _CreateProductPartOverview extends HookConsumerWidget {
  const _CreateProductPartOverview({
    required this.customerId,
    required this.salesOrderId,
    required this.artworkQuarantine,
    required this.selectedProductNotifier,
    required this.navigatorKey,
    required this.pageController,
    required this.selectedArtworkTemplateNotifier,
    required this.selectedArtworkTypeNotifier,
    required this.selectedLayerIdNotifier,
    required this.selectedPrintProcessTypeNotifier,
    required this.isLoadingNotifier,
  });
  final int customerId;
  final int salesOrderId;

  final ArtworkQuarantine artworkQuarantine;
  final ValueNotifier<Product?> selectedProductNotifier;
  final GlobalKey<NavigatorState> navigatorKey;
  final PageController pageController;
  final ValueNotifier<ArtworkTemplate?> selectedArtworkTemplateNotifier;
  final ValueNotifier<ArtworkType?> selectedArtworkTypeNotifier;
  final ValueNotifier<ArtworkPrintProcessType?>
      selectedPrintProcessTypeNotifier;
  final ValueNotifier<int?> selectedLayerIdNotifier;

  final ValueNotifier<bool> isLoadingNotifier;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useValueListenable(selectedLayerIdNotifier);
    useValueListenable(selectedArtworkTypeNotifier);
    useValueListenable(selectedProductNotifier);

    final serienIndex = selectedProductNotifier.value!.serienIndex;

    final productPartId = selectedProductNotifier.value!.fullProductPartId(
      selectedArtworkTypeNotifier.value!,
      selectedLayerIdNotifier.value!,
    );

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
                  label: ppL10n.artwork_back,
                ),
                _CreateProductPartFromQuarantineButton(
                  isLoadingNotifier: isLoadingNotifier,
                  selectedLayerIdNotifier: selectedLayerIdNotifier,
                  serienIndex: serienIndex,
                  selectedPrintProcessTypeNotifier:
                      selectedPrintProcessTypeNotifier,
                  customerId: customerId,
                  selectedArtworkTemplateNotifier:
                      selectedArtworkTemplateNotifier,
                  artworkQuarantineId: artworkQuarantine.meta.id!,
                  salesOrderId: salesOrderId,
                  selectedProductNotifier: selectedProductNotifier,
                  selectedArtworkTypeNotifier: selectedArtworkTypeNotifier,
                  navigatorKey: navigatorKey,
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
                ElbTwoColumnItem.text(
                  field: ProductFields.fromEnum(
                    ProductField.productId,
                  ),
                  readOnly: true,
                  onChanged: (value) {},
                  initialValue: selectedProductNotifier.value!.fullProductId,
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
                ElbTwoColumnItem.text(
                  field: ProductFields.fromEnum(
                    ProductField.productPartId,
                  ),
                  readOnly: true,
                  onChanged: (value) {},
                  initialValue: productPartId,
                ),
              ],
              columnRight: [
                ElbTwoColumnItem.text(
                  field: ArtworkLayerFields.fromEnum(
                    ArtworkLayerField.id,
                  ),
                  readOnly: true,
                  onChanged: (value) {},
                  initialValue: selectedLayerIdNotifier.value == 0
                      ? l10n.bearer_singular
                      : selectedLayerIdNotifier.value?.toString() ?? '',
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

class _CreateProductPartFromQuarantineButton extends HookConsumerWidget {
  const _CreateProductPartFromQuarantineButton({
    required this.isLoadingNotifier,
    required this.selectedLayerIdNotifier,
    required this.serienIndex,
    required this.selectedPrintProcessTypeNotifier,
    required this.customerId,
    required this.selectedArtworkTemplateNotifier,
    required this.artworkQuarantineId,
    required this.salesOrderId,
    required this.selectedProductNotifier,
    required this.selectedArtworkTypeNotifier,
    required this.navigatorKey,
  });

  final ValueNotifier<bool> isLoadingNotifier;
  final ValueNotifier<int?> selectedLayerIdNotifier;
  final int serienIndex;
  final ValueNotifier<ArtworkPrintProcessType?>
      selectedPrintProcessTypeNotifier;
  final int customerId;
  final ValueNotifier<ArtworkTemplate?> selectedArtworkTemplateNotifier;
  final int artworkQuarantineId;
  final int salesOrderId;
  final ValueNotifier<Product?> selectedProductNotifier;
  final ValueNotifier<ArtworkType?> selectedArtworkTypeNotifier;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return AppButton.primary(
      isLoading: isLoadingNotifier.value,
      onPressed: isLoadingNotifier.value
          ? null
          : () async {
              isLoadingNotifier.value = true;
              final (:success, :data, :exception) =
                  await AsyncHandler.handleAsyncOperation<Product>(
                context,
                () => ref
                    .read(productRepositoryProvider)
                    .createProductPartFromArtworkQuarantineAndTemplate(
                      layerId: selectedLayerIdNotifier.value!,
                      serienIndex: serienIndex,
                      printProcessType: selectedPrintProcessTypeNotifier.value!,
                      customerId: customerId,
                      artworkTemplateId:
                          selectedArtworkTemplateNotifier.value!.meta.id!,
                      artworkQuarantineId: artworkQuarantineId,
                      salesOrderId: salesOrderId,
                      types: [],
                      productId: selectedProductNotifier.value!.meta.id!,
                      artworkType: selectedArtworkTypeNotifier.value!,
                    ),
              );

              if (!success && context.mounted) {
                isLoadingNotifier.value = false;
                return;
              }
              // * Don't delete this
              // final artworkId = data!.artworks
              //     .firstWhere(
              //       (artwork) =>
              //           artwork.artworkQuarantineId == artworkQuarantineId,
              //     )
              //     .meta
              //     .id;

              // ref.read(floatingWindowDataStateProvider.notifier).addWindow(
              //       FloatingArtworkWindowData(
              //         artworkId: artworkId,
              //         customerId: customerId,
              //       ),
              //     );
              if (context.mounted) {
                navigatorKey.currentState?.pop();
              }
            },
      label: l10n.gen_create,
    );
  }
}
