import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/customer/config/customer_shipping_contact_fields.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
// ignore: no_flutter_material_import
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

class CustomerShippingContactsTable extends ConsumerWidget {
  const CustomerShippingContactsTable({
    required this.fixedTableTitle,
    required this.toolbarTrailingActions,
    required this.secondContent,
    required this.showTable,
    required this.customerId,
    required this.showFilter,
    required this.componentIdentifier,
    required this.showTableViews,
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
  final bool showTableViews;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;

    return AppTableView<CustomerShippingContact, CustomerShippingContactField>(
      tableDefaultNamePlural: 'Kunde Lieferadressen'.hc,
      tableViewIdentifier: componentIdentifier.name,
      selfGrowable: true,
      isResizable: true,
      showTableViews: showTableViews,
      showTable: showTable ?? true,
      secondContent: secondContent,
      fixedTableTitle: fixedTableTitle,
      showToolbarDivider: true,
      initialFilter: initialFilter,
      hiddenFilterGroup: hiddenFilterGroup,
      defaultTableConfig: CustomerShippingContactFields.defaultTableColumns,
      toolbarTrailingActions: (sessionId) => [
        if (toolbarTrailingActions != null) ...toolbarTrailingActions!,
      ],
      dataProvider: (sessionId) {
        return watchCustomerShippingContactsProvider(
          sessionId,
          customerId: customerId,
        );
      },
      onRowTap: (item) {
        final isPerson = item.contact.general.type == ContactType.person;
        if (isPerson) {
          ref.openWindow(
            FloatingContactPersonWindowData(
              contactId: item.contact.meta.id,
            ),
          );
        } else {
          ref.openWindow(
            FloatingContactCompanyWindowData(
              contactId: item.contact.meta.id,
            ),
          );
        }
      },
      availableFilterFieldsWithLabels: showFilter
          ? CustomerShippingContactField.values
              .filterableWithLabels(l10n, crmL10n)
          : null,
      availableTableColumnsWithLabels: CustomerShippingContactField.values
          .tableColumnsWithLabels(l10n, crmL10n),
      quickSearchFilterFields: showFilter
          ? CustomerShippingContactField.values.quickSearchFilter(l10n, crmL10n)
          : null,
      fieldFromKey: (fieldKey) =>
          CustomerShippingContactFields.fromFieldKey(fieldKey).value,
      buildCellTitle: (field) =>
          CustomerShippingContactFields.fromEnum(field).readable(l10n, crmL10n),
      getTitleAlignment: (field) =>
          CustomerShippingContactFields.fromEnum(field).cellAlignment,
      buildCell: (field, item) {
        final cellAlignment =
            CustomerShippingContactFields.fromEnum(field).cellAlignment;

        return switch (field) {
          CustomerShippingContactField.shippingContactCustomId =>
            AppTableCellOpenInNew(
              item.contact.fullContactId,
              alignment: cellAlignment,
              onPressed: () {
                final isPerson =
                    item.contact.general.type == ContactType.person;
                if (isPerson) {
                  ref.openWindow(
                    FloatingContactPersonWindowData(
                      contactId: item.contact.meta.id,
                    ),
                  );
                } else {
                  ref.openWindow(
                    FloatingContactCompanyWindowData(
                      contactId: item.contact.meta.id,
                    ),
                  );
                }
              },
            ),
          CustomerShippingContactField.shippingContactLanguageCode =>
            AppTableCellText(
              item.contact.general.languageCode?.name ?? '',
              alignment: cellAlignment,
            ),
          CustomerShippingContactField.shippingContactCountryCode =>
            AppTableCellText(
              item.contact.address.countryCode?.name ?? '',
              alignment: cellAlignment,
            ),
          CustomerShippingContactField.filterByShippingContactIdOrFullName =>
            const SizedBox.shrink(),
          CustomerShippingContactField.id => const SizedBox.shrink(),
          CustomerShippingContactField.shippingContactFullName =>
            AppTableCellText(
              item.contact.general.name,
              alignment: cellAlignment,
            ),
          CustomerShippingContactField.shippingContactAddress =>
            AppTableCellText(
              item.contact.address.address,
              alignment: cellAlignment,
            ),
          CustomerShippingContactField.shippingContactAddress2 =>
            AppTableCellText(
              item.contact.address.address2,
              alignment: cellAlignment,
            ),
          CustomerShippingContactField.shippingContactPostCode =>
            AppTableCellText(
              item.contact.address.postCode,
              alignment: cellAlignment,
            ),
          CustomerShippingContactField.shippingContactCity => AppTableCellText(
              item.contact.address.city,
              alignment: cellAlignment,
            ),
          CustomerShippingContactField.shippingContactState => AppTableCellText(
              item.contact.address.state,
              alignment: cellAlignment,
            ),
          CustomerShippingContactField.shippingContactPhone => AppTableCellText(
              item.contact.communication.phone,
              alignment: cellAlignment,
            ),
          CustomerShippingContactField.shippingContactEmail => AppTableCellText(
              item.contact.communication.email,
              alignment: cellAlignment,
            ),
          CustomerShippingContactField.shippingContactMobile =>
            AppTableCellText(
              item.contact.communication.mobile,
              alignment: cellAlignment,
            ),
          CustomerShippingContactField.customer => AppTableCellText(
              item.customer.contact?.general.name ?? '',
              alignment: cellAlignment,
            ),
          CustomerShippingContactField.shippingContact => AppTableCellText(
              item.contact.general.name,
              alignment: cellAlignment,
            ),
        };
      },
    );
  }
}
