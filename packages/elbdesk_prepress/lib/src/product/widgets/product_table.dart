import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine/widgets/create_product_product_part_dialog/create_product_product_dialog.dart';
import 'package:elbdesk_prepress/src/product/config/product_fields.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

enum _Type {
  selectForSalesOrder,
  standard,
  all,
  selectSeries,
}

class ProductTable extends HookConsumerWidget {
  const ProductTable({
    required this.customerId,
    required int this.salesOrderId,
    required this.navigatorKey,
    required this.componentIdentifier,
    required this.dataProvider,
    this.onSelect,
    this.isCollapsible = true,
    this.trailingActions,
    this.toolbarPadding = EdgeInsets.zero,
    super.key,
    this.readOnly = false,
    this.fixedTableName,
  })  : showTableViews = false,
        showTableName = false,
        isResizable = false,
        floatingWindowId = null,
        floatingWindowFocus = null,
        isSortable = false,
        showToolbarDivider = true,
        selfGrowable = false,
        _type = _Type.standard;

  const ProductTable.selectForSalesOrder({
    required this.salesOrderId,
    required this.customerId,
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.componentIdentifier,
    required this.dataProvider,
    this.isCollapsible = false,
    this.trailingActions,
    super.key,
    this.onSelect,
    this.toolbarPadding = EdgeInsets.zero,
  })  : showTableViews = false,
        showTableName = false,
        isResizable = false,
        isSortable = false,
        showToolbarDivider = true,
        selfGrowable = false,
        fixedTableName = null,
        readOnly = false,
        _type = _Type.selectForSalesOrder;

  const ProductTable.all({
    required this.dataProvider,
    required this.componentIdentifier,
    required this.navigatorKey,
    this.trailingActions,
    this.onSelect,
    this.selfGrowable = true,
    this.isCollapsible = true,
    this.toolbarPadding =
        const EdgeInsets.only(right: UiConstants.tableCardToolbarPadding),
    super.key,
  })  : showTableViews = false,
        showTableName = false,
        isResizable = false,
        isSortable = false,
        salesOrderId = null,
        showToolbarDivider = true,
        customerId = null,
        floatingWindowId = null,
        floatingWindowFocus = null,
        fixedTableName = null,
        readOnly = false,
        _type = _Type.all;

  const ProductTable.selectSeries({
    required this.dataProvider,
    required this.componentIdentifier,
    required this.customerId,
    required int this.salesOrderId,
    required this.navigatorKey,
    this.trailingActions,
    this.isCollapsible = false,
    this.fixedTableName,
    this.onSelect,
    this.toolbarPadding = EdgeInsets.zero,
    super.key,
  })  : showTableViews = false,
        floatingWindowId = null,
        floatingWindowFocus = null,
        showTableName = false,
        isResizable = false,
        isSortable = false,
        showToolbarDivider = true,
        selfGrowable = true,
        readOnly = false,
        _type = _Type.selectSeries;

  final bool readOnly;
  final int? customerId;

  final bool showTableViews;
  final bool showTableName;
  final bool isSortable;
  final GlobalKey<NavigatorState>? navigatorKey;
  final bool isResizable;
  final String? floatingWindowId;
  final FocusNode? floatingWindowFocus;
  final String? fixedTableName;

  final bool selfGrowable;
  final bool showToolbarDivider;

  final int? salesOrderId;
  final _Type _type;
  final ComponentIdentifier componentIdentifier;
  final bool isCollapsible;

  final List<Widget>? trailingActions;

  final void Function(Product)? onSelect;
  final ProviderListenable<AsyncValue<List<Product>>> Function(
    String sessionId,
  ) dataProvider;

  final EdgeInsetsGeometry toolbarPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;

    final fixedTableTitle = fixedTableName ?? ppL10n.product_plural;

    return AppTableView<Product, ProductField>(
      tableDefaultNamePlural: ppL10n.product_plural,
      tableViewIdentifier: componentIdentifier.name,
      isCollapsible: isCollapsible,
      isHighlightable: onSelect != null,
      isResizable: isResizable,
      isSortable: isSortable,
      selfGrowable: selfGrowable,
      toolbarPadding: toolbarPadding,
      quickSearchFilterFields:
          ProductField.values.quickSearchFilters(l10n, ppL10n),
      fixedTableTitle: fixedTableTitle,
      showToolbarDivider: showToolbarDivider,
      hiddenFilterGroup: null,
      showTableViews: showTableViews,
      availableFilterFieldsWithLabels:
          ProductField.values.filters(l10n, ppL10n),
      availableTableColumnsWithLabels:
          !showTableViews ? null : ProductField.values.columns(l10n, ppL10n),
      toolbarTrailingActions: (sessionId) => [
        if (_type == _Type.selectForSalesOrder)
          _AddProductButton(
            tableSessionId: sessionId,
            navigatorKey: navigatorKey!,
            salesOrderId: salesOrderId!,
            customerId: customerId!,
            floatingWindowId: floatingWindowId!,
            floatingWindowFocus: floatingWindowFocus!,
          ),
        ...(trailingActions ?? []),
      ],
      defaultTableConfig: ProductFields.defaultTableColumns,
      tableDensity: AppTableDensity.compact,
      dataProvider: dataProvider,
      fieldFromKey: (fieldKey) => ProductFields.fromFieldKey(fieldKey).value,
      buildCellTitle: (field) =>
          ProductFields.fromEnum(field).readable(l10n, ppL10n),
      getTitleAlignment: (field) => ProductFields.fromEnum(field).cellAlignment,
      onRowTap: onSelect,
      buildCell: (field, item) {
        return switch (field) {
          ProductField.serienIdString => switch (_type) {
              _Type.selectForSalesOrder => AppTableCellOpenInNew(
                  item.fullProductId,
                  onPressed: () {
                    ref.openWindow(
                      FloatingProductMasterWindowData(
                        productMasterId: item.productMasterId!,
                      ),
                    );
                  },
                ),
              _ => AppTableCellText(item.fullProductId),
            },
          ProductField.artworks => AppTableCellText(
              item.artworks.length.toString(),
            ),
          ProductField.keywords => AppTableCellText(item.keywords),
          ProductField.description => AppTableCellText(item.description),
          _ => const SizedBox.shrink()
        };
      },
    );
  }
}

class _AddProductButton extends HookConsumerWidget {
  const _AddProductButton({
    required this.tableSessionId,
    required this.navigatorKey,
    required this.salesOrderId,
    required this.customerId,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
  });

  final String tableSessionId;
  final int salesOrderId;
  final int customerId;
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;
    return AppButton.primary(
      onPressed: () async {
        final productId = await showElbDialog<int?>(
          context: context,
          child: CreateProductManualDialog(
            customerId: customerId,
            navigatorKey: navigatorKey,
            salesOrderId: salesOrderId,
            sessionId: tableSessionId,
            floatingWindowId: floatingWindowId,
            floatingWindowFocus: floatingWindowFocus,
          ),
        );

        if (productId != null && context.mounted) {
          Navigator.of(context).pop();
        }
      },
      tooltip: l10n.gen_add_entity(ppL10n.product_singular),
      iconData: AppIcons.add,
    );
  }
}
