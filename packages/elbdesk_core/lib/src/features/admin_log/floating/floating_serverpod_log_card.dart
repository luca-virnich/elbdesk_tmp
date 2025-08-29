import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Floating Serverpod Log Entry Card
///
/// This widget is used to display Serverpod log entry information in a floating
/// window.
/// It is called when clicking a row in the ServerpodLogTable.
class FloatingServerpodLogCard extends HookConsumerWidget {
  /// Constructor for the FloatingServerpodLogCard
  const FloatingServerpodLogCard({
    required this.data,
    super.key,
  });

  /// The data for the floating window
  final FloatingServerpodLogWindowData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingWindowFocus =
        ref.watch(windowFocusNodeProvider(data.floatingWindowId));
    return ServerpodLogCard(
      floatingWindowId: data.floatingWindowId,
      logId: data.logId,
      floatingWindowFocus: floatingWindowFocus,
      floatingWindowType: data.windowType,
    );
  }
}
