import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';
import 'package:project_core/src/app_user/widgets/app_user_table.dart';

class FloatingAppUserTable extends HookConsumerWidget {
  const FloatingAppUserTable({required this.data, super.key});

  final FloatingAppUserTableWindowData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingWindowFocus = useFocusNode();
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
      iconData: AppIcons.appUsers,
      baseTitle: l10n.admin_app_users_plural,
      floatingWindowId: data.floatingWindowId,
      childBuilder: (
        context,
        selectedNavIndexRef,
        navigatorKey,
      ) {
        return FloatingCardBody(
          floatingWindowType: FloatingWindowType.appUser.name,
          isFirstRun: true,
          floatingWindowId: data.floatingWindowId,
          navigatorKey: navigatorKey,
          children: [
            CardBodyItem(
              child: const SelfScrollableCardItem(
                child: AppUserTable.standard(
                  componentIdentifier: ComponentIdentifier.floatingAppUserTable,
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
