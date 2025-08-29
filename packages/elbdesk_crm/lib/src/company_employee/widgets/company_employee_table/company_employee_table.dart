import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/company_employee/config/company_employee_fields.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

enum CompanyEmployeeTableType {
  employeesView,
  companiesView,
  departmentView,
}

class CompanyEmployeeTable extends ConsumerWidget {
  const CompanyEmployeeTable.employeesView({
    required this.toolbarTrailingActions,
    required this.secondContent,
    required this.showTable,
    required this.showFilter,
    required this.dataProvider,
    required this.componentIdentifier,
    required this.isCollapsible,
    this.sessionId,
    this.onRowTap,
    this.showTableViews,
    super.key,
    this.hiddenFilterGroup,
    this.initialFilter,
  })  : tableType = CompanyEmployeeTableType.employeesView,
        departmentId = null;

  const CompanyEmployeeTable.companiesView({
    required this.toolbarTrailingActions,
    required this.secondContent,
    required this.showTable,
    required this.showFilter,
    required this.dataProvider,
    required this.componentIdentifier,
    required this.isCollapsible,
    this.onRowTap,
    super.key,
    this.hiddenFilterGroup,
    this.initialFilter,
  })  : tableType = CompanyEmployeeTableType.companiesView,
        departmentId = null,
        showTableViews = null,
        sessionId = null;

  const CompanyEmployeeTable.departmentView({
    required this.toolbarTrailingActions,
    required this.secondContent,
    required this.showTable,
    required this.showFilter,
    required this.dataProvider,
    required this.componentIdentifier,
    required this.departmentId,
    this.isCollapsible = true,
    super.key,
    this.hiddenFilterGroup,
    this.initialFilter,
  })  : tableType = CompanyEmployeeTableType.departmentView,
        showTableViews = false,
        sessionId = null,
        onRowTap = null;

  final int? departmentId;
  final FilterGroup? hiddenFilterGroup;
  final Filter? initialFilter;
  final List<Widget>? toolbarTrailingActions;
  final bool showTable;
  final bool? showTableViews;

  final Widget? Function(String)? secondContent;
  final bool showFilter;
  final void Function(CompanyEmployee)? onRowTap;
  final ProviderListenable<AsyncValue<List<CompanyEmployee>>> Function(String)
      dataProvider;
  final CompanyEmployeeTableType tableType;
  final ComponentIdentifier componentIdentifier;
  final String? sessionId;
  final bool isCollapsible;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    return AppTableView<CompanyEmployee, CompanyEmployeeField>(
      sessionId: sessionId,
      tableDefaultNamePlural: crmL10n.company_employee_plural,
      selfGrowable: true,
      tableViewIdentifier: componentIdentifier.name,
      isCollapsible: isCollapsible,
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
              FloatingCompanyEmployeeWindowData(
                entityId: item.meta.id!,
              ),
            );
          },
      fixedTableTitle: switch (tableType) {
        CompanyEmployeeTableType.employeesView =>
          crmL10n.company_employee_assigned_employees,
        CompanyEmployeeTableType.companiesView =>
          crmL10n.company_employee_assigned_companies,
        CompanyEmployeeTableType.departmentView =>
          crmL10n.company_employee_assigned_employees,
      },
      defaultTableConfig: switch (tableType) {
        CompanyEmployeeTableType.employeesView =>
          CompanyEmployeeFields.defaultEmployeeTableColumns,
        CompanyEmployeeTableType.companiesView =>
          CompanyEmployeeFields.defaultCompanyTableColumns,
        CompanyEmployeeTableType.departmentView =>
          CompanyEmployeeFields.defaultDepartmentTableColumns,
      },
      availableFilterFieldsWithLabels: showFilter
          ? switch (tableType) {
              CompanyEmployeeTableType.employeesView => CompanyEmployeeField
                  .values
                  .filterableWithLabelsEmployeesView(l10n, crmL10n),
              CompanyEmployeeTableType.companiesView => CompanyEmployeeField
                  .values
                  .filterableWithLabelsCompaniesView(l10n, crmL10n),
              CompanyEmployeeTableType.departmentView => CompanyEmployeeField
                  .values
                  .filterableWithLabelsEmployeesView(l10n, crmL10n),
            }
          : null,
      availableTableColumnsWithLabels: switch (tableType) {
        CompanyEmployeeTableType.employeesView => CompanyEmployeeField.values
            .tableColumnsWithLabelsEmployeesView(l10n, crmL10n),
        CompanyEmployeeTableType.companiesView => CompanyEmployeeField.values
            .tableColumnsWithLabelsCompaniesView(l10n, crmL10n),
        CompanyEmployeeTableType.departmentView => CompanyEmployeeField.values
            .tableColumnsWithLabelsEmployeesView(l10n, crmL10n),
      },
      quickSearchFilterFields: showFilter
          ? switch (tableType) {
              CompanyEmployeeTableType.employeesView => CompanyEmployeeField
                  .values
                  .quickSearchFilterEmployeesView(l10n, crmL10n),
              CompanyEmployeeTableType.companiesView => CompanyEmployeeField
                  .values
                  .quickSearchFilterCompaniesView(l10n, crmL10n),
              CompanyEmployeeTableType.departmentView => CompanyEmployeeField
                  .values
                  .quickSearchFilterEmployeesView(l10n, crmL10n),
            }
          : null,
      fieldFromKey: (fieldKey) =>
          CompanyEmployeeFields.fromFieldKey(fieldKey).value,
      buildCellTitle: (field) =>
          CompanyEmployeeFields.fromEnum(field).readable(l10n, crmL10n),
      getTitleAlignment: (field) =>
          CompanyEmployeeFields.fromEnum(field).cellAlignment,
      buildCell: (field, item) {
        final cellAlignment =
            CompanyEmployeeFields.fromEnum(field).cellAlignment;

        return switch (field) {
          // general
          CompanyEmployeeField.id => AppTableCellText(
              item.meta.id.toString(),
              alignment: cellAlignment,
            ),
          CompanyEmployeeField.company => AppTableCellText(
              item.company.general.name,
              alignment: cellAlignment,
            ),
          CompanyEmployeeField.employee => AppTableCellText(
              item.employee.general.name,
              alignment: cellAlignment,
            ),
          CompanyEmployeeField.position => AppTableCellText(
              item.position,
              alignment: cellAlignment,
            ),
          CompanyEmployeeField.department => AppTableCellText(
              item.departments?.map((e) => e.name).join(', '),
              alignment: cellAlignment,
            ),
          CompanyEmployeeField.active => AppTableCellBool(
              item.active,
              alignment: cellAlignment,
            ),
          CompanyEmployeeField.note => AppTableCellText(
              item.note,
              alignment: cellAlignment,
            ),

          // employee contact
          CompanyEmployeeField.filterByEmployeeContactIdOrFullName =>
            const SizedBox.shrink(),
          CompanyEmployeeField.employeeContactCustomId => AppTableCellOpenInNew(
              item.employee.fullContactId,
              alignment: cellAlignment,
              onPressed: () {
                final isPerson =
                    item.employee.general.type == ContactType.person;
                if (isPerson) {
                  ref.openWindow(
                    FloatingContactPersonWindowData(
                      contactId: item.employee.meta.id,
                    ),
                  );
                } else {
                  ref.openWindow(
                    FloatingContactCompanyWindowData(
                      contactId: item.employee.meta.id,
                    ),
                  );
                }
              },
            ),
          CompanyEmployeeField.employeeContactFullName => AppTableCellOpenInNew(
              item.employee.general.name,
              alignment: cellAlignment,
              onPressed: () {
                final isPerson =
                    item.employee.general.type == ContactType.person;
                if (isPerson) {
                  ref.openWindow(
                    FloatingContactPersonWindowData(
                      contactId: item.employee.meta.id,
                    ),
                  );
                } else {
                  ref.openWindow(
                    FloatingContactCompanyWindowData(
                      contactId: item.employee.meta.id,
                    ),
                  );
                }
              },
            ),
          CompanyEmployeeField.employeeContactAddress => AppTableCellText(
              item.employee.address.address,
              alignment: cellAlignment,
            ),
          CompanyEmployeeField.employeeContactAddress2 => AppTableCellText(
              item.employee.address.address2,
              alignment: cellAlignment,
            ),
          CompanyEmployeeField.employeeContactPostCode => AppTableCellText(
              item.employee.address.postCode,
              alignment: cellAlignment,
            ),
          CompanyEmployeeField.employeeContactCity => AppTableCellText(
              item.employee.address.city,
              alignment: cellAlignment,
            ),
          CompanyEmployeeField.employeeContactState => AppTableCellText(
              item.employee.address.state,
              alignment: cellAlignment,
            ),
          CompanyEmployeeField.employeeContactPhone => AppTableCellText(
              item.employee.communication.phone,
              alignment: cellAlignment,
            ),
          CompanyEmployeeField.employeeContactEmail => AppTableCellText(
              item.employee.communication.email,
              alignment: cellAlignment,
            ),
          CompanyEmployeeField.employeeContactMobile => AppTableCellText(
              item.employee.communication.mobile,
              alignment: cellAlignment,
            ),
          CompanyEmployeeField.employeeContactLanguageCode => AppTableCellText(
              item.employee.general.languageCode?.name ?? '',
              alignment: cellAlignment,
            ),
          CompanyEmployeeField.employeeContactCountryCode => AppTableCellText(
              item.employee.address.countryCode?.name ?? '',
              alignment: cellAlignment,
            ),

          // company contact
          CompanyEmployeeField.filterByCompanyContactIdOrFullName =>
            const SizedBox.shrink(),
          CompanyEmployeeField.companyContactCustomId => AppTableCellOpenInNew(
              item.company.fullContactId,
              alignment: cellAlignment,
              onPressed: () {
                final isPerson =
                    item.company.general.type == ContactType.person;
                if (isPerson) {
                  ref.openWindow(
                    FloatingContactPersonWindowData(
                      contactId: item.company.meta.id,
                    ),
                  );
                } else {
                  ref.openWindow(
                    FloatingContactCompanyWindowData(
                      contactId: item.company.meta.id,
                    ),
                  );
                }
              },
            ),
          CompanyEmployeeField.companyContactFullName => AppTableCellOpenInNew(
              item.company.general.name,
              alignment: cellAlignment,
              onPressed: () {
                final isPerson =
                    item.company.general.type == ContactType.person;
                if (isPerson) {
                  ref.openWindow(
                    FloatingContactPersonWindowData(
                      contactId: item.company.meta.id,
                    ),
                  );
                } else {
                  ref.openWindow(
                    FloatingContactCompanyWindowData(
                      contactId: item.company.meta.id,
                    ),
                  );
                }
              },
            ),
          CompanyEmployeeField.companyContactAddress => AppTableCellText(
              item.company.address.address,
              alignment: cellAlignment,
            ),
          CompanyEmployeeField.companyContactAddress2 => AppTableCellText(
              item.company.address.address2,
              alignment: cellAlignment,
            ),
          CompanyEmployeeField.companyContactPostCode => AppTableCellText(
              item.company.address.postCode,
              alignment: cellAlignment,
            ),
          CompanyEmployeeField.companyContactCity => AppTableCellText(
              item.company.address.city,
              alignment: cellAlignment,
            ),
          CompanyEmployeeField.companyContactState => AppTableCellText(
              item.company.address.state,
              alignment: cellAlignment,
            ),
          CompanyEmployeeField.companyContactPhone => AppTableCellText(
              item.company.communication.phone,
              alignment: cellAlignment,
            ),
          CompanyEmployeeField.companyContactEmail => AppTableCellText(
              item.company.communication.email,
              alignment: cellAlignment,
            ),
          CompanyEmployeeField.companyContactMobile => AppTableCellText(
              item.company.communication.mobile,
              alignment: cellAlignment,
            ),
          CompanyEmployeeField.companyContactLanguageCode => AppTableCellText(
              item.company.general.languageCode?.name ?? '',
              alignment: cellAlignment,
            ),
          CompanyEmployeeField.companyContactCountryCode => AppTableCellText(
              item.company.address.countryCode?.name ?? '',
              alignment: cellAlignment,
            ),

          // actions (Used for deletion in departmentCard)
          CompanyEmployeeField.actions => departmentId != null
              ? AppTableCellTextButton(
                  l10n.gen_delete,
                  textColor: context.appTheme.generalColors.danger,
                  alignment: cellAlignment,
                  onPressed: () {
                    ref
                        .read(companyEmployeeRepositoryProvider)
                        .removeEmployeeFromDepartment(
                          companyEmployeeId: item.meta.id!,
                          departmentId: departmentId!,
                        );
                  },
                )
              : const SizedBox.shrink(),

          // meta fields
          CompanyEmployeeField.createdAt => const SizedBox.shrink(),
          CompanyEmployeeField.createdBy => const SizedBox.shrink(),
          CompanyEmployeeField.lastModifiedAt => const SizedBox.shrink(),
          CompanyEmployeeField.lastModifiedBy => const SizedBox.shrink(),
          CompanyEmployeeField.deletedAt => const SizedBox.shrink(),
          CompanyEmployeeField.isDraft => const SizedBox.shrink(),
        };
      },
    );
  }
}
