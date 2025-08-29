import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_core/src/core_floating_window_type.dart';
import 'package:elbdesk_core/src/features/admin_log/widgets/flutter_log_table.dart';
import 'package:elbdesk_core/src/features/admin_log/widgets/serverpod_log_table.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';

/// Admin Log Card
///
/// This card displays system logs:
/// - System Error Logs
/// - Application Error Logs
class AdminLogCard extends HookConsumerWidget {
  /// Creates a new AdminLogCard
  const AdminLogCard({
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

    return CustomCard(
      floatingWindowType: floatingWindowType,
      baseTitle: l10n.admin_log_title_plural,
      iconData: AppIcons.admin_log,
      floatingWindowFocus: floatingWindowFocus,
      floatingWindowId: floatingWindowId,
      childBuilder: (context, selectedNavIndexRef, navigatorKey) {
        return FloatingCardBody(
          floatingWindowType: CoreFloatingWindowType.coreAdminLogCard.name,
          isFirstRun: true,
          navigatorKey: navigatorKey,
          floatingWindowId: floatingWindowId,
          navigationGroups: [
            CardNavigationGroup(
              items: [
                CardNavigationItem(
                  icon: AppIcons.serverpod_log,
                  label: l10n.serverpod_log_entry_singular,
                ),
                CardNavigationItem(
                  icon: AppIcons.flutter_log,
                  label: l10n.flutter_log_entry_singular,
                ),
              ],
            ),
          ],
          children: [
            CardBodyItem(
              keepAlive: false,
              loadLazy: true,
              child: const AdminLogServerpodLogPage(),
            ),
            // Placeholder for Application Error Logs table
            CardBodyItem(
              keepAlive: false,
              loadLazy: true,
              child: const AdminLogFlutterLogPage(),
            ),
          ],
        );
      },
    );
  }
}

class AdminLogFlutterLogPage extends StatelessWidget {
  const AdminLogFlutterLogPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CardTablePadding(
      child: FlutterLogTable(),
    );
  }
}

class AdminLogServerpodLogPage extends StatelessWidget {
  const AdminLogServerpodLogPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CardTablePadding(
      child: ServerpodLogTable(),
    );
  }
}
