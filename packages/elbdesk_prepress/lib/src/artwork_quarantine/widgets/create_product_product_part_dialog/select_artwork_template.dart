part of 'create_product_product_dialog.dart';

class _SelectArtworkTemplate extends StatelessWidget {
  const _SelectArtworkTemplate({
    required this.selectedTemplateNotifier,
    required this.pageController,
    required this.customerId,
  });
  final ValueNotifier<ArtworkTemplate?> selectedTemplateNotifier;
  final PageController pageController;
  final int customerId;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;
    return Padding(
      padding: const EdgeInsets.only(right: UiConstants.defaultPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ArtworkTemplateTable.fromSalesOrder(
              dataProvider: (sessionId) =>
                  findArtworkTemplatesByCustomerProvider(
                customerId,
                sessionId,
                includeGeneralTemplates: true,
              ),
              componentIdentifier:
                  ComponentIdentifier.artworkTemplateTableFromSalesOrder,
              isCollapsible: false,
              fixedTableName: ppL10n.artwork_template_select,
              toolbarTrailingActions: null,
              onSelect: (artworkTemplate) {
                selectedTemplateNotifier.value = artworkTemplate;
                pageController.nextPage(
                  duration: AnimationConstants.shortDuration,
                  curve: AnimationConstants.defaultCurve,
                );
              },
            ),
          ),
          const SizedBox(height: UiConstants.defaultPadding),
          Align(
            alignment: Alignment.centerLeft,
            child: AppButton.secondary(
              label: l10n.gen_back,
              onPressed: () {
                pageController.previousPage(
                  duration: AnimationConstants.shortDuration,
                  curve: AnimationConstants.defaultCurve,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
