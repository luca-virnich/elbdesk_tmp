import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_core/src/core_component_identifier.dart';
import 'package:elbdesk_core/src/features/admin_log/config/serverpod_log_default_config.dart';
import 'package:elbdesk_core/src/features/admin_log/fields/serverpod_log_fields.dart';
import 'package:elbdesk_core/src/features/admin_log/models/serverpod_log.dart';
import 'package:elbdesk_core/src/features/admin_log/repositories/serverpod_log_repository.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';

/// Admin Log Table
///
/// Displays server logs in a table format
class ServerpodLogTable extends ConsumerWidget {
  const ServerpodLogTable({
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

    return AppTableView<ServerpodLog, ServerpodLogField>(
      tableDefaultNamePlural: l10n.serverpod_log_entry_plural,
      tableViewIdentifier: CoreComponentIdentifier.coreServerpodLogTable.name,
      isCollapsible: false,
      showToolbarDivider: true,
      hiddenFilterGroup: hiddenFilterGroup,
      availableFilterFieldsWithLabels:
          ServerpodLogField.values.filterableWithLabels(
        l10n,
      ),
      availableTableColumnsWithLabels:
          ServerpodLogField.values.tableColumnsWithLabels(
        l10n,
      ),
      quickSearchFilterFields: null,
      defaultTableConfig: serverpodLogDefaultConfig,
      tableDensity: tableDensity ?? AppTableDensity.compact,
      dataProvider: fetchAdminLogsProvider.call,
      onRowTap: (item) {
        ref.openWindow(
          FloatingServerpodLogWindowData(logId: item.id!),
        );
      },
      fieldFromKey: (fieldKey) =>
          ServerpodLogFields.fromFieldKey(fieldKey).value,
      buildCellTitle: (field) =>
          ServerpodLogFields.fromEnum(field).readable(l10n, l10n),
      getTitleAlignment: (field) =>
          ServerpodLogFields.fromEnum(field).cellAlignment,
      buildCell: (field, item) {
        final cellAlignment = ServerpodLogFields.fromEnum(field).cellAlignment;

        return switch (field) {
          ServerpodLogField.id => AppTableCellText(
              item.id.toString(),
              alignment: cellAlignment,
            ),
          ServerpodLogField.time => AppTableCellDateTime(
              item.time,
              alignment: cellAlignment,
            ),
          ServerpodLogField.message => AppTableCellText(
              item.message,
              alignment: cellAlignment,
            ),
          ServerpodLogField.logLevel => AppTableCellText(
              ServerpodLogFields.getLevelReadable(item.level, l10n),
              alignment: cellAlignment,
            ),
          ServerpodLogField.error => AppTableCellText(
              item.error ?? '',
              alignment: cellAlignment,
            ),
          ServerpodLogField.stackTrace => AppTableCellText(
              item.stackTrace ?? '',
              alignment: cellAlignment,
            ),
          ServerpodLogField.reference => AppTableCellText(
              item.reference ?? '',
              alignment: cellAlignment,
            ),
          ServerpodLogField.serverId => AppTableCellText(
              item.serverId ?? '',
              alignment: cellAlignment,
            ),
          ServerpodLogField.sessionLogId => AppTableCellText(
              item.sessionLogId.toString(),
              alignment: cellAlignment,
            ),
          ServerpodLogField.messageId => AppTableCellText(
              item.messageId.toString(),
              alignment: cellAlignment,
            ),
        };
      },
    );
  }
}
