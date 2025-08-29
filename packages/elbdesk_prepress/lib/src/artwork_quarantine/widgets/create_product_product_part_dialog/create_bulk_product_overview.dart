part of 'create_product_product_dialog.dart';

/// Bulk Create Product Overview Page
///
/// Last page in the Bulk creation of products
/// Used to display all settings and the selected quarantines
class _CreateBulkProductOverview extends HookConsumerWidget {
  const _CreateBulkProductOverview({
    required this.isLoading,
    required this.selectedLayerIdNotifier,
    required this.customerId,
    required this.salesOrderId,
    required this.selectedQuarantinesNotifier,
    required this.selectedSerienIndexNotifier,
    required this.selectedProductMasterNotifier,
    required this.pageController,
    required this.selectedArtworkTemplateNotifier,
    required this.selectedArtworkTypeNotifier,
    required this.selectedPrintProcessTypeNotifier,
    required this.selectedProductTypeNotifier,
  });

  final ValueNotifier<bool> isLoading;
  final ValueNotifier<int?> selectedLayerIdNotifier;
  final int customerId;
  final int salesOrderId;
  final ValueNotifier<Set<ArtworkQuarantine>> selectedQuarantinesNotifier;
  final ValueNotifier<int> selectedSerienIndexNotifier;
  final ValueNotifier<Product?> selectedProductMasterNotifier;

  final PageController pageController;
  final ValueNotifier<ArtworkTemplate?> selectedArtworkTemplateNotifier;
  final ValueNotifier<ArtworkType?> selectedArtworkTypeNotifier;
  final ValueNotifier<ArtworkPrintProcessType?>
      selectedPrintProcessTypeNotifier;
  final ValueNotifier<ProductType?> selectedProductTypeNotifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;
    useValueListenable(selectedQuarantinesNotifier);
    useValueListenable(selectedLayerIdNotifier);

    // Individual index management for each quarantine
    final quarantineIndicesNotifier =
        useValueNotifier<Map<ArtworkQuarantine, int>>(
      Map.fromEntries(
        selectedQuarantinesNotifier.value.map(
          (quarantine) => MapEntry(
            quarantine,
            selectedSerienIndexNotifier.value +
                selectedQuarantinesNotifier.value.toList().indexOf(quarantine),
          ),
        ),
      ),
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        return ListViewWithFooter(
          isFooterFixed: true,
          footer: Padding(
            padding: const EdgeInsets.only(
              top: AppSpace.m,
              right: UiConstants.defaultPadding,
            ),
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
                _ApplyBulkCreationProductButton(
                  isLoading: isLoading,
                  selectedQuarantinesNotifier: selectedQuarantinesNotifier,
                  quarantineIndicesNotifier: quarantineIndicesNotifier,
                  selectedSerienIndexNotifier: selectedSerienIndexNotifier,
                  customerId: customerId,
                  selectedArtworkTemplateNotifier:
                      selectedArtworkTemplateNotifier,
                  salesOrderId: salesOrderId,
                  selectedArtworkTypeNotifier: selectedArtworkTypeNotifier,
                  selectedLayerIdNotifier: selectedLayerIdNotifier,
                  selectedPrintProcessTypeNotifier:
                      selectedPrintProcessTypeNotifier,
                  selectedProductTypeNotifier: selectedProductTypeNotifier,
                  selectedProductMasterNotifier: selectedProductMasterNotifier,
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
                    onChanged: (p0) {},
                    initialValue:
                        selectedProductMasterNotifier.value!.productId,
                  ),
                ElbTwoColumnItem.integer(
                  field: ProductFields.fromEnum(
                    ProductField.serienIndex,
                  ),
                  readOnly: true,
                  onChanged: (p0) {},
                  initialValue: selectedSerienIndexNotifier.value,
                ),
                ElbTwoColumnItem.text(
                  field: ArtworkTemplateFields.fromEnum(
                    ArtworkTemplateField.description,
                  ),
                  readOnly: true,
                  onChanged: (p0) {},
                  initialValue:
                      selectedArtworkTemplateNotifier.value?.description ?? '',
                ),
              ],
              columnRight: [
                ElbTwoColumnItem.text(
                  field: ArtworkFields.fromEnum(
                    ArtworkField.printProcessType,
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
                      selectedProductTypeNotifier.value?.readable(ppL10n) ?? '',
                ),
                if (selectedProductTypeNotifier.value == ProductType.multilayer)
                  ElbTwoColumnItem.integer(
                    field: ArtworkLayerFields.fromEnum(
                      ArtworkLayerField.id,
                    ),
                    readOnly: true,
                    onChanged: (p0) {},
                    initialValue: selectedLayerIdNotifier.value,
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
            Padding(
              padding: const EdgeInsets.only(right: UiConstants.defaultPadding),
              child: CardSectionTitle(
                title: 'Ausgewählte Artwork Quarantänen '
                        '(${selectedQuarantinesNotifier.value.length})'
                    .hc,
              ),
            ),
            ...selectedQuarantinesNotifier.value.map((quarantine) {
              final index = selectedQuarantinesNotifier.value
                  .toList()
                  .indexOf(quarantine);
              return Padding(
                padding:
                    const EdgeInsets.only(right: UiConstants.defaultPadding),
                child: ArtworkQuarantineOverviewTile.chooseIndex(
                  artworkQuarantine: quarantine,
                  index: index,
                  displayIndex: quarantineIndicesNotifier.value[quarantine] ??
                      selectedSerienIndexNotifier.value + index,
                  onIndexChanged: (newIndex) {
                    final currentIndices = Map<ArtworkQuarantine, int>.from(
                      quarantineIndicesNotifier.value,
                    );
                    currentIndices[quarantine] = newIndex;
                    quarantineIndicesNotifier.value = currentIndices;
                  },
                ),
              );
            }),
          ],
        );
      },
    );
  }
}

class _ApplyBulkCreationProductButton extends ConsumerWidget {
  const _ApplyBulkCreationProductButton({
    required this.isLoading,
    required this.selectedQuarantinesNotifier,
    required this.quarantineIndicesNotifier,
    required this.selectedSerienIndexNotifier,
    required this.customerId,
    required this.selectedArtworkTemplateNotifier,
    required this.salesOrderId,
    required this.selectedArtworkTypeNotifier,
    required this.selectedLayerIdNotifier,
    required this.selectedPrintProcessTypeNotifier,
    required this.selectedProductTypeNotifier,
    required this.selectedProductMasterNotifier,
  });

  final ValueNotifier<bool> isLoading;
  final ValueNotifier<Set<ArtworkQuarantine>> selectedQuarantinesNotifier;
  final ValueNotifier<Map<ArtworkQuarantine, int>> quarantineIndicesNotifier;
  final ValueNotifier<int> selectedSerienIndexNotifier;
  final int customerId;
  final ValueNotifier<ArtworkTemplate?> selectedArtworkTemplateNotifier;
  final int salesOrderId;
  final ValueNotifier<ArtworkType?> selectedArtworkTypeNotifier;
  final ValueNotifier<int?> selectedLayerIdNotifier;
  final ValueNotifier<ArtworkPrintProcessType?>
      selectedPrintProcessTypeNotifier;
  final ValueNotifier<ProductType?> selectedProductTypeNotifier;
  final ValueNotifier<Product?> selectedProductMasterNotifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    // Validation function for indices
    String? validateIndices() {
      final indices = quarantineIndicesNotifier.value.values.toList();

      // Check if indices are unique
      if (indices.length != indices.toSet().length) {
        return 'Indizes müssen eindeutig sein'.hc;
      }

      return null;
    }

    return AppApplyButton(
      isLoading: isLoading.value,
      onPressed: isLoading.value
          ? null
          : () async {
              isLoading.value = true;

              final (:success, :data, :exception) =
                  await AsyncHandler.handleAsyncOperation<void>(
                context,
                () async {
                  // Validate indices
                  final validationError = validateIndices();
                  if (validationError != null) {
                    throw ElbException(
                      exceptionType: ElbExceptionType.validationFieldError,
                      message: validationError,
                    );
                  }
                  final productRepository = ref.read(productRepositoryProvider);
                  final selectedQuarantines = selectedQuarantinesNotifier.value;

                  // Prepare quarantines with indices for bulk
                  // creation
                  final quarantinesWithIndices =
                      selectedQuarantines.map((quarantine) {
                    final index = quarantineIndicesNotifier.value[quarantine] ??
                        selectedSerienIndexNotifier.value;
                    return (
                      artworkQuarantineId: quarantine.meta.id!,
                      serienIndex: index,
                    );
                  }).toList();

                  await productRepository
                      .createBulkProductFromArtworkQuarantineAndArtworkTemplate(
                    customerId: customerId,
                    artworkTemplateId:
                        selectedArtworkTemplateNotifier.value!.meta.id!,
                    salesOrderId: salesOrderId,
                    types: [],
                    artworkType: selectedArtworkTypeNotifier.value!,
                    layerId: selectedLayerIdNotifier.value!,
                    printProcessType: selectedPrintProcessTypeNotifier.value!,
                    productType: selectedProductTypeNotifier.value!,
                    serienId: selectedProductMasterNotifier.value?.serienId,
                    quarantinesWithIndices: quarantinesWithIndices,
                  );
                },
              );

              if (!success && context.mounted) {
                isLoading.value = false;
                return;
              }

              if (context.mounted) {
                Navigator.of(context).pop(true);
              }
            },
      label: l10n.gen_create,
    );
  }
}
