part of 'create_product_product_dialog.dart';

class _SelectProductPartValues extends HookConsumerWidget {
  const _SelectProductPartValues({
    required this.artworkTypeNotifier,
    required this.pageController,
    required this.navigatorKey,
    required this.layerIdNotifier,
    required this.isLoadingNotifier,
    required this.customerId,
    required this.salesOrderId,
    required this.selectedProductNotifier,
    required this.selectedPrintProcessTypeNotifier,
  });

  final ValueNotifier<int?> layerIdNotifier;

  final PageController pageController;
  final GlobalKey<NavigatorState> navigatorKey;
  final ValueNotifier<ArtworkType> artworkTypeNotifier;
  final ValueNotifier<bool> isLoadingNotifier;
  final ValueNotifier<Product?> selectedProductNotifier;
  final int customerId;
  final int salesOrderId;
  final ValueNotifier<ArtworkPrintProcessType?>
      selectedPrintProcessTypeNotifier;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final layersToShow = useState<int>(3);
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;
    final artworks = selectedProductNotifier.value?.artworks ?? [];

    useValueListenable(layerIdNotifier);
    useValueListenable(selectedPrintProcessTypeNotifier);
    useValueListenable(artworkTypeNotifier);

    final selectedLayer = layerIdNotifier.value;
    final selectedFrontBack = artworkTypeNotifier.value;
    // check if the selected layer and front back are not in the artworks
    final isAlreadyInArtworks = artworks.any(
      (artwork) =>
          artwork.layerId == selectedLayer &&
          artwork.artworkType == selectedFrontBack,
    );

    return ListViewWithFooter(
      isFooterFixed: true,
      childrenPadding: const EdgeInsets.only(right: UiConstants.defaultPadding),
      footer: Padding(
        padding: const EdgeInsets.only(right: UiConstants.defaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: AppButton.secondary(
                label: l10n.gen_back,
                onPressed: isLoadingNotifier.value
                    ? null
                    : () {
                        pageController.previousPage(
                          duration: AnimationConstants.shortDuration,
                          curve: AnimationConstants.defaultCurve,
                        );
                      },
              ),
            ),
            AppButton.primary(
              label: l10n.gen_next,
              onPressed: isAlreadyInArtworks
                  ? null
                  : () {
                      pageController.nextPage(
                        duration: AnimationConstants.shortDuration,
                        curve: AnimationConstants.defaultCurve,
                      );
                    },
            ),
          ],
        ),
      ),
      children: [
        CardSectionTitle(title: ppL10n.artwork_assigned_artworks),
        AppWrap(
          alignment: WrapAlignment.start,
          spacing: AppSpace.l,
          runSpacing: AppSpace.m,
          children: [
            for (final artwork in artworks)
              ArtworkListItem(
                artwork: artwork,
                customerId: customerId,
                product: selectedProductNotifier.value,
              ),
          ],
        ),
        const CardSectionDivider(),
        CardSectionTitle(
          title: ppL10n.artwork_print_process,
        ),
        AppWrap(
          alignment: WrapAlignment.start,
          children: [
            for (final e in ArtworkPrintProcessType.values.ordered)
              AppButton.checkbox(
                label: e.readable(ppL10n),
                onSelected: (selected) {
                  selectedPrintProcessTypeNotifier.value = e;
                },
                isSelected: selectedPrintProcessTypeNotifier.value == e,
              ),
          ],
        ),
        const CardSectionDivider(),
        CardSectionTitle(title: ppL10n.layer),
        AppWrap(
          alignment: WrapAlignment.start,
          children: [
            for (int i = 1; i <= layersToShow.value; i++)
              AppButton.checkbox(
                label: '${ppL10n.layer} $i',
                onSelected: (selected) {
                  layerIdNotifier.value = i;
                },
                isSelected: layerIdNotifier.value == i,
              ),
            AppIconButton.secondary(
              tooltip: l10n.gen_add,
              iconData: AppIcons.add,
              onPressed: () {
                layersToShow.value = layersToShow.value + 5;
              },
            ),
            AppButton.checkbox(
              label: ppL10n.support,
              onSelected: (selected) {
                layerIdNotifier.value = 0;
              },
              isSelected: layerIdNotifier.value == 0,
            ),
          ],
        ),
        const CardSectionDivider(),
        CardSectionTitle(title: ppL10n.artwork_front_back),
        _SelectArtworkType(artworkTypeNotifier: artworkTypeNotifier),
      ],
    );
  }
}
