import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';
import 'package:project_core/src/entity_lock/entity_lock_table.dart';

class FloatingEntityLockTable extends HookConsumerWidget {
  const FloatingEntityLockTable({required this.data, super.key});

  final FloatingEntityLockTableWindowData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingWindowFocus =
        ref.watch(windowFocusNodeProvider(data.floatingWindowId));
    final l10n = context.l10n;

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
      iconData: AppIcons.entity_lock,
      baseTitle: l10n.entity_lock_title_plural,
      floatingWindowId: data.floatingWindowId,
      childBuilder: (
        context,
        selectedNavIndexRef,
        navigatorKey,
      ) {
        return FloatingCardBody(
          floatingWindowType: FloatingWindowType.adminEntityLockTable.name,
          isFirstRun: true,
          floatingWindowId: data.floatingWindowId,
          navigatorKey: navigatorKey,
          children: [
            CardBodyItem(
              child: SelfScrollableCardItem(
                child: EntityLockTable(
                  navigatorKey: navigatorKey,
                  componentIdentifier:
                      ComponentIdentifier.floatingEntityLockTable,
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
