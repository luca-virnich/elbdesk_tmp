part of 'create_product_product_dialog.dart';

/// Bulk Create Product Part Overview Page
///
/// Last page in the Bulk creation of products
/// Used to display all settings and the selected quarantines
class _CreateBulkProductPartOverview extends HookConsumerWidget {
  const _CreateBulkProductPartOverview({
    required this.isLoading,
    required this.selectedPrintProcessTypeNotifier,
    required this.selectedLayerIdNotifier,
    required this.customerId,
    required this.salesOrderId,
    required this.selectedQuarantinesNotifier,
    required this.selectedProductNotifier,
    required this.navigatorKey,
    required this.pageController,
    required this.selectedArtworkTemplateNotifier,
    required this.selectedArtworkTypeNotifier,
  });

  final ValueNotifier<bool> isLoading;
  final ValueNotifier<ArtworkPrintProcessType?>
      selectedPrintProcessTypeNotifier;
  final ValueNotifier<int> selectedLayerIdNotifier;
  final int customerId;
  final int salesOrderId;
  final ValueNotifier<Set<ArtworkQuarantine>> selectedQuarantinesNotifier;
  final ValueNotifier<Product?> selectedProductNotifier;
  final GlobalKey<NavigatorState> navigatorKey;
  final PageController pageController;
  final ValueNotifier<ArtworkTemplate?> selectedArtworkTemplateNotifier;
  final ValueNotifier<ArtworkType> selectedArtworkTypeNotifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;
    useValueListenable(selectedQuarantinesNotifier);
    useValueListenable(selectedLayerIdNotifier);
    useValueListenable(selectedArtworkTypeNotifier);
    useValueListenable(selectedProductNotifier);

    // Individual index management for each quarantine
    final quarantineIndicesNotifier =
        useValueNotifier<Map<ArtworkQuarantine, int>>(
      Map.fromEntries(
        selectedQuarantinesNotifier.value.map(
          (quarantine) => MapEntry(
            quarantine,
            1 + selectedQuarantinesNotifier.value.toList().indexOf(quarantine),
          ),
        ),
      ),
    );

    final productPartId = selectedProductNotifier.value!.fullProductPartId(
      selectedArtworkTypeNotifier.value,
      selectedLayerIdNotifier.value,
    );

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
                _ApplyBulkCreationProductPartButton(
                  isLoading: isLoading,
                  selectedQuarantinesNotifier: selectedQuarantinesNotifier,
                  quarantineIndicesNotifier: quarantineIndicesNotifier,
                  customerId: customerId,
                  selectedArtworkTemplateNotifier:
                      selectedArtworkTemplateNotifier,
                  salesOrderId: salesOrderId,
                  selectedProductNotifier: selectedProductNotifier,
                  selectedArtworkTypeNotifier: selectedArtworkTypeNotifier,
                  selectedLayerIdNotifier: selectedLayerIdNotifier,
                  selectedPrintProcessTypeNotifier:
                      selectedPrintProcessTypeNotifier,
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
                  onChanged: (p0) {},
                  initialValue: selectedProductNotifier.value!.fullProductId,
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
                ElbTwoColumnItem.text(
                  field: ProductFields.fromEnum(
                    ProductField.productPartId,
                  ),
                  readOnly: true,
                  onChanged: (p0) {},
                  initialValue: productPartId,
                ),
              ],
              columnRight: [
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
                      selectedArtworkTypeNotifier.value.readable(ppL10n),
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
                  displayIndex:
                      quarantineIndicesNotifier.value[quarantine] ?? 1 + index,
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

class _ApplyBulkCreationProductPartButton extends ConsumerWidget {
  const _ApplyBulkCreationProductPartButton({
    required this.isLoading,
    required this.selectedQuarantinesNotifier,
    required this.quarantineIndicesNotifier,
    required this.customerId,
    required this.selectedArtworkTemplateNotifier,
    required this.salesOrderId,
    required this.selectedProductNotifier,
    required this.selectedArtworkTypeNotifier,
    required this.selectedLayerIdNotifier,
    required this.selectedPrintProcessTypeNotifier,
  });

  final ValueNotifier<bool> isLoading;
  final ValueNotifier<Set<ArtworkQuarantine>> selectedQuarantinesNotifier;
  final ValueNotifier<Map<ArtworkQuarantine, int>> quarantineIndicesNotifier;
  final int customerId;
  final ValueNotifier<ArtworkTemplate?> selectedArtworkTemplateNotifier;
  final int salesOrderId;
  final ValueNotifier<Product?> selectedProductNotifier;
  final ValueNotifier<ArtworkType> selectedArtworkTypeNotifier;
  final ValueNotifier<int> selectedLayerIdNotifier;
  final ValueNotifier<ArtworkPrintProcessType?>
      selectedPrintProcessTypeNotifier;

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

                  for (final quarantine in selectedQuarantines) {
                    final index =
                        quarantineIndicesNotifier.value[quarantine] ?? 1;
                    await productRepository
                        .createProductPartFromArtworkQuarantineAndTemplate(
                      customerId: customerId,
                      artworkTemplateId:
                          selectedArtworkTemplateNotifier.value!.meta.id!,
                      artworkQuarantineId: quarantine.meta.id!,
                      salesOrderId: salesOrderId,
                      types: [], // Empty types for bulk creation
                      productId: selectedProductNotifier.value!.meta.id!,
                      artworkType: selectedArtworkTypeNotifier.value,
                      layerId: selectedLayerIdNotifier.value,
                      serienIndex: index,
                      printProcessType: selectedPrintProcessTypeNotifier.value!,
                    );
                  }
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
