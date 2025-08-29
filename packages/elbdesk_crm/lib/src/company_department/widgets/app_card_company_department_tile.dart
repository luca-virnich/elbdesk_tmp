import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// This widget shows a Tile for a company department.
class AppCardCompanyDepartmentTile extends HookConsumerWidget {
  /// This constructor is used to show a company department.
  const AppCardCompanyDepartmentTile({
    required this.companyDepartment,
    required this.sessionId,
    required this.navigatorKey,
    super.key,
  });

  final CompanyDepartment companyDepartment;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    final employeesAsync = ref.watch(
      watchEmployeesByCompanyAndDepartmentProvider(
        sessionId,
        companyId: companyDepartment.companyId,
        departmentId: companyDepartment.meta.id!,
      ),
    );

    final isDialogOpen = useState<bool>(false);
    final crmL10n = context.crmL10n;

    return AppCardTile(
      title: companyDepartment.name,
      onTitleTap: () {
        ref.openWindow(
          FloatingCompanyDepartmentWindowData(
            entityId: companyDepartment.meta.id,
            companyId: companyDepartment.companyId,
          ),
        );
      },
      onDelete: () async {
        if (isDialogOpen.value) return;
        isDialogOpen.value = true;
        final result = await showElbDialog<bool>(
          context: context,
          navigatorKey: navigatorKey,
          child: ElbAlertDialog(
            titleText: l10n.gen_attention,
            contentText: crmL10n.customer_department_delete_dialog_text(
              companyDepartment.name,
            ),
            onCancel: () {
              Navigator.of(context).pop(false);
            },
            actions: [
              AppButton.secondary(
                label: l10n.gen_cancel,
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              AppButton.danger(
                label: l10n.gen_remove,
                onPressed: () async {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          ),
        );

        if ((result ?? false) && context.mounted) {
          await AsyncHandler.handleAsyncOperation(
            context,
            () => ref.read(companyDepartmentRepositoryProvider).delete(
                  companyDepartment.meta.id!,
                  sessionId,
                ),
            successMessage: l10n.gen_deleted_entity_hint_message,
            successNavigatorKey: navigatorKey,
            errorNavigatorKey: navigatorKey,
          );
        }
        if (context.mounted) isDialogOpen.value = false;
      },
      leadingIcon: const ElbIcon(AppIcons.companyDepartment),
      trailing: null,
      content: employeesAsync.fastWhen(
        data: (employees) => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left side - Department info
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSpace.s),
                  if (companyDepartment.description.isNotEmpty)
                    AppText(companyDepartment.description),
                  const SizedBox(height: AppSpace.s),
                  AppText(
                    '${employees.length} '
                    '${crmL10n.employee}',
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpace.l),
            // Right side - Employee list
            Expanded(
              flex: 2,
              child: _DepartmentEmployeesList(
                departmentId: companyDepartment.meta.id!,
                companyId: companyDepartment.companyId,
                sessionId: sessionId,
                navigatorKey: navigatorKey,
                employees: employees,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Widget to display employees for a specific department
class _DepartmentEmployeesList extends ConsumerWidget {
  const _DepartmentEmployeesList({
    required this.departmentId,
    required this.companyId,
    required this.sessionId,
    required this.navigatorKey,
    required this.employees,
  });

  final int departmentId;
  final int companyId;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;
  final List<CompanyEmployee> employees;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final theme = context.appTheme;
    final crmL10n = context.crmL10n;
    if (employees.isEmpty) {
      return Row(
        children: [
          ElbIcon(
            AppIcons.person,
            size: AppIconSize.s,
            color: theme.generalColors.onBackground.withAppOpacity(0.4),
          ),
          const SizedBox(width: AppSpace.xs),
          Expanded(
            child: AppText(
              crmL10n.company_employee_no_assigned_employees,
              color: theme.generalColors.onBackground.withAppOpacity(0.6),
            ),
          ),
        ],
      );
    }

    // Show first 5 employees in 2 columns, with "more" indicator replacing
    // 6th employee
    final displayEmployees = employees.take(5).toList();
    final hasMore = employees.length > 5;
    final remainingCount = employees.length - 5;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Employee grid - 2 columns
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First column
            Expanded(
              child: Column(
                children: [
                  ...displayEmployees.take(3).map(
                        (employee) => _EmployeeItem(
                          employee: employee,
                        ),
                      ),
                ],
              ),
            ),
            const SizedBox(width: AppSpace.s),
            // Second column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...displayEmployees.skip(3).take(2).map(
                        (employee) => _EmployeeItem(
                          employee: employee,
                        ),
                      ),
                  // Show more indicator in place of 6th employee
                  if (hasMore)
                    Padding(
                      padding: const EdgeInsets.only(top: AppSpace.xs),
                      child: AppText(
                        l10n.gen_count_more(remainingCount),
                        style: theme.textStyles.defaultTextLight.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Individual employee item widget
class _EmployeeItem extends StatelessWidget {
  const _EmployeeItem({
    required this.employee,
  });

  final CompanyEmployee employee;

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpace.xs),
      child: Row(
        children: [
          // Avatar/Icon
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: theme.generalColors.primary.withAppOpacity(0.1),
              borderRadius: BorderRadius.circular(theme.borderRadiuses.xs),
            ),
            child: ElbIcon(
              AppIcons.person,
              size: AppIconSize.m,
              color: theme.generalColors.primary,
            ),
          ),
          const SizedBox(width: AppSpace.xs),
          // Employee info
          AppText(
            maxLines: 1,
            employee.employee.general.name,
            style: theme.textStyles.defaultText,
            color: theme.generalColors.onBackground,
          ),
          if (employee.position.isNotEmpty) ...[
            const SizedBox(height: 1),
            Flexible(
              child: AppText(
                maxLines: 1,
                ' (${employee.position})'.hc,
                style: theme.textStyles.defaultTextLight,
                color: theme.generalColors.onBackground.withAppOpacity(0.7),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
