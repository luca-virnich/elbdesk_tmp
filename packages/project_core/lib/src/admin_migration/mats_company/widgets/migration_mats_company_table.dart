import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';
import 'package:project_core/src/admin_migration/mats_company/config/migration_mats_company_default_config.dart';
import 'package:project_core/src/admin_migration/mats_company/fields/migration_mats_company_fields.dart';
import 'package:project_core/src/admin_migration/mats_company/logic/migration_mats_company_provider.dart';
import 'package:project_core/src/admin_migration/mats_company/models/migration_mats_company.dart';

/// Migration Mats Company Table
///
/// The Table View for displaying migration data from MATS system
class MigrationMatsCompanyTable extends ConsumerWidget {
  const MigrationMatsCompanyTable.standard({
    super.key,
    this.hiddenFilterGroup,
    this.initialFilter,
    this.tableDensity,
  });

  final FilterGroup? hiddenFilterGroup;
  final Filter? initialFilter;
  final AppTableDensity? tableDensity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;

    return AppTableView<MigrationMatsCompany, MigrationMatsCompanyField>(
      tableDefaultNamePlural: 'Migration Mats Firmen'.hc,
      tableViewIdentifier: ComponentIdentifier.migrationMatsCompany.name,
      hiddenFilterGroup: hiddenFilterGroup,
      availableFilterFieldsWithLabels:
          MigrationMatsCompanyField.values.filterableWithLabels(
        l10n,
        crmL10n,
      ),
      availableTableColumnsWithLabels:
          MigrationMatsCompanyField.values.tableColumnsWithLabels(
        l10n,
        crmL10n,
      ),
      toolbarTrailingActions: (_) => const [],
      onRowTap: null,
      showToolbarDivider: true,
      quickSearchFilterFields:
          MigrationMatsCompanyField.values.filterableWithLabels(
        l10n,
        crmL10n,
      ),
      defaultTableConfig: migrationMatsCompanyDefaultConfig,
      tableDensity: tableDensity,
      dataProvider: findMigrationMatsCompaniesProvider.call,
      fieldFromKey: (fieldKey) =>
          MigrationMatsCompanyFields.fromFieldKey(fieldKey).value,
      buildCellTitle: (field) =>
          MigrationMatsCompanyFields.fromEnum(field).readable(l10n, crmL10n),
      getTitleAlignment: (field) =>
          MigrationMatsCompanyFields.fromEnum(field).cellAlignment,
      buildCell: (field, item) {
        final cellAlignment =
            MigrationMatsCompanyFields.fromEnum(field).cellAlignment;

        return switch (field) {
          MigrationMatsCompanyField.idAccount => AppTableCellText(
              item.data.idAccount,
              alignment: cellAlignment,
            ),
          MigrationMatsCompanyField.account => AppTableCellText(
              item.data.account,
              alignment: cellAlignment,
            ),
          MigrationMatsCompanyField.account2 => AppTableCellText(
              item.data.account2,
              alignment: cellAlignment,
            ),
          MigrationMatsCompanyField.shippingStreet1 => AppTableCellText(
              item.data.shippingStreet1,
              alignment: cellAlignment,
            ),
          MigrationMatsCompanyField.shippingStreet2 => AppTableCellText(
              item.data.shippingStreet2,
              alignment: cellAlignment,
            ),
          MigrationMatsCompanyField.shippingPostalCode => AppTableCellText(
              item.data.shippingPostalCode,
              alignment: cellAlignment,
            ),
          MigrationMatsCompanyField.shippingCity => AppTableCellText(
              item.data.shippingCity,
              alignment: cellAlignment,
            ),
          MigrationMatsCompanyField.shippingState => AppTableCellText(
              item.data.shippingState,
              alignment: cellAlignment,
            ),
          MigrationMatsCompanyField.shippingCountry => AppTableCellText(
              item.data.shippingCountry,
              alignment: cellAlignment,
            ),
          MigrationMatsCompanyField.phone1 => AppTableCellText(
              item.data.phone1,
              alignment: cellAlignment,
            ),
          MigrationMatsCompanyField.phone2 => AppTableCellText(
              item.data.phone2,
              alignment: cellAlignment,
            ),
          MigrationMatsCompanyField.fax => AppTableCellText(
              item.data.fax,
              alignment: cellAlignment,
            ),
          MigrationMatsCompanyField.email => AppTableCellText(
              item.data.email,
              alignment: cellAlignment,
            ),
          MigrationMatsCompanyField.website => AppTableCellText(
              item.data.website,
              alignment: cellAlignment,
            ),
          MigrationMatsCompanyField.idAramis => AppTableCellText(
              item.data.idAramis,
              alignment: cellAlignment,
            ),
          MigrationMatsCompanyField.idStaff => AppTableCellText(
              item.data.idStaff,
              alignment: cellAlignment,
            ),
          MigrationMatsCompanyField.idAvVerantw => AppTableCellText(
              item.data.idAvVerantw,
              alignment: cellAlignment,
            ),
          MigrationMatsCompanyField.standort => AppTableCellText(
              item.data.standort,
              alignment: cellAlignment,
            ),
          MigrationMatsCompanyField.isMigrated => AppTableCellBool(
              item.isMigrated,
              alignment: cellAlignment,
            ),
          MigrationMatsCompanyField.createdAt => AppTableCellText(
              item.meta.createdAt?.toLocal().toString(),
              alignment: cellAlignment,
            ),
          MigrationMatsCompanyField.createdBy => AppTableCellText(
              item.meta.createdById.toString(),
              alignment: cellAlignment,
            ),
          MigrationMatsCompanyField.lastModifiedAt => AppTableCellText(
              item.meta.lastModifiedAt?.toLocal().toString(),
              alignment: cellAlignment,
            ),
          MigrationMatsCompanyField.lastModifiedBy => AppTableCellText(
              item.meta.lastModifiedById.toString(),
              alignment: cellAlignment,
            ),
          MigrationMatsCompanyField.deletedAt => AppTableCellText(
              item.meta.deletedAt?.toLocal().toString(),
              alignment: cellAlignment,
            ),
          MigrationMatsCompanyField.isDraft => AppTableCellText(
              item.meta.isDraft.toString(),
              alignment: cellAlignment,
            ),
        };
      },
    );
  }
}
