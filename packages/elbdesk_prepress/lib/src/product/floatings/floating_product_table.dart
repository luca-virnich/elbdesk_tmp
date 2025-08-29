import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

class FloatingProductTable extends HookConsumerWidget {
  const FloatingProductTable({required this.data, super.key});

  final FloatingProductTableWindowData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingWindowFocus =
        ref.watch(windowFocusNodeProvider(data.floatingWindowId));
    return ProductTableCard(
      floatingWindowId: data.floatingWindowId,
      floatingWindowFocus: floatingWindowFocus,
      componentIdentifier: ComponentIdentifier.floatingProductTable,
      isCollapsible: false,
      floatingWindowType: data.windowType,
    );
  }
}
