import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
// ignore: no_flutter_material_import
import 'package:flutter/material.dart';

class AdjustColumnsBottomSheetContent<T> extends HookConsumerWidget {
  const AdjustColumnsBottomSheetContent({
    required this.componentIdentifier,
    required this.sessionId,
    required this.tableDefaultConfig,
    required this.availableTableColumns,
    required this.namePlural,
    super.key,
  });

  final String componentIdentifier;
  final String sessionId;
  final List<TableFieldConfig> tableDefaultConfig;
  final Map<T, TableColumnData> availableTableColumns;
  final String namePlural;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final searchController = useTextEditingController();
    final searchTerm = useListenableSelector(
      searchController,
      () => searchController.text.trim().toLowerCase(),
    );

    final initialConfig = useMemoized(
      () => ref
          .read(
            appTableConfigStateProvider(
              componentIdentifier,
              sessionId,
            ),
          )
          .requireValue,
      [],
    );

    final currentConfiguration = ref.watch(
      appTableConfigStateProvider(
        componentIdentifier,
        sessionId,
      ),
    );

    return currentConfiguration.fastWhen(
      data: (config) {
        // Get all columns with their selection state
        final allColumns = availableTableColumns.entries.map((entry) {
          final isSelected = config!.tableFieldConfig.any(
            (field) => field.fieldKey == entry.value.fieldConfig.fieldKey,
          );
          final order = isSelected
              ? config.tableFieldConfig.indexWhere(
                  (field) => field.fieldKey == entry.value.fieldConfig.fieldKey,
                )
              : -1;
          return (
            column: entry.value,
            isSelected: isSelected,
            order: order,
          );
        }).toList();

        // Apply search filter
        final filteredColumns = allColumns.where((item) {
          return item.column.readable.toLowerCase().contains(searchTerm);
        }).toList();

        // Separate selected and unselected columns
        final selectedColumns = filteredColumns
            .where((item) => item.isSelected)
            .toList()
          ..sort((a, b) => a.order.compareTo(b.order));

        final unselectedColumns = filteredColumns
            .where((item) => !item.isSelected)
            .toList()
          ..sort((a, b) => a.column.readable.compareTo(b.column.readable));

        final scrollController = useScrollController();
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Search field
            Padding(
              padding: const EdgeInsets.all(UiConstants.defaultPadding),
              child: AppTextFormField(
                hintText: '${l10n.gen_search}...',
                controller: searchController,
              ),
            ),
            // Info text

            const SizedBox(height: AppSpace.s),
            const AppDivider(),
            // Column lists
            Expanded(
              child: AppScrollbar(
                controller: scrollController,
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: EdgeInsets.zero,
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Selected columns (reorderable)
                      if (selectedColumns.isNotEmpty) ...[
                        ReorderableListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          buildDefaultDragHandles: false,
                          onReorder: (oldIndex, newIndex) {
                            // Find the actual indices in the full config
                            final oldItem = selectedColumns[oldIndex];
                            final oldConfigIndex =
                                config!.tableFieldConfig.indexWhere(
                              (field) =>
                                  field.fieldKey ==
                                  oldItem.column.fieldConfig.fieldKey,
                            );

                            if (oldIndex < newIndex) {
                              newIndex -= 1;
                            }

                            final newItem = selectedColumns[newIndex];
                            var newConfigIndex =
                                config.tableFieldConfig.indexWhere(
                              (field) =>
                                  field.fieldKey ==
                                  newItem.column.fieldConfig.fieldKey,
                            );

                            if (oldConfigIndex < newConfigIndex) {
                              newConfigIndex += 1;
                            }

                            ref
                                .read(
                                  appTableConfigStateProvider(
                                    componentIdentifier,
                                    sessionId,
                                  ).notifier,
                                )
                                .updateName(l10n.table_unsaved_configuration);

                            ref
                                .read(
                                  appTableConfigStateProvider(
                                    componentIdentifier,
                                    sessionId,
                                  ).notifier,
                                )
                                .reOrderConfig(oldConfigIndex, newConfigIndex);
                          },
                          itemCount: selectedColumns.length,
                          itemBuilder: (context, index) {
                            final item = selectedColumns[index];
                            final canRemove =
                                config!.tableFieldConfig.length > 1;

                            return _ColumnTile(
                              key: Key(item.column.fieldConfig.fieldKey),
                              column: item.column,
                              isSelected: true,
                              canToggle: canRemove,
                              showReorderHandle: true,
                              reorderIndex: index,
                              componentIdentifier: componentIdentifier,
                              sessionId: sessionId,
                              tableDefaultConfig: tableDefaultConfig,
                              onToggle: () {
                                if (!canRemove) return;

                                ref
                                    .read(
                                      appTableConfigStateProvider(
                                        componentIdentifier,
                                        sessionId,
                                      ).notifier,
                                    )
                                    .updateName(
                                      l10n.table_unsaved_configuration,
                                    );

                                final removeIndex =
                                    config.tableFieldConfig.indexWhere(
                                  (field) =>
                                      field.fieldKey ==
                                      item.column.fieldConfig.fieldKey,
                                );
                                if (removeIndex >= 0) {
                                  ref
                                      .read(
                                        appTableConfigStateProvider(
                                          componentIdentifier,
                                          sessionId,
                                        ).notifier,
                                      )
                                      .removeFieldConfig(removeIndex);
                                }
                              },
                            );
                          },
                        ),
                        const SizedBox(height: AppSpace.l),
                      ],

                      // Unselected columns
                      if (unselectedColumns.isNotEmpty) ...[
                        const AppDivider(),
                        const SizedBox(height: AppSpace.s),
                        ...unselectedColumns.map((item) {
                          return _ColumnTile(
                            column: item.column,
                            isSelected: false,
                            canToggle: true,
                            showReorderHandle: false,
                            componentIdentifier: componentIdentifier,
                            sessionId: sessionId,
                            tableDefaultConfig: tableDefaultConfig,
                            onToggle: () {
                              ref
                                  .read(
                                    appTableConfigStateProvider(
                                      componentIdentifier,
                                      sessionId,
                                    ).notifier,
                                  )
                                  .updateName(l10n.table_unsaved_configuration);

                              ref
                                  .read(
                                    appTableConfigStateProvider(
                                      componentIdentifier,
                                      sessionId,
                                    ).notifier,
                                  )
                                  .addFieldConfig(item.column.fieldConfig);
                            },
                          );
                        }),
                      ],
                    ],
                  ),
                ),
              ),
            ),
            const AppDivider(),
            // Actions
            Container(
              padding: const EdgeInsets.all(UiConstants.defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppButton.danger(
                    onPressed: () {
                      ref
                          .read(
                            appTableConfigStateProvider(
                              componentIdentifier,
                              sessionId,
                            ).notifier,
                          )
                          .updateTableConfig(initialConfig!);
                      Navigator.of(context).pop();
                    },
                    label: l10n.gen_cancel,
                  ),
                  const SizedBox(width: AppSpace.m),
                  AppButton.primary(
                    onPressed: () => Navigator.of(context).pop(),
                    label: l10n.gen_apply,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

/// Simple column tile with checkbox-like behavior
class _ColumnTile extends StatelessWidget {
  const _ColumnTile({
    required this.column,
    required this.isSelected,
    required this.canToggle,
    required this.componentIdentifier,
    required this.sessionId,
    required this.tableDefaultConfig,
    required this.onToggle,
    this.showReorderHandle = false,
    this.reorderIndex,
    super.key,
  });

  final TableColumnData column;
  final bool isSelected;
  final bool canToggle;
  final String componentIdentifier;
  final String sessionId;
  final List<TableFieldConfig> tableDefaultConfig;
  final VoidCallback onToggle;
  final bool showReorderHandle;
  final int? reorderIndex;

  @override
  Widget build(BuildContext context) {
    final isDisabled = isSelected && !canToggle;

    final tile = ElbListTile(
      onPressed: isDisabled ? null : onToggle,
      contentPadding: EdgeInsets.only(
        left: UiConstants.defaultPadding,
        right: showReorderHandle ? 0 : UiConstants.defaultPadding,
        top: AppSpace.m,
        bottom: AppSpace.m,
      ),
      titleText: column.readable,
      titleTextStyle: isDisabled
          ? context.appTheme.textStyles.defaultText.copyWith(
              color: context.appTheme.generalColors.onBackground
                  .withValues(alpha: 0.5),
            )
          : null,
      leading: Padding(
        padding: const EdgeInsets.only(right: 8, top: 1),
        child: ElbIcon(
          isSelected ? AppIcons.remove_circle_outlined : AppIcons.add_circle,
          size: AppIconSize.l,
          color: isDisabled
              ? context.appTheme.generalColors.onBackground
                  .withValues(alpha: 0.3)
              : isSelected
                  ? context.appTheme.statusColors.error
                  : context.appTheme.statusColors.success,
        ),
      ),
      trailing: isDisabled
          ? const SizedBox.shrink()
          : showReorderHandle
              ? ReorderableDragStartListener(
                  index: reorderIndex ?? 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Icon(
                      Icons.drag_handle,
                      color: context.appTheme.generalColors.onBackground
                          .withValues(alpha: 0.5),
                    ),
                  ),
                )
              : null,
    );

    return tile;
  }
}
