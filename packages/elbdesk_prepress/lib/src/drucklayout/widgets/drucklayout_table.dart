import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

/// Defines the different variants of the Drucklayout table
enum _Type {
  standard,
  byCustomer,
  bySalesOrder,
}

/// Drucklayout Table Widget
class DrucklayoutTable extends HookConsumerWidget {
  /// Standard Drucklayout constructor
  ///
  /// Used to display all Drucklayouts
  DrucklayoutTable.all({
    required this.componentIdentifier,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.onSelect,
    required this.navigatorKey,
    super.key,
    this.initialFilter,
    this.isCollapsible = true,
    this.hiddenFilterGroup,
    this.tableDensity = AppTableDensity.standard,
    this.readOnly = false,
  })  : customerId = null,
        salesOrderId = null,
        defaultTableConfig = DrucklayoutFields.defaultTableColumns,
        showToolbarDivider = true,
        showWhenEmpty = true,
        showTableViews = true,
        showTableName = true,
        selfGrowable = false,
        toolbarTrailingActions = null,
        fixedTableName = null,
        isResizable = true,
        _type = _Type.standard;

  /// Customer-specific Drucklayout constructor
  ///
  /// Used to display Drucklayouts filtered by customer
  DrucklayoutTable.byCustomer({
    required this.toolbarTrailingActions,
    required this.customerId,
    required this.navigatorKey,
    required this.onSelect,
    required this.floatingWindowFocus,
    required this.floatingWindowId,
    required this.componentIdentifier,
    this.isCollapsible = true,
    super.key,
    this.tableDensity = AppTableDensity.standard,
    this.readOnly = false,
    this.hiddenFilterGroup,
  })  : showTableViews = false,
        showTableName = false,
        fixedTableName = ''.hc,
        defaultTableConfig = DrucklayoutFields.defaultTableColumns,
        selfGrowable = false,
        isResizable = true,
        showToolbarDivider = true,
        showWhenEmpty = true,
        _type = _Type.byCustomer,
        salesOrderId = null,
        initialFilter = Filter(
          filterGroups: [
            FilterGroup(
              filters: [
                FilterField(
                  fieldKey: DrucklayoutField.customerId.name,
                  value: customerId.toString(),
                  type: FilterType.equal,
                  fieldType: FilterFieldType.number,
                  uuid: const Uuid().v4(),
                  filterOperator: FilterOperator.and,
                ),
              ],
              nextOperator: FilterOperator.and,
            ),
          ],
        );

  /// Sales Order-specific Drucklayout constructor
  ///
  /// Used to display Drucklayouts filtered by sales order
  DrucklayoutTable.bySalesOrder({
    required this.toolbarTrailingActions,
    required this.salesOrderId,
    required this.customerId,
    required this.navigatorKey,
    required this.floatingWindowFocus,
    required this.onSelect,
    required this.floatingWindowId,
    required this.componentIdentifier,
    this.isCollapsible = true,
    super.key,
    this.fixedTableName,
    this.tableDensity = AppTableDensity.standard,
    this.readOnly = false,
    this.hiddenFilterGroup,
  })  : showTableViews = false,
        showTableName = true,
        defaultTableConfig = DrucklayoutFields.defaultTableColumns,
        selfGrowable = false,
        isResizable = true,
        showToolbarDivider = true,
        showWhenEmpty = true,
        _type = _Type.bySalesOrder,
        initialFilter = null;

  final FilterGroup? hiddenFilterGroup;
  final Filter? initialFilter;
  final AppTableDensity tableDensity;

  final bool readOnly;
  final int? customerId;
  final int? salesOrderId;
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
  final bool showToolbarDivider;
  final bool showWhenEmpty;
  final ComponentIdentifier componentIdentifier;
  final void Function(Drucklayout)? onSelect;
  final bool isCollapsible;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;
    final sessionId = useUuid();

    return AppTableView<Drucklayout, DrucklayoutField>(
      tableDefaultNamePlural: ppL10n.drucklayout_plural,
      sessionId: sessionId,
      showWhenEmpty: showWhenEmpty,
      isCollapsible: isCollapsible,
      tableViewIdentifier: componentIdentifier.name,
      showToolbarDivider: showToolbarDivider,
      selfGrowable: selfGrowable,
      isResizable: isResizable,
      isHighlightable: true,
      fixedTableTitle: fixedTableName,
      hiddenFilterGroup: hiddenFilterGroup,
      showTableViews: showTableViews,
      availableFilterFieldsWithLabels:
          DrucklayoutField.values.filters(l10n, ppL10n),
      availableTableColumnsWithLabels: !showTableViews
          ? null
          : DrucklayoutField.values.columns(l10n, ppL10n),
      toolbarTrailingActions: (sessionId) => [
        ...?toolbarTrailingActions?.call(sessionId),
      ],
      defaultTableConfig: DrucklayoutFields.defaultTableColumns,
      tableDensity: tableDensity,
      dataProvider: (_) {
        return switch (_type) {
          _Type.standard => findDrucklayoutsProvider(sessionId),
          _Type.byCustomer => watchDrucklayoutsByCustomerProvider(
              customerId!,
              sessionId,
            ),
          _Type.bySalesOrder => watchDrucklayoutsBySalesOrderProvider(
              salesOrderId!,
            ),
        };
      },
      fieldFromKey: (fieldKey) =>
          DrucklayoutFields.fromFieldKey(fieldKey).value,
      buildCellTitle: (field) =>
          DrucklayoutFields.fromEnum(field).readable(l10n, ppL10n),
      getTitleAlignment: (field) =>
          DrucklayoutFields.fromEnum(field).cellAlignment,
      onRowTap: (item) {
        onSelect?.call(item);
      },
      buildCell: (field, item) {
        final cellAlignment = DrucklayoutFields.fromEnum(field).cellAlignment;
        return switch (field) {
          DrucklayoutField.title => AppTableCellText(
              item.title,
              alignment: cellAlignment,
            ),
          DrucklayoutField.description => AppTableCellText(
              item.description,
              alignment: cellAlignment,
            ),
          DrucklayoutField.id => AppTableCellText(
              item.formattedId,
              alignment: cellAlignment,
            ),
          DrucklayoutField.drucklayoutPreSelection => AppTableCellText(
              item.drucklayoutPreSelection.description,
              alignment: cellAlignment,
            ),
          DrucklayoutField.drucklayoutSelection => AppTableCellText(
              item.drucklayoutSelection.description,
              alignment: cellAlignment,
            ),
          DrucklayoutField.customerId => AppTableCellText(
              item.customer?.contact?.general.name ?? '',
              alignment: cellAlignment,
            ),
          DrucklayoutField.createdAt => AppTableCellDateTime(
              item.meta.createdAt,
              alignment: cellAlignment,
            ),
          DrucklayoutField.createdBy => AppTableCellUser(
              item.meta.createdById,
              alignment: cellAlignment,
            ),
          DrucklayoutField.lastModifiedAt => AppTableCellDateTime(
              item.meta.lastModifiedAt,
              alignment: cellAlignment,
            ),
          DrucklayoutField.lastModifiedBy => AppTableCellUser(
              item.meta.lastModifiedById,
              alignment: cellAlignment,
            ),
          DrucklayoutField.deletedAt => AppTableCellDateTime(
              item.meta.deletedAt,
              alignment: cellAlignment,
            ),
          DrucklayoutField.isDraft => AppTableCellBool(
              item.meta.isDraft,
              alignment: cellAlignment,
            ),
        };
      },
    );
  }
}
