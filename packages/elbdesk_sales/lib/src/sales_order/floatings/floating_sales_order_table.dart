import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

/// Floating Sales Order Table
///
/// Displays a [SalesOrderTable] in a [FloatingWindow]
class FloatingSalesOrderTable extends HookConsumerWidget {
  /// Constructor
  const FloatingSalesOrderTable({
    required this.data,
    super.key,
  });

  /// The data for the floating window
  final FloatingSalesOrderTableWindowData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingWindowFocus = useFocusNode();
    final salesL10n = context.salesL10n;

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

    // This makes it closeable from the task bar
    ref.listen(
      floatingWindowRemoveFromTaskbarStateProvider(data.floatingWindowId),
      (prev, next) {
        if (next) {
          ref.removeWindow(data.floatingWindowId);
        }
      },
    );

    return CustomCard(
      floatingWindowType: data.windowType,
      floatingWindowFocus: floatingWindowFocus,
      iconData: AppIcons.salesOrder,
      baseTitle: salesL10n.sales_order_plural,
      floatingWindowId: data.floatingWindowId,
      childBuilder: (context, selectedNavIndexRef, navigatorKey) {
        return FloatingCardBody(
          floatingWindowType: FloatingWindowType.salesOrderTable.name,
          isFirstRun: true,
          floatingWindowId: data.floatingWindowId,
          navigatorKey: navigatorKey,
          children: [
            CardBodyItem(
              child: TableCardItem(
                table: SalesOrderTable.standard(
                  navigatorKey: navigatorKey,
                  floatingWindowId: data.floatingWindowId,
                  floatingWindowFocus: floatingWindowFocus,
                  componentIdentifier:
                      ComponentIdentifier.floatingSalesOrderTable,
                  isCollapsible: false,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
