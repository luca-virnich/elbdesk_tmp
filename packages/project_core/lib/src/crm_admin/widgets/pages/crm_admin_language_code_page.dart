import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

/// Language Code Page
///
/// This page allows managing language codes for the CRM admin.
class CrmAdminLanguageCodePage extends StatelessWidget {
  const CrmAdminLanguageCodePage({
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
      child: LanguageCodeTable(
        componentIdentifier: ComponentIdentifier.crmAdminLanguageCodeTable,
        isCollapsible: false,
        navigatorKey: navigatorKey,
        floatingWindowId: floatingWindowId,
      ),
    );
  }
}
