import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/customer/config/customer_billing_customers_fields.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
// ignore: no_flutter_material_import
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

class CustomerBillingCustomersTable extends ConsumerWidget {
  const CustomerBillingCustomersTable({
    required this.fixedTableTitle,
    required this.toolbarTrailingActions,
    required this.secondContent,
    required this.showTable,
    required this.customerId,
    required this.showFilter,
    required this.componentIdentifier,
    super.key,
    this.hiddenFilterGroup,
    this.initialFilter,
  });

  final FilterGroup? hiddenFilterGroup;
  final Filter? initialFilter;
  final String? fixedTableTitle;
  final List<Widget>? toolbarTrailingActions;
  final bool? showTable;
  final Widget? Function(String)? secondContent;
  final int customerId;
  final bool showFilter;
  final ComponentIdentifier componentIdentifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    return AppTableView<CustomerBillingCustomer, CustomerBillingCustomerField>(
      tableDefaultNamePlural: 'Kunden Rechnungskunden'.hc,
      selfGrowable: true,
      tableViewIdentifier: componentIdentifier.name,
      isResizable: true,
      showTableViews: false,
      showTable: showTable ?? true,
      secondContent: secondContent,
      fixedTableTitle: fixedTableTitle,
      showToolbarDivider: true,
      initialFilter: initialFilter,
      hiddenFilterGroup: hiddenFilterGroup,
      defaultTableConfig: CustomerBillingCustomerFields.defaultTableColumns,
      toolbarTrailingActions: (sessionId) => [
        if (toolbarTrailingActions != null) ...toolbarTrailingActions!,
      ],
      dataProvider: (sessionId) {
        return watchCustomerBillingContactsProvider(
          sessionId,
          customerId: customerId,
        );
      },
      onRowTap: (item) {
        ref.openWindow(
          FloatingCustomerWindowData(
            customerId: item.billingCustomer!.meta.id,
          ),
        );
      },
      availableFilterFieldsWithLabels: showFilter
          ? CustomerBillingCustomerField.values
              .filterableWithLabels(l10n, crmL10n)
          : null,
      availableTableColumnsWithLabels: CustomerBillingCustomerField.values
          .tableColumnsWithLabels(l10n, crmL10n),
      quickSearchFilterFields: showFilter
          ? CustomerBillingCustomerField.values.quickSearchFilter(l10n, crmL10n)
          : null,
      fieldFromKey: (fieldKey) =>
          CustomerBillingCustomerFields.fromFieldKey(fieldKey).value,
      buildCellTitle: (field) =>
          CustomerBillingCustomerFields.fromEnum(field).readable(l10n, crmL10n),
      getTitleAlignment: (field) =>
          CustomerBillingCustomerFields.fromEnum(field).cellAlignment,
      buildCell: (field, item) {
        final cellAlignment =
            CustomerBillingCustomerFields.fromEnum(field).cellAlignment;

        return switch (field) {
          CustomerBillingCustomerField.billingCustomerCustomId =>
            AppTableCellOpenInNew(
              item.billingCustomer!.customId.toString(),
              alignment: cellAlignment,
              onPressed: () {
                {
                  ref.openWindow(
                    FloatingCustomerWindowData(
                      customerId: item.billingCustomer!.meta.id,
                    ),
                  );
                }
              },
            ),
          CustomerBillingCustomerField.billingCustomerLanguageCode =>
            AppTableCellText(
              item.billingCustomer!.contact!.general.languageCode?.name ?? '',
              alignment: cellAlignment,
            ),
          CustomerBillingCustomerField.billingCustomerCountryCode =>
            AppTableCellText(
              item.billingCustomer!.contact!.address.countryCode?.name ?? '',
              alignment: cellAlignment,
            ),
          CustomerBillingCustomerField.filterByBillingCustomerIdOrFullName =>
            const SizedBox.shrink(),
          CustomerBillingCustomerField.id => const SizedBox.shrink(),
          CustomerBillingCustomerField.isPrimary => AppTableCellBool(
              item.isPrimary,
              alignment: cellAlignment,
            ),
          CustomerBillingCustomerField.billingCustomerFullName =>
            AppTableCellText(
              item.billingCustomer!.contact!.general.name,
              alignment: cellAlignment,
            ),
          CustomerBillingCustomerField.billingCustomerAddress =>
            AppTableCellText(
              item.billingCustomer!.contact!.address.address,
              alignment: cellAlignment,
            ),
          CustomerBillingCustomerField.billingCustomerAddress2 =>
            AppTableCellText(
              item.billingCustomer!.contact!.address.address2,
              alignment: cellAlignment,
            ),
          CustomerBillingCustomerField.billingCustomerPostCode =>
            AppTableCellText(
              item.billingCustomer!.contact!.address.postCode,
              alignment: cellAlignment,
            ),
          CustomerBillingCustomerField.billingCustomerCity => AppTableCellText(
              item.billingCustomer!.contact!.address.city,
              alignment: cellAlignment,
            ),
          CustomerBillingCustomerField.billingCustomerState => AppTableCellText(
              item.billingCustomer!.contact!.address.state,
              alignment: cellAlignment,
            ),
          CustomerBillingCustomerField.billingCustomerPhone => AppTableCellText(
              item.billingCustomer!.contact!.communication.phone,
              alignment: cellAlignment,
            ),
          CustomerBillingCustomerField.billingCustomerEmail => AppTableCellText(
              item.billingCustomer!.contact!.communication.email,
              alignment: cellAlignment,
            ),
          CustomerBillingCustomerField.billingCustomerMobile =>
            AppTableCellText(
              item.billingCustomer!.contact!.communication.mobile,
              alignment: cellAlignment,
            ),
          CustomerBillingCustomerField.customer => AppTableCellText(
              item.customer!.contact?.general.name ?? '',
              alignment: cellAlignment,
            ),
          CustomerBillingCustomerField.billingCustomer => AppTableCellText(
              item.billingCustomer!.contact!.general.name,
              alignment: cellAlignment,
            ),
        };
      },
    );
  }
}
