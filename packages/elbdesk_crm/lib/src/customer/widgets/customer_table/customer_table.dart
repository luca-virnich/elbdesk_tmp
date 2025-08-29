import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/customer/config/customer_table_select_address_default_columns.dart';
import 'package:elbdesk_crm/src/customer/config/customer_table_select_customer_default_columns.dart';
import 'package:elbdesk_crm/src/customer/extensions/invoice_method_ext.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

enum CustomerTableType {
  standard,
  selectCustomer,
  selectAddress,
  selectBillingAddressForSalesOrder,
}

/// Customer Table
///
/// The Table View for the Customers
///
/// This table view is used to display the customers in a table view
/// It uses the AppTable widget to display the contacts
class CustomerTable extends HookConsumerWidget {
  CustomerTable.standard({
    required this.componentIdentifier,
    this.isCollapsible = true,
    super.key,
    this.initialFilter,
    this.selfGrowable = false,
    this.onSelect,
    this.onShiftSelect,
  })  : showTableViews = true,
        showToolbarDivider = true,
        dataProvider = null,
        toolbarPadding =
            const EdgeInsets.only(right: UiConstants.tableCardToolbarPadding),
        fixedTableTitle = null,
        hiddenFilterGroup = null,
        tableDensity = AppTableDensity.standard,
        isResizable = true,
        isSortable = true,
        defaultTableConfig = CustomerFields.defaultTableColumns,
        tableType = CustomerTableType.standard;

  CustomerTable.selectCustomer({
    required this.onSelect,
    required this.componentIdentifier,
    this.onShiftSelect,
    this.selfGrowable = false,
    this.isCollapsible = true,
    super.key,
  })  : showTableViews = false,
        showToolbarDivider = true,
        hiddenFilterGroup = null,
        dataProvider = null,
        initialFilter = null,
        toolbarPadding = EdgeInsets.zero,
        fixedTableTitle = null,
        tableDensity = AppTableDensity.compact,
        isResizable = false,
        isSortable = true,
        tableType = CustomerTableType.selectCustomer,
        defaultTableConfig = customerTableSelectCustomerDefaultColumns;

  CustomerTable.selectAddress({
    required this.onSelect,
    required this.componentIdentifier,
    required this.hiddenFilterGroup,
    this.onShiftSelect,
    this.selfGrowable = false,
    this.isCollapsible = true,
    super.key,
  })  : showTableViews = false,
        toolbarPadding = EdgeInsets.zero,
        showToolbarDivider = true,
        dataProvider = null,
        initialFilter = null,
        fixedTableTitle = null,
        tableDensity = AppTableDensity.standard,
        isResizable = false,
        isSortable = true,
        tableType = CustomerTableType.selectAddress,
        defaultTableConfig = customerTableSelectAddressDefaultColumns;

  /// Select Billing Address for Sales Order
  ///
  /// This is a table view that is used to select a billing address for a SO
  CustomerTable.selectBillingAddressForSalesOrder({
    required this.fixedTableTitle,
    required this.dataProvider,
    required this.onSelect,
    required this.componentIdentifier,
    this.onShiftSelect,
    this.selfGrowable = false,
    this.isCollapsible = true,
    super.key,
  })  : showTableViews = false,
        showToolbarDivider = true,
        toolbarPadding = EdgeInsets.zero,
        hiddenFilterGroup = null,
        defaultTableConfig = customerTableSelectAddressDefaultColumns,
        initialFilter = null,
        isResizable = true,
        isSortable = true,
        tableType = CustomerTableType.selectBillingAddressForSalesOrder,
        tableDensity = AppTableDensity.compact;

  /// Size and look of the table
  final AppTableDensity tableDensity;

  /// Initial Filters added to the table
  final Filter? initialFilter;

  final List<TableFieldConfig> defaultTableConfig;
  final void Function(Customer)? onSelect;
  final bool showTableViews;
  final FilterGroup? hiddenFilterGroup;
  final ProviderListenable<AsyncValue<List<Customer>>> Function(String)?
      dataProvider;
  final String? fixedTableTitle;
  final bool showToolbarDivider;
  final bool? isResizable;
  final bool? isSortable;
  final CustomerTableType tableType;
  final void Function(Customer)? onShiftSelect;
  final ComponentIdentifier componentIdentifier;
  final bool isCollapsible;
  final EdgeInsetsGeometry toolbarPadding;
  final bool selfGrowable;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;

    // final dropdownFilterItems = useMemoized(
    //   () => CustomerFields.buildDropdownFilterItemsMap(l10n, crmL10n),
    //   [l10n, crmL10n],
    // );

    return AppTableView<Customer, CustomerField>(
      tableDefaultNamePlural: crmL10n.customer_plural,
      tableViewIdentifier: componentIdentifier.name,
      toolbarPadding: toolbarPadding,
      dropdownFilterItems: null,
      fixedTableTitle: fixedTableTitle,
      isCollapsible: isCollapsible,
      showToolbarDivider: showToolbarDivider,
      showTableViews: showTableViews,
      selfGrowable: selfGrowable,
      quickSearchFilterFields:
          CustomerField.values.quickSearchFilters(l10n, crmL10n),
      tableDensity: tableDensity,
      defaultTableConfig: defaultTableConfig,
      dataProvider: (sessionId) {
        if (dataProvider != null) {
          return dataProvider!(sessionId);
        } else {
          return findCustomersProvider(sessionId);
        }
      },
      onRowShiftTab: onShiftSelect,
      onRowTap: onSelect,
      isResizable: isResizable ?? true,
      isSortable: isSortable ?? true,
      hiddenFilterGroup: hiddenFilterGroup,
      fieldFromKey: (fieldKey) => CustomerFields.fromFieldKey(fieldKey).value,
      buildCellTitle: (field) =>
          CustomerFields.fromEnum(field).readable(l10n, crmL10n),
      getTitleAlignment: (field) =>
          CustomerFields.fromEnum(field).cellAlignment,
      buildCell: (field, item) {
        final alignment = CustomerFields.fromEnum(field).cellAlignment;
        return switch (field) {
          CustomerField.customId => const SizedBox(),
          CustomerField.contractSovereignty => AppTableCellText(
              item.contractSovereignty?.description ?? '',
              alignment: alignment,
            ),
          CustomerField.paymentCode => AppTableCellText(
              item.paymentCode?.code ?? '',
              alignment: alignment,
            ),
          CustomerField.invoiceEmail => AppTableCellText(
              item.invoiceEmail,
              alignment: alignment,
            ),
          CustomerField.invoiceDeliveryMethod => AppTableCellText(
              item.invoiceDeliveryMethod?.readable(crmL10n) ?? '',
              alignment: alignment,
            ),
          CustomerField.shippingMethod => AppTableCellText(
              item.shippingMethod?.description ?? '',
              alignment: alignment,
            ),
          CustomerField.customIdString => switch (tableType) {
              CustomerTableType.standard => AppTableCellText(
                  item.customId.toString(),
                  alignment: alignment,
                ),
              CustomerTableType.selectCustomer => AppTableCellOpenInNew(
                  item.customId.toString(),
                  alignment: alignment,
                  onPressed: () {
                    ref.openWindow(
                      FloatingCustomerWindowData(
                        customerId: item.meta.id,
                      ),
                    );
                  },
                ),
              CustomerTableType.selectAddress => AppTableCellOpenInNew(
                  item.customId.toString(),
                  alignment: alignment,
                  onPressed: () {
                    ref.openWindow(
                      FloatingCustomerWindowData(
                        customerId: item.meta.id,
                      ),
                    );
                  },
                ),
              CustomerTableType.selectBillingAddressForSalesOrder =>
                AppTableCellOpenInNew(
                  item.customId.toString(),
                  alignment: alignment,
                  onPressed: () {
                    ref.openWindow(
                      FloatingCustomerWindowData(
                        customerId: item.meta.id,
                      ),
                    );
                  },
                ),
            },
          CustomerField.assignedUser => AppTableCellLightUser(
              item.assignedUser,
              alignment: alignment,
            ),
          CustomerField.deletedAt => AppTableCellText(
              item.meta.deletedAt.toString(),
              alignment: alignment,
            ),
          CustomerField.isDraft => AppTableCellText(
              item.meta.isDraft.toString(),
              alignment: alignment,
            ),
          CustomerField.vatId => AppTableCellText(
              item.vatId,
              alignment: alignment,
            ),
          CustomerField.address3 => AppTableCellText(
              item.contact?.address.address3 ?? '',
              alignment: alignment,
            ),
          CustomerField.selectCustomer => AppTableCellTextButton(
              l10n.gen_table_select_entity,
              alignment: alignment,
              onPressed: () {
                onSelect?.call(item);
              },
            ),
          CustomerField.id => AppTableCellText(
              item.meta.id.toString(),
              alignment: alignment,
            ),
          CustomerField.type => AppTableCellText(
              item.contact?.general.type.toString() ?? '',
              alignment: alignment,
            ),
          CustomerField.customerName => AppTableCellText(
              item.contact?.general.name ?? '',
              alignment: alignment,
            ),
          CustomerField.address => AppTableCellText(
              item.contact?.address.address ?? '',
              alignment: alignment,
            ),
          CustomerField.city => AppTableCellText(
              item.contact?.address.city ?? '',
              alignment: alignment,
            ),
          CustomerField.country => AppTableCellText(
              item.contact?.address.countryCode?.name ?? '',
              alignment: alignment,
            ),
          CustomerField.address2 => AppTableCellText(
              item.contact?.address.address2 ?? '',
              alignment: alignment,
            ),
          CustomerField.postCode => AppTableCellText(
              item.contact?.address.postCode ?? '',
              alignment: alignment,
            ),
          CustomerField.state => AppTableCellText(
              item.contact?.address.state ?? '',
              alignment: alignment,
            ),
          CustomerField.phone => AppTableCellText(
              item.contact?.communication.phone ?? '',
              alignment: alignment,
            ),
          CustomerField.email => AppTableCellText(
              item.contact?.communication.email ?? '',
              alignment: alignment,
            ),
          CustomerField.mobile => AppTableCellText(
              item.contact?.communication.mobile ?? '',
              alignment: alignment,
            ),
          CustomerField.website => AppTableCellText(
              item.contact?.communication.website ?? '',
              alignment: alignment,
            ),
          CustomerField.createdAt => AppTableCellDateTime(
              item.meta.createdAt,
              alignment: alignment,
            ),
          CustomerField.createdBy => AppTableCellUser(
              item.meta.createdById,
              alignment: alignment,
            ),
          CustomerField.lastModifiedAt => AppTableCellDateTime(
              item.meta.lastModifiedAt,
              alignment: alignment,
            ),
          CustomerField.lastModifiedBy => AppTableCellUser(
              item.meta.lastModifiedById,
              alignment: alignment,
            ),
          CustomerField.filterByIdOrName => AppTableCellText(
              item.meta.id.toString(),
            ),
        };
      },
      availableFilterFieldsWithLabels:
          CustomerField.values.filters(l10n, crmL10n),
      availableTableColumnsWithLabels:
          CustomerField.values.columns(l10n, crmL10n),
      toolbarTrailingActions: (sessionId) => [
        if (dataProvider == null)
          AppTableRefreshButton(
            onPressed: () {
              ref.invalidate(findCustomersProvider(sessionId));
            },
          ),
      ],
      toolbarMobileTrailingActions: (sessionId) => [
        if (dataProvider == null)
          MobileTableToolbarActionItem(
            onPressed: () {
              ref.invalidate(findCustomersProvider(sessionId));
            },
            label: l10n.gen_refresh,
            icon: AppIcons.refresh,
          ),
      ],
    );
  }
}
