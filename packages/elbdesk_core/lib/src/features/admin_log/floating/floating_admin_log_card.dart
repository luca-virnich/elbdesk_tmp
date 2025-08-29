import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Floating card that displays admin logs
class FloatingAdminLogCard extends HookConsumerWidget {
  /// Constructor for the FloatingAdminLogCard
  const FloatingAdminLogCard({
    required this.data,
    super.key,
  });

  /// The data for the floating window
  final FloatingAdminLogWindowData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingWindowFocus =
        ref.watch(windowFocusNodeProvider(data.floatingWindowId));
    return AdminLogCard(
      floatingWindowId: data.floatingWindowId,
      floatingWindowFocus: floatingWindowFocus,
      floatingWindowType: data.windowType,
    );
  }
}
