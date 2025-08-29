import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/project_core.dart';

/// A widget that displays sales orders for a customer
class CustomerCardSalesOrdersPage extends HookConsumerWidget {
  /// Creates a new [CustomerCardSalesOrdersPage]
  const CustomerCardSalesOrdersPage({
    required this.customerId,
    required this.sessionId,
    required this.validationGroupId,
    required this.readOnly,
    required this.navigatorKey,
    super.key,
  });

  /// The ID of the customer
  final int customerId;

  /// The session ID
  final String sessionId;

  /// The validation group ID for form validation
  final String validationGroupId;

  /// Whether the view is read-only
  final bool readOnly;

  /// The width of the page

  /// The navigator key
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CardTablePadding(
      child: SalesOrderTable.byCustomer(
        customerId: customerId,
        navigatorKey: navigatorKey,
        componentIdentifier: ComponentIdentifier.customerCardSalesOrdersPage,
        isCollapsible: false,
      ),
    );
  }
}
