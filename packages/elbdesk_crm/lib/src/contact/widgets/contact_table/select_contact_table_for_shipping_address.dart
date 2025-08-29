import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

class SelectContactTableForShippingAddress extends StatelessWidget {
  const SelectContactTableForShippingAddress({
    required this.dataProvider,
    required this.defaultTableConfig,
    required this.tableTitle,
    required this.onRowTap,
    super.key,
  });

  final ProviderListenable<AsyncValue<List<Contact>>> Function(String)
      dataProvider;
  final List<TableFieldConfig> defaultTableConfig;
  final String tableTitle;
  final void Function(Contact)? onRowTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    return AppTableView<Contact, ContactField>(
      tableDefaultNamePlural: crmL10n.contact_plural,
      tableViewIdentifier:
          ComponentIdentifier.selectContactTableForShippingAddress.name,
      isCollapsible: false,
      showTableViews: false,
      fixedTableTitle: tableTitle,
      showToolbarDivider: true,
      hiddenFilterGroup: null,
      availableFilterFieldsWithLabels: null,
      availableTableColumnsWithLabels: null,
      toolbarTrailingActions: null,
      defaultTableConfig: defaultTableConfig,
      tableDensity: AppTableDensity.compact,
      dataProvider: dataProvider,
      fieldFromKey: (fieldKey) => ContactFields.fromFieldKey(fieldKey).value,
      buildCellTitle: (field) =>
          ContactFields.fromEnum(field).readable(l10n, crmL10n),
      getTitleAlignment: (field) => ContactFields.fromEnum(field).cellAlignment,
      onRowTap: onRowTap,
      buildCell: (field, item) {
        final cellAlignment = ContactFields.fromEnum(field).cellAlignment;
        return switch (field) {
          ContactField.fullName => AppTableCellText(
              item.general.name,
              alignment: cellAlignment,
            ),
          ContactField.address => AppTableCellText(
              item.address.address,
              alignment: cellAlignment,
            ),
          ContactField.address2 => AppTableCellText(
              item.address.address2,
              alignment: cellAlignment,
            ),
          ContactField.postCode => AppTableCellText(
              item.address.postCode,
              alignment: cellAlignment,
            ),
          ContactField.city => AppTableCellText(
              item.address.city,
              alignment: cellAlignment,
            ),
          ContactField.countryCode => AppTableCellText(
              item.address.countryCode?.name ?? '',
              alignment: cellAlignment,
            ),

          // add more fields if this table is used for other purposes
          _ => const SizedBox.shrink(),
        };
      },
    );
  }
}
