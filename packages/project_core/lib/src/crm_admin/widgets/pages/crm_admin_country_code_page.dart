import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

/// Country Code Page
///
/// This page allows managing country codes for the CRM admin.
class CrmAdminCountryCodePage extends StatelessWidget {
  const CrmAdminCountryCodePage({
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
      child: CountryCodeTable(
        floatingWindowFocus: floatingWindowFocus,
        navigatorKey: navigatorKey,
        floatingWindowId: floatingWindowId,
        componentIdentifier: ComponentIdentifier.crmAdminCountryCodeTable,
        isCollapsible: false,
      ),
    );
  }
}
