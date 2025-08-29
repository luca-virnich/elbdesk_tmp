import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/department_code/config/department_code_fields.dart';
import 'package:elbdesk_crm/src/department_code/widgets/department_code_card.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

class DepartmentCodeTable extends HookConsumerWidget {
  const DepartmentCodeTable({
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.componentIdentifier,
    this.isCollapsible = true,
    super.key,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  final ComponentIdentifier componentIdentifier;
  final bool isCollapsible;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionId = useUuid();

    final l10n = context.l10n;
    final crmL10n = context.crmL10n;

    return AppTableView<DepartmentCode, DepartmentCodeField>(
      tableDefaultNamePlural: crmL10n.department_code_plural,
      tableViewIdentifier: componentIdentifier.name,
      isCollapsible: isCollapsible,
      showToolbarDivider: true,
      sessionId: sessionId,
      toolbarPadding:
          const EdgeInsets.only(right: UiConstants.tableCardToolbarPadding),
      defaultTableConfig: DepartmentCodeFields.defaultTableColumns,
      onRowTap: (item) async {
        await showElbDialog<void>(
          context: context,
          navigatorKey: navigatorKey,
          child: DepartmentCodeCard(
            floatingWindowId: floatingWindowId,
            entityId: item.id,
            navigatorKey: navigatorKey,
            floatingWindowFocus: floatingWindowFocus,
          ),
        );
      },
      dataProvider: (sessionId) => findDepartmentCodesProvider(sessionId),
      fieldFromKey: (fieldKey) =>
          DepartmentCodeFields.fromFieldKey(fieldKey).value,
      buildCell: (field, item) {
        final alignment = DepartmentCodeFields.fromEnum(field).cellAlignment;
        return switch (field) {
          DepartmentCodeField.deletedAt => AppTableCellDateTime(
              item.meta.deletedAt,
              alignment: alignment,
            ),
          DepartmentCodeField.isDraft => AppTableCellBool(
              item.meta.isDraft,
              alignment: alignment,
            ),
          DepartmentCodeField.id => AppTableCellText(
              item.id.toString(),
              alignment: alignment,
            ),
          DepartmentCodeField.code => AppTableCellText(
              item.code,
              alignment: alignment,
            ),
          DepartmentCodeField.description => AppTableCellText(
              item.description,
              alignment: alignment,
            ),
          DepartmentCodeField.createdAt => AppTableCellDateTime(
              item.meta.createdAt,
              alignment: alignment,
            ),
          DepartmentCodeField.createdBy => AppTableCellUser(
              item.meta.createdById,
              alignment: alignment,
            ),
          DepartmentCodeField.lastModifiedAt => AppTableCellDateTime(
              item.meta.lastModifiedAt,
              alignment: alignment,
            ),
          DepartmentCodeField.lastModifiedBy => AppTableCellUser(
              item.meta.lastModifiedById,
              alignment: alignment,
            ),
        };
      },
      buildCellTitle: (field) =>
          DepartmentCodeFields.fromEnum(field).readable(l10n, crmL10n),
      getTitleAlignment: (field) =>
          DepartmentCodeFields.fromEnum(field).cellAlignment,
      availableFilterFieldsWithLabels:
          DepartmentCodeField.values.filterableWithLabels(
        l10n,
        crmL10n,
      ),
      availableTableColumnsWithLabels:
          DepartmentCodeField.values.tableColumnsWithLabels(l10n, crmL10n),
      toolbarTrailingActions: (sessionId) => [
        AppTableRefreshButton(
          onPressed: () {
            ref.invalidate(findDepartmentCodesProvider);
          },
        ),
        AddEntityInDialogButton<DepartmentCode>(
          entityCard: DepartmentCodeCard(
            floatingWindowId: floatingWindowId,
            entityId: null,
            navigatorKey: navigatorKey,
            floatingWindowFocus: floatingWindowFocus,
          ),
          navigatorKey: navigatorKey,
          title: l10n.gen_add_entity(crmL10n.department_code_singular),
          tooltip: l10n.gen_add_entity(crmL10n.department_code_singular),
        ),
      ],
      toolbarMobileTrailingActions: (sessionId) => [
        MobileTableToolbarActionItem(
          onPressed: () {
            ref.invalidate(findDepartmentCodesProvider);
          },
          label: l10n.gen_refresh,
          icon: AppIcons.refresh,
        ),
        MobileTableToolbarActionItem(
          onPressed: () {
            showElbDialog<DepartmentCode>(
              context: context,
              navigatorKey: navigatorKey,
              child: DepartmentCodeCard(
                floatingWindowId: floatingWindowId,
                entityId: null,
                navigatorKey: navigatorKey,
                floatingWindowFocus: floatingWindowFocus,
              ),
            );
          },
          label: crmL10n.department_code_singular,
          icon: AppIcons.add,
        ),
      ],
    );
  }
}
