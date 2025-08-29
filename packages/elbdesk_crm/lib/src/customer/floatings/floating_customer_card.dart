import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:elbdesk_crm/src/customer/widgets/customer_card/customer_card.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Floating Customer Card
///
/// This widget is used to display the customer information in a floating window
/// It is e.g. called from a button in the CustomerTable
/// The definition of the FloatingCard is done in the DashboardScreen
class FloatingCustomerCard extends HookConsumerWidget {
  /// Constructor for the FloatingCustomerCard
  const FloatingCustomerCard({
    required this.data,
    super.key,
  });

  /// The data for the floating window
  final FloatingCustomerWindowData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomerCard(
      floatingWindowId: data.floatingWindowId,
      customerId: data.customerId!,
      floatingWindowType: data.windowType,
      initialNoteId: data.initialNoteId,
      initialNoteParentId: data.initialNoteParentId,
    );
  }
}
