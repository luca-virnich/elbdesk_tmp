import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/company_employee/widgets/company_employee_table/company_employee_table.dart';
import 'package:elbdesk_crm/src/contact/widgets/contact_card/in_window_contact_selection.dart';
import 'package:elbdesk_crm/src/ui/app_card_company_employee_tile.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

/// Widget that shows all companies of an employee contact.
class CompaniesByEmployeeView extends HookConsumerWidget {
  const CompaniesByEmployeeView({
    required this.contactIdFromEmployee,
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.sessionId,
    required this.componentIdentifier,
    super.key,
  });
  final int contactIdFromEmployee;
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;

  final String sessionId;
  final ComponentIdentifier componentIdentifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    final showListView = useState<bool>(false);
    final floatingWindowFocus = ref.watch(
      windowFocusNodeProvider(floatingWindowId),
    );

    return SelfScrollableCardItem(
      showRightPadding: true,
      child: CompanyEmployeeTable.companiesView(
        componentIdentifier: componentIdentifier,
        isCollapsible: false,
        showFilter: false,
        dataProvider: (sessionId) => watchCompaniesByEmployeeProvider(
          sessionId,
          employeeId: contactIdFromEmployee,
        ),
        toolbarTrailingActions: [
          ElbTableSwitchLayoutButton(
            showList: showListView.value,
            onPressed: () => showListView.value = !showListView.value,
          ),
          AddEntityInCardButton(
            tooltip: l10n.gen_add_entity(crmL10n.company_singluar),
            onPressed: () async {
              await showElbDialog<Contact?>(
                context: context,
                child: SelectCompanyForEmployee(
                  contactIdFromEmployee: contactIdFromEmployee,
                  navigatorKey: navigatorKey,
                  floatingWindowId: floatingWindowId,
                  floatingWindowFocus: floatingWindowFocus,
                ),
              );
            },
          ),
        ],
        showTable: showListView.value,
        secondContent: (sessionId) => _CompaniesByEmployeeListView(
          sessionId: sessionId,
          contactId: contactIdFromEmployee,
          navigatorKey: navigatorKey,
        ),
      ),
    );
  }
}

class _CompaniesByEmployeeListView extends HookConsumerWidget {
  const _CompaniesByEmployeeListView({
    required this.sessionId,
    required this.contactId,
    required this.navigatorKey,
  });
  final String sessionId;
  final int contactId;
  final GlobalKey<NavigatorState> navigatorKey;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final crmL10n = context.crmL10n;
    final companys = ref.watch(
      watchCompaniesByEmployeeProvider(
        sessionId,
        employeeId: contactId,
      ),
    );

    return companys.fastWhen(
      skipLoadingOnRefresh: true,
      skipLoadingOnReload: true,
      data: (companys) {
        if (companys.isEmpty) {
          return Align(
            alignment: Alignment.topLeft,
            child: AppText(
              crmL10n.company_employee_no_assigned_companies,
            ),
          );
        }
        return ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, index) =>
              const AppListViewSeperator.space(),
          itemCount: companys.length,
          itemBuilder: (context, index) {
            final companyEmployee = companys[index];
            return AppCardCompanyEmployeeTile.company(
              companyEmployee: companyEmployee,
              sessionId: sessionId,
              navigatorKey: navigatorKey,
            );
          },
        );
      },
    );
  }
}

class SelectCompanyForEmployee extends HookConsumerWidget {
  const SelectCompanyForEmployee({
    required this.contactIdFromEmployee,
    required this.navigatorKey,
    required this.floatingWindowFocus,
    required this.floatingWindowId,
    super.key,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final FocusNode floatingWindowFocus;
  final int contactIdFromEmployee;
  final String floatingWindowId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    final isLoading = useState<bool>(false);
    return InWindowContactSelection.company(
      onSelect: isLoading.value
          ? null
          : (contact) async {
              isLoading.value = true;

              final (:success, :exception, :data) =
                  await AsyncHandler.handleAsyncOperation<int>(
                context,
                () => ref
                    .read(companyEmployeeRepositoryProvider)
                    .createCompanyEmployee(
                      companyId: contact.meta.id!,
                      employeeId: contactIdFromEmployee,
                    ),
                successMessage: l10n.gen_saving_success,
                successNavigatorKey: navigatorKey,
                errorNavigatorKey: navigatorKey,
              );

              if (success) {
                ref.openWindow(
                  FloatingCompanyEmployeeWindowData(
                    entityId: data!,
                  ),
                );
                if (context.mounted) {
                  navigatorKey.currentState?.pop();
                }
              } else if (context.mounted) {
                isLoading.value = false;
              }
            },
      floatingWindowId: floatingWindowId,
      navigatorKey: navigatorKey,
      floatingWindowFocus: floatingWindowFocus,
      isLoading: isLoading.value,
      titleText: l10n.gen_select(crmL10n.company_singluar),
    );
  }
}
