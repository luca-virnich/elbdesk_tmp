import 'package:elbdesk_app/app/app_dashboard/widgets/grid/dashboard_grid_tile.dart';
import 'package:elbdesk_app/app/app_dashboard/widgets/tiles/recent_entity_tile.dart'
    show RecentEntityGridTile;
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/project_core.dart';

class EntityNoteNotificationGridTile extends HookConsumerWidget {
  /// Constructor for [RecentEntityGridTile].
  const EntityNoteNotificationGridTile({
    super.key,
    this.tileId,
  });

  /// The unique identifier of the tile used for removal.
  final String? tileId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    final notifications = ref.watch(watchEntityNoteNotificationsProvider);

    // TODO(luca): use fastWhen
    return notifications.when(
      error: (error, stackTrace) => DashboardGridTile(
        title: l10n.chat_notifications,
        tileId: tileId,
        leadingIcon: AppIcons.notifications,
        children: [AppText('Error: $error')],
      ),
      loading: () => DashboardGridTile(
        title: l10n.chat_notifications,
        tileId: tileId,
        leadingIcon: AppIcons.notifications,
        children: const [Center(child: AppLoadingIndicator())],
      ),
      data: (notifications) => DashboardGridTile(
        title: l10n.chat_notifications,
        tileId: tileId,
        leadingIcon: AppIcons.notifications,
        children: [
          ...notifications.map(
            (e) => EntityNoteNotificationTile(
              notification: e,
            ),
          ),
        ],
      ),
    );
  }
}
