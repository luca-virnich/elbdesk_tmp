import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork/config/artwork_fields.dart';
import 'package:elbdesk_prepress/src/artwork/extensions/artwork_print_process_type_ext.dart';
import 'package:elbdesk_prepress/src/artwork/extensions/artwork_type_ext.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine/widgets/create_product_product_part_dialog/artwork_quarantine_overview_tile.dart';
import 'package:elbdesk_prepress/src/artwork_shared/config/artwork_layer_fields.dart';
import 'package:elbdesk_prepress/src/artwork_template/config/artwork_template_fields.dart';
import 'package:elbdesk_prepress/src/artwork_template/logic/artwork_template_provider.dart';
import 'package:elbdesk_prepress/src/product/config/product_fields.dart';
import 'package:elbdesk_prepress/src/product/extensions/product_type_extension.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:elbdesk_window_manager/elbdesk_window_manager.dart';
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

part 'create_bulk_product_overview.dart';
part 'create_bulk_product_part_overview.dart';
part 'create_manual_product_overview.dart';
part 'create_product_overview.dart';
part 'create_product_part_overview.dart';
part 'select_artwork_template.dart';
part 'select_product_for_product_part.dart';
part 'select_product_part_values.dart';
part 'select_product_series.dart';
part 'select_product_values.dart';

class SalesOrderItemTypesFromArtworkQuarantine {
  SalesOrderItemTypesFromArtworkQuarantine({
    required this.types,
    required this.artworkTemplate,
    required this.artworkType,
    required this.product,
  });
  final List<SalesOrderItemType> types;
  final ArtworkTemplate artworkTemplate;
  final ArtworkType artworkType;
  final Product? product;
}

class CreateProductDialog extends HookWidget {
  const CreateProductDialog({
    required this.customerId,
    required this.salesOrderId,
    required this.artworkQuarantine,
    required this.floatingWindowFocus,
    required this.navigatorKey,
    required this.floatingWindowId,
    super.key,
  });
  final int customerId;
  final int salesOrderId;
  final FocusNode floatingWindowFocus;
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;
  final ArtworkQuarantine artworkQuarantine;

  @override
  Widget build(BuildContext context) {
    final ppL10n = context.prepressL10n;
    final pageController = usePageController();

    final selectedTemplateNotifier = useValueNotifier<ArtworkTemplate?>(null);
    final selectedLayerIdNotifier = useValueNotifier<int?>(1);
    final selectedSerienIndexNotifier = useValueNotifier<int>(1);
    final selectedProductTypeNotifier = useValueNotifier<ProductType?>(
      artworkQuarantine.general.productType,
    );
    final selectedPrintProcessTypeNotifier =
        useValueNotifier<ArtworkPrintProcessType?>(
      artworkQuarantine.general.printProcessType,
    );
    final selectedProductMasterNotifier = useValueNotifier<Product?>(null);

    final artworkTypeNotifier =
        useValueNotifier<ArtworkType?>(artworkQuarantine.general.type);
    final isLoading = useState<bool>(false);

    return ElbDialog(
      isSelfScrollable: true,
      blockShortcuts: isLoading.value,
      title: ppL10n.artwork_quarantine_create_product,
      contentPadding:
          const EdgeInsets.all(UiConstants.defaultPadding).copyWith(right: 0),
      floatingWindowId: floatingWindowId,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxHeight = constraints.maxHeight.clamp(0.0, 500.0);
          return SizedBox(
            height: maxHeight,
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              children: [
                _SelectProductSerie(
                  floatingWindowId: floatingWindowId,
                  isLoading: isLoading,
                  selectedSerienIndexNotifier: selectedSerienIndexNotifier,
                  pageController: pageController,
                  customerId: customerId,
                  selectedProductMasterNotifier: selectedProductMasterNotifier,
                  printProcessTypeNotifier: selectedPrintProcessTypeNotifier,
                  productTypeNotifier: selectedProductTypeNotifier,
                  layerIdNotifier: selectedLayerIdNotifier,
                  artworkTypeNotifier: artworkTypeNotifier,
                  salesOrderId: salesOrderId,
                  showBackButton: false,
                ),
                _SelectProductValues(
                  customerId: customerId,
                  salesOrderId: salesOrderId,
                  artworkTypeNotifier: artworkTypeNotifier,
                  printProcessTypeNotifier: selectedPrintProcessTypeNotifier,
                  productTypeNotifier: selectedProductTypeNotifier,
                  layerIdNotifier: selectedLayerIdNotifier,
                  pageController: pageController,
                  isLoading: isLoading,
                ),
                _SelectArtworkTemplate(
                  selectedTemplateNotifier: selectedTemplateNotifier,
                  pageController: pageController,
                  customerId: customerId,
                ),
                _CreateProductOverview(
                  isLoading: isLoading,
                  selectedLayerIdNotifier: selectedLayerIdNotifier,
                  customerId: customerId,
                  salesOrderId: salesOrderId,
                  artworkQuarantine: artworkQuarantine,
                  selectedSerienIndexNotifier: selectedSerienIndexNotifier,
                  selectedProductMasterNotifier: selectedProductMasterNotifier,
                  navigatorKey: navigatorKey,
                  pageController: pageController,
                  selectedArtworkTemplateNotifier: selectedTemplateNotifier,
                  selectedArtworkTypeNotifier: artworkTypeNotifier,
                  selectedPrintProcessTypeNotifier:
                      selectedPrintProcessTypeNotifier,
                  selectedProductTypeNotifier: selectedProductTypeNotifier,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CreateProductPartDialog extends HookWidget {
  const CreateProductPartDialog({
    required this.customerId,
    required this.salesOrderId,
    required this.artworkQuarantine,
    required this.floatingWindowFocus,
    required this.navigatorKey,
    required this.floatingWindowId,
    super.key,
  });
  final int customerId;
  final int salesOrderId;
  final FocusNode floatingWindowFocus;
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;
  final ArtworkQuarantine artworkQuarantine;

  @override
  Widget build(BuildContext context) {
    final ppL10n = context.prepressL10n;
    final pageController = usePageController();

    final selectedTemplateNotifier = useValueNotifier<ArtworkTemplate?>(null);
    final selectedLayerIdNotifier = useValueNotifier<int>(1);

    final selectedProductNotifier = useValueNotifier<Product?>(null);

    final artworkTypeNotifier = useValueNotifier<ArtworkType>(
      artworkQuarantine.general.type ?? ArtworkType.front,
    );
    final isLoadingNotifier = useState<bool>(false);
    final selectedPrintProcessTypeNotifier =
        useValueNotifier<ArtworkPrintProcessType?>(
      artworkQuarantine.general.printProcessType,
    );

    return ElbDialog(
      isSelfScrollable: true,
      blockShortcuts: isLoadingNotifier.value,
      title: ppL10n.artwork_quarantine_add_to_product,
      isLoading: isLoadingNotifier.value,
      floatingWindowId: floatingWindowId,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxHeight = constraints.maxHeight.clamp(0.0, 500.0);
          return SizedBox(
            height: maxHeight,
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              children: [
                _SelectProductForProductPart(
                  isLoadingNotifier: isLoadingNotifier,
                  pageController: pageController,
                  navigatorKey: navigatorKey,
                  customerId: customerId,
                  selectedProductNotifier: selectedProductNotifier,
                  salesOrderId: salesOrderId,
                  selectedPrintProcessTypeNotifier:
                      selectedPrintProcessTypeNotifier,
                ),
                _SelectProductPartValues(
                  selectedPrintProcessTypeNotifier:
                      selectedPrintProcessTypeNotifier,
                  customerId: customerId,
                  salesOrderId: salesOrderId,
                  isLoadingNotifier: isLoadingNotifier,
                  artworkTypeNotifier: artworkTypeNotifier,
                  layerIdNotifier: selectedLayerIdNotifier,
                  pageController: pageController,
                  navigatorKey: navigatorKey,
                  selectedProductNotifier: selectedProductNotifier,
                ),
                _SelectArtworkTemplate(
                  selectedTemplateNotifier: selectedTemplateNotifier,
                  pageController: pageController,
                  customerId: customerId,
                ),
                _CreateProductPartOverview(
                  isLoadingNotifier: isLoadingNotifier,
                  selectedPrintProcessTypeNotifier:
                      selectedPrintProcessTypeNotifier,
                  selectedLayerIdNotifier: selectedLayerIdNotifier,
                  customerId: customerId,
                  salesOrderId: salesOrderId,
                  artworkQuarantine: artworkQuarantine,
                  selectedProductNotifier: selectedProductNotifier,
                  navigatorKey: navigatorKey,
                  pageController: pageController,
                  selectedArtworkTemplateNotifier: selectedTemplateNotifier,
                  selectedArtworkTypeNotifier: artworkTypeNotifier,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/// Bulk Create Product Dialog
class CreateBulkProductDialog extends HookWidget {
  const CreateBulkProductDialog({
    required this.customerId,
    required this.salesOrderId,
    required this.artworkQuarantines,
    required this.floatingWindowId,
    super.key,
  });
  final int customerId;
  final int salesOrderId;
  final List<ArtworkQuarantine> artworkQuarantines;

  final String floatingWindowId;

  @override
  Widget build(BuildContext context) {
    final ppL10n = context.prepressL10n;
    final pageController = usePageController();

    final preselectedProductType =
        artworkQuarantines.firstOrNull?.general.productType;
    final preselectedPrintProcessType =
        artworkQuarantines.firstOrNull?.general.printProcessType;

    final selectedTemplateNotifier = useValueNotifier<ArtworkTemplate?>(null);
    final selectedLayerIdNotifier = useValueNotifier<int?>(1);
    final selectedSerienIndexNotifier = useValueNotifier<int>(1);
    final selectedProductTypeNotifier =
        useValueNotifier<ProductType?>(preselectedProductType);
    final selectedPrintProcessTypeNotifier =
        useValueNotifier<ArtworkPrintProcessType?>(preselectedPrintProcessType);
    final selectedProductMasterNotifier = useValueNotifier<Product?>(null);

    final artworkTypeNotifier = useValueNotifier<ArtworkType?>(
      artworkQuarantines.firstOrNull?.general.type ?? ArtworkType.front,
    );
    final isLoadingNotifier = useState<bool>(false);

    // Selected quarantines - initially all selected
    final selectedQuarantinesNotifier =
        useValueNotifier<Set<ArtworkQuarantine>>(
      Set.from(artworkQuarantines),
    );

    return ElbDialog(
      isSelfScrollable: true,
      title: ppL10n.artwork_quarantine_create_product,
      isLoading: isLoadingNotifier.value,
      floatingWindowId: floatingWindowId,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxHeight = constraints.maxHeight.clamp(0.0, 500.0);
          return SizedBox(
            height: maxHeight,
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              children: [
                _SelectArtworkQuarantines(
                  artworkQuarantines: artworkQuarantines,
                  selectedQuarantinesNotifier: selectedQuarantinesNotifier,
                  pageController: pageController,
                ),
                _SelectProductSerie(
                  isLoading: isLoadingNotifier,
                  selectedSerienIndexNotifier: selectedSerienIndexNotifier,
                  pageController: pageController,
                  floatingWindowId: floatingWindowId,
                  customerId: customerId,
                  selectedProductMasterNotifier: selectedProductMasterNotifier,
                  printProcessTypeNotifier: selectedPrintProcessTypeNotifier,
                  productTypeNotifier: selectedProductTypeNotifier,
                  layerIdNotifier: selectedLayerIdNotifier,
                  artworkTypeNotifier: artworkTypeNotifier,
                  salesOrderId: salesOrderId,
                  showBackButton: true,
                ),
                _SelectProductValues(
                  customerId: customerId,
                  salesOrderId: salesOrderId,
                  artworkTypeNotifier: artworkTypeNotifier,
                  printProcessTypeNotifier: selectedPrintProcessTypeNotifier,
                  productTypeNotifier: selectedProductTypeNotifier,
                  layerIdNotifier: selectedLayerIdNotifier,
                  pageController: pageController,
                  isLoading: isLoadingNotifier,
                ),
                _SelectArtworkTemplate(
                  selectedTemplateNotifier: selectedTemplateNotifier,
                  pageController: pageController,
                  customerId: customerId,
                ),
                _CreateBulkProductOverview(
                  isLoading: isLoadingNotifier,
                  selectedLayerIdNotifier: selectedLayerIdNotifier,
                  customerId: customerId,
                  salesOrderId: salesOrderId,
                  selectedQuarantinesNotifier: selectedQuarantinesNotifier,
                  selectedSerienIndexNotifier: selectedSerienIndexNotifier,
                  selectedProductMasterNotifier: selectedProductMasterNotifier,
                  pageController: pageController,
                  selectedArtworkTemplateNotifier: selectedTemplateNotifier,
                  selectedArtworkTypeNotifier: artworkTypeNotifier,
                  selectedPrintProcessTypeNotifier:
                      selectedPrintProcessTypeNotifier,
                  selectedProductTypeNotifier: selectedProductTypeNotifier,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/// Bulk Create Product Part Dialog
class CreateBulkProductPartDialog extends HookWidget {
  const CreateBulkProductPartDialog({
    required this.customerId,
    required this.salesOrderId,
    required this.artworkQuarantines,
    required this.floatingWindowFocus,
    required this.navigatorKey,
    required this.floatingWindowId,
    super.key,
  });
  final int customerId;
  final int salesOrderId;
  final List<ArtworkQuarantine> artworkQuarantines;
  final FocusNode floatingWindowFocus;
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;

  @override
  Widget build(BuildContext context) {
    final ppL10n = context.prepressL10n;
    final pageController = usePageController();

    final selectedTemplateNotifier = useValueNotifier<ArtworkTemplate?>(null);
    final selectedLayerIdNotifier = useValueNotifier<int>(1);

    final selectedProductNotifier = useValueNotifier<Product?>(null);

    final artworkTypeNotifier = useValueNotifier<ArtworkType>(
      artworkQuarantines.firstOrNull?.general.type ?? ArtworkType.front,
    );
    final isLoading = useState<bool>(false);
    final selectedPrintProcessTypeNotifier =
        useValueNotifier<ArtworkPrintProcessType?>(
      artworkQuarantines.firstOrNull?.general.printProcessType,
    );

    // Selected quarantines - initially all selected
    final selectedQuarantinesNotifier =
        useValueNotifier<Set<ArtworkQuarantine>>(
      Set.from(artworkQuarantines),
    );

    return ElbDialog(
      isSelfScrollable: true,
      blockShortcuts: isLoading.value,
      isLoading: isLoading.value,
      title: ppL10n.artwork_quarantine_add_to_product,
      contentPadding:
          const EdgeInsets.all(UiConstants.defaultPadding).copyWith(right: 0),
      floatingWindowId: floatingWindowId,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxHeight = constraints.maxHeight.clamp(0.0, 500.0);
          return SizedBox(
            height: maxHeight,
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              children: [
                _SelectArtworkQuarantines(
                  artworkQuarantines: artworkQuarantines,
                  selectedQuarantinesNotifier: selectedQuarantinesNotifier,
                  pageController: pageController,
                ),
                _SelectProductForProductPart(
                  isLoadingNotifier: isLoading,
                  pageController: pageController,
                  navigatorKey: navigatorKey,
                  customerId: customerId,
                  selectedProductNotifier: selectedProductNotifier,
                  salesOrderId: salesOrderId,
                  selectedPrintProcessTypeNotifier:
                      selectedPrintProcessTypeNotifier,
                ),
                _SelectProductPartValues(
                  selectedPrintProcessTypeNotifier:
                      selectedPrintProcessTypeNotifier,
                  customerId: customerId,
                  salesOrderId: salesOrderId,
                  isLoadingNotifier: isLoading,
                  artworkTypeNotifier: artworkTypeNotifier,
                  layerIdNotifier: selectedLayerIdNotifier,
                  pageController: pageController,
                  navigatorKey: navigatorKey,
                  selectedProductNotifier: selectedProductNotifier,
                ),
                _SelectArtworkTemplate(
                  selectedTemplateNotifier: selectedTemplateNotifier,
                  pageController: pageController,
                  customerId: customerId,
                ),
                _CreateBulkProductPartOverview(
                  isLoading: isLoading,
                  selectedPrintProcessTypeNotifier:
                      selectedPrintProcessTypeNotifier,
                  selectedLayerIdNotifier: selectedLayerIdNotifier,
                  customerId: customerId,
                  salesOrderId: salesOrderId,
                  selectedQuarantinesNotifier: selectedQuarantinesNotifier,
                  selectedProductNotifier: selectedProductNotifier,
                  navigatorKey: navigatorKey,
                  pageController: pageController,
                  selectedArtworkTemplateNotifier: selectedTemplateNotifier,
                  selectedArtworkTypeNotifier: artworkTypeNotifier,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/// Manual Product Creation Dialog
class CreateProductManualDialog extends HookWidget {
  const CreateProductManualDialog({
    required this.customerId,
    required this.salesOrderId,
    required this.sessionId,
    required this.floatingWindowFocus,
    required this.navigatorKey,
    required this.floatingWindowId,
    super.key,
  });
  final int customerId;
  final int salesOrderId;
  final String sessionId;
  final FocusNode floatingWindowFocus;
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;
    final pageController = usePageController();

    final selectedTemplateNotifier = useValueNotifier<ArtworkTemplate?>(null);
    final selectedLayerIdNotifier = useValueNotifier<int>(1);
    final selectedSerienIndexNotifier = useValueNotifier<int>(1);
    final selectedProductTypeNotifier = useValueNotifier<ProductType>(
      ProductType.vorderseite,
    );
    final selectedPrintProcessTypeNotifier =
        useValueNotifier<ArtworkPrintProcessType>(
      ArtworkPrintProcessType.flexodruck,
    );
    final selectedProductMasterNotifier = useValueNotifier<Product?>(null);

    final artworkTypeNotifier =
        useValueNotifier<ArtworkType>(ArtworkType.front);
    final isLoading = useState<bool>(false);

    return ElbDialog(
      title: l10n.gen_create_entity(ppL10n.product_singular),
      blockShortcuts: isLoading.value,
      isLoading: isLoading.value,
      floatingWindowId: floatingWindowId,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxHeight = constraints.maxHeight.clamp(0.0, 500.0);

          return SizedBox(
            height: maxHeight,
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              children: [
                _SelectProductSerie(
                  isLoading: isLoading,
                  selectedSerienIndexNotifier: selectedSerienIndexNotifier,
                  pageController: pageController,
                  floatingWindowId: floatingWindowId,
                  customerId: customerId,
                  selectedProductMasterNotifier: selectedProductMasterNotifier,
                  printProcessTypeNotifier: selectedPrintProcessTypeNotifier,
                  productTypeNotifier: selectedProductTypeNotifier,
                  layerIdNotifier: selectedLayerIdNotifier,
                  artworkTypeNotifier: artworkTypeNotifier,
                  salesOrderId: salesOrderId,
                  showBackButton: false,
                ),
                _SelectProductValues(
                  customerId: customerId,
                  salesOrderId: salesOrderId,
                  artworkTypeNotifier: artworkTypeNotifier,
                  printProcessTypeNotifier: selectedPrintProcessTypeNotifier,
                  productTypeNotifier: selectedProductTypeNotifier,
                  layerIdNotifier: selectedLayerIdNotifier,
                  pageController: pageController,
                  isLoading: isLoading,
                ),
                _SelectArtworkTemplate(
                  selectedTemplateNotifier: selectedTemplateNotifier,
                  pageController: pageController,
                  customerId: customerId,
                ),
                _CreateManualProductOverview(
                  isLoading: isLoading,
                  selectedLayerIdNotifier: selectedLayerIdNotifier,
                  selectedSerienIndexNotifier: selectedSerienIndexNotifier,
                  customerId: customerId,
                  salesOrderId: salesOrderId,
                  sessionId: sessionId,
                  selectedProductMasterNotifier: selectedProductMasterNotifier,
                  navigatorKey: navigatorKey,
                  pageController: pageController,
                  selectedArtworkTemplateNotifier: selectedTemplateNotifier,
                  selectedArtworkTypeNotifier: artworkTypeNotifier,
                  selectedPrintProcessTypeNotifier:
                      selectedPrintProcessTypeNotifier,
                  selectedProductTypeNotifier: selectedProductTypeNotifier,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _SelectArtworkType extends HookWidget {
  const _SelectArtworkType({
    required this.artworkTypeNotifier,
  });
  final ValueNotifier<ArtworkType?> artworkTypeNotifier;

  @override
  Widget build(BuildContext context) {
    final ppL10n = context.prepressL10n;
    useValueListenable(artworkTypeNotifier);
    return AppWrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.start,
      children: [
        AppButton.checkbox(
          label: ppL10n.artwork_front,
          onSelected: (selected) {
            artworkTypeNotifier.value = ArtworkType.front;
          },
          isSelected: artworkTypeNotifier.value == ArtworkType.front,
        ),
        AppButton.checkbox(
          label: ppL10n.artwork_back,
          onSelected: (selected) {
            artworkTypeNotifier.value = ArtworkType.back;
          },
          isSelected: artworkTypeNotifier.value == ArtworkType.back,
        ),
      ],
    );
  }
}

/// Select Artwork Quarantines Page
class _SelectArtworkQuarantines extends HookWidget {
  const _SelectArtworkQuarantines({
    required this.artworkQuarantines,
    required this.selectedQuarantinesNotifier,
    required this.pageController,
  });

  final List<ArtworkQuarantine> artworkQuarantines;
  final ValueNotifier<Set<ArtworkQuarantine>> selectedQuarantinesNotifier;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;
    useValueListenable(selectedQuarantinesNotifier);

    return LayoutBuilder(
      builder: (context, constraints) {
        return ListViewWithFooter(
          isFooterFixed: true,
          footer: InWindowCardDialogFooter(
            leadingActions: [
              AppButton.secondary(
                label: l10n.gen_cancel,
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
            trailingActions: [
              AppButton.primary(
                label: l10n.gen_next,
                onPressed: selectedQuarantinesNotifier.value.isEmpty
                    ? null
                    : () {
                        pageController.nextPage(
                          duration: AnimationConstants.shortDuration,
                          curve: Curves.easeInOut,
                        );
                      },
              ),
            ],
          ),
          children: [
            Padding(
              padding: const EdgeInsets.only(right: UiConstants.defaultPadding),
              child: AppText(
                ppL10n.artwork_quarantine_create_product,
                style: context.appTheme.textStyles.h2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: UiConstants.defaultPadding),
              child: AppText(
                '${l10n.gen_choose_entity(ppL10n.artwork_quarantine_plural)}:',
                style: context.appTheme.textStyles.defaultText,
              ),
            ),
            const SizedBox(height: AppSpace.l),
            ...artworkQuarantines.asMap().entries.map((entry) {
              final index = entry.key;
              final quarantine = entry.value;
              final isSelected =
                  selectedQuarantinesNotifier.value.contains(quarantine);

              return Padding(
                padding:
                    const EdgeInsets.only(right: UiConstants.defaultPadding),
                child: ArtworkQuarantineOverviewTile.chooseQuarantine(
                  artworkQuarantine: quarantine,
                  index: index,
                  showCheckbox: true,
                  isSelected: isSelected,
                  onPressed: () {
                    if (isSelected) {
                      selectedQuarantinesNotifier.value =
                          selectedQuarantinesNotifier.value
                              .where((q) => q != quarantine)
                              .toSet();
                    } else {
                      selectedQuarantinesNotifier.value = {
                        ...selectedQuarantinesNotifier.value,
                        quarantine,
                      };
                    }
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
