import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

/// Floating Sales Order Item Table
///
/// Displays a [SalesOrderItemTable] in a FloatingWindow
class FloatingSalesOrderItemTable extends HookConsumerWidget {
  /// Constructor
  const FloatingSalesOrderItemTable({
    required this.data,
    super.key,
  });

  /// The data for the floating window
  final FloatingSalesOrderItemTableWindowData data;

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
      iconData: AppIcons.salesOrderItem,
      baseTitle: salesL10n.sales_order_item_plural,
      floatingWindowId: data.floatingWindowId,
      childBuilder: (context, selectedNavIndexRef, navigatorKey) {
        return FloatingCardBody(
          floatingWindowType: FloatingWindowType.salesOrderItemTable.name,
          isFirstRun: true,
          floatingWindowId: data.floatingWindowId,
          navigatorKey: navigatorKey,
          children: [
            CardBodyItem(
              child: SelfScrollableCardItem(
                showRightPadding: true,
                child: SalesOrderItemTable(
                  defaultColumns: SalesOrderItemFields.defaultTableColumns,
                  componentIdentifier:
                      ComponentIdentifier.floatingSalesOrderItemTable,
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
