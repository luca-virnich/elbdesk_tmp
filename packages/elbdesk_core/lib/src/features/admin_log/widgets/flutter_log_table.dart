import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_core/src/core_component_identifier.dart';
import 'package:elbdesk_core/src/features/admin_log/config/flutter_log_default_config.dart';
import 'package:elbdesk_core/src/features/admin_log/fields/flutter_log_fields.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';

/// Flutter Error Log Table
///
/// Displays Flutter client-side error logs in a table format
class FlutterLogTable extends ConsumerWidget {
  const FlutterLogTable({
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

    return AppTableView<FlutterLog, FlutterLogField>(
      tableDefaultNamePlural: l10n.flutter_log_entry_plural,
      tableViewIdentifier: CoreComponentIdentifier.coreFlutterLogTable.name,
      isCollapsible: false,
      showToolbarDivider: true,
      hiddenFilterGroup: hiddenFilterGroup,
      availableFilterFieldsWithLabels:
          FlutterLogField.values.filterableWithLabels(l10n),
      availableTableColumnsWithLabels:
          FlutterLogField.values.tableColumnsWithLabels(l10n),
      quickSearchFilterFields: FlutterLogField.values.quickSearchFields(l10n),
      defaultTableConfig: flutterLogDefaultConfig,
      tableDensity: tableDensity ?? AppTableDensity.compact,
      dataProvider: fetchFlutterLogsProvider.call,
      onRowTap: (item) {
        ref.openWindow(
          FloatingFlutterLogWindowData(logId: item.id!),
        );
      },
      fieldFromKey: (fieldKey) => FlutterLogFields.fromFieldKey(fieldKey).value,
      buildCellTitle: (field) =>
          FlutterLogFields.fromEnum(field).readable(l10n, l10n),
      getTitleAlignment: (field) =>
          FlutterLogFields.fromEnum(field).cellAlignment,
      buildCell: (field, item) {
        final cellAlignment = FlutterLogFields.fromEnum(field).cellAlignment;

        return switch (field) {
          FlutterLogField.id => AppTableCellText(
              item.id.toString(),
              alignment: cellAlignment,
            ),
          FlutterLogField.time => AppTableCellDateTime(
              item.time,
              alignment: cellAlignment,
            ),
          FlutterLogField.exception => AppTableCellText(
              item.exception,
              alignment: cellAlignment,
            ),
          FlutterLogField.context => AppTableCellText(
              item.context ?? '',
              alignment: cellAlignment,
            ),
          FlutterLogField.flutterLibrary => AppTableCellText(
              item.flutterLibrary ?? '',
              alignment: cellAlignment,
            ),
          FlutterLogField.stack => AppTableCellText(
              item.stack ?? '',
              alignment: cellAlignment,
            ),
          FlutterLogField.silent => AppTableCellBool(
              item.silent ?? false,
              alignment: cellAlignment,
            ),
          FlutterLogField.information => AppTableCellText(
              item.information ?? '',
              alignment: cellAlignment,
            ),
          FlutterLogField.deviceId => AppTableCellText(
              item.deviceId ?? '',
              alignment: cellAlignment,
            ),
          FlutterLogField.userId => AppTableCellText(
              item.userId?.toString() ?? '',
              alignment: cellAlignment,
            ),
          FlutterLogField.platform => AppTableCellText(
              item.platform ?? '',
              alignment: cellAlignment,
            ),
          FlutterLogField.appVersion => AppTableCellText(
              item.appVersion ?? '',
              alignment: cellAlignment,
            ),
          FlutterLogField.buildNumber => AppTableCellText(
              item.buildNumber ?? '',
              alignment: cellAlignment,
            ),
        };
      },
    );
  }
}
