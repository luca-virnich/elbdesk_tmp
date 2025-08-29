import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/mop_admin/config/floating_mop_admin_window_data.dart';
import 'package:elbdesk_prepress/src/mop_admin/widgets/mop_admin_card.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Floating MOP Admin Card
class FloatingMopAdminCard extends HookConsumerWidget {
  /// Creates a new instance of FloatingMopAdminCard
  const FloatingMopAdminCard({
    required this.data,
    super.key,
  });

  /// The data for the floating window
  final FloatingMopAdminWindowData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingWindowFocus =
        ref.watch(windowFocusNodeProvider(data.floatingWindowId));

    // This makes it closeable from the task bar
    ref.listen(
      floatingWindowRemoveFromTaskbarStateProvider(data.floatingWindowId),
      (prev, next) {
        if (next) {
          ref.removeWindow(
            data.floatingWindowId,
          );
        }
      },
    );
    return MopAdminCard(
      floatingWindowId: data.floatingWindowId,
      floatingWindowFocus: floatingWindowFocus,
      floatingWindowType: data.windowType,
    );
  }
}
