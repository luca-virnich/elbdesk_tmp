import 'dart:async';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
// ignore: no_flutter_material_import
import 'package:flutter/material.dart';

class AppTableView<T, TField> extends HookConsumerWidget {
  const AppTableView({
    required this.defaultTableConfig,
    required this.fieldFromKey,
    required this.buildCell,
    required this.buildCellTitle,
    required this.getTitleAlignment,
    required this.availableFilterFieldsWithLabels,
    required this.availableTableColumnsWithLabels,
    required this.tableViewIdentifier,
    required this.tableDefaultNamePlural,
    required this.dataProvider,
    this.buildCellTitleWidget,
    this.tableDensity,
    this.toolbarTrailingActions,
    this.initialFilter,
    this.sessionId,
    this.quickSearchFilterFields,
    this.dropdownFilterItems,
    this.showTableViews = true,
    this.showTableName = true,
    this.toolbarPadding = EdgeInsets.zero,
    this.hiddenFilterGroup,
    this.onRowTap,
    this.showToolbarDivider = false,
    this.fixedTableTitle,
    this.selfGrowable = false,
    this.isSortable = true,
    this.isHighlightable = true,
    this.isResizable = true,
    this.showWhenEmpty = true,
    this.showLoadingIndicatorOnRefresh = false,
    this.width,
    this.onRowShiftTab,
    this.enableAutofocus = true,
    this.showTable = true,
    this.secondContent,
    this.toolbarMobileTrailingActions,
    this.isSingleTableOnPage = false,
    this.isCollapsible = true,
    super.key,
  });

  final bool isHighlightable;
  final bool showWhenEmpty;
  final bool showLoadingIndicatorOnRefresh;
  final bool selfGrowable;
  final bool isSortable;
  final bool showToolbarDivider;
  final double? width;
  final void Function(T item)? onRowTap;

  final List<TableFieldConfig> defaultTableConfig;
  final Filter? initialFilter;
  final FilterGroup? hiddenFilterGroup;
  final AppTableDensity? tableDensity;

  final bool enableAutofocus;
  final ProviderListenable<AsyncValue<List<T>>> Function(
    String sessionId,
  )? dataProvider;

  final TField Function(String fieldKey) fieldFromKey;
  final Widget Function(
    TField field,
    T item,
  ) buildCell;

  final String Function(TField field) buildCellTitle;
  final Widget Function(TField field)? buildCellTitleWidget;
  final Alignment Function(TField field) getTitleAlignment;
  final Map<TField, TableFieldData>? availableFilterFieldsWithLabels;
  final Map<TField, TableFieldData>? quickSearchFilterFields;
  final Map<TField, TableColumnData>? availableTableColumnsWithLabels;
  final Map<TField, List<DropdownItem<dynamic>>>? dropdownFilterItems;
  final List<Widget> Function(String sessionId)? toolbarTrailingActions;

  final String? sessionId;
  final bool showTableViews;
  final bool showTableName;
  final EdgeInsetsGeometry toolbarPadding;

  final String? fixedTableTitle;
  final bool isResizable;
  final void Function(T item)? onRowShiftTab;
  final bool showTable;
  final Widget? Function(String sessionId)? secondContent;
  final List<MobileTableToolbarActionItem> Function(String sessionId)?
      toolbarMobileTrailingActions;

  // set when a table is the only contenton a page
  final bool isSingleTableOnPage;

  // Default name for the table, this is shown in the table config overlay for
  // the default table config
  final String tableDefaultNamePlural;

  // Identfier for the table, required, e.g. a contact table in an employee view
  // mus has a different identifier then a contact table in the artwork view
  // Identifier for the collapsible table, this is used to collapse the table
  // if null, you can collapse the table. must be unique for one table in a
  // card/page
  final String tableViewIdentifier;

  final bool isCollapsible;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionId = this.sessionId ?? useUuid();

    // keepalives
    ref
      ..listen(
        appTableConfigStateProvider(tableViewIdentifier, sessionId),
        (previous, next) {},
      )
      ..listen(
        appTableFilterStateProvider(tableViewIdentifier, sessionId),
        (previous, next) {},
      )
      ..listen(appTableSortStateProvider(sessionId), (previous, next) {})
      ..listen(
        hiddenAppTableFilterGroupStateProvider(tableViewIdentifier, sessionId),
        (previous, next) {},
      );

    final defaultCollapseCardSections =
        ref.watch(defaultCollapseCardSectionsStateProvider);
    final collapseCardSection = isCollapsible
        ? ref
            .watch(collapseCardSectionStateProvider)
            .findIsCollapsedByIdentifier(tableViewIdentifier)
        : null;
    final isCollapsed = useState<bool>(
      isCollapsible && (collapseCardSection ?? defaultCollapseCardSections),
    );

    final containerKey = useMemoized(GlobalKey.new, []);

    final isInitialized = useState<bool>(false);
    final selectedConfigRef = useRef<TableConfig?>(null);

    // if showTableViews is false, then only default config is used
    // if availableTableColumnsWithLabels is null or empty, then only
    //
    final onlyDefaultTableConfig =
        availableTableColumnsWithLabels == null || !showTableViews;

    final defaultTableCfg = useMemoized(
      () {
        return TableConfig(
          componentIdentifier: tableViewIdentifier,
          tableId: const Uuid().v4(),
          tableFieldConfig: defaultTableConfig,
          isPrimary: false,
          filter: initialFilter ?? Filter(filterGroups: []),
          name: tableDefaultNamePlural,
        );
      },
      [tableViewIdentifier, sessionId, initialFilter],
    );

    final fetchInitialConfig = useCallback(() async {
      final selectedConfig = await ref.read(
        appTableConfigStateProvider(
          tableViewIdentifier,
          sessionId,
        ).future,
      );
      if (selectedConfig != null) {
        selectedConfigRef.value = selectedConfig;
        return (isDefault: false, config: selectedConfig);
      } else {
        selectedConfigRef.value = defaultTableCfg;
        ref
            .read(
              appTableConfigStateProvider(tableViewIdentifier, sessionId)
                  .notifier,
            )
            .updateTableConfig(defaultTableCfg);
        return (isDefault: true, config: defaultTableCfg);
      }
    }, [
      initialFilter,
      hiddenFilterGroup,
    ]);

    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          // First handle initialConfig if present
          unawaited(
            fetchInitialConfig().then((result) {
              final isDefault = result.isDefault;
              final config = result.config;

              if (initialFilter != null && isDefault) {
                ref
                    .read(
                      appTableFilterStateProvider(
                        tableViewIdentifier,
                        sessionId,
                      ).notifier,
                    )
                    .updateFilter(initialFilter);
              } else {
                ref
                    .read(
                      appTableFilterStateProvider(
                        tableViewIdentifier,
                        sessionId,
                      ).notifier,
                    )
                    .updateFilter(config.filter);
              }
              if (hiddenFilterGroup != null) {
                ref
                    .read(
                      hiddenAppTableFilterGroupStateProvider(
                        tableViewIdentifier,
                        sessionId,
                      ).notifier,
                    )
                    .updateFilter(hiddenFilterGroup);
              }
              if (config.sort != null) {
                ref
                    .read(appTableSortStateProvider(sessionId).notifier)
                    .updateSort(config.sort!);
              }
              isInitialized.value = true;
            }),
          );
        });

        return null;
      },
      [initialFilter, hiddenFilterGroup],
    );

    // return const SizedBox();

    if (!isInitialized.value) {
      return const SizedBox();
    }

    final isEmpty = ref.watch(dataProvider!(sessionId)).valueOrNull?.isEmpty;

    if ((isEmpty ?? true) && !showWhenEmpty) {
      return const SizedBox();
    }

    return AppTableWrapper(
      key: containerKey,
      showToolbarDivider: showToolbarDivider,
      tableDensity: tableDensity ?? AppTableDensity.standard,
      toolbar: Padding(
        padding: toolbarPadding,
        child: AppTableToolbar<TField>(
          defaultConfig: defaultTableCfg,
          namePlural: tableDefaultNamePlural,
          quickSearchFilterFields: quickSearchFilterFields,
          mobileTrailingActions:
              toolbarMobileTrailingActions?.call(sessionId) ?? [],
          isCollapsedNotifier: isCollapsed,
          componentIdentifier: tableViewIdentifier,
          isCollapsible: isCollapsible,
          fixedTableTitle: fixedTableTitle,
          showTableName: showTableName,
          showToolbarDivider: showToolbarDivider,
          showTableViews: showTableViews,
          sessionId: sessionId,
          tableDensity: tableDensity ?? AppTableDensity.standard,
          tableDefaultConfig: defaultTableConfig,
          onlyDefaultConfig: onlyDefaultTableConfig,
          containerKey: containerKey,
          availableFilterFields: availableFilterFieldsWithLabels,
          availableTableColumns: availableTableColumnsWithLabels,
          dropdownFilterItems: dropdownFilterItems,
          trailingActions: toolbarTrailingActions?.call(sessionId) ?? [],
          enableAutofocus: enableAutofocus,
        ),
      ),
      content: ref.watch(dataProvider!(sessionId)).when(
            skipLoadingOnRefresh: true,
            skipLoadingOnReload: true,
            loading: () => const Center(
              child: AppLoadingIndicator(),
            ),
            error: (error, stackTrace) => AppText('Error: $error'),
            data: (data) {
              final isProviderLoading =
                  ref.watch(dataProvider!(sessionId)).isLoading;

              return showTable
                  ? _Table(
                      namePlural: tableDefaultNamePlural,
                      isCollapsed: isCollapsed.value,
                      selfGrowable: selfGrowable,
                      showLoadingIndicatorOnRefresh:
                          showLoadingIndicatorOnRefresh,
                      isProviderLoading: isProviderLoading,
                      isResizable: isResizable,
                      onRowTap: onRowTap,
                      onRowShiftTab: onRowShiftTab,
                      defaultTableConfig: defaultTableConfig,
                      onlyDefaultTableConfig: onlyDefaultTableConfig,
                      isHighlightable: isHighlightable,
                      isSelectable: false,
                      componentIdentifier: tableViewIdentifier,
                      sessionId: sessionId,
                      isSortable: isSortable,
                      fieldFromKey: fieldFromKey,
                      buildCell: buildCell,
                      buildCellTitle: buildCellTitle,
                      getTitleAlignment: getTitleAlignment,
                      data: data,
                      buildCellTitleWidget: buildCellTitleWidget,
                    )
                  : AutoAnimatedSize(
                      expanded: !isCollapsed.value,
                      child: secondContent?.call(sessionId) ??
                          const SizedBox.shrink(),
                    );
            },
          ),
    );
  }
}

class AppTableViewWithItems<T, TField> extends HookConsumerWidget {
  const AppTableViewWithItems({
    required this.defaultTableConfig,
    required this.items,
    required this.fieldFromKey,
    required this.buildCell,
    required this.buildCellTitle,
    required this.getTitleAlignment,
    required this.availableTableColumnsWithLabels,
    required this.componentIdentifier,
    required this.tableDefaultNamePlural,
    this.buildCellTitleWidget,
    this.tableDensity,
    this.toolbarTrailingActions,
    this.initialFilter,
    this.quickSearchFilterFields,
    this.showTableViews = true,
    this.toolbarPadding = EdgeInsets.zero,
    this.hiddenFilterGroup,
    this.onRowTap,
    this.onRowShiftTab,
    this.width,
    this.showToolbarDivider = false,
    this.fixedTableTitle,
    this.selfGrowable = false,
    this.isSortable = true,
    this.isHighlightable = true,
    this.isResizable = true,
    this.showWhenEmpty = true,
    this.showLoadingIndicatorOnRefresh = false,
    this.enableAutofocus = true,
    this.mobileTrailingActions = const [],
    super.key,
    this.isCollapsible = true,
  });

  final bool isHighlightable;
  final bool showWhenEmpty;
  final bool showLoadingIndicatorOnRefresh;
  final bool selfGrowable;
  final bool isSortable;
  final bool showToolbarDivider;
  final void Function(T item)? onRowTap;
  final void Function(T item)? onRowShiftTab;

  final List<TableFieldConfig> defaultTableConfig;
  final Filter? initialFilter;
  final FilterGroup? hiddenFilterGroup;
  final AppTableDensity? tableDensity;
  final String componentIdentifier;
  final bool enableAutofocus;
  final List<T> items;
  final double? width;
  final TField Function(String fieldKey) fieldFromKey;
  final Widget Function(
    TField field,
    T item,
  ) buildCell;

  final String Function(TField field) buildCellTitle;
  final Widget Function(TField field)? buildCellTitleWidget;
  final Alignment Function(TField field) getTitleAlignment;

  final Map<TField, TableFieldData>? quickSearchFilterFields;
  final Map<TField, TableColumnData>? availableTableColumnsWithLabels;
  final List<Widget> Function(String sessionId)? toolbarTrailingActions;

  final bool showTableViews;
  final EdgeInsetsGeometry toolbarPadding;

  final String? fixedTableTitle;
  final bool isResizable;
  final List<MobileTableToolbarActionItem> mobileTrailingActions;
  final String tableDefaultNamePlural;
  final bool isCollapsible;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultCollapseCardSections =
        ref.watch(defaultCollapseCardSectionsStateProvider);
    final collapseCardSection = isCollapsible
        ? ref
            .watch(collapseCardSectionStateProvider)
            .findIsCollapsedByIdentifier(componentIdentifier)
        : null;
    final isCollapsed = useState<bool>(
      isCollapsible && (collapseCardSection ?? defaultCollapseCardSections),
    );
    final sessionId = useMemoized<String>(() => const Uuid().v4(), []);
    final containerKey = useMemoized(GlobalKey.new, []);

    final isInitialized = useState<bool>(false);
    final selectedConfigRef = useRef<TableConfig?>(null);
    // if showTableViews is false, then only default config is used
    // if availableTableColumnsWithLabels is null or empty, then only
    //
    final onlyDefaultTableConfig =
        availableTableColumnsWithLabels == null || !showTableViews;

    final defaultTableCfg = useMemoized(
      () {
        return TableConfig(
          componentIdentifier: componentIdentifier,
          tableId: const Uuid().v4(),
          tableFieldConfig: defaultTableConfig,
          isPrimary: false,
          filter: initialFilter ?? Filter(filterGroups: []),
          name: tableDefaultNamePlural,
        );
      },
      [componentIdentifier, sessionId, initialFilter],
    );

    final fetchInitialConfig = useCallback(() async {
      final selectedConfig = await ref.read(
        appTableConfigStateProvider(
          componentIdentifier,
          sessionId,
        ).future,
      );
      if (selectedConfig != null) {
        selectedConfigRef.value = selectedConfig;
        return (isDefault: false, config: selectedConfig);
      } else {
        selectedConfigRef.value = defaultTableCfg;
        ref
            .read(
              appTableConfigStateProvider(componentIdentifier, sessionId)
                  .notifier,
            )
            .updateTableConfig(defaultTableCfg);
        return (isDefault: true, config: defaultTableCfg);
      }
    }, [
      initialFilter,
      hiddenFilterGroup,
    ]);

    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          // First handle initialConfig if present
          unawaited(
            fetchInitialConfig().then((result) {
              final isDefault = result.isDefault;
              final config = result.config;

              if (initialFilter != null && isDefault) {
                ref
                    .read(
                      appTableFilterStateProvider(
                        componentIdentifier,
                        sessionId,
                      ).notifier,
                    )
                    .updateFilter(initialFilter);
              } else {
                ref
                    .read(
                      appTableFilterStateProvider(
                        componentIdentifier,
                        sessionId,
                      ).notifier,
                    )
                    .updateFilter(config.filter);
              }
              if (hiddenFilterGroup != null) {
                ref
                    .read(
                      hiddenAppTableFilterGroupStateProvider(
                        componentIdentifier,
                        sessionId,
                      ).notifier,
                    )
                    .updateFilter(hiddenFilterGroup);
              }
              if (config.sort != null) {
                ref
                    .read(appTableSortStateProvider(sessionId).notifier)
                    .updateSort(config.sort!);
              }
              isInitialized.value = true;
            }),
          );
        });

        return null;
      },
      [initialFilter, hiddenFilterGroup],
    );

    // return const SizedBox();

    if (!isInitialized.value) {
      return const SizedBox();
    }

    if ((items.isEmpty) && !showWhenEmpty) {
      return const SizedBox();
    }
    if (width != null) {
      final density =
          width! > 600 ? AppTableDensity.standard : AppTableDensity.compact;
      final tableDensity = this.tableDensity ?? density;
      return AppTableWrapper(
        key: containerKey,
        showToolbarDivider: showToolbarDivider,
        tableDensity: tableDensity,
        toolbar: Padding(
          padding: toolbarPadding,
          child: AppTableToolbar<TField>(
            defaultConfig: defaultTableCfg,
            namePlural: tableDefaultNamePlural,
            quickSearchFilterFields: quickSearchFilterFields,
            mobileTrailingActions: mobileTrailingActions,
            isCollapsedNotifier: isCollapsed,
            componentIdentifier: componentIdentifier,
            fixedTableTitle: fixedTableTitle,
            showToolbarDivider: showToolbarDivider,
            showTableViews: showTableViews,
            sessionId: sessionId,
            tableDensity: tableDensity,
            isCollapsible: isCollapsible,
            tableDefaultConfig: defaultTableConfig,
            onlyDefaultConfig: onlyDefaultTableConfig,
            containerKey: containerKey,
            availableFilterFields: null,
            availableTableColumns: availableTableColumnsWithLabels,
            trailingActions: toolbarTrailingActions?.call(sessionId) ?? [],
            enableAutofocus: enableAutofocus,
          ),
        ),
        content: _Table(
          namePlural: tableDefaultNamePlural,
          isCollapsed: isCollapsed.value,
          selfGrowable: selfGrowable,
          showLoadingIndicatorOnRefresh: showLoadingIndicatorOnRefresh,
          isProviderLoading: false,
          isResizable: isResizable,
          onRowTap: onRowTap,
          onRowShiftTab: onRowShiftTab,
          defaultTableConfig: defaultTableConfig,
          onlyDefaultTableConfig: onlyDefaultTableConfig,
          isHighlightable: isHighlightable,
          isSelectable: false,
          componentIdentifier: componentIdentifier,
          sessionId: sessionId,
          isSortable: isSortable,
          fieldFromKey: fieldFromKey,
          buildCell: buildCell,
          buildCellTitle: buildCellTitle,
          getTitleAlignment: getTitleAlignment,
          data: items,
          buildCellTitleWidget: buildCellTitleWidget,
        ),
      );
    }
    if (width != null) {
      final density =
          width! > 600 ? AppTableDensity.standard : AppTableDensity.compact;
      final tableDensity = this.tableDensity ?? density;
      return AppTableWrapper(
        key: containerKey,
        showToolbarDivider: showToolbarDivider,
        tableDensity: tableDensity,
        toolbar: Padding(
          padding: toolbarPadding,
          child: AppTableToolbar<TField>(
            defaultConfig: defaultTableCfg,
            namePlural: tableDefaultNamePlural,
            quickSearchFilterFields: quickSearchFilterFields,
            mobileTrailingActions: mobileTrailingActions,
            isCollapsedNotifier: isCollapsed,
            componentIdentifier: componentIdentifier,
            fixedTableTitle: fixedTableTitle,
            showToolbarDivider: showToolbarDivider,
            showTableViews: showTableViews,
            isCollapsible: isCollapsible,
            sessionId: sessionId,
            tableDensity: tableDensity,
            tableDefaultConfig: defaultTableConfig,
            onlyDefaultConfig: onlyDefaultTableConfig,
            containerKey: containerKey,
            availableFilterFields: null,
            availableTableColumns: availableTableColumnsWithLabels,
            trailingActions: toolbarTrailingActions?.call(sessionId) ?? [],
            enableAutofocus: enableAutofocus,
          ),
        ),
        content: _Table(
          namePlural: tableDefaultNamePlural,
          isCollapsed: isCollapsed.value,
          selfGrowable: selfGrowable,
          showLoadingIndicatorOnRefresh: showLoadingIndicatorOnRefresh,
          isProviderLoading: false,
          isResizable: isResizable,
          onRowTap: onRowTap,
          onRowShiftTab: onRowShiftTab,
          defaultTableConfig: defaultTableConfig,
          onlyDefaultTableConfig: onlyDefaultTableConfig,
          isHighlightable: isHighlightable,
          isSelectable: false,
          componentIdentifier: componentIdentifier,
          sessionId: sessionId,
          isSortable: isSortable,
          fieldFromKey: fieldFromKey,
          buildCell: buildCell,
          buildCellTitle: buildCellTitle,
          getTitleAlignment: getTitleAlignment,
          data: items,
          buildCellTitleWidget: buildCellTitleWidget,
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final density = constraints.maxWidth > 600
            ? AppTableDensity.standard
            : AppTableDensity.compact;
        final tableDensity = this.tableDensity ?? density;
        return AppTableWrapper(
          key: containerKey,
          showToolbarDivider: showToolbarDivider,
          tableDensity: tableDensity,
          toolbar: Padding(
            padding: toolbarPadding,
            child: AppTableToolbar<TField>(
              defaultConfig: defaultTableCfg,
              namePlural: tableDefaultNamePlural,
              quickSearchFilterFields: quickSearchFilterFields,
              mobileTrailingActions: mobileTrailingActions,
              isCollapsedNotifier: isCollapsed,
              componentIdentifier: componentIdentifier,
              fixedTableTitle: fixedTableTitle,
              showToolbarDivider: showToolbarDivider,
              showTableViews: showTableViews,
              isCollapsible: isCollapsible,
              sessionId: sessionId,
              tableDensity: tableDensity,
              tableDefaultConfig: defaultTableConfig,
              onlyDefaultConfig: onlyDefaultTableConfig,
              containerKey: containerKey,
              availableFilterFields: null,
              availableTableColumns: availableTableColumnsWithLabels,
              trailingActions: toolbarTrailingActions?.call(sessionId) ?? [],
              enableAutofocus: enableAutofocus,
            ),
          ),
          content: _Table(
            namePlural: tableDefaultNamePlural,
            isCollapsed: isCollapsed.value,
            selfGrowable: selfGrowable,
            showLoadingIndicatorOnRefresh: showLoadingIndicatorOnRefresh,
            isProviderLoading: false,
            isResizable: isResizable,
            onRowTap: onRowTap,
            onRowShiftTab: onRowShiftTab,
            defaultTableConfig: defaultTableConfig,
            onlyDefaultTableConfig: onlyDefaultTableConfig,
            isHighlightable: isHighlightable,
            isSelectable: false,
            componentIdentifier: componentIdentifier,
            sessionId: sessionId,
            isSortable: isSortable,
            fieldFromKey: fieldFromKey,
            buildCell: buildCell,
            buildCellTitle: buildCellTitle,
            getTitleAlignment: getTitleAlignment,
            data: items,
            buildCellTitleWidget: buildCellTitleWidget,
          ),
        );
      },
    );
  }
}

class _Table<T, TField> extends StatelessWidget {
  const _Table({
    required this.isCollapsed,
    required this.selfGrowable,
    required this.showLoadingIndicatorOnRefresh,
    required this.isProviderLoading,
    required this.isResizable,
    required this.onRowTap,
    required this.defaultTableConfig,
    required this.onlyDefaultTableConfig,
    required this.isHighlightable,
    required this.isSelectable,
    required this.namePlural,
    required this.componentIdentifier,
    required this.sessionId,
    required this.isSortable,
    required this.fieldFromKey,
    required this.buildCell,
    required this.buildCellTitle,
    required this.getTitleAlignment,
    required this.data,
    required this.buildCellTitleWidget,
    this.onRowShiftTab,
  });
  final bool isCollapsed;
  final bool selfGrowable;
  final bool showLoadingIndicatorOnRefresh;
  final bool isProviderLoading;
  final bool isResizable;
  final void Function(T item)? onRowTap;
  final void Function(T item)? onRowShiftTab;
  final List<TableFieldConfig> defaultTableConfig;
  final bool onlyDefaultTableConfig;
  final bool isHighlightable;
  final bool isSelectable;
  final String componentIdentifier;
  final String sessionId;
  final bool isSortable;
  final TField Function(String fieldKey) fieldFromKey;
  final Widget Function(TField field, T item) buildCell;
  final String Function(TField field) buildCellTitle;
  final Widget Function(TField field)? buildCellTitleWidget;
  final Alignment Function(TField field) getTitleAlignment;
  final List<T> data;
  final String namePlural;

  @override
  Widget build(BuildContext context) {
    return AutoAnimatedSize(
      expanded: !isCollapsed,
      child: AppTable<T>(
        tableDefaultNamePlural: namePlural,
        selfGrowable: selfGrowable,
        isDataLoading: showLoadingIndicatorOnRefresh && isProviderLoading,
        isResizable: isResizable,
        onRowTap: onRowTap,
        onRowShiftTab: onRowShiftTab,
        tableDefaultConfig: defaultTableConfig,
        onlyDefaultTableConfig: onlyDefaultTableConfig,
        isHighlightable: isHighlightable,
        isSelectable: false,
        componentIdentifier: componentIdentifier,
        sessionId: sessionId,

        columnSort: (fieldKey) {
          if (!isSortable) return const SizedBox();
          return ExcludeFocus(
            child: AppTableSortButton(
              fieldKey: fieldKey,
              tableId: sessionId,
            ),
          );
        },
        columnTitle: (
          fieldKey,
        ) {
          final field = fieldFromKey(fieldKey);
          return buildCellTitleWidget?.call(field) ??
              AppTableTitleText(
                buildCellTitle(field),
                alignment: Alignment.centerLeft,
              );
        },
        items: data,

        // we get the tableFieldConfig with the fieldKey
        //(The fieldKey is the key of the field in the table)
        // We also get the contact object which is the current
        // row
        cellWidget: (
          TableFieldConfig tableField,
          T item,
        ) {
          final field = fieldFromKey(tableField.fieldKey);
          return buildCell(field, item);
        },
      ),
    );
  }
}
