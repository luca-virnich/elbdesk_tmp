import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_sales/src/sales_order/config/sales_order_fields.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

/// Possible types of the ProductPart Table
enum SalesOrderTableType {
  standard,
  byCustomer,
}

class SalesOrderTable extends HookConsumerWidget {
  const SalesOrderTable.standard({
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.componentIdentifier,
    this.isCollapsible = true,
    super.key,
    this.initialFilter,
    this.toolbarPadding =
        const EdgeInsets.only(right: UiConstants.tableCardToolbarPadding),
    this.hiddenFilterGroup,
    this.width,
    this.tableDensity = AppTableDensity.standard,
    this.readOnly = false,
  })  : _tableType = SalesOrderTableType.standard,
        customerId = null,
        showToolbarDivider = false;

  const SalesOrderTable.byCustomer({
    required int this.customerId,
    required this.navigatorKey,
    required this.componentIdentifier,
    this.width,
    this.isCollapsible = true,
    super.key,
    this.tableDensity,
    this.showToolbarDivider = false,
    this.readOnly = false,
    this.toolbarPadding = EdgeInsets.zero,
    this.hiddenFilterGroup,
    this.initialFilter,
  })  : _tableType = SalesOrderTableType.byCustomer,
        floatingWindowId = null,
        floatingWindowFocus = null;

  final SalesOrderTableType _tableType;
  final FilterGroup? hiddenFilterGroup;
  final Filter? initialFilter;
  final AppTableDensity? tableDensity;
  final int? customerId;
  final bool readOnly;
  final bool showToolbarDivider;
  final GlobalKey<NavigatorState> navigatorKey;
  final String? floatingWindowId;
  final FocusNode? floatingWindowFocus;
  final double? width;
  final ComponentIdentifier componentIdentifier;
  final EdgeInsetsGeometry toolbarPadding;
  final bool isCollapsible;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final salesL10n = context.salesL10n;
    final crmL10n = context.crmL10n;

    // The CustomerName does not need to be displayed in the byCustomer table
    // by default

    final availableTableColumnsWithLabels = switch (_tableType) {
      SalesOrderTableType.standard =>
        SalesOrderField.values.columns(l10n, salesL10n),
      SalesOrderTableType.byCustomer =>
        SalesOrderField.values.columnsByCustomer(l10n, salesL10n),
    };

    final availableFilterFieldsWithLabels = switch (_tableType) {
      SalesOrderTableType.standard =>
        SalesOrderField.values.filters(l10n, salesL10n),
      SalesOrderTableType.byCustomer =>
        SalesOrderField.values.filtersByCustomer(l10n, salesL10n),
    };

    final quickSearchFilterFields = switch (_tableType) {
      SalesOrderTableType.standard =>
        SalesOrderField.values.quickSearchFilters(l10n, salesL10n),
      SalesOrderTableType.byCustomer =>
        SalesOrderField.values.quickSearchFiltersByCustomer(l10n, salesL10n),
    };

    // Build dropdown filter items - memoized for performance
    final dropdownFilterItems = useMemoized(
      () => SalesOrderFields.buildFilterDropdownItems(l10n, salesL10n),
      [l10n, salesL10n],
    );

    return AppTableView<SalesOrder, SalesOrderField>(
      tableDefaultNamePlural: salesL10n.sales_order_plural,
      tableViewIdentifier: componentIdentifier.name,
      isCollapsible: isCollapsible,
      showWhenEmpty: true,
      showToolbarDivider: true,
      dropdownFilterItems: dropdownFilterItems,
      hiddenFilterGroup: hiddenFilterGroup,
      toolbarPadding: toolbarPadding,
      initialFilter: initialFilter,
      availableFilterFieldsWithLabels: availableFilterFieldsWithLabels,
      availableTableColumnsWithLabels: availableTableColumnsWithLabels,
      toolbarTrailingActions: (sessionId) => [
        AppTableRefreshButton(
          onPressed: () {
            if (_tableType == SalesOrderTableType.standard) {
              ref.invalidate(findSalesOrdersProvider(sessionId));
            } else {
              ref.invalidate(
                findSalesOrdersByCustomerIdProvider(sessionId, customerId!),
              );
            }
          },
        ),
        if (_tableType == SalesOrderTableType.byCustomer)
          _AddSalesOrderByCustomerButton(
            readOnly: readOnly,
            useSmallButton: tableDensity == AppTableDensity.compact,
            customerId: customerId,
          )
        else
          _AddSalesOrderButton(
            navigatorKey: navigatorKey,
            floatingWindowId: floatingWindowId!,
            floatingWindowFocus: floatingWindowFocus!,
          ),
      ],
      toolbarMobileTrailingActions: (sessionId) => [
        MobileTableToolbarActionItem(
          onPressed: () {
            if (_tableType == SalesOrderTableType.standard) {
              ref.invalidate(findSalesOrdersProvider(sessionId));
            } else {
              ref.invalidate(
                findSalesOrdersByCustomerIdProvider(sessionId, customerId!),
              );
            }
          },
          label: l10n.gen_refresh,
          icon: AppIcons.refresh,
        ),
        if (_tableType == SalesOrderTableType.byCustomer)
          MobileTableToolbarActionItem(
            icon: AppIcons.add,
            label: salesL10n.sales_order_singular,
            onPressed: readOnly
                ? null
                : () {
                    ref.openWindow(
                      FloatingSalesOrderWindowData(
                        salesOrderId: null,
                        customerId: customerId,
                      ),
                    );
                  },
          )
        else
          MobileTableToolbarActionItem(
            icon: AppIcons.add,
            label: salesL10n.sales_order_singular,
            onPressed: () async {
              final customer = await showElbDialog<Customer>(
                context: context,
                navigatorKey: navigatorKey,
                child: InWindowCustomerSelection(
                  floatingWindowId: floatingWindowId!,
                  titleText: l10n.gen_choose_entity(crmL10n.customer_singular),
                ),
              );
              if (customer != null) {
                ref.openWindow(
                  FloatingSalesOrderWindowData(
                    salesOrderId: null,
                    customerId: customer.meta.id,
                  ),
                );
              }
            },
          ),
      ],
      onRowTap: (salesOrder) {
        ref.openWindow(
          FloatingSalesOrderWindowData(
            salesOrderId: salesOrder.meta.id,
          ),
        );
      },
      defaultTableConfig: switch (_tableType) {
        SalesOrderTableType.byCustomer => SalesOrderFields.defaultColumns,
        SalesOrderTableType.standard =>
          SalesOrderFields.defaultByCustomerColumns,
      },
      quickSearchFilterFields: quickSearchFilterFields,
      tableDensity: tableDensity,
      dataProvider: (sessionId) {
        return switch (_tableType) {
          SalesOrderTableType.standard => findSalesOrdersProvider(sessionId),
          SalesOrderTableType.byCustomer =>
            findSalesOrdersByCustomerIdProvider(sessionId, customerId!),
        };
      },
      fieldFromKey: (fieldKey) => SalesOrderFields.fromFieldKey(fieldKey).value,
      buildCellTitle: (field) =>
          SalesOrderFields.fromEnum(field).readable(l10n, salesL10n),
      getTitleAlignment: (field) =>
          SalesOrderFields.fromEnum(field).cellAlignment,
      buildCell: (field, salesOrder) {
        return switch (field) {
          SalesOrderField.shippingAddress => const SizedBox(),
          SalesOrderField.billingAddress => const SizedBox(),
          SalesOrderField.customIdString => const SizedBox(),
          SalesOrderField.customId => AppTableCellText(
              salesOrder.fullSalesOrderId,
            ),
          SalesOrderField.filterByIdOrName => AppTableCellText(
              salesOrder.meta.id.toString(),
            ),
          SalesOrderField.deletedAt => AppTableCellDateTime(
              salesOrder.meta.deletedAt,
              italic: salesOrder.meta.isDraft,
            ),
          SalesOrderField.isDraft => AppTableCellBool(
              salesOrder.meta.isDraft,
            ),
          SalesOrderField.description => AppTableCellText(
              salesOrder.description,
            ),
          SalesOrderField.status => AppTableCellText(
              leadingIconData: salesOrder.status.icon,
              leadingIconColor: salesOrder.status.color,
              salesOrder.status.readable(l10n),
            ),
          SalesOrderField.orderDate => AppTableCellDate(
              salesOrder.orderDate,
            ),
          SalesOrderField.keywords => AppTableCellText(
              salesOrder.keywords,
            ),
          SalesOrderField.orderNumber => AppTableCellText(
              salesOrder.orderNumber,
            ),
          SalesOrderField.assignedUser => AppTableCellLightUser(
              salesOrder.assignedUser,
            ),
          SalesOrderField.customerId => AppTableCellOpenInNew(
              salesOrder.customer?.customId.toString() ?? '',
              onPressed: () {
                ref.openWindow(
                  FloatingCustomerWindowData(
                    customerId: salesOrder.customer?.meta.id,
                  ),
                );
              },
            ),
          SalesOrderField.customerName => switch (_tableType) {
              SalesOrderTableType.standard => AppTableCellOpenInNew(
                  salesOrder.customer?.contact?.general.name ?? '',
                  onPressed: () {
                    ref.openWindow(
                      FloatingCustomerWindowData(
                        customerId: salesOrder.customer?.meta.id,
                      ),
                    );
                  },
                ),
              SalesOrderTableType.byCustomer => AppTableCellText(
                  salesOrder.customer?.contact?.general.name ?? '',
                ),
            },
          SalesOrderField.createdAt => AppTableCellDateTime(
              salesOrder.meta.createdAt,
            ),
          SalesOrderField.createdBy => AppTableCellUser(
              salesOrder.meta.createdById,
            ),
          SalesOrderField.lastModifiedAt => AppTableCellDateTime(
              salesOrder.meta.lastModifiedAt,
            ),
          SalesOrderField.lastModifiedBy => AppTableCellUser(
              salesOrder.meta.lastModifiedById,
            ),
          SalesOrderField.customerContactPerson => AppTableCellText(
              salesOrder.customerContactPerson?.general.name ?? '',
            ),
          SalesOrderField.customerCustomerContactPerson => AppTableCellText(
              salesOrder.customerCustomerContactPerson?.general.name ?? '',
            ),
          SalesOrderField.customerCustomer => AppTableCellText(
              salesOrder.customerCustomer?.customerCustomerContact?.general
                      .name ??
                  '',
            ),
          SalesOrderField.customerFirstReference => AppTableCellText(
              salesOrder.customerFirstReference,
            ),
          SalesOrderField.customerSecondReference => AppTableCellText(
              salesOrder.customerSecondReference,
            ),
          SalesOrderField.customerCustomerReference => AppTableCellText(
              salesOrder.customerCustomerReference,
            ),
        };
      },
    );
  }
}

class _AddSalesOrderByCustomerButton extends HookConsumerWidget {
  const _AddSalesOrderByCustomerButton({
    required this.readOnly,
    this.customerId,
    this.useSmallButton,
  });
  final int? customerId;

  final bool? useSmallButton;
  final bool readOnly;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final salesL10n = context.salesL10n;

    return AddEntityInCardButton(
      onPressed: readOnly
          ? null
          : () {
              ref.openWindow(
                FloatingSalesOrderWindowData(
                  salesOrderId: null,
                  customerId: customerId,
                ),
              );
            },
      tooltip: l10n.gen_add_entity(salesL10n.sales_order_singular),
    );
  }
}

class _AddSalesOrderButton extends ConsumerWidget {
  const _AddSalesOrderButton({
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
  });
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final salesL10n = context.salesL10n;
    final crmL10n = context.crmL10n;
    return AppButton.primary(
      iconData: AppIcons.add,
      tooltip: l10n.gen_add_entity(salesL10n.sales_order_singular),
      onPressed: () async {
        final customer = await showElbDialog<Customer>(
          context: context,
          navigatorKey: navigatorKey,
          child: InWindowCustomerSelection(
            floatingWindowId: floatingWindowId,

            titleText: l10n.gen_choose_entity(crmL10n.customer_singular),
            // maxHeight: 600,
          ),
        );
        if (customer != null) {
          ref.openWindow(
            FloatingSalesOrderWindowData(
              salesOrderId: null,
              customerId: customer.meta.id,
            ),
          );
        }
      },
    );
  }
}

class InWindowCustomerSelection extends StatelessWidget {
  const InWindowCustomerSelection({
    required this.floatingWindowId,
    required this.titleText,
    super.key,
  });
  final String floatingWindowId;

  final String titleText;

  @override
  Widget build(BuildContext context) {
    return ElbDialog(
      floatingWindowId: floatingWindowId,
      title: titleText,
      child: CustomerTable.selectCustomer(
        componentIdentifier: ComponentIdentifier.inWindowCustomerSelection,
        isCollapsible: false,
        onSelect: (customer) {
          Navigator.of(context).pop(customer);
        },
      ),
    );
  }
}
