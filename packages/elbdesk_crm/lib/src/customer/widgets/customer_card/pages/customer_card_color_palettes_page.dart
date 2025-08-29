import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

class CustomerColorPalettesPage extends StatelessWidget {
  const CustomerColorPalettesPage({
    required this.customerId,
    required this.navigatorKey,
    required this.floatingWindowId,
    super.key,
  });
  final int customerId;
  final String floatingWindowId;

  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context) {
    return SelfScrollableCardItem(
      showRightPadding: true,
      child: PrepressColorPaletteTable.byCustomer(
        floatingWindowId: floatingWindowId,
        navigatorKey: navigatorKey,
        componentIdentifier:
            ComponentIdentifier.customerCardColorPalettesPageColorPalettes,
        customerId: customerId,
        defaultColumns: PrepressColorPaletteFields.defaultTableColumns,
        availableFilterFieldsWithLabels: const {},
      ),
    );
  }
}
