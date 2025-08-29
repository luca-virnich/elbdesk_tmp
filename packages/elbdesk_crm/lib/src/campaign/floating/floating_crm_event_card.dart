import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Floating Event Card
///
/// This widget is used to display the event information in a floating window
/// It is e.g. called from a button in the EventTable
/// The definition of the FloatingCard is done in the DashboardScreen
class FloatingEventCard extends HookConsumerWidget {
  /// Constructor for the FloatingEventCard
  const FloatingEventCard({
    required this.data,
    super.key,
  });

  /// The data for the floating window
  final FloatingCrmEventWindowData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingWindowFocus =
        ref.watch(windowFocusNodeProvider(data.floatingWindowId));
    return CrmEventCard(
      floatingWindowId: data.floatingWindowId,
      eventId: data.eventId,
      floatingWindowFocus: floatingWindowFocus,
      floatingWindowType: data.windowType,
    );
  }
}
