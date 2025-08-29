import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

/// Salutation Code Page
///
/// This page allows managing salutation codes for the CRM admin.
class CrmAdminSalutationCodePage extends StatelessWidget {
  const CrmAdminSalutationCodePage({
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
      child: SalutationCodeTable(
        floatingWindowFocus: floatingWindowFocus,
        navigatorKey: navigatorKey,
        floatingWindowId: floatingWindowId,
        componentIdentifier: ComponentIdentifier.crmAdminSalutationCodeTable,
        isCollapsible: false,
      ),
    );
  }
}
