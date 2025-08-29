import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';
import 'package:project_core/src/admin_migration/mats_person/config/migration_mats_person_default_config.dart';
import 'package:project_core/src/admin_migration/mats_person/fields/migration_mats_person_fields.dart';
import 'package:project_core/src/admin_migration/mats_person/logic/migration_mats_person_provider.dart';
import 'package:project_core/src/admin_migration/mats_person/models/migration_mats_person.dart';

/// Migration Mats Person Table
///
/// The Table View for displaying migration data from MATS system
class MigrationMatsPersonTable extends ConsumerWidget {
  const MigrationMatsPersonTable.standard({
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

    return AppTableView<MigrationMatsPerson, MigrationMatsPersonField>(
      tableDefaultNamePlural: 'Migration Mats Personen'.hc,
      tableViewIdentifier: ComponentIdentifier.migrationMatsPerson.name,
      hiddenFilterGroup: hiddenFilterGroup,
      availableFilterFieldsWithLabels:
          MigrationMatsPersonField.values.filterableWithLabels(
        l10n,
        crmL10n,
      ),
      availableTableColumnsWithLabels:
          MigrationMatsPersonField.values.tableColumnsWithLabels(
        l10n,
        crmL10n,
      ),
      toolbarTrailingActions: (_) => const [],
      onRowTap: null,
      showToolbarDivider: true,
      quickSearchFilterFields:
          MigrationMatsPersonField.values.filterableWithLabels(
        l10n,
        crmL10n,
      ),
      defaultTableConfig: migrationMatsPersonDefaultConfig,
      tableDensity: tableDensity,
      dataProvider: findMigrationMatsPersonsProvider.call,
      fieldFromKey: (fieldKey) =>
          MigrationMatsPersonFields.fromFieldKey(fieldKey).value,
      buildCellTitle: (field) =>
          MigrationMatsPersonFields.fromEnum(field).readable(l10n, crmL10n),
      getTitleAlignment: (field) =>
          MigrationMatsPersonFields.fromEnum(field).cellAlignment,
      buildCell: (field, item) {
        final cellAlignment =
            MigrationMatsPersonFields.fromEnum(field).cellAlignment;

        return switch (field) {
          MigrationMatsPersonField.idContact => AppTableCellText(
              item.data.idContact,
              alignment: cellAlignment,
            ),
          MigrationMatsPersonField.nameFirst => AppTableCellText(
              item.data.nameFirst,
              alignment: cellAlignment,
            ),
          MigrationMatsPersonField.nameLast => AppTableCellText(
              item.data.nameLast,
              alignment: cellAlignment,
            ),
          MigrationMatsPersonField.anrede => AppTableCellText(
              item.data.anrede,
              alignment: cellAlignment,
            ),
          MigrationMatsPersonField.titel => AppTableCellText(
              item.data.titel,
              alignment: cellAlignment,
            ),
          MigrationMatsPersonField.department => AppTableCellText(
              item.data.department,
              alignment: cellAlignment,
            ),
          MigrationMatsPersonField.position => AppTableCellText(
              item.data.position,
              alignment: cellAlignment,
            ),
          MigrationMatsPersonField.anredeLang => AppTableCellText(
              item.data.anredeLang,
              alignment: cellAlignment,
            ),
          MigrationMatsPersonField.idAccount => AppTableCellText(
              item.data.idAccount,
              alignment: cellAlignment,
            ),
          MigrationMatsPersonField.isPerson => AppTableCellBool(
              item.data.isPerson,
              alignment: cellAlignment,
            ),
          MigrationMatsPersonField.primaryStreet1 => AppTableCellText(
              item.data.primaryStreet1,
              alignment: cellAlignment,
            ),
          MigrationMatsPersonField.primaryStreet2 => AppTableCellText(
              item.data.primaryStreet2,
              alignment: cellAlignment,
            ),
          MigrationMatsPersonField.primaryPostalCode => AppTableCellText(
              item.data.primaryPostalCode,
              alignment: cellAlignment,
            ),
          MigrationMatsPersonField.primaryCity => AppTableCellText(
              item.data.primaryCity,
              alignment: cellAlignment,
            ),
          MigrationMatsPersonField.primaryCountry => AppTableCellText(
              item.data.primaryCountry,
              alignment: cellAlignment,
            ),
          MigrationMatsPersonField.primaryState => AppTableCellText(
              item.data.primaryState,
              alignment: cellAlignment,
            ),
          MigrationMatsPersonField.telefon1 => AppTableCellText(
              item.data.telefon1,
              alignment: cellAlignment,
            ),
          MigrationMatsPersonField.telefon2 => AppTableCellText(
              item.data.telefon2,
              alignment: cellAlignment,
            ),
          MigrationMatsPersonField.mobilTelefon => AppTableCellText(
              item.data.mobilTelefon,
              alignment: cellAlignment,
            ),
          MigrationMatsPersonField.fax => AppTableCellText(
              item.data.fax,
              alignment: cellAlignment,
            ),
          MigrationMatsPersonField.email => AppTableCellText(
              item.data.email,
              alignment: cellAlignment,
            ),
          MigrationMatsPersonField.status => AppTableCellText(
              item.data.status,
              alignment: cellAlignment,
            ),
          MigrationMatsPersonField.wK => AppTableCellText(
              item.data.wK,
              alignment: cellAlignment,
            ),
          MigrationMatsPersonField.wWf => AppTableCellText(
              item.data.wWf,
              alignment: cellAlignment,
            ),
          MigrationMatsPersonField.wFp => AppTableCellText(
              item.data.wFp,
              alignment: cellAlignment,
            ),
          MigrationMatsPersonField.contactInfor => AppTableCellText(
              item.data.contactInfor,
              alignment: cellAlignment,
            ),
          MigrationMatsPersonField.isMigrated => AppTableCellBool(
              item.isMigrated,
              alignment: cellAlignment,
            ),
          MigrationMatsPersonField.createdAt => AppTableCellText(
              item.meta.createdAt?.toLocal().toString(),
              alignment: cellAlignment,
            ),
          MigrationMatsPersonField.createdBy => AppTableCellText(
              item.meta.createdById.toString(),
              alignment: cellAlignment,
            ),
          MigrationMatsPersonField.lastModifiedAt => AppTableCellText(
              item.meta.lastModifiedAt?.toLocal().toString(),
              alignment: cellAlignment,
            ),
          MigrationMatsPersonField.lastModifiedBy => AppTableCellText(
              item.meta.lastModifiedById.toString(),
              alignment: cellAlignment,
            ),
          MigrationMatsPersonField.deletedAt => AppTableCellText(
              item.meta.deletedAt?.toLocal().toString(),
              alignment: cellAlignment,
            ),
          MigrationMatsPersonField.isDraft => AppTableCellText(
              item.meta.isDraft.toString(),
              alignment: cellAlignment,
            ),
        };
      },
    );
  }
}
