import 'package:elbdesk_app/app/app_dashboard/widgets/grid/dashboard_grid_tile.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/project_core.dart';

/// A tile that displays recent entity entries using a stream provider.
class RecentEntityGridTile extends HookConsumerWidget {
  /// Constructor for [RecentEntityGridTile].
  const RecentEntityGridTile({
    super.key,
    this.tileId,
  });

  /// The unique identifier of the tile used for removal.
  final String? tileId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    final recentWindows = ref.watch(recentWindowsProvider);
    final recentWindowFilterValues = ref.watch(
      recentWindowFilterValuesStateProvider,
    );

    return recentWindows.componentWhen(
      loadingWidget: DashboardGridTile(
        title: l10n.dashboard_recent_items,
        tileId: tileId,
        leadingIcon: AppIcons.recentItems,
        children: const [Center(child: AppLoadingIndicator())],
      ),
      data: (recentWindows) {
        final checkedRecentWindows = recentWindows.where(
          (window) => recentWindowFilterValues[window.type] ?? true,
        );
        final supportedTypes =
            FloatingWindowTypeExtension.supportedRecentWindowTypes;
        final filteredRecentWindows = checkedRecentWindows.where(
          (window) => supportedTypes.contains(
            FloatingWindowType.values.byName(window.type),
          ),
        );

        return DashboardGridTile(
          title: l10n.dashboard_recent_items,
          tileId: tileId,
          leadingIcon: AppIcons.recentItems,
          actions: [
            ElbPopup(
              buttonBuilder: (show, hide, isOpen) {
                return AppIconButton.secondary(
                  icon: isOpen
                      ? const Icon(AppIcons.close)
                      : const Icon(AppIcons.filter_list),
                  onPressed: isOpen ? hide : show,
                );
              },
              menuBuilder: (hide) {
                return const _RecentWindowsFilterContent();
              },
              style: ElbPopupStyle(
                backgroundColor: context.appTheme.generalColors.background,
                borderRadius: BorderRadius.circular(
                  context.appTheme.borderRadiuses.m,
                ),
                borderColor:
                    context.appTheme.buttonStyles.secondary.borderColor,
              ),
              position: ElbPopupPosition.leftToBottom,
              excludeButtonFromBarrier: true,
            ),
          ],
          children: [
            ListView.separated(
              shrinkWrap: true,
              itemCount: filteredRecentWindows.length,
              separatorBuilder: (context, index) =>
                  const AppListViewSeperator.divider(
                height: 1,
              ),
              itemBuilder: (context, index) {
                final recentWindow = filteredRecentWindows.elementAt(index);
                return RecentWindowTile(recentWindow: recentWindow);
              },
            ),
          ],
        );
      },
    );
  }
}

class _RecentWindowsFilterContent extends HookConsumerWidget {
  const _RecentWindowsFilterContent();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final secondaryButtonStyles = context.appTheme.buttonStyles.secondary;

    final recentWindowFilterValues =
        ref.watch(recentWindowFilterValuesStateProvider);

    final isAdmin = ref.watch(isAdminProvider);
    final isSuperAdmin = ref.watch(isSuperAdminProvider);

    final supportedTypes = <FloatingWindowType>[
      ...FloatingWindowTypeExtension.recentCrmWindowTypes,
      ...FloatingWindowTypeExtension.recentPrepressWindowTypes,
      ...FloatingWindowTypeExtension.recentSalesWindowTypes,
      if (isAdmin) ...FloatingWindowTypeExtension.recentAdminWindowTypes,
      if (isSuperAdmin) ...FloatingWindowTypeExtension.superAdminWindowTypes,
    ];

    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 250,
        minWidth: 250,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: secondaryButtonStyles.borderColor.withAppOpacity(0.75),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: AppText(
                l10n.table_filter,
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ),
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: supportedTypes.length,
            separatorBuilder: (context, index) =>
                const AppListViewSeperator.divider(
              height: 1,
            ),
            itemBuilder: (context, index) {
              final floatingWindowType = supportedTypes[index];
              return _RecentWindowsFilterItem(
                floatingWindowType: floatingWindowType,
                isVisible:
                    recentWindowFilterValues[floatingWindowType.name] ?? true,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _RecentWindowsFilterItem extends HookConsumerWidget {
  const _RecentWindowsFilterItem({
    required this.floatingWindowType,
    required this.isVisible,
  });
  final FloatingWindowType floatingWindowType;
  final bool isVisible;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectL10n = context.projectL10n;
    return RecentWindowFilterItemTile(
      title: floatingWindowType.title(projectL10n),
      isSelected: isVisible,
      icon: floatingWindowType.isTable
          ? Icons.table_rows_outlined
          : floatingWindowType.icon,
      onPressed: () {
        final newValue = !isVisible;
        ref
            .read(userSettingsStateProvider.notifier)
            .updateRecentWindowFilterValues(floatingWindowType.name, newValue);
      },
    );
  }
}
