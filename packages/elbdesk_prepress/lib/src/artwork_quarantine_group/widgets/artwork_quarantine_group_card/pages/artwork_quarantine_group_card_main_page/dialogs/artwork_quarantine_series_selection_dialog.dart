import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

/// Artwork Quarantine Series Selection Dialog
///
/// Dialog for selecting a product series for the data import
///
/// Used in the Artwork Quarantine Group Card
class ArtworkQuarantineSeriesSelectionDialog extends StatelessWidget {
  const ArtworkQuarantineSeriesSelectionDialog({
    required this.groupId,
    required this.sessionId,
    required this.floatingWindowId,
    required this.parentNavigatorKey,
    required this.floatingWindowFocus,
    required this.group,
    super.key,
  });

  final int groupId;
  final String sessionId;
  final String floatingWindowId;
  final GlobalKey<NavigatorState> parentNavigatorKey;
  final FocusNode floatingWindowFocus;
  final ArtworkQuarantineGroup group;

  @override
  Widget build(BuildContext context) {
    final ppL10n = context.prepressL10n;

    return ElbDialog(
      floatingWindowId: floatingWindowId,
      title: ppL10n.product_series_select,
      child: ProductTable(
        componentIdentifier:
            ComponentIdentifier.productTableSelectProductSeries,
        isCollapsible: false,
        fixedTableName: ppL10n.product_series_select,
        customerId: group.customerId,
        salesOrderId: 0,
        navigatorKey: AppNavigatorKeys.appRootNavigatorKey,
        dataProvider: (sessionId) => findMasterProductsByCustomerProvider(
          group.customerId!,
          sessionId,
        ),
        onSelect: (product) {
          Navigator.of(context).pop(product);
        },
      ),
    );
  }
}
