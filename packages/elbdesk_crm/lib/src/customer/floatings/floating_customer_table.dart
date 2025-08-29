import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/src/customer/widgets/customer_table/customer_table_card.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

class FloatingCustomerTable extends HookConsumerWidget {
  const FloatingCustomerTable({required this.data, super.key});

  final FloatingCustomerTableWindowData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingWindowFocus =
        ref.watch(windowFocusNodeProvider(data.floatingWindowId));

    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          ref.read(recentWindowsProvider.notifier).insertEntityWindow(
                RecentWindow(
                  type: data.windowType,
                  label: '',
                  entityId: null,
                ),
              );
        });
        return null;
      },
      [],
    );
    return CustomerTableCard(
      floatingWindowId: data.floatingWindowId,
      floatingWindowFocus: floatingWindowFocus,
      componentIdentifier: ComponentIdentifier.floatingCustomerTable,
      isCollapsible: false,
    );
  }
}
