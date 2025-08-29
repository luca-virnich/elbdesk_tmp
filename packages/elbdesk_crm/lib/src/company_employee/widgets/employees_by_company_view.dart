import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/company_employee/widgets/company_employee_table/company_employee_table.dart';
import 'package:elbdesk_crm/src/contact/widgets/contact_card/in_window_contact_selection.dart';
import 'package:elbdesk_crm/src/ui/app_card_company_employee_tile.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

class EmployeesByCompanyView extends HookConsumerWidget {
  /// All employees of a company contact.
  const EmployeesByCompanyView({
    required this.contactId,
    required this.sessionId,
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.componentIdentifier,
    super.key,
  });
  // The contactId (of the company)
  final int contactId;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;

  final ComponentIdentifier componentIdentifier;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // we should invalidate this provider when a attached employee is
    // deleted or updated
    final crmL10n = context.crmL10n;
    final l10n = context.l10n;
    final showListView = useState<bool>(false);
    final floatingWindowFocus = ref.watch(
      windowFocusNodeProvider(floatingWindowId),
    );

    return SelfScrollableCardItem(
      showRightPadding: true,
      child: CompanyEmployeeTable.employeesView(
        sessionId: sessionId,
        componentIdentifier: componentIdentifier,
        isCollapsible: false,
        showFilter: true,
        dataProvider: (sessionId) => streamEmployeesByCompanyProvider(
          sessionId,
          companyId: contactId,
        ),
        toolbarTrailingActions: [
          ElbTableSwitchLayoutButton(
            showList: showListView.value,
            onPressed: () => showListView.value = !showListView.value,
          ),
          AddEntityInCardButton(
            tooltip: l10n.gen_add_entity(crmL10n.employee),
            onPressed: () async {
              await showElbDialog<Contact?>(
                context: context,
                child: _SelectEmployee(
                  contactId: contactId,
                  navigatorKey: navigatorKey,
                  floatingWindowId: floatingWindowId,
                  floatingWindowFocus: floatingWindowFocus,
                ),
              );
            },
          ),
        ],
        showTable: showListView.value,
        secondContent: (sessionId) => _EmployeesByCompanyListView(
          sessionId: sessionId,
          contactId: contactId,
          navigatorKey: navigatorKey,
        ),
      ),
    );
  }
}

class _EmployeesByCompanyListView extends HookConsumerWidget {
  const _EmployeesByCompanyListView({
    required this.sessionId,
    required this.contactId,
    required this.navigatorKey,
  });
  final String sessionId;
  final int contactId;
  final GlobalKey<NavigatorState> navigatorKey;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final employees = ref.watch(
      streamEmployeesByCompanyProvider(
        sessionId,
        companyId: contactId,
      ),
    );
    final crmL10n = context.crmL10n;

    return employees.fastWhen(
      skipLoadingOnRefresh: true,
      skipLoadingOnReload: true,
      data: (employees) {
        if (employees.isEmpty) {
          return Align(
            alignment: Alignment.topLeft,
            child: AppText(
              crmL10n.company_employee_no_assigned_employees,
            ),
          );
        }

        return ListView.separated(
          shrinkWrap: true,
          itemCount: employees.length,
          separatorBuilder: (_, __) => const AppListViewSeperator.space(),
          itemBuilder: (context, index) {
            final employee = employees[index];
            return AppCardCompanyEmployeeTile.employee(
              companyEmployee: employee,
              sessionId: sessionId,
              navigatorKey: navigatorKey,
            );
          },
        );
      },
    );
  }
}

class _SelectEmployee extends HookConsumerWidget {
  const _SelectEmployee({
    required this.contactId,
    required this.navigatorKey,
    required this.floatingWindowFocus,
    required this.floatingWindowId,
  });
  final int contactId;
  final GlobalKey<NavigatorState> navigatorKey;
  final FocusNode floatingWindowFocus;

  final String floatingWindowId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    final isLoading = useState<bool>(false);
    return InWindowContactSelection.person(
      onSelect: isLoading.value
          ? null
          : (contact) async {
              isLoading.value = true;
              final (:exception, :success, :data) =
                  await AsyncHandler.handleAsyncOperation<int>(
                context,
                () => ref
                    .read(companyEmployeeRepositoryProvider)
                    .createCompanyEmployee(
                      companyId: contactId,
                      employeeId: contact.meta.id!,
                    ),
                errorNavigatorKey: navigatorKey,
                successMessage: l10n.gen_saving_success,
                successNavigatorKey: navigatorKey,
              );

              if (context.mounted) {
                if (success) {
                  ref.openWindow(
                    FloatingCompanyEmployeeWindowData(
                      entityId: data!,
                    ),
                  );
                  navigatorKey.currentState?.pop();
                } else {
                  isLoading.value = false;
                }
              }
            },
      floatingWindowId: floatingWindowId,
      navigatorKey: navigatorKey,
      floatingWindowFocus: floatingWindowFocus,
      isLoading: isLoading.value,
      titleText: crmL10n.company_employee_select_employee,
    );
  }
}
