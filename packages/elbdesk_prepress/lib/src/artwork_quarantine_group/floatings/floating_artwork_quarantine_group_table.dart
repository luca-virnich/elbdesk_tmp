import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

/// Floating Artwork Quarantine Group Table
///
/// Displays an [ArtworkQuarantineGroupTable] in a [FloatingWindow]
class FloatingArtworkQuarantineGroupTable extends HookConsumerWidget {
  /// Constructor
  const FloatingArtworkQuarantineGroupTable({
    required this.data,
    super.key,
  });

  /// The data for the floating window
  final FloatingArtworkQuarantineGroupTableWindowData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingWindowFocus = useFocusNode();

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
          ref.removeWindow(
            data.floatingWindowId,
          );
        }
      },
    );

    final ppL10n = context.prepressL10n;

    return CustomCard(
      floatingWindowType: data.windowType,
      floatingWindowFocus: floatingWindowFocus,
      iconData: AppIcons.data_import,
      baseTitle: ppL10n.artwork_quarantine_group_plural,
      floatingWindowId: data.floatingWindowId,
      childBuilder: (context, selectedNavIndexRef, navigatorKey) {
        return FloatingCardBody(
          floatingWindowType:
              FloatingWindowType.artworkQuarantineGroupTable.name,
          isFirstRun: true,
          floatingWindowId: data.floatingWindowId,
          navigatorKey: navigatorKey,
          children: [
            CardBodyItem(
              child: TableCardItem(
                table: ArtworkQuarantineGroupTable.todo(
                  toolbarPadding: const EdgeInsets.only(
                    right: UiConstants.tableCardToolbarPadding,
                  ),
                  navigatorKey: navigatorKey,
                  floatingWindowId: data.floatingWindowId,
                  floatingWindowFocus: floatingWindowFocus,
                  componentIdentifier:
                      ComponentIdentifier.floatingArtworkQuarantineGroupTable,
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
