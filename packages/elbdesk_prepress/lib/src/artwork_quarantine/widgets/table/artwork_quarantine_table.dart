import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/app_table_cell_artwork_colors.dart';
import 'package:elbdesk_prepress/src/artwork/extensions/artwork_print_process_type_ext.dart';
import 'package:elbdesk_prepress/src/artwork/extensions/artwork_type_ext.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine/config/artwork_quarantine_fields.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine/widgets/create_product_product_part_dialog/create_product_product_dialog.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/extensions/artwork_quarantine_status_extension.dart';
import 'package:elbdesk_prepress/src/product/extensions/product_type_extension.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

/// Possible types of the CoeColor Table
///

enum _Type {
  byCustomer,
  bySalesOrder,
  standard,
  byGroup,
}

/// CoeColor Table Widget
class ArtworkQuarantineTable extends HookConsumerWidget {
  /// Standard CoeColors constructor
  ArtworkQuarantineTable.standard({
    required this.componentIdentifier,
    super.key,
    this.initialFilter,
    this.navigatorKey,
    this.tableDensity = AppTableDensity.standard,
    this.readOnly = false,
    this.isCollapsible = true,
  })  : hiddenFilterGroup = null,
        customerId = null,
        salesOrderId = null,
        showTableViews = true,
        floatingWindowFocus = null,
        floatingWindowId = null,
        defaultTableConfig = ArtworkQuarantineFields.defaultTableColumns,
        showTableName = true,
        selfGrowable = false,
        toolbarTrailingActions = null,
        fixedTableName = null,
        isResizable = true,
        dataProvider = null,
        showToolbarDivider = false,
        showWhenEmpty = true,
        groupId = null,
        _type = _Type.standard;

  ArtworkQuarantineTable.byCustomer({
    required this.toolbarTrailingActions,
    required this.customerId,
    required this.navigatorKey,
    required this.floatingWindowFocus,
    required this.floatingWindowId,
    required this.componentIdentifier,
    super.key,
    this.initialFilter,
    this.fixedTableName,
    this.tableDensity = AppTableDensity.standard,
    this.readOnly = false,
    this.hiddenFilterGroup,
    this.isCollapsible = true,
  })  : showTableViews = false,
        salesOrderId = null,
        showTableName = true,
        defaultTableConfig = ArtworkQuarantineFields.customerTableColumns,
        selfGrowable = false,
        isResizable = false,
        showToolbarDivider = true,
        dataProvider = null,
        showWhenEmpty = true,
        groupId = null,
        _type = _Type.byCustomer;

  ArtworkQuarantineTable.bySalesOrder({
    required this.salesOrderId,
    required this.toolbarTrailingActions,
    required this.customerId,
    required this.navigatorKey,
    required this.floatingWindowFocus,
    required this.floatingWindowId,
    required this.componentIdentifier,
    super.key,
    this.initialFilter,
    this.fixedTableName,
    this.tableDensity = AppTableDensity.compact,
    this.readOnly = false,
    this.hiddenFilterGroup,
    this.isCollapsible = true,
  })  : showTableViews = false,
        showTableName = false,
        defaultTableConfig = ArtworkQuarantineFields.salesOrderTableColumns,
        selfGrowable = true,
        isResizable = false,
        showToolbarDivider = true,
        dataProvider = null,
        showWhenEmpty = false,
        groupId = null,
        _type = _Type.bySalesOrder;

  ArtworkQuarantineTable.byGroup({
    required this.groupId,
    required this.navigatorKey,
    required this.floatingWindowFocus,
    required this.floatingWindowId,
    required this.customerId,
    required this.salesOrderId,
    required this.componentIdentifier,
    required this.toolbarTrailingActions,
    super.key,
    this.initialFilter,
    this.tableDensity = AppTableDensity.minimal,
    this.readOnly = false,
    this.hiddenFilterGroup,
    this.dataProvider,
    this.isCollapsible = true,
  })  : showTableViews = false,
        fixedTableName = null,
        showTableName = false,
        defaultTableConfig =
            ArtworkQuarantineFields.salesOrderByGroupTableColumns,
        selfGrowable = true,
        isResizable = false,
        showToolbarDivider = false,
        showWhenEmpty = false,
        _type = _Type.byGroup;

  final FilterGroup? hiddenFilterGroup;
  final Filter? initialFilter;
  final AppTableDensity tableDensity;
  final bool isCollapsible;
  final bool readOnly;
  final int? customerId;
  final FocusNode? floatingWindowFocus;
  final String? floatingWindowId;
  final bool showTableViews;
  final bool showTableName;
  final String? fixedTableName;
  final bool selfGrowable;
  final List<Widget> Function(String sessionId)? toolbarTrailingActions;
  final List<TableFieldConfig> defaultTableConfig;
  final _Type _type;
  final bool isResizable;
  final GlobalKey<NavigatorState>? navigatorKey;
  final int? salesOrderId;
  final bool showToolbarDivider;
  final bool showWhenEmpty;
  final ComponentIdentifier componentIdentifier;
  final int? groupId;
  final ProviderListenable<AsyncValue<List<ArtworkQuarantine>>> Function(
    String,
  )? dataProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;
    final sessionId = useUuid();
    final artworkQuarantineDataProvider = switch (_type) {
      _Type.standard => findArtworkQuarantinesProvider(sessionId),
      _Type.byCustomer =>
        watchArtworkQuarantinesByCustomerProvider(customerId!),
      _Type.bySalesOrder =>
        watchArtworkQuarantinesByCustomerIdAndStatusProvider(
          customerId: customerId!,
          status: ArtworkQuarantineGroupStatus.done,
        ),
      _Type.byGroup => dataProvider != null
          ? dataProvider!(sessionId)
          : watchArtworkQuarantinesByGroupIdProvider(
              groupId!,
            ),
    };

    return AppTableView<ArtworkQuarantine, ArtworkQuarantineField>(
      sessionId: sessionId,
      tableDefaultNamePlural: ppL10n.artwork_quarantine_plural,
      isCollapsible: isCollapsible,
      showWhenEmpty: showWhenEmpty,
      tableViewIdentifier: componentIdentifier.name,
      showToolbarDivider: showToolbarDivider,
      selfGrowable: selfGrowable,
      isResizable: isResizable,
      initialFilter: initialFilter,
      isHighlightable: true,
      fixedTableTitle: fixedTableName,
      showTableName: showTableName,
      hiddenFilterGroup: hiddenFilterGroup,
      showTableViews: showTableViews,
      availableFilterFieldsWithLabels:
          ArtworkQuarantineField.values.filterableWithLabels(l10n, ppL10n),
      availableTableColumnsWithLabels: !showTableViews
          ? null
          : ArtworkQuarantineField.values.tableColumnsWithLabels(l10n, ppL10n),
      toolbarTrailingActions: toolbarTrailingActions,
      defaultTableConfig: defaultTableConfig,
      tableDensity: tableDensity,
      dataProvider: (_) => artworkQuarantineDataProvider,
      isSortable: false,
      fieldFromKey: (fieldKey) =>
          ArtworkQuarantineFields.fromFieldKey(fieldKey).value,
      buildCellTitle: (field) =>
          ArtworkQuarantineFields.fromEnum(field).readable(l10n, ppL10n),
      getTitleAlignment: (field) =>
          ArtworkQuarantineFields.fromEnum(field).cellAlignment,
      onRowTap: null,
      buildCell: (field, item) {
        final isDraft = item.meta.isDraft;

        final isAnalyzed =
            item.general.status == ArtworkQuarantineGroupStatus.done;
        final cellAlignment =
            ArtworkQuarantineFields.fromEnum(field).cellAlignment;

        return switch (field) {
          ArtworkQuarantineField.id => AppTableCellText(
              item.meta.id.toString(),
              alignment: cellAlignment,
              italic: isDraft,
            ),
          ArtworkQuarantineField.description => AppTableCellText(
              item.general.description,
              alignment: cellAlignment,
            ),
          ArtworkQuarantineField.customer => AppTableCellText(
              item.customer.toString(),
              alignment: cellAlignment,
            ),
          ArtworkQuarantineField.groupStatus => AppTableCellText(
              item.group?.status.name ?? '',
              alignment: cellAlignment,
            ),
          ArtworkQuarantineField.customerId => AppTableCellText(
              item.customer?.meta.id.toString() ?? '',
              alignment: cellAlignment,
            ),
          ArtworkQuarantineField.status => AppTableCellText(
              item.general.status.name,
              leadingIconData: item.general.status.icon,
              leadingIconColor: item.general.status.color,
              alignment: cellAlignment,
            ),
          ArtworkQuarantineField.keywords => AppTableCellText(
              item.general.keywords ?? '',
              alignment: cellAlignment,
            ),
          ArtworkQuarantineField.colors => AppTableCellArtworkColors(
              colors: item.artworkData.colors,
            ),
          ArtworkQuarantineField.createdAt => AppTableCellDateTime(
              item.meta.createdAt,
              alignment: cellAlignment,
            ),
          ArtworkQuarantineField.createdBy => AppTableCellUser(
              item.meta.createdById,
              alignment: cellAlignment,
            ),
          ArtworkQuarantineField.lastModifiedAt => AppTableCellDateTime(
              item.meta.lastModifiedAt,
              alignment: cellAlignment,
            ),
          ArtworkQuarantineField.lastModifiedBy => AppTableCellUser(
              item.meta.lastModifiedById,
              alignment: cellAlignment,
            ),
          ArtworkQuarantineField.deletedAt => AppTableCellDateTime(
              item.meta.deletedAt,
              alignment: cellAlignment,
            ),
          ArtworkQuarantineField.isDraft => AppTableCellBool(
              item.meta.isDraft,
              alignment: cellAlignment,
            ),
          ArtworkQuarantineField.artwork => AppTableCellText(
              ppL10n.artwork,
              alignment: cellAlignment,
            ),
          ArtworkQuarantineField.width => AppTableCellNum(
              item.artworkData.width,
              alignment: cellAlignment,
            ),
          ArtworkQuarantineField.height => AppTableCellNum(
              item.artworkData.height,
              alignment: cellAlignment,
            ),
          ArtworkQuarantineField.cornerRadius => AppTableCellNum(
              item.artworkData.cornerRadius,
              alignment: cellAlignment,
            ),
          ArtworkQuarantineField.printProcessType => AppTableCellText(
              item.general.printProcessType?.readable(ppL10n) ?? '',
              alignment: cellAlignment,
            ),
          ArtworkQuarantineField.productType => AppTableCellText(
              item.general.productType?.readable(ppL10n) ?? '',
              alignment: cellAlignment,
            ),
          ArtworkQuarantineField.artworkType => AppTableCellText(
              item.general.type?.readable(ppL10n) ?? '',
              alignment: cellAlignment,
            ),
          ArtworkQuarantineField.productSeriesId => AppTableCellText(
              item.group?.selectedProductSeriesId?.toString() ?? '',
              alignment: cellAlignment,
            ),
          ArtworkQuarantineField.createProduct =>
            salesOrderId == null || !isAnalyzed
                ? const SizedBox.shrink()
                : _CreateProductFromArtworkQuarantineCellButton(
                    artworkQuarantine: item,
                    navigatorKey: navigatorKey!,
                    floatingWindowFocus: floatingWindowFocus!,
                    floatingWindowId: floatingWindowId!,
                    customerId: customerId!,
                    salesOrderId: salesOrderId!,
                  ),
          ArtworkQuarantineField.createProductPart =>
            salesOrderId == null || !isAnalyzed
                ? const SizedBox.shrink()
                : _CreateProductPartFromArtworkQuarantineCellButton(
                    artworkQuarantine: item,
                    navigatorKey: navigatorKey!,
                    floatingWindowFocus: floatingWindowFocus!,
                    floatingWindowId: floatingWindowId!,
                    customerId: customerId!,
                    salesOrderId: salesOrderId!,
                  ),
          ArtworkQuarantineField.deleteArtworkQuarantine =>
            const SizedBox.shrink(),
        };
      },
    );
  }
}

class _CreateProductFromArtworkQuarantineCellButton extends HookConsumerWidget {
  const _CreateProductFromArtworkQuarantineCellButton({
    required this.artworkQuarantine,
    required this.navigatorKey,
    required this.floatingWindowFocus,
    required this.floatingWindowId,
    required this.customerId,
    required this.salesOrderId,
  });

  final ArtworkQuarantine artworkQuarantine;
  final GlobalKey<NavigatorState> navigatorKey;
  final FocusNode floatingWindowFocus;
  final String floatingWindowId;
  final int customerId;
  final int salesOrderId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ppL10n = context.prepressL10n;
    return AppTableCellTextButton(
      ppL10n.product_create,
      onPressed: () async {
        await showElbDialog<SalesOrderItemTypesFromArtworkQuarantine?>(
          context: context,
          navigatorKey: navigatorKey,
          child: CreateProductDialog(
            customerId: customerId,
            salesOrderId: salesOrderId,
            navigatorKey: navigatorKey,
            floatingWindowFocus: floatingWindowFocus,
            floatingWindowId: floatingWindowId,
            artworkQuarantine: artworkQuarantine,
          ),
        );
      },
    );
  }
}

class _CreateProductPartFromArtworkQuarantineCellButton
    extends HookConsumerWidget {
  const _CreateProductPartFromArtworkQuarantineCellButton({
    required this.artworkQuarantine,
    required this.navigatorKey,
    required this.floatingWindowFocus,
    required this.floatingWindowId,
    required this.customerId,
    required this.salesOrderId,
  });

  final ArtworkQuarantine artworkQuarantine;
  final GlobalKey<NavigatorState> navigatorKey;
  final FocusNode floatingWindowFocus;
  final String floatingWindowId;
  final int customerId;
  final int salesOrderId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ppL10n = context.prepressL10n;
    return AppTableCellTextButton(
      ppL10n.artwork_add_to_product,
      onPressed: () async {
        await showElbDialog<SalesOrderItemTypesFromArtworkQuarantine?>(
          context: context,
          navigatorKey: navigatorKey,
          child: CreateProductPartDialog(
            customerId: customerId,
            salesOrderId: salesOrderId,
            navigatorKey: navigatorKey,
            floatingWindowFocus: floatingWindowFocus,
            floatingWindowId: floatingWindowId,
            artworkQuarantine: artworkQuarantine,
          ),
        );
      },
    );
  }
}
