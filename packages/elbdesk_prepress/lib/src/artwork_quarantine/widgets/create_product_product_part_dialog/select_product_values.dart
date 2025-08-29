part of 'create_product_product_dialog.dart';

class _SelectProductValues extends HookConsumerWidget {
  const _SelectProductValues({
    required this.artworkTypeNotifier,
    required this.pageController,
    required this.printProcessTypeNotifier,
    required this.productTypeNotifier,
    required this.layerIdNotifier,
    required this.customerId,
    required this.salesOrderId,
    required this.isLoading,
  });
  final ValueNotifier<ArtworkPrintProcessType?> printProcessTypeNotifier;
  final ValueNotifier<ProductType?> productTypeNotifier;
  final ValueNotifier<int?> layerIdNotifier;
  final ValueNotifier<bool> isLoading;
  final PageController pageController;

  final ValueNotifier<ArtworkType?> artworkTypeNotifier;

  final int customerId;
  final int salesOrderId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final layersToShow = useState<int>(3);
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;
    useValueListenable(printProcessTypeNotifier);
    useValueListenable(productTypeNotifier);
    useValueListenable(layerIdNotifier);
    useValueListenable(artworkTypeNotifier);

    final canContinue = printProcessTypeNotifier.value != null &&
        productTypeNotifier.value != null &&
        artworkTypeNotifier.value != null &&
        layerIdNotifier.value != null;

    return ListViewWithFooter(
      isFooterFixed: true,
      childrenPadding: const EdgeInsets.only(right: UiConstants.defaultPadding),
      footer: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(right: UiConstants.defaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppButton.secondary(
                label: l10n.gen_back,
                onPressed: isLoading.value
                    ? null
                    : () {
                        pageController.previousPage(
                          duration: AnimationConstants.shortDuration,
                          curve: AnimationConstants.defaultCurve,
                        );
                      },
              ),
              AppButton.primary(
                label: l10n.gen_next,
                onPressed: !canContinue
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
      ),
      children: [
        CardSectionTitle(title: ppL10n.artwork_print_process),
        AppWrap(
          alignment: WrapAlignment.start,
          children: [
            for (final e in ArtworkPrintProcessType.values.ordered)
              AppButton.checkbox(
                label: e.readable(ppL10n),
                onSelected: (selected) {
                  printProcessTypeNotifier.value = e;
                },
                isSelected: printProcessTypeNotifier.value == e,
              ),
          ],
        ),
        const CardSectionDivider(),
        if (printProcessTypeNotifier.value != null) ...[
          CardSectionTitle(title: ppL10n.product_type),
          AppWrap(
            alignment: WrapAlignment.start,
            children: [
              for (final e in ProductType.values.ordered)
                AppButton.checkbox(
                  label: e.readable(ppL10n),
                  onSelected: (selected) {
                    productTypeNotifier.value = e;
                    if (e != ProductType.multilayer) {
                      layerIdNotifier.value = 1;
                    }
                  },
                  isSelected: productTypeNotifier.value == e,
                ),
            ],
          ),
        ],
        if (productTypeNotifier.value == ProductType.multilayer) ...[
          const CardSectionDivider(),
          CardSectionTitle(title: 'Layer'.fixed),
          AppWrap(
            alignment: WrapAlignment.start,
            children: [
              for (int i = 1; i <= layersToShow.value; i++)
                AppButton.checkbox(
                  label: 'Layer $i'.fixed,
                  onSelected: (selected) {
                    layerIdNotifier.value = i;
                  },
                  isSelected: layerIdNotifier.value == i,
                ),
              AppIconButton.secondary(
                tooltip: l10n.gen_add_entity(ppL10n.layer),
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
        ],
        if (productTypeNotifier.value != null) ...[
          const CardSectionDivider(),
          CardSectionTitle(title: ppL10n.artwork_front_back),
          _SelectArtworkType(artworkTypeNotifier: artworkTypeNotifier),
        ],
      ],
    );
  }
}
