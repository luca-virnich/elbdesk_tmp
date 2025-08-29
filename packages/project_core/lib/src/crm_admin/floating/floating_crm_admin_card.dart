import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/src/crm_admin/config/floating_crm_admin_window_data.dart';
import 'package:project_core/src/crm_admin/widgets/crm_admin_card.dart';

/// Floating CRM Admin Card
class FloatingCrmAdminCard extends HookConsumerWidget {
  /// Creates a new instance of FloatingCrmAdminCard
  const FloatingCrmAdminCard({
    required this.data,
    super.key,
  });

  /// The data for the floating window
  final FloatingCrmAdminWindowData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingWindowFocus =
        ref.watch(windowFocusNodeProvider(data.floatingWindowId));

    // This makes it closeable from the task bar
    ref.listen(
      floatingWindowRemoveFromTaskbarStateProvider(data.floatingWindowId),
      (prev, next) {
        if (next) {
          ref.removeWindow(data.floatingWindowId);
        }
      },
    );
    return CrmAdminCard(
      floatingWindowId: data.floatingWindowId,
      floatingWindowFocus: floatingWindowFocus,
      floatingWindowType: data.windowType,
    );
  }
}
