import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/src/admin_settings/config/floating_admin_settings_window_data.dart';
import 'package:project_core/src/admin_settings/widgets/admin_settings_card.dart';

/// Floating Admin Settings Card
///
class FloatingAdminSettingsCard extends HookConsumerWidget {
  /// Constructor for the FloatingAdminSettingsCard
  const FloatingAdminSettingsCard({
    required this.data,
    super.key,
  });

  /// The data for the floating window
  final FloatingAdminSettingsWindowData data;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingWindowFocus = useFocusNode();

    // This makes it closeable from the task bar
    ref.listen(
      floatingWindowRemoveFromTaskbarStateProvider(data.floatingWindowId),
      (prev, next) {
        if (next) {
          ref.removeWindow(data.floatingWindowId);
        }
      },
    );
    return AdminSettingsCard(
      floatingWindowType: data.windowType,
      floatingWindowId: data.floatingWindowId,
      floatingWindowFocus: floatingWindowFocus,
    );
  }
}
