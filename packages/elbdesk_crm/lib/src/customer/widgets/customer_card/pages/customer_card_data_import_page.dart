import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

class CustomerDataImportPage extends ConsumerWidget {
  const CustomerDataImportPage({
    required this.customerId,
    required this.navigatorKey,
    required this.floatingWindowId,
    super.key,
  });
  final int customerId;

  final GlobalKey<NavigatorState> navigatorKey;

  final String floatingWindowId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final floatingWindowFocus = ref.watch(
      windowFocusNodeProvider(floatingWindowId),
    );
    return CardTablePadding(
      child: ArtworkQuarantineGroupTable.byCustomer(
        customerId: customerId,
        toolbarTrailingActions: null,
        navigatorKey: navigatorKey,
        fixedTableName: l10n.data_import,
        floatingWindowFocus: floatingWindowFocus,
        floatingWindowId: floatingWindowId,
        componentIdentifier: ComponentIdentifier.customerDataImportPage,
        isCollapsible: false,
      ),
    );
  }
}
