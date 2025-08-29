import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/company_department/config/company_department_fields.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

enum CompanyDepartmentTableType {
  departments,
  selectDepartment,
}

/// CompanyDepartment Table Widget
class CompanyDepartmentTable extends ConsumerWidget {
  const CompanyDepartmentTable.departmentsView({
    required this.toolbarTrailingActions,
    required this.secondContent,
    required this.showTable,
    required this.showFilter,
    required this.dataProvider,
    required this.componentIdentifier,
    super.key,
    this.hiddenFilterGroup,
    this.initialFilter,
    this.onRowTap,
    this.isCollapsible = true,
  }) : type = CompanyDepartmentTableType.departments;

  const CompanyDepartmentTable.selectDepartment({
    required this.dataProvider,
    required this.onRowTap,
    required this.componentIdentifier,
    super.key,
    this.showFilter = true,
    this.showTable = true,
    this.toolbarTrailingActions = const [],
    this.secondContent,
    this.hiddenFilterGroup,
    this.initialFilter,
    this.isCollapsible = true,
  }) : type = CompanyDepartmentTableType.selectDepartment;

  final FilterGroup? hiddenFilterGroup;
  final Filter? initialFilter;
  final List<Widget>? toolbarTrailingActions;
  final bool showTable;
  final Widget? Function(String)? secondContent;
  final bool showFilter;
  final ProviderListenable<AsyncValue<List<CompanyDepartment>>> Function(String)
      dataProvider;
  final ComponentIdentifier componentIdentifier;
  final void Function(CompanyDepartment)? onRowTap;
  final bool isCollapsible;
  final CompanyDepartmentTableType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    return AppTableView<CompanyDepartment, CompanyDepartmentField>(
      tableDefaultNamePlural: crmL10n.company_department_plural,
      selfGrowable: true,
      isCollapsible: isCollapsible,
      tableViewIdentifier: componentIdentifier.name,
      isResizable: true,
      showTableViews: false,
      showTable: showTable,
      secondContent: secondContent,
      showToolbarDivider: true,
      initialFilter: initialFilter,
      hiddenFilterGroup: hiddenFilterGroup,
      dataProvider: dataProvider,
      toolbarTrailingActions: (sessionId) => [
        if (toolbarTrailingActions != null) ...toolbarTrailingActions!,
      ],
      onRowTap: onRowTap ??
          (item) {
            ref.openWindow(
              FloatingCompanyDepartmentWindowData(
                entityId: item.meta.id,
                companyId: item.companyId,
              ),
            );
          },
      fixedTableTitle: crmL10n.company_department_plural,
      defaultTableConfig: CompanyDepartmentFields.defaultTableColumns,
      availableFilterFieldsWithLabels: showFilter
          ? CompanyDepartmentField.values.filterableWithLabels(l10n, crmL10n)
          : null,
      availableTableColumnsWithLabels:
          CompanyDepartmentField.values.tableColumnsWithLabels(l10n, crmL10n),
      fieldFromKey: (fieldKey) =>
          CompanyDepartmentFields.fromFieldKey(fieldKey).value,
      buildCellTitle: (field) =>
          CompanyDepartmentFields.fromEnum(field).readable(l10n, crmL10n),
      getTitleAlignment: (field) =>
          CompanyDepartmentFields.fromEnum(field).cellAlignment,
      buildCell: (field, item) {
        final cellAlignment =
            CompanyDepartmentFields.fromEnum(field).cellAlignment;

        return switch (field) {
          CompanyDepartmentField.name => switch (type) {
              CompanyDepartmentTableType.selectDepartment =>
                AppTableCellOpenInNew(
                  item.name,
                  alignment: cellAlignment,
                  onPressed: () {
                    ref.openWindow(
                      FloatingCompanyDepartmentWindowData(
                        entityId: item.meta.id,
                        companyId: item.companyId,
                      ),
                    );
                  },
                ),
              CompanyDepartmentTableType.departments => AppTableCellText(
                  item.name,
                  alignment: cellAlignment,
                ),
            },
          CompanyDepartmentField.description => AppTableCellText(
              item.description,
              alignment: cellAlignment,
            ),
          CompanyDepartmentField.id => AppTableCellText(
              item.meta.id.toString(),
              alignment: cellAlignment,
            ),
          CompanyDepartmentField.createdAt => AppTableCellDateTime(
              item.meta.createdAt,
              alignment: cellAlignment,
            ),
          CompanyDepartmentField.createdBy => AppTableCellUser(
              item.meta.createdById,
              alignment: cellAlignment,
            ),
          CompanyDepartmentField.lastModifiedAt => AppTableCellDateTime(
              item.meta.lastModifiedAt,
              alignment: cellAlignment,
            ),
          CompanyDepartmentField.lastModifiedBy => AppTableCellUser(
              item.meta.lastModifiedById,
              alignment: cellAlignment,
            ),
          CompanyDepartmentField.deletedAt => const SizedBox.shrink(),
          CompanyDepartmentField.isDraft => const SizedBox.shrink(),
        };
      },
    );
  }
}
