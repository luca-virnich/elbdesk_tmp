part of 'app_table_toolbar.dart';

class _AdjustColumns<T> extends ConsumerWidget {
  const _AdjustColumns({
    required this.availableTableColumns,
    required this.componentIdentifier,
    required this.sessionId,
    required this.containerKey,
    required this.tableDensity,
    required this.tableDefaultConfig,
    required this.namePlural,
    super.key,
  });
  final Map<T, TableColumnData> availableTableColumns;
  final String componentIdentifier;
  final String sessionId;
  final List<TableFieldConfig> tableDefaultConfig;
  final GlobalKey containerKey;
  final AppTableDensity tableDensity;
  final String namePlural;
  static const preferredMinWidth = 600.0;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TableOverlay(
      containerKey: containerKey,
      preferredMinWidth: preferredMinWidth,
      alignRight: true,
      builder: (showOverlay, hideOverlay, isOpen) {
        return _AdjustColumnsButton(
          isOpen: isOpen,
          show: showOverlay,
          tableDensity: tableDensity,
        );
      },
      overlayContent: (closeOverlay) {
        return _Overlay(
          componentIdentifier: componentIdentifier,
          sessionId: sessionId,
          namePlural: namePlural,
          tableDefaultConfig: tableDefaultConfig,
          preferredMinWidth: preferredMinWidth,
          availableTableColumns: availableTableColumns,
          closeOverlay: closeOverlay,
        );
      },
    );
  }
}

class _Overlay<T> extends HookConsumerWidget {
  const _Overlay({
    required this.componentIdentifier,
    required this.sessionId,
    required this.tableDefaultConfig,
    required this.preferredMinWidth,
    required this.availableTableColumns,
    required this.closeOverlay,
    required this.namePlural,
    super.key,
  });

  final String componentIdentifier;
  final String sessionId;
  final List<TableFieldConfig> tableDefaultConfig;

  final double preferredMinWidth;
  final Map<T, TableColumnData> availableTableColumns;
  final VoidCallback closeOverlay;
  final String namePlural;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final initalConfig = useMemoized(
      () => ref
          .read(
            appTableConfigStateProvider(
              componentIdentifier,
              sessionId,
            ),
          )
          .requireValue!,
      [],
    );
    final onClose = useCallback(
      () {
        ref
            .read(
              appTableConfigStateProvider(
                componentIdentifier,
                namePlural,
              ).notifier,
            )
            .updateTableConfig(initalConfig);
        closeOverlay();
      },
      [],
    );

    return NextCloseOverlayListener(
      onClose: onClose,
      child: AppWindow.fixed(
        contentPadding:
            const EdgeInsets.only(bottom: UiConstants.defaultPadding),
        titlebar: AppWindowTitlebar(
          titleText: l10n.table_adjust_columns,
          titleIconData: AppIcons.view_column_outlined,
          onClose: onClose,
        ),
        width: preferredMinWidth,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 300,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Left side - Available Columns
                  Expanded(
                    child: _AvailableTableColumns(
                      availableTableColumns: availableTableColumns,
                      componentIdentifier: componentIdentifier,
                      namePlural: namePlural,
                      sessionId: sessionId,
                      tableDefaultConfig: tableDefaultConfig,
                    ),
                  ),

                  const AppDivider.vertical(
                    width: 2,
                  ),

                  /// Right side - Selected Columns
                  Expanded(
                    child: _SelectedTableColumns(
                      componentIdentifier: componentIdentifier,
                      namePlural: namePlural,
                      sessionId: sessionId,
                      availableTableColumns: availableTableColumns,
                      tableDefaultConfig: tableDefaultConfig,
                    ),
                  ),
                ],
              ),
            ),
            const AppDivider(),
            const SizedBox(height: UiConstants.defaultPadding),

            /// Add new configuration
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppApplyButton(
                  onPressed: closeOverlay,
                ),
                const SizedBox(
                  width: AppSpace.m,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// "Adjust Columns" Button that toggles a [AppOverlay] with the available
/// columns to add to the table.
class _AdjustColumnsButton extends StatelessWidget {
  const _AdjustColumnsButton({
    required this.show,
    required this.tableDensity,
    required this.isOpen,
  });

  // final AppOverlayController controller;
  final VoidCallback show;
  final AppTableDensity tableDensity;
  final bool isOpen;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppButton.secondary(
      tooltip: l10n.table_adjust_columns,

      iconData: AppIcons.view_column_outlined,
      // onPressed: controller.show,
      onPressed: isOpen ? null : show,

      label: tableDensity == AppTableDensity.standard
          ? l10n.table_adjust_columns
          : null,
    );
  }
}

class _AvailableTableColumns<T> extends HookConsumerWidget {
  const _AvailableTableColumns({
    required this.availableTableColumns,
    required this.componentIdentifier,
    required this.sessionId,
    required this.tableDefaultConfig,
    required this.namePlural,
    super.key,
  });
  final Map<T, TableColumnData> availableTableColumns;
  final String componentIdentifier;
  final String sessionId;
  final List<TableFieldConfig> tableDefaultConfig;
  final String namePlural;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final l10n = context.l10n;
    final currentConfiguration = ref.watch(
      appTableConfigStateProvider(
        componentIdentifier,
        sessionId,
      ),
    );

    final searchFocusNode = useFocusNode();
    final searchController = useTextEditingController();
    final searchTerm = useListenableSelector(
      searchController,
      () => searchController.text.trim().toLowerCase(),
    );
    return currentConfiguration.fastWhen(
      data: (configs) {
        // remove all from available that are already in the selected
        final available = availableTableColumns.entries.where((element) {
          return !configs!.tableFieldConfig.any((element2) {
            return element2.fieldKey == element.value.fieldConfig.fieldKey;
          });
        }).toList()
          ..sort((a, b) {
            return a.value.readable.compareTo(b.value.readable);
          });

        // search result
        final searchResult = available.where((element) {
          return element.value.readable.toLowerCase().contains(searchTerm);
        }).toList();

        if (available.isEmpty) {
          return const Center(
            child: ElbIcon(
              AppIcons.verified_outlined,
              size: AppIconSize.xxxl,
            ),
          );
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(UiConstants.defaultPadding - 4.5),
              child: AppTextFormField(
                hintText: '${l10n.gen_search}...',
                focusNode: searchFocusNode,
                controller: searchController,
              ),
            ),
            if (searchResult.isEmpty && searchTerm.isNotEmpty)
              const Padding(
                padding: EdgeInsets.only(top: 32),
                child: ElbIcon.danger(
                  AppIcons.search_off,
                  size: AppIconSize.xxxl,
                ),
              )
            else
              Expanded(
                child: AppScrollbar(
                  controller: scrollController,
                  child: ListView.separated(
                    controller: scrollController,
                    physics: const ClampingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => const AppDivider(),
                    itemCount: searchTerm.isEmpty
                        ? available.length
                        : searchResult.length,
                    itemBuilder: (context, index) {
                      final column = searchTerm.isEmpty
                          ? available[index].value
                          : searchResult[index].value;

                      return _UnselecteTableColumn(
                        column: column,
                        namePlural: namePlural,
                        componentIdentifier: componentIdentifier,
                        sessionId: sessionId,
                        tableDefaultConfig: tableDefaultConfig,
                        key: Key(column.fieldConfig.fieldKey),
                      );
                    },
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class _UnselecteTableColumn extends ConsumerWidget {
  const _UnselecteTableColumn({
    required this.column,
    required this.componentIdentifier,
    required this.sessionId,
    required this.tableDefaultConfig,
    required this.namePlural,
    super.key,
  });

  final TableColumnData column;
  final String componentIdentifier;
  final String sessionId;
  final List<TableFieldConfig> tableDefaultConfig;
  final String namePlural;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    return ElbListTile(
      onPressed: () {
        /// This updates the currently shown table name to
        /// "Unsaved Configuration"
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
            .addFieldConfig(column.fieldConfig);
      },
      buttonBorderRadius: 0,
      titleText: column.readable,
      trailing: const Padding(
        padding: EdgeInsets.only(left: AppSpace.l),
        child: ElbIcon(
          AppIcons.chevron_right,
        ),
      ),
    );
  }
}

class _SelectedTableColumns<T> extends HookConsumerWidget {
  const _SelectedTableColumns({
    required this.componentIdentifier,
    required this.sessionId,
    required this.availableTableColumns,
    required this.tableDefaultConfig,
    required this.namePlural,
    super.key,
  });
  final String componentIdentifier;
  final String sessionId;
  final Map<T, TableColumnData> availableTableColumns;
  final List<TableFieldConfig> tableDefaultConfig;
  final String namePlural;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final generalColors = context.appTheme.generalColors;
    final scrollController = useScrollController();
    final isReordering = useState(false);
    if (availableTableColumns.isEmpty) {
      return const SizedBox.shrink();
    }

    final currentConfiguration = ref.watch(
      appTableConfigStateProvider(
        componentIdentifier,
        sessionId,
      ),
    );

    return currentConfiguration.fastWhen(
      data: (configs) {
        return Theme(
          data: Theme.of(context).copyWith(
            canvasColor: generalColors.background.withAppOpacity(0.9),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: AppScrollbar(
                  controller: scrollController,
                  child: ReorderableListView.builder(
                    scrollController: scrollController,
                    onReorder: (oldIndex, newIndex) {
                      ref
                          .read(
                            appTableConfigStateProvider(
                              componentIdentifier,
                              sessionId,
                            ).notifier,
                          )
                          .reOrderConfig(
                            oldIndex,
                            newIndex,
                          );
                    },
                    physics: const ClampingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: configs!.tableFieldConfig.length,
                    onReorderStart: (index) {
                      isReordering.value = true;
                    },
                    onReorderEnd: (index) {
                      isReordering.value = false;
                    },
                    itemBuilder: (context, index) {
                      final tableColumnData =
                          availableTableColumns.entries.firstWhereOrNull(
                        (element) {
                          return element.value.fieldConfig.fieldKey ==
                              configs.tableFieldConfig[index].fieldKey;
                        },
                      );
                      if (tableColumnData == null) {
                        final uuid = const Uuid().v4();
                        return SizedBox.shrink(
                          key: Key('missing_column_$uuid'),
                        );
                      }

                      return _SelectedColumn(
                        columnData: tableColumnData.value,
                        index: index,
                        sessionId: sessionId,
                        namePlural: namePlural,
                        componentIdentifier: componentIdentifier,
                        tableDefaultConfig: tableDefaultConfig,
                        key: Key(tableColumnData.value.fieldConfig.fieldKey),
                        isReordering: isReordering,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SelectedColumn extends ConsumerWidget {
  const _SelectedColumn({
    required this.columnData,
    required this.componentIdentifier,
    required this.sessionId,
    required this.tableDefaultConfig,
    required this.index,
    required this.isReordering,
    required this.namePlural,
    super.key,
  });
  final TableColumnData columnData;
  final String componentIdentifier;
  final String sessionId;
  final List<TableFieldConfig> tableDefaultConfig;
  final int index;
  final ValueNotifier<bool> isReordering;
  final String namePlural;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    final length = ref
        .watch(
          appTableConfigStateProvider(
            componentIdentifier,
            sessionId,
          ),
        )
        .requireValue!
        .tableFieldConfig
        .length;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (index != 0) const AppDivider(),
        ElbListTile(
          contentPadding: const EdgeInsets.all(UiConstants.defaultPadding)
              .copyWith(right: 36),
          leading: const Padding(
            padding: EdgeInsets.only(right: AppSpace.l),
            child: ElbIcon(
              AppIcons.chevron_left,
            ),
          ),
          buttonBorderRadius: 0,
          onPressed: (length == 1 || isReordering.value)
              ? null
              : () {
                  /// This updates the currently shown table name to
                  /// "Unsaved Configuration"
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
                      .removeFieldConfig(index);
                },
          titleText: columnData.readable,
        ),
      ],
    );
  }
}
