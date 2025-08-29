import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_core/src/data/table/table_controller.dart';
import 'package:elbdesk_core/src/data/table/table_repository.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
// ignore: no_flutter_material_import
import 'package:flutter/material.dart';

/// Table Views Bottom Sheet
///
/// Mobile-friendly bottom sheet version of TableViews
class TableViewsBottomSheet extends StatelessWidget {
  const TableViewsBottomSheet({
    required this.componentIdentifier,
    required this.sessionId,
    required this.tableDefaultConfig,
    required this.onlyDefaultConfig,
    required this.tableNames,
    required this.width,
    required this.namePlural,
    required this.defaultConfig,
    super.key,
  });

  final String sessionId;
  final bool onlyDefaultConfig;
  final String componentIdentifier;
  final List<TableFieldConfig> tableDefaultConfig;
  final Widget tableNames;
  final double width;
  final String namePlural;
  final TableConfig defaultConfig;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppBottomSheet.show<void>(
          context: context,
          title: 'Table Views'.hc,
          icon: AppIcons.table_chart_outlined,
          onCancel: () => Navigator.of(context).pop(),
          child: _TableViewsBottomSheetContent(
            namePlural: namePlural,
            onlyDefaultConfig: onlyDefaultConfig,
            defaultConfig: defaultConfig,
            sessionId: sessionId,
            componentIdentifier: componentIdentifier,
            tableDefaultConfig: tableDefaultConfig,
          ),
        );
        // showModalBottomSheet<void>(
        //   context: context,
        //   isScrollControlled: true,
        //   backgroundColor: Colors.transparent,
        //   builder: (context) => _TableViewsBottomSheetContent(
        //     onlyDefaultConfig: onlyDefaultConfig,
        //     sessionId: sessionId,
        //     tableType: tableType,
        //     tableDefaultConfig: tableDefaultConfig,
        //   ),
        // );
      },
      child: SizedBox(
        width: width,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: tableNames,
            ),
            ExcludeFocus(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: AppIconButton.secondary(
                  tooltip: context.l10n.table_table_views,
                  iconData: AppIcons.expand_more,
                  iconSize: 24,
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) => _TableViewsBottomSheetContent(
                        namePlural: namePlural,
                        onlyDefaultConfig: onlyDefaultConfig,
                        defaultConfig: defaultConfig,
                        sessionId: sessionId,
                        componentIdentifier: componentIdentifier,
                        tableDefaultConfig: tableDefaultConfig,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TableViewsBottomSheetContent extends StatelessWidget {
  const _TableViewsBottomSheetContent({
    required this.componentIdentifier,
    required this.sessionId,
    required this.tableDefaultConfig,
    required this.onlyDefaultConfig,
    required this.namePlural,
    required this.defaultConfig,
  });

  final String componentIdentifier;
  final String sessionId;
  final List<TableFieldConfig> tableDefaultConfig;
  final bool onlyDefaultConfig;
  final String namePlural;
  final TableConfig defaultConfig;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const AppDivider(),
        // Content
        Flexible(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _AvailableTableConfigsList(
                  componentIdentifier: componentIdentifier,
                  onlyDefaultConfig: onlyDefaultConfig,
                  namePlural: namePlural,
                  sessionId: sessionId,
                  tableDefaultConfig: tableDefaultConfig,
                  defaultConfig: defaultConfig,
                ),
                const AppDivider(),
                const SizedBox(height: UiConstants.defaultPadding),
                _AddNewConfigurationSection(
                  componentIdentifier: componentIdentifier,
                  namePlural: namePlural,
                  sessionId: sessionId,
                  tableDefaultConfig: tableDefaultConfig,
                  onlyDefaultConfig: onlyDefaultConfig,
                ),
                const SizedBox(height: UiConstants.defaultPadding),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _AvailableTableConfigsList extends HookConsumerWidget {
  const _AvailableTableConfigsList({
    required this.componentIdentifier,
    required this.sessionId,
    required this.tableDefaultConfig,
    required this.onlyDefaultConfig,
    required this.namePlural,
    required this.defaultConfig,
  });

  final String componentIdentifier;
  final String sessionId;
  final List<TableFieldConfig> tableDefaultConfig;
  final bool onlyDefaultConfig;
  final String namePlural;
  final TableConfig defaultConfig;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final configs = ref.watch(
      appTableConfigsProvider(
        componentIdentifier: componentIdentifier,
      ),
    );

    return configs.emptyWhen(
      skipLoadingOnRefresh: true,
      data: (remoteConfigs) {
        final configs = [defaultConfig, ...remoteConfigs];
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const Divider(height: 0),
          itemCount: configs.length,
          itemBuilder: (context, index) {
            final config = configs[index];
            return _ConfigTile(
              namePlural: namePlural,
              index: index,
              key: Key(config.id.toString()),
              config: config,
              onlyDefaultConfig: onlyDefaultConfig,
              componentIdentifier: componentIdentifier,
              sessionId: sessionId,
              tableDefaultConfig: tableDefaultConfig,
            );
          },
        );
      },
    );
  }
}

class _ConfigTile extends HookConsumerWidget {
  const _ConfigTile({
    required this.config,
    required this.sessionId,
    required this.componentIdentifier,
    required this.index,
    required this.tableDefaultConfig,
    required this.onlyDefaultConfig,
    required this.namePlural,
    super.key,
  });

  final TableConfig config;
  final int index;
  final String sessionId;
  final String componentIdentifier;
  final List<TableFieldConfig> tableDefaultConfig;
  final bool onlyDefaultConfig;
  final String namePlural;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final isExpanded = useState(false);

    return Column(
      children: [
        ElbListTile(
          buttonBorderRadius: 0,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: UiConstants.defaultPadding,
            vertical: AppSpace.m,
          ),
          onPressed: () {
            final filter = config.filter;
            ref
                .read(
                  appTableFilterStateProvider(componentIdentifier, sessionId)
                      .notifier,
                )
                .updateFilter(filter);
            final sort = config.sort;
            if (sort != null) {
              ref
                  .read(appTableSortStateProvider(sessionId).notifier)
                  .updateSort(sort);
            }

            ref
                .read(
                  appTableConfigStateProvider(
                    componentIdentifier,
                    sessionId,
                  ).notifier,
                )
                .updateTableConfig(config);
            Navigator.pop(context);
          },
          trailing: index == 0
              ? null
              : AppIconButton.secondary(
                  iconData: isExpanded.value
                      ? AppIcons.expand_less
                      : AppIcons.expand_more,
                  onPressed: () => isExpanded.value = !isExpanded.value,
                ),
          titleText: config.name,
        ),
        if (isExpanded.value && index != 0)
          _ConfigActions(
            config: config,
            componentIdentifier: componentIdentifier,
            sessionId: sessionId,
            namePlural: namePlural,
            l10n: l10n,
            tableDefaultConfig: tableDefaultConfig,
          ),
      ],
    );
  }
}

class _ConfigActions extends ConsumerWidget {
  const _ConfigActions({
    required this.config,
    required this.componentIdentifier,
    required this.sessionId,
    required this.l10n,
    required this.tableDefaultConfig,
    required this.namePlural,
  });

  final TableConfig config;
  final String componentIdentifier;
  final String sessionId;
  final ElbCoreLocalizations l10n;
  final List<TableFieldConfig> tableDefaultConfig;
  final String namePlural;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: context.appTheme.generalColors.background.withValues(alpha: 0.5),
      padding: const EdgeInsets.all(UiConstants.defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Set as Primary
          AppIconButton.secondary(
            iconData: config.isPrimary
                ? AppIcons.favoriteSelected
                : AppIcons.favoriteUnselected,
            tooltip: config.isPrimary
                ? l10n.table_unset_primary_table_view
                : l10n.table_set_primary_table_view,
            onPressed: () {
              final tableConfig = config.copyWith(isPrimary: true);
              ref.read(tableControllerProvider).togglePrimaryConfig(
                    tableConfig: tableConfig,
                  );
              Navigator.pop(context);
            },
          ),
          const SizedBox(width: AppSpace.m),
          // Update
          AppIconButton.secondary(
            iconData: AppIcons.update_edit,
            tooltip: l10n.table_update_table_view,
            onPressed: () {
              _showUpdateDialog(context, ref);
            },
          ),
          const SizedBox(width: AppSpace.m),
          // Delete
          AppIconButton.danger(
            iconData: AppIcons.cancel_outlined,
            tooltip: l10n.table_delete_table_view,
            onPressed: () {
              _showDeleteDialog(context, ref);
            },
          ),
        ],
      ),
    );
  }

  void _showUpdateDialog(BuildContext context, WidgetRef ref) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.table_update_table_view),
        content: Text(
          l10n.table_update_table_view,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.gen_cancel),
          ),
          TextButton(
            onPressed: () {
              final currentFilter = ref.read(
                appTableFilterStateProvider(componentIdentifier, sessionId),
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
              final currentSort = ref.read(
                appTableSortStateProvider(sessionId),
              );

              final updatedConfig = TableConfig(
                componentIdentifier: componentIdentifier,
                tableId: sessionId,
                tableFieldConfig: currentTableConfig,
                filter: currentFilter,
                isPrimary: config.isPrimary,
                name: config.name,
                id: config.id,
                sort: currentSort,
              );

              ref.read(tableControllerProvider).updateTableConfig(
                    tableConfig: updatedConfig,
                  );

              ref
                  .read(
                    appTableConfigStateProvider(
                      componentIdentifier,
                      sessionId,
                    ).notifier,
                  )
                  .updateName(updatedConfig.name);

              ref.invalidate(
                appTableConfigsProvider(
                  componentIdentifier: componentIdentifier,
                ),
              );
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text(l10n.gen_update),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, WidgetRef ref) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.table_delete_table_view),
        content: Text(l10n.table_delete_table_view),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.gen_cancel),
          ),
          TextButton(
            onPressed: () {
              ref.read(tableControllerProvider).deleteTableConfig(
                    tableId: config.id!,
                    componentIdentifier: componentIdentifier,
                  );
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text(l10n.gen_delete),
          ),
        ],
      ),
    );
  }
}

class _AddNewConfigurationSection extends HookConsumerWidget {
  const _AddNewConfigurationSection({
    required this.sessionId,
    required this.componentIdentifier,
    required this.tableDefaultConfig,
    required this.onlyDefaultConfig,
    required this.namePlural,
  });

  final String componentIdentifier;
  final String sessionId;
  final List<TableFieldConfig> tableDefaultConfig;
  final bool onlyDefaultConfig;
  final String namePlural;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final textController = useTextEditingController(text: '');
    final isTextEmpty = useListenableSelector(
      textController,
      () => textController.text.isTrimmedEmpty,
    );
    final isLoading = useState<bool>(false);
    final showInput = useState<bool>(false);

    final onSave = useCallback(
      () async {
        if (textController.text.trim().isEmpty) return;

        isLoading.value = true;
        final currentFilter = ref.read(
          appTableFilterStateProvider(componentIdentifier, sessionId),
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
          sort: currentSort,
          isPrimary: false,
          name: textController.text,
        );

        await ref.read(tableRepositoryProvider).addTableConfig(tableConfig);

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

        textController.clear();
        showInput.value = false;
        if (context.mounted) {
          isLoading.value = false;
        }
      },
      [],
    );

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: UiConstants.defaultPadding,
      ),
      child: Column(
        children: [
          if (!showInput.value)
            Align(
              alignment: Alignment.centerRight,
              child: AppButton.secondary(
                iconData: AppIcons.add,
                onPressed: () => showInput.value = true,
                label: l10n.table_save_view,
              ),
            )
          else
            Column(
              children: [
                AppTextFormField(
                  autofocus: true,
                  controller: textController,
                  hintText: l10n.gen_description,
                  onFieldSubmitted: (_) => onSave(),
                ),
                const SizedBox(height: AppSpace.m),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppButton.danger(
                      isLoading: isLoading.value,
                      onPressed: () {
                        textController.clear();
                        showInput.value = false;
                      },
                      label: l10n.gen_cancel,
                    ),
                    const SizedBox(width: AppSpace.m),
                    AppButton.primary(
                      isLoading: isLoading.value,
                      onPressed: isTextEmpty || isLoading.value ? null : onSave,
                      label: l10n.gen_save,
                    ),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }
}
