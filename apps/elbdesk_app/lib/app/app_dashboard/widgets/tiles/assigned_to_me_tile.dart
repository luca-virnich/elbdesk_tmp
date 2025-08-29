import 'package:elbdesk_app/app/app_dashboard/widgets/grid/dashboard_grid_tile.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

class AssignedToMeTile extends HookConsumerWidget {
  /// Constructor for [AssignedToMeTile].
  ///
  /// If [tileId] is provided, the tile is considered removable.
  const AssignedToMeTile({
    super.key,
    this.tileId,
  });

  /// The unique identifier of the tile used for removal.
  final String? tileId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final myUserId = ref.watch(authUserStateProvider)?.id;
    if (myUserId == null || myUserId == 1) {
      return const SizedBox.shrink();
    }
    final lightUserId =
        ref.watch(fetchLocalLightUserByUserInfoIdProvider(myUserId));

    final entityAssignments =
        ref.watch(watchEntityAssignmentsProvider(lightUserId.lightUserId));

    // TODO(luca): use fastWhen
    return entityAssignments.when(
      error: (error, stackTrace) => DashboardGridTile(
        title: l10n.dashboard_assigned_to_me,
        tileId: tileId,
        leadingIcon: AppIcons.assignedToMe,
        children: [AppText(l10n.gen_error(error.toString()))],
      ),
      loading: () => DashboardGridTile(
        title: l10n.dashboard_assigned_to_me,
        tileId: tileId,
        leadingIcon: AppIcons.assignedToMe,
        children: const [Center(child: AppLoadingIndicator())],
      ),
      data: (entityAssignments) => DashboardGridTile(
        title: l10n.dashboard_assigned_to_me,
        tileId: tileId,

        // isScrollable: false,
        leadingIcon: AppIcons.assignedToMe,
        children: [
          ...entityAssignments.map(
            (e) => EntityAssignmentTile(
              assignment: e,
              key: Key('${e.tableType}_${e.entityId}'),
            ),
          ),
        ],
      ),
    );
  }
}
