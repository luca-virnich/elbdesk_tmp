import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/src/admin_migration/config/floating_admin_migration_window_data.dart';
import 'package:project_core/src/admin_migration/widgets/admin_migration_card.dart';

/// Floating window wrapper for the Admin Migration Card
class FloatingAdminMigrationCard extends HookConsumerWidget {
  /// Creates a new instance of FloatingAdminMigrationCard
  const FloatingAdminMigrationCard({
    required this.data,
    super.key,
  });

  /// The data for the floating window
  final FloatingAdminMigrationWindowData data;

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

    return AdminMigrationCard(
      floatingWindowType: data.windowType,
      floatingWindowId: data.floatingWindowId,
      floatingWindowFocus: floatingWindowFocus,
    );
  }
}
