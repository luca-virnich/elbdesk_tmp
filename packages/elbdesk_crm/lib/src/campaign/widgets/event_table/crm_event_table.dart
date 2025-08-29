import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/campaign/config/crm_event_fields.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

/// CRM Event Table
///
/// This table displays all CRM events and allows the user to
/// create, edit and delete events.
class CrmEventTable extends HookConsumerWidget {
  const CrmEventTable({
    required this.navigatorKey,
    required this.floatingWindowFocus,
    required this.componentIdentifier,
    this.isCollapsible = true,
    super.key,
    this.floatingWindowId,
    this.initialTableConfig,
  });

  final List<TableFieldConfig>? initialTableConfig;
  final GlobalKey<NavigatorState> navigatorKey;
  final String? floatingWindowId;
  final FocusNode floatingWindowFocus;
  final ComponentIdentifier componentIdentifier;
  final bool isCollapsible;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionId = useUuid();
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;

    return AppTableView<CrmEvent, CrmEventField>(
      tableDefaultNamePlural: crmL10n.event_plural,
      tableViewIdentifier: componentIdentifier.name,
      sessionId: sessionId,
      isCollapsible: isCollapsible,
      showTableViews: true,
      defaultTableConfig: CrmEventFields.defaultTableColumns,
      tableDensity: null,
      onRowTap: (item) {
        ref.openWindow(
          FloatingCrmEventWindowData(
            eventId: item.meta.id,
          ),
        );
      },
      dataProvider: (sessionId) => fetchAndWatchAllCrmEventsProvider,
      fieldFromKey: (fieldKey) => CrmEventFields.fromFieldKey(fieldKey).value,
      showToolbarDivider: true,
      buildCell: (field, item) {
        final alignment = CrmEventFields.fromEnum(field).cellAlignment;
        return switch (field) {
          CrmEventField.id => AppTableCellText(
              item.meta.id.toString(),
              alignment: alignment,
            ),
          CrmEventField.name => AppTableCellText(
              item.name,
              alignment: alignment,
            ),
          CrmEventField.description => AppTableCellText(
              item.description,
              alignment: alignment,
            ),
          CrmEventField.startDate => AppTableCellDateTime(
              item.startDate,
              alignment: alignment,
            ),
          CrmEventField.endDate => AppTableCellDateTime(
              item.endDate,
              alignment: alignment,
            ),
          CrmEventField.status => AppTableCellText(
              leadingIconColor:
                  item.status.color(context.appTheme.statusColors),
              leadingIconData: item.status.icon,
              item.status.name,
              alignment: alignment,
            ),
          CrmEventField.createdAt => AppTableCellDateTime(
              item.meta.createdAt,
              alignment: alignment,
            ),
          CrmEventField.createdBy => AppTableCellUser(
              item.meta.createdById,
              alignment: alignment,
            ),
          CrmEventField.lastModifiedAt => AppTableCellDateTime(
              item.meta.lastModifiedAt,
              alignment: alignment,
            ),
          CrmEventField.lastModifiedBy => AppTableCellUser(
              item.meta.lastModifiedById,
              alignment: alignment,
            ),
          CrmEventField.deletedAt => AppTableCellDateTime(
              item.meta.deletedAt,
              alignment: alignment,
            ),
          CrmEventField.isDraft => AppTableCellBool(
              item.meta.isDraft,
              alignment: alignment,
            ),
          CrmEventField.executionDate => AppTableCellDateTime(
              item.executionDate,
              alignment: alignment,
            ),
        };
      },
      buildCellTitle: (field) =>
          CrmEventFields.fromEnum(field).readable(l10n, crmL10n),
      getTitleAlignment: (field) =>
          CrmEventFields.fromEnum(field).cellAlignment,
      availableFilterFieldsWithLabels:
          CrmEventField.values.filterableWithLabels(l10n, crmL10n),
      availableTableColumnsWithLabels:
          CrmEventField.values.tableColumnsWithLabels(l10n, crmL10n),
      toolbarTrailingActions: (sessionId) => [
        AppTableRefreshButton(
          onPressed: () {
            ref.invalidate(findCrmEventsProvider);
          },
        ),
        const _AddEventButton(
          readOnly: false,
        ),
      ],
    );
  }
}

class _AddEventButton extends HookConsumerWidget {
  const _AddEventButton({
    required this.readOnly,
  });

  final bool readOnly;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    return AppButton.primary(
      onPressed: readOnly
          ? null
          : () {
              ref.openWindow(
                FloatingCrmEventWindowData(
                  eventId: null,
                ),
              );
            },
      tooltip: l10n.gen_add_entity(crmL10n.event_singular),
      iconData: AppIcons.add,
    );
  }
}
