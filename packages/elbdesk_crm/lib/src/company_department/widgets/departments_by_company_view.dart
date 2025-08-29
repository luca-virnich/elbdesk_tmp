import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/company_department/widgets/app_card_company_department_tile.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

class DepartmentsByCompanyView extends HookConsumerWidget {
  /// All departments of a company contact.
  const DepartmentsByCompanyView({
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
    final showListView = useState<bool>(false);

    return SelfScrollableCardItem(
      showRightPadding: true,
      child: CompanyDepartmentTable.departmentsView(
        componentIdentifier: componentIdentifier,
        isCollapsible: false,
        showFilter: false,
        dataProvider: (sessionId) => watchDepartmentsByCompanyProvider(
          sessionId,
          companyId: contactId,
        ),
        toolbarTrailingActions: [
          ElbTableSwitchLayoutButton(
            showList: showListView.value,
            onPressed: () => showListView.value = !showListView.value,
          ),
          _AddCompanyDepartmentButton(
            sessionId: sessionId,
            contactId: contactId,
            navigatorKey: navigatorKey,
          ),
        ],
        showTable: showListView.value,
        secondContent: (sessionId) => _DepartmentsByCompanyListView(
          sessionId: sessionId,
          contactId: contactId,
          navigatorKey: navigatorKey,
        ),
      ),
    );
  }
}

class _AddCompanyDepartmentButton extends ConsumerWidget {
  const _AddCompanyDepartmentButton({
    required this.sessionId,
    required this.contactId,
    required this.navigatorKey,
  });

  final String sessionId;
  final int contactId;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    return AddEntityInCardButton(
      tooltip: l10n.gen_add_entity(crmL10n.company_department_singular),
      onPressed: () async {
        final (:exception, :success, :data) =
            await AsyncHandler.handleAsyncOperation<int>(
          context,
          () => ref.read(companyDepartmentRepositoryProvider).create(
                companyId: contactId,
              ),
          errorNavigatorKey: navigatorKey,
          successNavigatorKey: navigatorKey,
        );

        if (context.mounted && success) {
          ref.openWindow(
            FloatingCompanyDepartmentWindowData(
              entityId: data,
              companyId: contactId,
            ),
          );
        }
      },
    );
  }
}

class _DepartmentsByCompanyListView extends HookConsumerWidget {
  const _DepartmentsByCompanyListView({
    required this.sessionId,
    required this.contactId,
    required this.navigatorKey,
  });
  final String sessionId;
  final int contactId;
  final GlobalKey<NavigatorState> navigatorKey;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    final departmentsAsync = ref.watch(
      watchDepartmentsByCompanyProvider(
        sessionId,
        companyId: contactId,
      ),
    );

    return departmentsAsync.fastWhen(
      skipLoadingOnRefresh: true,
      skipLoadingOnReload: true,
      data: (departments) {
        if (departments.isEmpty) {
          return Align(
            alignment: Alignment.topLeft,
            child: AppText(
              l10n.gen_no_entities_assigned(crmL10n.company_department_plural),
            ),
          );
        }

        return ListView.separated(
          shrinkWrap: true,
          itemCount: departments.length,
          separatorBuilder: (_, __) => const AppListViewSeperator.space(),
          itemBuilder: (context, index) {
            final department = departments[index];
            return AppCardCompanyDepartmentTile(
              companyDepartment: department,
              sessionId: sessionId,
              navigatorKey: navigatorKey,
            );
          },
        );
      },
    );
  }
}
