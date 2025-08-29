part of 'table_views.dart';

/// Toggle enum for possible actions in the table view
enum _TableViewToggleEnum {
  /// Used to update the TableView
  update,

  /// Used to delete the TableView
  delete,
}

class _TableViewsTileButtonRow extends ConsumerWidget {
  const _TableViewsTileButtonRow({
    required this.config,
    required this.l10n,
    required this.toggleState,
    required this.toggle,
    required this.tableDefaultConfig,
    required this.namePlural,
  });

  final TableConfig config;
  final ElbCoreLocalizations l10n;
  final ValueNotifier<_TableViewToggleEnum> toggleState;
  final void Function() toggle;
  final List<TableFieldConfig> tableDefaultConfig;
  final String namePlural;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        /// Primary Star Button
        AppIconButton.secondary(
          icon: config.isPrimary
              ? const Icon(
                  AppIcons.favoriteSelected,
                )
              : const Icon(
                  AppIcons.favoriteUnselected,
                ),
          tooltip: config.isPrimary
              ? l10n.table_unset_primary_table_view
              : l10n.table_set_primary_table_view,
          color:
              config.isPrimary ? context.appTheme.generalColors.primary : null,
          // overlayColor: buttonColors.secondaryBackground,
          onPressed: () {
            final tableConfig = config.copyWith(isPrimary: true);

            // Toggle primary Config
            ref
                .read(
                  tableControllerProvider,
                )
                .togglePrimaryConfig(
                  tableConfig: tableConfig,
                );
          },
        ),

        const SizedBox(
          width: AppSpace.s,
        ),

        /// Update Button
        AppIconButton.secondary(
          iconData: AppIcons.update_edit,
          tooltip: l10n.table_update_table_view,
          onPressed: () {
            toggleState.value = _TableViewToggleEnum.update;
            toggle.call();
          },
        ),
        const SizedBox(
          width: AppSpace.s,
        ),

        /// Delete Button
        AppIconButton.danger(
          iconData: AppIcons.cancel_outlined,
          tooltip: l10n.table_delete_table_view,
          onPressed: () {
            toggleState.value = _TableViewToggleEnum.delete;

            toggle.call();
          },
        ),
      ],
    );
  }
}

class _TableViewsConfirmUpdateActions extends ConsumerWidget {
  const _TableViewsConfirmUpdateActions({
    required this.componentIdentifier,
    required this.sessionId,
    required this.l10n,
    required this.config,
    required this.toggle,
    required this.tableDefaultConfig,
    required this.namePlural,
  });

  final String componentIdentifier;
  final String sessionId;
  final ElbCoreLocalizations l10n;
  final TableConfig config;
  final void Function() toggle;
  final List<TableFieldConfig> tableDefaultConfig;
  final String namePlural;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// Update Confirm Button
        AppButton.primary(
          onPressed: () {
            final currentFilter = ref.read(
              appTableFilterStateProvider(
                componentIdentifier,
                sessionId,
              ),
            );

            final currentTableConfig = ref
                .read(
                  appTableConfigStateProvider(
                    componentIdentifier,
                    sessionId,
                  ),
                )
                .requireValue!
                .tableFieldConfig;
            final currentSort = ref.read(appTableSortStateProvider(sessionId));

            final tableConfig = TableConfig(
              componentIdentifier: componentIdentifier,
              tableId: sessionId,
              tableFieldConfig: currentTableConfig,
              filter: currentFilter,
              isPrimary: config.isPrimary,
              name: config.name,
              id: config.id,
              sort: currentSort,
            );

            ref
                .read(
                  tableControllerProvider,
                )
                .updateTableConfig(
                  tableConfig: tableConfig,
                );

            // Updates the currently shown table name
            ref
                .read(
                  appTableConfigStateProvider(
                    componentIdentifier,
                    sessionId,
                  ).notifier,
                )
                .updateName(tableConfig.name);

            ref.invalidate(
              appTableConfigsProvider(
                componentIdentifier: componentIdentifier,
              ),
            );
            toggle.call();
          },
          label: l10n.gen_update,
        ),
        const SizedBox(
          width: AppSpace.s,
        ),

        /// Cancel Update Button
        AppIconButton.secondary(
          onPressed: toggle,
          iconData: AppIcons.close,
        ),
      ],
    );
  }
}

class _TableViewsConfirmDeleteActions extends ConsumerWidget {
  const _TableViewsConfirmDeleteActions({
    required this.config,
    required this.componentIdentifier,
    required this.l10n,
    required this.toggle,
    required this.tableDefaultConfig,
    required this.namePlural,
  });

  final TableConfig config;
  final String componentIdentifier;
  final ElbCoreLocalizations l10n;
  final void Function() toggle;
  final List<TableFieldConfig> tableDefaultConfig;
  final String namePlural;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// Delete Confirm Button
        AppButton.danger(
          onPressed: () {
            ref.read(tableControllerProvider).deleteTableConfig(
                  tableId: config.id!,
                  componentIdentifier: componentIdentifier,
                );
          },
          label: l10n.gen_delete,
        ),
        const SizedBox(
          width: AppSpace.s,
        ),

        /// Cancel Delete Button
        AppIconButton.secondary(
          onPressed: toggle,
          iconData: AppIcons.close,
        ),
      ],
    );
  }
}
