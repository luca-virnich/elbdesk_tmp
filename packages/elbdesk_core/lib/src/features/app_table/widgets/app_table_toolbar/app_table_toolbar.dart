import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_core/src/features/app_table/widgets/app_table_toolbar/adjust_columns_bottom_sheet.dart';
import 'package:elbdesk_core/src/features/app_table/widgets/app_table_toolbar/table_filter/filter_field_view/filter_field_view.dart';
import 'package:elbdesk_core/src/features/app_table/widgets/app_table_toolbar/table_filter/quick_search_filter/quick_search_filter.dart';
import 'package:elbdesk_core/src/features/app_table/widgets/app_table_toolbar/table_filter/table_filter_bottom_sheet.dart';
import 'package:elbdesk_core/src/features/app_table/widgets/app_table_toolbar/table_views/table_views.dart';
import 'package:elbdesk_core/src/widgets/card_section_collapse_button.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/foundation.dart';
// ignore: no_flutter_material_import
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Export the content widgets so they're available

part 'adjust_columns.dart';
part 'table_filter.dart';
part 'table_name.dart';

/// This is the toolbar for a table. It is used to display the table title and
/// the actions that can be performed on the table.
class AppTableToolbar<T> extends StatelessWidget {
  /// AppTableToolbar constructor
  const AppTableToolbar({
    required this.sessionId,
    // required this.tableField,
    required this.containerKey,
    required this.availableFilterFields,
    required this.availableTableColumns,
    required this.tableDensity,
    required this.tableDefaultConfig,
    required this.onlyDefaultConfig,
    required this.componentIdentifier,
    required this.namePlural,
    required this.defaultConfig,
    required this.isCollapsible,
    this.navigatorKey,
    this.quickSearchFilterFields,
    this.dropdownFilterItems,
    this.trailingActions = const [],
    super.key,
    this.showFilter = true,
    this.showColumnAdjustment = true,
    this.showTableViews = true,
    this.showTableName = true,
    this.showToolbarDivider = false,
    this.fixedTableTitle,
    this.isCollapsedNotifier,
    this.enableAutofocus = true,
    this.mobileTrailingActions = const [],
  });

  final String componentIdentifier;

  /// The fixed table title
  final ValueNotifier<bool>? isCollapsedNotifier;

  /// The fixed table title
  final String? fixedTableTitle;

  final bool onlyDefaultConfig;

  final bool showToolbarDivider;

  /// The density of the table
  final AppTableDensity tableDensity;

  /// The key of the container
  final GlobalKey containerKey;

  /// Used to differentiate between different tables with the same type and
  /// create states that are unique to the table
  final String sessionId;

  /// The available filter fields for the table
  final Map<T, TableFieldData>? availableFilterFields;

  /// The available quick search filter fields for the table
  final Map<T, TableFieldData>? quickSearchFilterFields;

  /// The available table columns for the table
  final Map<T, TableColumnData>? availableTableColumns;

  /// The dropdown filter items for fields that use dropdowns
  final Map<T, List<DropdownItem<dynamic>>>? dropdownFilterItems;

  /// Trailing Child Widgets for the toolbar
  ///
  /// Shown after the adjustColumns and Filter buttons
  final List<Widget> trailingActions;

  /// Use small buttons

  /// Toggles if filters are shown
  final bool showFilter;

  /// Toggles if column adjustment is shown
  final bool showColumnAdjustment;

  /// Toggles if a dropdown menu is visible at the top of the table to
  /// select different table views
  final bool showTableViews;
  final bool showTableName;

  /// Whether the quick search filter should automatically focus when opened
  final bool enableAutofocus;

  /// Default config of the table
  final List<TableFieldConfig> tableDefaultConfig;

  final GlobalKey<NavigatorState>? navigatorKey;

  final List<MobileTableToolbarActionItem> mobileTrailingActions;
  final String namePlural;
  final TableConfig defaultConfig;
  final bool isCollapsible;

  @override
  Widget build(BuildContext context) {
    final dividerColor = context.appTheme.generalColors.titleDivider;

    final leadingWidgets = <Widget>[
      if (showTableName && !showTableViews)
        _TableName(
          fixedTableTitle: fixedTableTitle,
          onlyDefaultConfig: onlyDefaultConfig,
          componentIdentifier: componentIdentifier,
          sessionId: sessionId,
          tableDefaultConfig: tableDefaultConfig,
          namePlural: namePlural,
        ),
      if (showTableViews)
        TableViews(
          defaultConfig: defaultConfig,
          namePlural: namePlural,
          tableNames: showTableName
              ? _TableName(
                  fixedTableTitle: fixedTableTitle,
                  onlyDefaultConfig: onlyDefaultConfig,
                  componentIdentifier: componentIdentifier,
                  sessionId: sessionId,
                  tableDefaultConfig: tableDefaultConfig,
                  namePlural: namePlural,
                )
              : const SizedBox.shrink(),
          onlyDefaultConfig: onlyDefaultConfig,
          containerKey: containerKey,
          componentIdentifier: componentIdentifier,
          sessionId: sessionId,
          tableDefaultConfig: tableDefaultConfig,
        ),
    ];

    final trailingWidgets = <Widget>[
      const SizedBox(
        width: UiConstants.elementMargin,
      ),
      if (quickSearchFilterFields != null) ...[
        if (tableDensity != AppTableDensity.minimal)
          // Flexible(
          //   child: AutoAnimatedSize(
          //     animationDuration: AnimationConstants.shortDuration,
          //     keepAliveChildren: true,
          //     expanded: !isCollapsedNotifier!.value,
          //     child: QuickSearchFilter<T>(
          //       onShowQuickSearchFilter: null,
          //       tableType: tableType,
          //       sessionId: sessionId,
          //       availableFilterFields: quickSearchFilterFields,
          //       tableDensity: tableDensity,
          //       enableAutofocus: enableAutofocus,
          //     ),
          //   ),
          // ),
          const SizedBox(
            width: UiConstants.elementMargin,
          ),
        if (availableFilterFields != null)
          AutoAnimatedSize(
            animationDuration: AnimationConstants.shortDuration,
            keepAliveChildren: true,
            expanded: !isCollapsedNotifier!.value,
            child: _TableFilter(
              containerKey: containerKey,
              navigatorKey: navigatorKey,
              // tableDensity: tableDensity,
              tableDensity: AppTableDensity.compact,
              componentIdentifier: componentIdentifier,
              sessionId: sessionId,
              availableFilterFields: availableFilterFields!,
              dropdownFilterItems: dropdownFilterItems,
            ),
          ),
      ],
      // if (availableFilterFields == null) const Spacer(),

      // The Customize Table View Overlay, here we can reorder the columns
      // and select which columns should be visible
      if (availableTableColumns != null && showTableViews) ...[
        const SizedBox(
          width: UiConstants.elementMargin,
        ),
        AutoAnimatedSize(
          animationDuration: AnimationConstants.shortDuration,
          keepAliveChildren: true,
          expanded: !isCollapsedNotifier!.value,
          child: _AdjustColumns(
            containerKey: containerKey,
            // tableDensity: tableDensity,
            tableDensity: AppTableDensity.compact,
            availableTableColumns: availableTableColumns!,
            componentIdentifier: componentIdentifier,
            sessionId: sessionId,
            tableDefaultConfig: tableDefaultConfig,
            namePlural: namePlural,
          ),
        ),
      ],
      // other children we are passing to this toolbar, typically a "add new"
      // button
      if (trailingActions.isNotEmpty)
        const SizedBox(
          height: UiConstants.buttonHeight,
          width: UiConstants.elementMargin,
        ),

      if (isCollapsedNotifier != null)
        AutoAnimatedSize(
          animationDuration: AnimationConstants.shortDuration,
          keepAliveChildren: true,
          expanded: !isCollapsedNotifier!.value,
          child: Row(
            children: trailingActions,
          ),
        ),
      if (isCollapsible && isCollapsedNotifier != null)
        Padding(
          padding: const EdgeInsets.only(left: UiConstants.elementMargin),
          child: Consumer(
            builder: (context, ref, child) {
              return CardSectionCollapseButton(
                onPressed: () {
                  isCollapsedNotifier?.value = !isCollapsedNotifier!.value;

                  ref
                      .read(userSettingsStateProvider.notifier)
                      .updateCollapseCardSection(
                        componentIdentifier,
                        isCollapsedNotifier!.value,
                      );
                },
                isCollapsed: isCollapsedNotifier!.value,
              );
            },
          ),
        ),
    ];

    final allChildren = <Widget>[
      ...leadingWidgets,
      // ...leadingActions,
      ...trailingWidgets,
    ];

    if (tableDensity != AppTableDensity.minimal) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _DefaultTableToolbar(
            defaultConfig: defaultConfig,
            componentIdentifier: componentIdentifier,
            sessionId: sessionId,
            quickSearchFilterFields: quickSearchFilterFields,
            tableDensity: tableDensity,
            enableAutofocus: enableAutofocus,
            fixedTableTitle: fixedTableTitle,
            onlyDefaultConfig: onlyDefaultConfig,
            tableDefaultConfig: tableDefaultConfig,
            showTableName: showTableName,
            containerKey: containerKey,
            navigatorKey: navigatorKey,
            availableFilterFields: availableFilterFields,
            availableTableColumns: availableTableColumns,
            trailingActions: trailingActions,
            showTableViews: showTableViews,
            isCollapsedNotifier: isCollapsedNotifier,
            isCollapsible: isCollapsible,
            mobileTrailingActions: mobileTrailingActions,
            namePlural: namePlural,
            dropdownFilterItems: dropdownFilterItems,
          ),
          if (showToolbarDivider) AppDivider(height: 16, color: dividerColor),
        ],
      );
    }
    return Column(
      children: allChildren.reversed.toList(),
    );
  }
}

class _DefaultTableToolbar<T> extends StatefulWidget {
  const _DefaultTableToolbar({
    required this.componentIdentifier,
    required this.sessionId,
    required this.quickSearchFilterFields,
    required this.tableDensity,
    required this.enableAutofocus,
    required this.fixedTableTitle,
    required this.onlyDefaultConfig,
    required this.tableDefaultConfig,
    required this.showTableName,
    required this.containerKey,
    required this.navigatorKey,
    required this.availableFilterFields,
    required this.availableTableColumns,
    required this.trailingActions,
    required this.showTableViews,
    required this.isCollapsedNotifier,
    required this.isCollapsible,
    required this.mobileTrailingActions,
    required this.namePlural,
    required this.defaultConfig,
    this.dropdownFilterItems,
    super.key,
  });

  final String componentIdentifier;
  final String sessionId;
  final Map<T, TableFieldData>? quickSearchFilterFields;
  final AppTableDensity tableDensity;
  final bool enableAutofocus;
  final String? fixedTableTitle;
  final bool onlyDefaultConfig;
  final List<TableFieldConfig> tableDefaultConfig;
  final bool showTableName;
  final GlobalKey containerKey;
  final GlobalKey<NavigatorState>? navigatorKey;
  final Map<T, TableFieldData>? availableFilterFields;
  final Map<T, List<DropdownItem<dynamic>>>? dropdownFilterItems;
  final Map<T, TableColumnData>? availableTableColumns;
  final List<Widget> trailingActions;
  final bool showTableViews;
  final ValueNotifier<bool>? isCollapsedNotifier;
  final bool isCollapsible;

  final List<MobileTableToolbarActionItem> mobileTrailingActions;
  final String namePlural;
  final TableConfig defaultConfig;
  @override
  State<_DefaultTableToolbar<T>> createState() =>
      _DefaultTableToolbarState<T>();
}

class _DefaultTableToolbarState<T> extends State<_DefaultTableToolbar<T>> {
  double? trailingWidth;
  double? expandedTrailingWidth;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    // Use post frame callback to ensure first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          _isInitialized = true;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void updateTrailingWidth(double width) {
    if (!mounted) return;

    // Only update if the width has actually changed
    if (trailingWidth != width || expandedTrailingWidth == null) {
      // Use microtask to avoid setState during build
      Future.microtask(() {
        if (!mounted) return;
        setState(() {
          trailingWidth = width;
          if ((width != expandedTrailingWidth) &&
              (width > (expandedTrailingWidth ?? 0))) {
            expandedTrailingWidth = width;
          }
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final rowWidth = constraints.maxWidth;
        // Use a default estimated width if not measured yet to prevent layout
        // jumps
        final estimatedTrailingWidth = expandedTrailingWidth ?? 200;
        final useMobileLayout = rowWidth - estimatedTrailingWidth < 600 &&
                (widget.quickSearchFilterFields != null) ||
            rowWidth - estimatedTrailingWidth < 100 &&
                (widget.quickSearchFilterFields == null);
        final hideQuickSearchFilter = !_isInitialized ||
            (trailingWidth != null && (rowWidth - trailingWidth!) < 550);

        return SizedBox(
          height: UiConstants.buttonHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (widget.showTableName && !widget.showTableViews)
                Expanded(
                  child: _TableName(
                    fixedTableTitle: widget.fixedTableTitle,
                    onlyDefaultConfig: widget.onlyDefaultConfig,
                    componentIdentifier: widget.componentIdentifier,
                    sessionId: widget.sessionId,
                    tableDefaultConfig: widget.tableDefaultConfig,
                    namePlural: widget.namePlural,
                  ),
                ),
              if (widget.showTableViews)
                Expanded(
                  child: TableViews(
                    defaultConfig: widget.defaultConfig,
                    namePlural: widget.namePlural,
                    tableNames: widget.showTableName
                        ? _TableName(
                            fixedTableTitle: widget.fixedTableTitle,
                            onlyDefaultConfig: widget.onlyDefaultConfig,
                            componentIdentifier: widget.componentIdentifier,
                            namePlural: widget.namePlural,
                            sessionId: widget.sessionId,
                            tableDefaultConfig: widget.tableDefaultConfig,
                          )
                        : const SizedBox.shrink(),
                    onlyDefaultConfig: widget.onlyDefaultConfig,
                    containerKey: widget.containerKey,
                    componentIdentifier: widget.componentIdentifier,
                    sessionId: widget.sessionId,
                    tableDefaultConfig: widget.tableDefaultConfig,
                  ),
                ),
              if (widget.quickSearchFilterFields != null)
                if (!hideQuickSearchFilter)
                  AutoAnimatedSize(
                    animationDuration: AnimationConstants.shortDuration,
                    keepAliveChildren: true,
                    offstage: true,
                    expanded: !widget.isCollapsedNotifier!.value,
                    child: QuickSearchFilter<T>(
                      componentIdentifier: widget.componentIdentifier,
                      sessionId: widget.sessionId,
                      availableFilterFields: widget.quickSearchFilterFields!,
                      tableDensity: widget.tableDensity,
                      enableAutofocus: widget.enableAutofocus,
                    ),
                  ),
              ElbMeasureSize(
                onChange: (size) => updateTrailingWidth(size.width),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: _isInitialized ? 1.0 : 0.0,
                  child: _Trailing(
                    isCollapsedNotifier: widget.isCollapsedNotifier,
                    isCollapsible: widget.isCollapsible,
                    componentIdentifier: widget.componentIdentifier,
                    sessionId: widget.sessionId,
                    availableFilterFields: widget.availableFilterFields,
                    availableTableColumns: widget.availableTableColumns,
                    showTableViews: widget.showTableViews,
                    tableDefaultConfig: widget.tableDefaultConfig,
                    trailingActions: widget.trailingActions,
                    useMobileLayout: useMobileLayout,
                    namePlural: widget.namePlural,
                    containerKey: widget.containerKey,
                    navigatorKey: widget.navigatorKey,
                    mobileTrailingActions: widget.mobileTrailingActions,
                    dropdownFilterItems: widget.dropdownFilterItems,
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

/// Mobile more menu widget that shows a vertical more icon
/// and opens a menu with table actions
class _MobileMoreMenu<T> extends StatefulWidget {
  const _MobileMoreMenu({
    required this.componentIdentifier,
    required this.sessionId,
    required this.availableFilterFields,
    required this.availableTableColumns,
    required this.showTableViews,
    required this.tableDefaultConfig,
    required this.mobileTrailingActions,
    required this.namePlural,
    super.key,
  });

  final String componentIdentifier;
  final String sessionId;
  final Map<T, TableFieldData>? availableFilterFields;
  final Map<T, TableColumnData>? availableTableColumns;
  final bool showTableViews;
  final List<TableFieldConfig> tableDefaultConfig;
  final List<MobileTableToolbarActionItem> mobileTrailingActions;
  final String namePlural;
  @override
  State<_MobileMoreMenu<T>> createState() => _MobileMoreMenuState<T>();
}

class _MobileMoreMenuState<T> extends State<_MobileMoreMenu<T>> {
  late final NextMenuController controller;
  late final FocusNode focusNode;
  final GlobalKey containerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    controller = NextMenuController();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return ElbPopup(
      barrierColor: Colors.transparent,
      position: ElbPopupPosition.leftToBottom,
      // animationType: ElbPopupAnimationType.slideVertical,
      barrierAbsorbing: true,
      excludeButtonFromBarrier: true,
      useRootNavigator: false,
      forceButtonWidth: false,
      items: [
        if (widget.availableFilterFields != null &&
            widget.availableFilterFields!.isNotEmpty)
          ElbPopupItem(
            icon: AppIcons.filter_list,
            label: l10n.table_filter,
            onTap: () {
              AppBottomSheet.show<void>(
                context: context,
                title: l10n.table_filter,
                icon: AppIcons.filter_list,
                child: TableFilterBottomSheetContent(
                  sessionId: widget.sessionId,
                  availableFilterFields: widget.availableFilterFields!,
                  componentIdentifier: widget.componentIdentifier,
                ),
              );
            },
          ),
        if (widget.availableTableColumns != null && widget.showTableViews)
          ElbPopupItem(
            icon: AppIcons.view_column_outlined,
            label: l10n.table_adjust_columns,
            onTap: () {
              AppBottomSheet.show<void>(
                context: context,
                title: l10n.table_adjust_columns,
                forceMaxHeight: true,
                icon: AppIcons.view_column_outlined,
                child: AdjustColumnsBottomSheetContent(
                  availableTableColumns: widget.availableTableColumns!,
                  componentIdentifier: widget.componentIdentifier,
                  sessionId: widget.sessionId,
                  tableDefaultConfig: widget.tableDefaultConfig,
                  namePlural: widget.namePlural,
                ),
              );
            },
          ),
        for (final action in widget.mobileTrailingActions)
          ElbPopupItem(
            icon: action.icon,
            label: action.label,
            onTap: action.onPressed,
          ),
      ],
      buttonBuilder: (showOverlay, hideOverlay, isOpen) {
        // return AppIconButton(
        //   iconData: isOpen ? AppIcons.close : AppIcons.tripleDotVert,
        //   color: Colors.grey,
        //   onPressed: () {
        //     if (isOpen) {
        //       hideOverlay();
        //     } else {
        //       showOverlay();
        //     }
        //   },
        // );
        return AppButton.text(
          iconData: isOpen ? AppIcons.close : Icons.more_vert,
          // borderColor: Colors.transparent,
          // borderColorOnHover: Colors.blue,
          tooltip: 'mehr',
          onPressed: () {
            if (isOpen) {
              hideOverlay();
            } else {
              showOverlay();
            }
          },
        );
      },
    );
  }
}

class _Trailing<T> extends HookWidget {
  const _Trailing({
    required this.isCollapsedNotifier,
    required this.isCollapsible,
    required this.componentIdentifier,
    required this.sessionId,
    required this.availableFilterFields,
    required this.availableTableColumns,
    required this.showTableViews,
    required this.tableDefaultConfig,
    required this.trailingActions,
    required this.useMobileLayout,
    required this.containerKey,
    required this.navigatorKey,
    required this.mobileTrailingActions,
    required this.namePlural,
    this.dropdownFilterItems,
    super.key,
  });

  final ValueNotifier<bool>? isCollapsedNotifier;
  final bool isCollapsible;

  final String componentIdentifier;
  final String sessionId;
  final Map<T, TableFieldData>? availableFilterFields;
  final Map<T, List<DropdownItem<dynamic>>>? dropdownFilterItems;

  final Map<T, TableColumnData>? availableTableColumns;
  final bool showTableViews;
  final List<TableFieldConfig> tableDefaultConfig;
  final List<Widget> trailingActions;
  final List<MobileTableToolbarActionItem> mobileTrailingActions;
  final bool useMobileLayout;
  final GlobalKey containerKey;
  final GlobalKey<NavigatorState>? navigatorKey;
  final String namePlural;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(width: UiConstants.elementMargin),
          AutoAnimatedSize(
            animationDuration: AnimationConstants.shortDuration,
            keepAliveChildren: true,
            expanded: !isCollapsedNotifier!.value,
            child: useMobileLayout
                ? _MobileMoreMenu(
                    namePlural: namePlural,
                    componentIdentifier: componentIdentifier,
                    sessionId: sessionId,
                    availableFilterFields: availableFilterFields,
                    availableTableColumns: availableTableColumns,
                    showTableViews: showTableViews,
                    tableDefaultConfig: tableDefaultConfig,
                    mobileTrailingActions: mobileTrailingActions,
                  )
                : Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: UiConstants.elementMargin,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (availableFilterFields != null &&
                            availableFilterFields!.isNotEmpty)
                          _TableFilter(
                            containerKey: containerKey,
                            navigatorKey: navigatorKey,
                            // tableDensity: tableDensity,
                            tableDensity: AppTableDensity.compact,
                            componentIdentifier: componentIdentifier,
                            sessionId: sessionId,
                            availableFilterFields: availableFilterFields!,
                            dropdownFilterItems: dropdownFilterItems,
                          ),
                        if (availableTableColumns != null && showTableViews)
                          _AdjustColumns(
                            namePlural: namePlural,
                            containerKey: containerKey,
                            // tableDensity: tableDensity,
                            tableDensity: AppTableDensity.compact,
                            availableTableColumns: availableTableColumns!,
                            componentIdentifier: componentIdentifier,
                            sessionId: sessionId,
                            tableDefaultConfig: tableDefaultConfig,
                          ),
                        ...trailingActions,
                      ],
                    ),
                  ),
          ),
          if (isCollapsible && isCollapsedNotifier != null)
            Padding(
              padding: const EdgeInsets.only(left: UiConstants.elementMargin),
              child: Consumer(
                builder: (context, ref, child) {
                  return CardSectionCollapseButton(
                    onPressed: () {
                      isCollapsedNotifier?.value = !isCollapsedNotifier!.value;

                      ref
                          .read(userSettingsStateProvider.notifier)
                          .updateCollapseCardSection(
                            componentIdentifier,
                            isCollapsedNotifier!.value,
                          );
                    },
                    isCollapsed: isCollapsedNotifier!.value,
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
