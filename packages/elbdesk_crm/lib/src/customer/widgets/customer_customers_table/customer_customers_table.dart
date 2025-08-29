import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/customer/config/customer_customer_fields.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
// ignore: no_flutter_material_import
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

class CustomerCustomersTable extends ConsumerWidget {
  const CustomerCustomersTable({
    required this.fixedTableTitle,
    required this.toolbarTrailingActions,
    required this.secondContent,
    required this.showTable,
    required this.customerId,
    required this.showFilter,
    required this.componentIdentifier,
    this.isCollapsible = true,
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
  final int? customerId;
  final bool showFilter;
  final ComponentIdentifier componentIdentifier;
  final bool isCollapsible;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;

    return AppTableView<CustomerCustomer, CustomerCustomerField>(
      tableDefaultNamePlural: 'Kunde Kunden'.hc,
      tableViewIdentifier: componentIdentifier.name,
      isCollapsible: isCollapsible,
      selfGrowable: true,
      isResizable: true,
      initialFilter: initialFilter,
      showTableViews: showTable ?? true,
      showTable: showTable ?? true,
      secondContent: secondContent,
      fixedTableTitle: fixedTableTitle,
      showToolbarDivider: true,
      hiddenFilterGroup: hiddenFilterGroup,
      defaultTableConfig: CustomerCustomerFields.defaultTableColumns,
      toolbarTrailingActions: (sessionId) => [
        if (toolbarTrailingActions != null) ...toolbarTrailingActions!,
      ],
      dataProvider: (sessionId) {
        return watchCustomerCustomersProvider(
          sessionId,
          customerId: customerId!,
        );
      },
      onRowTap: (item) {
        final isPerson =
            item.customerCustomerContact!.general.type == ContactType.person;
        if (isPerson) {
          ref.openWindow(
            FloatingContactPersonWindowData(
              contactId: item.customerCustomerContact!.meta.id,
            ),
          );
        } else {
          ref.openWindow(
            FloatingContactCompanyWindowData(
              contactId: item.customerCustomerContact!.meta.id,
            ),
          );
        }
      },
      availableFilterFieldsWithLabels: showFilter
          ? CustomerCustomerField.values.filterableWithLabels(l10n, crmL10n)
          : null,
      availableTableColumnsWithLabels:
          CustomerCustomerField.values.tableColumnsWithLabels(l10n, crmL10n),
      quickSearchFilterFields: showFilter
          ? CustomerCustomerField.values.quickSearchFilter(l10n, crmL10n)
          : null,
      fieldFromKey: (fieldKey) =>
          CustomerCustomerFields.fromFieldKey(fieldKey).value,
      buildCellTitle: (field) =>
          CustomerCustomerFields.fromEnum(field).readable(l10n, crmL10n),
      getTitleAlignment: (field) =>
          CustomerCustomerFields.fromEnum(field).cellAlignment,
      buildCell: (field, item) {
        final cellAlignment =
            CustomerCustomerFields.fromEnum(field).cellAlignment;

        return switch (field) {
          CustomerCustomerField.customerCustomerContactCustomId =>
            AppTableCellOpenInNew(
              item.customerCustomerContact!.fullContactId,
              alignment: cellAlignment,
              onPressed: () {
                final isPerson = item.customerCustomerContact!.general.type ==
                    ContactType.person;
                if (isPerson) {
                  ref.openWindow(
                    FloatingContactPersonWindowData(
                      contactId: item.customerCustomerContact!.meta.id,
                    ),
                  );
                } else {
                  ref.openWindow(
                    FloatingContactCompanyWindowData(
                      contactId: item.customerCustomerContact!.meta.id,
                    ),
                  );
                }
              },
            ),
          CustomerCustomerField.customerCustomerContactLanguageCode =>
            AppTableCellText(
              item.customerCustomerContact!.general.languageCode?.name ?? '',
              alignment: cellAlignment,
            ),
          CustomerCustomerField.customerCustomerContactCountryCode =>
            AppTableCellText(
              item.customerCustomerContact!.address.countryCode?.name ?? '',
              alignment: cellAlignment,
            ),
          CustomerCustomerField.filterByCustomerCustomerContactIdOrFullName =>
            const SizedBox.shrink(),
          CustomerCustomerField.id => const SizedBox.shrink(),
          CustomerCustomerField.customerCustomerContactFullName =>
            AppTableCellText(
              item.customerCustomerContact!.general.name,
              alignment: cellAlignment,
            ),
          CustomerCustomerField.customerCustomerContactAddress =>
            AppTableCellText(
              item.customerCustomerContact!.address.address,
              alignment: cellAlignment,
            ),
          CustomerCustomerField.customerCustomerContactAddress2 =>
            AppTableCellText(
              item.customerCustomerContact!.address.address2,
              alignment: cellAlignment,
            ),
          CustomerCustomerField.customerCustomerContactPostCode =>
            AppTableCellText(
              item.customerCustomerContact!.address.postCode,
              alignment: cellAlignment,
            ),
          CustomerCustomerField.customerCustomerContactCity => AppTableCellText(
              item.customerCustomerContact!.address.city,
              alignment: cellAlignment,
            ),
          CustomerCustomerField.customerCustomerContactState =>
            AppTableCellText(
              item.customerCustomerContact!.address.state,
              alignment: cellAlignment,
            ),
          CustomerCustomerField.customerCustomerContactPhone =>
            AppTableCellText(
              item.customerCustomerContact!.communication.phone,
              alignment: cellAlignment,
            ),
          CustomerCustomerField.customerCustomerContactEmail =>
            AppTableCellText(
              item.customerCustomerContact!.communication.email,
              alignment: cellAlignment,
            ),
          CustomerCustomerField.customerCustomerContactMobile =>
            AppTableCellText(
              item.customerCustomerContact!.communication.mobile,
              alignment: cellAlignment,
            ),
          CustomerCustomerField.customer => AppTableCellText(
              item.customer!.contact?.general.name ?? '',
              alignment: cellAlignment,
            ),
          CustomerCustomerField.customerCustomerContact => AppTableCellText(
              item.customerCustomerContact!.general.name,
              alignment: cellAlignment,
            ),
          CustomerCustomerField.createdAt => const SizedBox.shrink(),
          CustomerCustomerField.createdBy => const SizedBox.shrink(),
          CustomerCustomerField.lastModifiedAt => const SizedBox.shrink(),
          CustomerCustomerField.lastModifiedBy => const SizedBox.shrink(),
          CustomerCustomerField.deletedAt => const SizedBox.shrink(),
          CustomerCustomerField.isDraft => const SizedBox.shrink(),
        };
      },
    );
  }
}
