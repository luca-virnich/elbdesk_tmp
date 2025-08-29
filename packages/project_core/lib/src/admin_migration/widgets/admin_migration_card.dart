import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';
import 'package:project_core/src/admin_migration/widgets/pages/company_migration_page.dart';
import 'package:project_core/src/admin_migration/widgets/pages/person_migration_page.dart';

/// Admin Migration Card
///
/// This card provides a centralized interface for managing different types of
/// data migrations in the system.
class AdminMigrationCard extends HookConsumerWidget {
  /// Creates a new instance of AdminMigrationCard
  const AdminMigrationCard({
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.floatingWindowType,
    super.key,
  });

  /// The id of the floating window
  final String floatingWindowId;
  final String floatingWindowType;

  /// The focus node for the floating window
  final FocusNode floatingWindowFocus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomCard(
      floatingWindowType: floatingWindowType,
      baseTitle: 'Admin Migration'.hc,
      iconData: AppIcons.admin_migration,
      floatingWindowFocus: floatingWindowFocus,
      floatingWindowId: floatingWindowId,
      childBuilder: (context, selectedNavIndexRef, navigatorKey) {
        return FloatingCardBody(
          isFirstRun: true,
          floatingWindowType: FloatingWindowType.adminMigration.name,
          navigatorKey: navigatorKey,
          floatingWindowId: floatingWindowId,
          navigationGroups: [
            CardNavigationGroup(
              items: [
                CardNavigationItem(
                  icon: AppIcons.person,
                  label: 'Personenmigration'.hc,
                ),
                CardNavigationItem(
                  icon: AppIcons.company,
                  label: 'Firmenmigration'.hc,
                ),
              ],
            ),
          ],
          children: [
            CardBodyItem(
              keepAlive: false,
              loadLazy: true,
              child: PersonMigrationPage(
                floatingWindowFocus: floatingWindowFocus,
                navigatorKey: navigatorKey,
                floatingWindowId: floatingWindowId,
              ),
            ),
            CardBodyItem(
              keepAlive: false,
              loadLazy: true,
              child: CompanyMigrationPage(
                floatingWindowFocus: floatingWindowFocus,
                navigatorKey: navigatorKey,
                floatingWindowId: floatingWindowId,
              ),
            ),
          ],
        );
      },
    );
  }
}
