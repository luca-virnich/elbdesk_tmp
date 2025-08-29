import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';
import 'package:project_core/src/crm_admin/widgets/pages/crm_admin_country_code_page.dart';
import 'package:project_core/src/crm_admin/widgets/pages/crm_admin_event_page.dart';
import 'package:project_core/src/crm_admin/widgets/pages/crm_admin_language_code_page.dart';
import 'package:project_core/src/crm_admin/widgets/pages/crm_admin_salutation_code_page.dart';

/// CRM Admin Card
///
/// This card contains CRM specific admin settings and configurations
class CrmAdminCard extends HookConsumerWidget {
  /// Creates a new instance of CrmAdminCard
  const CrmAdminCard({
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.floatingWindowType,
    super.key,
  });

  /// The id of the floating window
  final String floatingWindowId;

  /// The focus node for the floating window
  final FocusNode floatingWindowFocus;

  final String floatingWindowType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    return CustomCard(
      floatingWindowType: floatingWindowType,
      baseTitle: l10n.app_scope_crm_admin,
      iconData: AppIcons.crm_admin,
      floatingWindowFocus: floatingWindowFocus,
      floatingWindowId: floatingWindowId,
      childBuilder: (context, selectedNavIndexRef, navigatorKey) {
        return FloatingCardBody(
          isFirstRun: true,
          navigatorKey: navigatorKey,
          floatingWindowId: floatingWindowId,
          floatingWindowType: FloatingWindowType.crmAdmin.name,
          navigationGroups: [
            CardNavigationGroup(
              items: [
                CardNavigationItem(
                  icon: AppIcons.paymentCode,
                  label: crmL10n.payment_code_plural,
                ),
                CardNavigationItem(
                  icon: AppIcons.shipping_method,
                  label: crmL10n.shipping_method_plural,
                ),
                CardNavigationItem(
                  icon: AppIcons.departmentCode,
                  label: crmL10n.department_code_plural,
                ),
                CardNavigationItem(
                  icon: AppIcons.globe,
                  label: crmL10n.country_code_plural,
                ),
                CardNavigationItem(
                  icon: AppIcons.language,
                  label: crmL10n.language_code_plural,
                ),
                CardNavigationItem(
                  icon: AppIcons.salutationCode,
                  label: crmL10n.salutation_code_plural,
                ),
                CardNavigationItem(
                  icon: AppIcons.crm_event,
                  label: crmL10n.event_plural,
                ),
              ],
            ),
          ],
          children: [
            CardBodyItem(
              keepAlive: false,
              loadLazy: true,
              child: TableCardItem(
                table: PaymentCodeTable(
                  floatingWindowFocus: floatingWindowFocus,
                  navigatorKey: navigatorKey,
                  floatingWindowId: floatingWindowId,
                  componentIdentifier:
                      ComponentIdentifier.crmAdminPaymentCodeTable,
                  isCollapsible: false,
                ),
              ),
            ),
            CardBodyItem(
              keepAlive: false,
              loadLazy: true,
              child: TableCardItem(
                table: ShippingMethodTable(
                  floatingWindowFocus: floatingWindowFocus,
                  navigatorKey: navigatorKey,
                  floatingWindowId: floatingWindowId,
                  componentIdentifier:
                      ComponentIdentifier.crmAdminShippingMethodTable,
                  isCollapsible: false,
                ),
              ),
            ),
            CardBodyItem(
              keepAlive: false,
              loadLazy: true,
              child: TableCardItem(
                table: DepartmentCodeTable(
                  floatingWindowFocus: floatingWindowFocus,
                  navigatorKey: navigatorKey,
                  floatingWindowId: floatingWindowId,
                  componentIdentifier:
                      ComponentIdentifier.crmAdminDepartmentCodeTable,
                  isCollapsible: false,
                ),
              ),
            ),
            CardBodyItem(
              keepAlive: false,
              loadLazy: true,
              child: CrmAdminCountryCodePage(
                floatingWindowFocus: floatingWindowFocus,
                floatingWindowId: floatingWindowId,
                navigatorKey: navigatorKey,
              ),
            ),
            CardBodyItem(
              keepAlive: false,
              loadLazy: true,
              child: CrmAdminLanguageCodePage(
                floatingWindowFocus: floatingWindowFocus,
                floatingWindowId: floatingWindowId,
                navigatorKey: navigatorKey,
              ),
            ),
            CardBodyItem(
              keepAlive: false,
              loadLazy: true,
              child: CrmAdminSalutationCodePage(
                floatingWindowFocus: floatingWindowFocus,
                floatingWindowId: floatingWindowId,
                navigatorKey: navigatorKey,
              ),
            ),
            CardBodyItem(
              keepAlive: false,
              loadLazy: true,
              child: CrmAdminEventPage(
                floatingWindowFocus: floatingWindowFocus,
                floatingWindowId: floatingWindowId,
                navigatorKey: navigatorKey,
              ),
            ),
          ],
        );
      },
    );
  }
}
