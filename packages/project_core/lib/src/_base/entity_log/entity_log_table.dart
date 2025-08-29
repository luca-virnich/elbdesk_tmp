import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_core/src/core_component_identifier.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/src/_base/entity_log/entity_log_fields.dart';
import 'package:project_core/src/_base/entity_log/entity_log_repository.dart';

class EntityLogTable extends HookConsumerWidget {
  const EntityLogTable({
    required this.entityId,
    required this.tableType,
    required this.navigatorKey,
    required this.fieldTitle,
    super.key,
  });

  final int entityId;
  final TableType tableType;
  final GlobalKey<NavigatorState>? navigatorKey;
  final String Function(EntityLogDTO) fieldTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    return SelfScrollableCardItem(
      showRightPadding: true,
      child: AppTableView<EntityLogDTO, EntityLogField>(
        tableDefaultNamePlural: l10n.gen_change_log_plural,
        defaultTableConfig: _defaultConfig,
        dataProvider: (sessionId) => fetchEntityLogsProvider(
          entityId: entityId,
          tableType: tableType,
          sessionId: sessionId,
        ),
        showToolbarDivider: true,
        showTableViews: false,
        fixedTableTitle: l10n.gen_change_log_singular,
        fieldFromKey: (fieldKey) =>
            EntityLogFields.fromFieldKey(fieldKey).value,
        buildCellTitle: (field) =>
            EntityLogFields.fromEnum(field).readable(l10n, l10n),
        getTitleAlignment: (field) =>
            EntityLogFields.fromEnum(field).cellAlignment,
        availableFilterFieldsWithLabels: null,
        availableTableColumnsWithLabels: null,
        buildCell: (field, item) {
          return switch (field) {
            EntityLogField.id => AppTableCellText(item.id.toString()),
            EntityLogField.entityId =>
              AppTableCellText(item.entityId.toString()),
            EntityLogField.field => AppTableCellText(fieldTitle(item)),
            EntityLogField.oldValue => AppTableCellText(item.oldValue),
            EntityLogField.newValue => AppTableCellText(item.newValue),
            EntityLogField.editedAt =>
              AppTableCellDateTime(item.editedAt.toLocal()),
            EntityLogField.editedById => AppTableCellUser(item.editedById),
            EntityLogField.tableType => AppTableCellText(item.tableType.name),
          };
        },
        tableViewIdentifier: CoreComponentIdentifier.coreEntityLogTable.name,
        isCollapsible: false,
      ),
    );
  }
}

final _defaultConfig = [
  TableFieldConfig(
    width: 150,
    fieldKey: EntityLogField.field.name,
  ),
  TableFieldConfig(
    width: 300,
    fieldKey: EntityLogField.oldValue.name,
  ),
  TableFieldConfig(
    width: 300,
    fieldKey: EntityLogField.newValue.name,
  ),
  TableFieldConfig(
    width: 300,
    fieldKey: EntityLogField.editedAt.name,
  ),
  TableFieldConfig(
    width: 300,
    fieldKey: EntityLogField.editedById.name,
  ),
];
