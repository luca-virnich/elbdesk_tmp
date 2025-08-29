import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_core/src/features/admin_log/widgets/flutter_log_card.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Floating Flutter Log Card
///
/// This widget is used to display Flutter log information in a floating window.
/// It is called when clicking a row in the FlutterLogTable.
class FloatingFlutterLogCard extends HookConsumerWidget {
  /// Constructor for the FloatingFlutterLogCard
  const FloatingFlutterLogCard({
    required this.data,
    super.key,
  });

  /// The data for the floating window
  final FloatingFlutterLogWindowData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingWindowFocus =
        ref.watch(windowFocusNodeProvider(data.floatingWindowId));
    return FlutterLogCard(
      floatingWindowId: data.floatingWindowId,
      floatingWindowType: data.windowType,
      logId: data.logId,
      floatingWindowFocus: floatingWindowFocus,
    );
  }
}
