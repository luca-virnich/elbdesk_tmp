import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/company_employee/widgets/companies_by_employee_view.dart';
import 'package:elbdesk_crm/src/contact/logic/contact_state.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/project_core.dart';

class CompanyEmployeeRibbon extends HookConsumerWidget {
  const CompanyEmployeeRibbon({
    required this.contactId,
    required this.sessionId,
    required this.navigatorKey,
    required this.floatingWindowId,
    super.key,
  });
  final int contactId;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCompany = ref.watch(
      contactStateProvider(contactId, sessionId)
          .select((value) => value.requireValue.isCompany),
    );
    final floatingWindowFocus = ref.watch(
      windowFocusNodeProvider(floatingWindowId),
    );

    final isLoading = useState<bool>(false);
    if (isCompany) {
      return const SizedBox.shrink();
    }
    final crmL10n = context.crmL10n;
    final isDraft = ref.watch(
      contactStateProvider(contactId, sessionId)
          .select((value) => value.requireValue.meta.isDraft),
    );
    return Ribbon(
      floatingWindowId: floatingWindowId,
      floatingWindowType: FloatingWindowType.contactPerson.name,
      label: crmL10n.contact_create_as_employee,
      icon: AppIcons.employee,
      onPressed: isLoading.value || isDraft
          ? null
          : () async {
              await showElbDialog<Contact?>(
                context: context,
                child: SelectCompanyForEmployee(
                  contactIdFromEmployee: contactId,
                  navigatorKey: navigatorKey,
                  floatingWindowId: floatingWindowId,
                  floatingWindowFocus: floatingWindowFocus,
                ),
              );
            },
    );
  }
}
