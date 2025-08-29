import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

/// Table to display SalesOrderItems with their details
class SalesOrderItemTable extends HookConsumerWidget {
  const SalesOrderItemTable({
    required this.defaultColumns,
    required this.componentIdentifier,
    super.key,
    this.initialFilter,
    this.hiddenFilterGroup,
    this.tableDensity = AppTableDensity.standard,
    this.readOnly = false,
    this.isCollapsible = true,
  });

  final FilterGroup? hiddenFilterGroup;
  final Filter? initialFilter;
  final AppTableDensity? tableDensity;
  final bool readOnly;
  final List<TableFieldConfig> defaultColumns;
  final ComponentIdentifier componentIdentifier;
  final bool isCollapsible;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final salesL10n = context.salesL10n;

    final dropdownFilterItems = useMemoized(
      () {
        return SalesOrderItemFields.buildFilterDropdownItems(l10n, salesL10n);
      },
      [l10n, salesL10n],
    );

    return AppTableView<SalesOrderItem, SalesOrderItemField>(
      tableDefaultNamePlural: salesL10n.sales_order_item_plural,
      tableViewIdentifier: componentIdentifier.name,
      isCollapsible: isCollapsible,
      showWhenEmpty: true,
      dropdownFilterItems: dropdownFilterItems,
      hiddenFilterGroup: hiddenFilterGroup,
      initialFilter: initialFilter,
      availableFilterFieldsWithLabels:
          SalesOrderItemField.values.filters(l10n, salesL10n),
      availableTableColumnsWithLabels:
          SalesOrderItemField.values.adjustableColumns(l10n, salesL10n),
      toolbarTrailingActions: (sessionId) => [
        AppButton.secondary(
          onPressed: () {
            ref.invalidate(findSalesOrderItemsProvider(sessionId));
          },
          tooltip: l10n.gen_refresh,
          iconData: AppIcons.refresh,
        ),
      ],
      toolbarMobileTrailingActions: (sessionId) => [
        MobileTableToolbarActionItem(
          onPressed: () {
            ref.invalidate(findSalesOrderItemsProvider(sessionId));
          },
          label: l10n.gen_refresh,
          icon: AppIcons.refresh,
        ),
      ],
      showToolbarDivider: true,
      defaultTableConfig: defaultColumns,
      tableDensity: tableDensity,
      onRowTap: (item) => _handleItemClick(ref, item),
      dataProvider: (sessionId) => findSalesOrderItemsProvider(sessionId),
      fieldFromKey: (fieldKey) =>
          SalesOrderItemFields.fromFieldKey(fieldKey).value,
      buildCellTitle: (field) =>
          SalesOrderItemFields.fromEnum(field).readable(l10n, salesL10n),
      getTitleAlignment: (field) =>
          SalesOrderItemFields.fromEnum(field).cellAlignment,
      quickSearchFilterFields:
          SalesOrderItemField.values.quickSearchFilter(l10n, salesL10n),
      buildCell: (field, item) {
        return switch (field) {
          SalesOrderItemField.customId => AppTableCellText(
              item.soiIdReadable,
            ),
          SalesOrderItemField.soiTypePrimaryKey => AppTableCellText(
              item.soiTypePrimaryKey.toString(),
            ),
          SalesOrderItemField.type => AppTableCellText(
              leadingIconData: SalesOrderItemTypeExt(item.type).icon,
              SalesOrderItemTypeExt(item.type).readable(l10n, salesL10n),
            ),
          SalesOrderItemField.status => AppTableCellText(
              leadingIconData: SalesOrderItemStatusExt(item.status).icon,
              leadingIconColor: SalesOrderItemStatusExt(item.status).color,
              SalesOrderItemStatusExt(item.status).readable(l10n),
            ),
          SalesOrderItemField.salesOrderId => const SizedBox.shrink(),
          SalesOrderItemField.salesOrderCustomId => AppTableCellOpenInNew(
              item.salesOrder?.fullSalesOrderId ?? '',
              onPressed: () {
                ref.openWindow(
                  FloatingSalesOrderWindowData(
                    salesOrderId: item.salesOrderId,
                  ),
                );
              },
            ),
          SalesOrderItemField.description => AppTableCellText(
              item.description,
            ),
          SalesOrderItemField.billableTime => AppTableCellText(
              item.billableTime.toString(),
            ),
          SalesOrderItemField.assignedUser => AppTableCellLightUser(
              item.assignedUser,
            ),
          SalesOrderItemField.customerName => AppTableCellOpenInNew(
              item.salesOrder?.customer?.contact?.general.name ?? '',
              onPressed: () {
                ref.openWindow(
                  FloatingCustomerWindowData(
                    customerId: item.salesOrder?.customer?.meta.id,
                  ),
                );
              },
            ),
          SalesOrderItemField.deadline => AppTableCellText(
              item.deadline?.toLocal().toString() ?? '',
            ),
        };
      },
    );
  }

  /// Handles clicking on a sales order item by opening the appropriate
  /// floating window
  Future<void> _handleItemClick(WidgetRef ref, SalesOrderItem item) async {
    switch (item.type) {
      case SalesOrderItemType.prepareArtwork:
        final entity =
            await ref.read(soiPrepareArtworkRepositoryProvider).fetchById(
                  item.soiTypePrimaryKey,
                );

        dlog(entity.toString());

        ref.openWindow(
          FloatingSoiPrepareArtworkWindowData(
            entityId: entity.meta.id,
            customerId: entity.salesOrder?.meta.id ?? 0,
          ),
        );

      case SalesOrderItemType.requestArtworkApproval:
        final entity = await ref
            .read(soiRequestArtworkApprovalRepositoryProvider)
            .fetchById(
              item.soiTypePrimaryKey,
            );

        dlog(entity.toString());

        ref.openWindow(
          FloatingSoiRequestArtworkApprovalWindowData(
            entityId: entity!.meta.id,
            customerId: entity.salesOrder?.meta.id ?? 0,
          ),
        );

      case SalesOrderItemType.consulting:
        final entity = await ref
            .read(soiConsultingRepositoryProvider)
            .fetchById(item.soiTypePrimaryKey);

        ref.openWindow(
          FloatingSoiConsultingWindowData(
            entityId: entity!.meta.id,
            salesOrderId: item.salesOrderId,
            customerId: entity.salesOrder!.customer!.meta.id!,
          ),
        );

        dlog(entity.toString());

      case SalesOrderItemType.einzelformaufbau:
        final entity = await ref
            .read(soiEinzelformaufbauRepositoryProvider)
            .fetchById(item.soiTypePrimaryKey);

        ref.openWindow(
          FloatingSoiEinzelformaufbauWindowData(
            entityId: entity!.meta.id,
            customerId: entity.salesOrder!.customer!.meta.id!,
          ),
        );
    }
  }
}
