import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

/// Event Page
///
/// This page allows managing events for the CRM admin.
class CrmAdminEventPage extends StatelessWidget {
  const CrmAdminEventPage({
    required this.floatingWindowFocus,
    required this.floatingWindowId,
    required this.navigatorKey,
    super.key,
  });

  final FocusNode floatingWindowFocus;
  final String floatingWindowId;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context) {
    return CardTablePadding(
      child: CrmEventTable(
        componentIdentifier: ComponentIdentifier.crmAdminEventTable,
        isCollapsible: false,
        floatingWindowFocus: floatingWindowFocus,
        navigatorKey: navigatorKey,
        floatingWindowId: floatingWindowId,
      ),
    );
  }
}
