import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

class DeveloperOptionsCard extends HookConsumerWidget {
  const DeveloperOptionsCard({
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.floatingWindowType,
    super.key,
  });

  /// The id of the floating window
  final String floatingWindowId;

  /// The focus node for the floating window
  final FocusNode floatingWindowFocus;

  final String floatingWindowType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    ref.listen(
      floatingWindowRemoveFromTaskbarStateProvider(floatingWindowId),
      (prev, next) {
        if (next) {
          ref.removeWindow(floatingWindowId);
        }
      },
    );

    return CustomCard(
      floatingWindowType: floatingWindowType,
      baseTitle: l10n.developer_options,
      iconData: AppIcons.developer_options,
      floatingWindowFocus: floatingWindowFocus,
      floatingWindowId: floatingWindowId,
      childBuilder: (
        context,
        selectedNavIndexRef,
        navigatorKey,
      ) {
        return FloatingCardBody(
          floatingWindowType: FloatingWindowType.developerOptions.name,
          isFirstRun: true,
          navigatorKey: navigatorKey,
          floatingWindowId: floatingWindowId,
          navigationGroups: [
            CardNavigationGroup(
              items: [
                CardNavigationItem(
                  icon: AppIcons.developer_options,
                  label: l10n.developer_options,
                ),
              ],
            ),
          ],
          children: [
            CardBodyItem(
              child: const DeveloperOptionsMainPage(),
            ),
          ],
        );
      },
    );
  }
}
