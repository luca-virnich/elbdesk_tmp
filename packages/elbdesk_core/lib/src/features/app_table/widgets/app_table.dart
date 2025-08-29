// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_core/src/features/app_table/logic/app_table_state.dart';
import 'package:elbdesk_core/src/features/app_table/widgets/app_data_table_row_checkbox.dart';
import 'package:elbdesk_core/src/features/app_table/widgets/app_data_table_title_row.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

/// The width of the checkbox column
const checkWidth = 40.0;

// Print statements are only for illustrative purposes, not recommended for
// production applications.
// ignore_for_file: avoid_print

/// The class containing the TableView for the sample application.
class AppTable<T> extends StatefulWidget {
  /// Creates a screen that demonstrates the TableView widget.
  const AppTable({
    required this.cellWidget,
    required this.componentIdentifier,
    required this.items,
    required this.sessionId,
    required this.columnTitle,
    required this.columnSort,
    required this.tableDefaultConfig,
    required this.onlyDefaultTableConfig,
    required this.isResizable,
    required this.tableDefaultNamePlural,
    this.showTitles = true,
    this.rowItemExtend = UiConstants.tableRowItemExtend,
    this.tableScrollPadding = UiConstants.tableScrollPadding,
    this.isSelectable = true,
    this.selfGrowable = false,
    this.onRowTap,
    this.onRowShiftTab,
    this.isHighlightable = true,
    this.isDataLoading = false,
    super.key,
  });

  final void Function(T item)? onRowTap;
  final void Function(T item)? onRowShiftTab;
  final bool isHighlightable;
  final bool isDataLoading;

  /// @nodoc
  final Widget Function(
    TableFieldConfig config,
    T item,
  ) cellWidget;

  /// Title of the column
  final Widget Function(String fieldKey) columnTitle;

  /// @nodoc
  final Widget Function(String fieldKey) columnSort;

  /// Show titles of the columns
  final bool showTitles;

  /// Items to display in the table
  final List<T> items;

  /// Table sessionId
  final String sessionId;

  /// Type of the table
  final String componentIdentifier;

  /// Name of the table
  final String tableDefaultNamePlural;

  /// Row item extend
  final double rowItemExtend;

  /// Table scroll padding
  final double tableScrollPadding;

  /// If true, the table will only use the default table config
  final bool onlyDefaultTableConfig;

  /// Is selectable
  /// If true, the table will have a checkbox column
  final bool isSelectable;
  final List<TableFieldConfig> tableDefaultConfig;

  final bool selfGrowable;
  final bool isResizable;
  @override
  State<AppTable<T>> createState() => _AppTableState<T>();
}

bool isDisposed = false;

class _AppTableState<T> extends State<AppTable<T>> {
  late final ScrollController _verticalController;
  late final ScrollController _horizontalController;

  @override
  void initState() {
    super.initState();
    _verticalController = ScrollController();
    _horizontalController = ScrollController();
  }

  @override
  void dispose() {
    _verticalController.dispose();
    _horizontalController.dispose();
    isDisposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return const Text('build');
    return Consumer(
      builder: (context, ref, child) {
        final tableConfig = ref.watch(
          appTableConfigStateProvider(
            widget.componentIdentifier,
            widget.sessionId,
          ),
        );

        return tableConfig.when(
          skipLoadingOnRefresh: true,
          skipLoadingOnReload: true,
          loading: () => const AppLoadingIndicator(),
          error: (error, stackTrace) => AppText('error: $error'),
          data: (tableCellConfigs) {
            final columnCount = tableCellConfigs!.tableFieldConfig.length;

            return TableLoadingOverlay(
              isLoading: widget.isDataLoading,
              child: Stack(
                children: [
                  TableScrollbar(
                    controller: _verticalController,
                    child: TableScrollbar(
                      controller: _horizontalController,
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: widget.tableScrollPadding,
                          // right: 0,
                          bottom: widget.tableScrollPadding,
                        ),
                        child: SizedBox(
                          height: !widget.selfGrowable
                              ? null
                              : widget.showTitles
                                  ? widget.items.length * widget.rowItemExtend +
                                      widget.rowItemExtend
                                  : widget.items.length * widget.rowItemExtend,
                          child: TableView.builder(
                            pinnedRowCount: widget.showTitles ? 1 : 0,
                            verticalDetails: ScrollableDetails.vertical(
                              controller: _verticalController,
                            ),
                            horizontalDetails: ScrollableDetails.horizontal(
                              controller: _horizontalController,
                              physics: const ClampingScrollPhysics(),
                            ),
                            cellBuilder: (context, vicinity) => _buildCell(
                              context,
                              vicinity,
                              tableCellConfigs.tableFieldConfig,
                            ),
                            columnCount: widget.isSelectable
                                ? columnCount + 1
                                : columnCount,
                            columnBuilder: (index) => _buildColumnSpan(
                              tableCellConfigs.tableFieldConfig,
                              index,
                            ),
                            rowCount: widget.showTitles
                                ? widget.items.length + 1
                                : widget.items.length,
                            rowBuilder: (index) => _buildRowSpan(index, ref),
                          ),
                        ),
                      ),
                    ),
                  ),
                  AppDataTableTitleRow(
                    namePlural: widget.tableDefaultNamePlural,
                    isResizable: widget.isResizable,
                    itemsLength: widget.items.length,
                    selfGrowable: widget.selfGrowable,
                    onlyDefaultTableConfig: widget.onlyDefaultTableConfig,
                    tablePadding: widget.tableScrollPadding,

                    tableDefaultConfig: widget.tableDefaultConfig,
                    columnSort: widget.columnSort,
                    componentIdentifier: widget.componentIdentifier,
                    tableLength: widget.items.length,
                    rowHeight: widget.rowItemExtend,
                    checkColumnWidth: checkWidth,
                    horizontalScrollController: _horizontalController,
                    updateTableConfig: (value) {
                      final currentConfig = ref
                          .read(
                            appTableConfigStateProvider(
                              widget.componentIdentifier,
                              widget.sessionId,
                            ),
                          )
                          .requireValue;
                      final updatedConfig = currentConfig!.copyWith(
                        tableFieldConfig: [...value],
                      );

                      ref
                          .read(
                            appTableConfigStateProvider(
                              widget.componentIdentifier,
                              widget.sessionId,
                            ).notifier,
                          )
                          .updateTableConfig(updatedConfig);
                    },
                    isSelectable: widget.isSelectable,
                    viewConfig: tableCellConfigs.tableFieldConfig,
                    sessionId: widget.sessionId,
                    // onSort: onSort,
                  ),
                  // if (widget.isDataLoading)
                  //   const Positioned(
                  //     top: 0,
                  //     left: 0,
                  //     right: 0,
                  //     bottom: 0,
                  //     child: Align(
                  //       child: AppLoadingIndicator(
                  //         showBackground: true,
                  //       ),
                  //     ),
                  //   ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  TableViewCell _buildCell(
    BuildContext context,
    TableVicinity vicinity,
    List<TableFieldConfig> tableCellConfigs,
  ) {
    // if (vicinity.column == 0 && widget.isSelectable && vicinity.row == 0) {
    //   return const TableViewCell(
    //     child: SizedBox(
    //       width: 50,
    //       child: Text('c'),
    //     ),
    //   );
    // }

    // vicinity.columns are all columns from the table.
    // if we have a checkbox, we have one column more than in the
    // tableConfig

    // this is the fieldColum we want to use to get the correct
    // fieldConfig
    final fieldColumn =
        widget.isSelectable ? vicinity.column - 1 : vicinity.column;

    // title section
    // if we have titles, we want to build the title cells here

    if (vicinity.row == 0 && widget.showTitles) {
      // if the table is selectable, we have one more column
      // and the first (index 0) is reserved for the checkbox
      if (widget.isSelectable && vicinity.column == 0) {
        return TableViewCell(
          child: AppDataTableRowCheckbox(
            providerId: widget.sessionId,
            index: widget.showTitles ? vicinity.row - 1 : vicinity.row,
          ),
        );
      }

      final fieldKey = tableCellConfigs[fieldColumn].fieldKey;
      return TableViewCell(
        child: Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Row(
            children: [
              Expanded(
                child: widget.columnTitle(fieldKey),
              ),
              if (widget.isResizable)
                const SizedBox(
                  width: 48,
                ),
            ],
          ),
        ),
      );
    }
    // cell section (columns)

    final row = widget.showTitles ? vicinity.row - 1 : vicinity.row;
    final item = widget.items[row];

    return TableViewCell(
      child: _CellWrapper(
        namePlural: widget.tableDefaultNamePlural,
        item: item,
        onlyDefaultTableConfig: widget.onlyDefaultTableConfig,
        cellWidget: widget.cellWidget,
        componentIdentifier: widget.componentIdentifier,
        vicinity: vicinity,
        sessionId: widget.sessionId,
        showTitles: widget.showTitles,
        isSelectable: widget.isSelectable,
        tableDefaultConfig: widget.tableDefaultConfig,
      ),
    );
  }

  TableSpan _buildColumnSpan(List<TableFieldConfig> cellConfigs, int index) {
    final tableProperties = context.appTheme.tableProperties;

    final decoration = TableSpanDecoration(
      border: TableSpanBorder(
        trailing: BorderSide(
          color: tableProperties.borderColor,
          width: 0.5,
        ),
      ),
    );
    final row = widget.isSelectable ? index - 1 : index;
    if (widget.isSelectable && index == 0) {
      return TableSpan(
        foregroundDecoration: decoration,
        extent: const FixedTableSpanExtent(checkWidth),
      );
    }
    final width = cellConfigs[row].width;
    return TableSpan(
      foregroundDecoration: decoration,
      extent: FixedTableSpanExtent(width),
    );
  }

  TableSpan _buildRowSpan(int index, WidgetRef ref) {
    final tableProperties = context.appTheme.tableProperties;

    final decoration = TableSpanDecoration(
      border: TableSpanBorder(
        trailing: BorderSide(
          width: (widget.showTitles && index == 0) ? 2 : 1,
          color: (widget.showTitles && index == 0)
              ? tableProperties.titleBorderColor
              : tableProperties.borderColor,
        ),
      ),
    );

    return TableSpan(
      cursor: widget.onRowTap == null
          ? SystemMouseCursors.basic
          : SystemMouseCursors.click,
      recognizerFactories: widget.onRowTap == null
          ? <Type, GestureRecognizerFactory>{}
          : <Type, GestureRecognizerFactory>{
              TapGestureRecognizer:
                  GestureRecognizerFactoryWithHandlers<TapGestureRecognizer>(
                TapGestureRecognizer.new,
                (TapGestureRecognizer t) => t.onTap = () {
                  final itemRow =
                      widget.showTitles ? (index > 0 ? index - 1 : 0) : index;
                  final item = widget.items[itemRow];
                  final isShiftPressed =
                      HardwareKeyboard.instance.isShiftPressed;
                  if (isShiftPressed && widget.onRowShiftTab != null) {
                    widget.onRowShiftTab!(item);
                  }
                  widget.onRowTap!(item);
                },
                // t.onTap = () => widget.onRowTap!(item),
              ),
            },
      onEnter: widget.isHighlightable
          ? (event) {
              if (context.mounted) {
                final row = widget.showTitles ? index - 1 : index;
                ref
                    .read(appTableStateProvider(widget.sessionId).notifier)
                    .addHoveredRow(row);
              }
            }
          : null,
      onExit: (event) {
        if (isDisposed) return;

        if (context.mounted) {
          final row = widget.showTitles ? index - 1 : index;
          ref
              .read(appTableStateProvider(widget.sessionId).notifier)
              .removeHoveredRow(row);
        }
      },
      backgroundDecoration: decoration,
      extent: const FixedTableSpanExtent(UiConstants.tableRowItemExtend),
    );
  }
}

class _CellWrapper<T> extends ConsumerWidget {
  const _CellWrapper({
    required this.item,
    required this.cellWidget,
    required this.vicinity,
    required this.sessionId,
    required this.componentIdentifier,
    required this.isSelectable,
    required this.showTitles,
    required this.tableDefaultConfig,
    required this.onlyDefaultTableConfig,
    required this.namePlural,
    super.key,
  });

  final T item;
  final Widget Function(
    TableFieldConfig config,
    T item,
  ) cellWidget;
  final TableVicinity vicinity;
  final String sessionId;
  final String componentIdentifier;
  final bool isSelectable;
  final bool showTitles;
  final List<TableFieldConfig> tableDefaultConfig;
  final bool onlyDefaultTableConfig;
  final String namePlural;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // if the table is selectable, than the first column is reserved for
    // the checkbox
    if (isSelectable && vicinity.column == 0) {
      return _CheckboxCell(
        sessionId: sessionId,
        index: showTitles ? vicinity.row - 1 : vicinity.row,
      );
    }
    final tableFieldConfigIndex =
        isSelectable ? vicinity.column - 1 : vicinity.column;

    final hoverIndex = showTitles ? vicinity.row - 1 : vicinity.row;

    return _FieldCell(
      namePlural: namePlural,
      onlyDefaultTableConfig: onlyDefaultTableConfig,
      tableFieldConfigIndex: tableFieldConfigIndex,
      cellWidget: cellWidget,
      item: item,
      sessionId: sessionId,
      componentIdentifier: componentIdentifier,
      hoverIndex: hoverIndex,
      tableDefaultConfig: tableDefaultConfig,
    );
  }
}

class _CheckboxCell extends ConsumerWidget {
  const _CheckboxCell({
    required this.sessionId,
    required this.index,
  });
  final String sessionId;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppDataTableRowCheckbox(
      providerId: sessionId,
      index: index,
    );
  }
}

class _FieldCell<T> extends ConsumerWidget {
  const _FieldCell({
    required this.tableFieldConfigIndex,
    required this.cellWidget,
    required this.item,
    required this.sessionId,
    required this.componentIdentifier,
    required this.hoverIndex,
    required this.tableDefaultConfig,
    required this.onlyDefaultTableConfig,
    required this.namePlural,
    super.key,
  });

  final int tableFieldConfigIndex;
  final Widget Function(
    TableFieldConfig config,
    T item,
  ) cellWidget;
  final T item;
  final String sessionId;
  final String componentIdentifier;
  final int hoverIndex;
  final List<TableFieldConfig> tableDefaultConfig;
  final bool onlyDefaultTableConfig;
  final String namePlural;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tableCellConfig = ref.watch(
      appTableConfigStateProvider(
        componentIdentifier,
        sessionId,
      ).select(
        (value) {
          final cfgs = value.requireValue!.tableFieldConfig;
          if (tableFieldConfigIndex >= cfgs.length) {
            return null;
          }
          return cfgs[tableFieldConfigIndex];
        },
      ),
    );

    return Stack(
      children: [
        AbsorbPointer(
          absorbing: true,
          child: _HoverSelectedContainer(
            sessionId: sessionId,
            hoverIndex: hoverIndex,
          ),
        ),
        Padding(
          padding: EdgeInsets.zero,
          child: Align(
            alignment: Alignment.centerLeft,
            child: tableCellConfig == null
                ? const SizedBox()
                : cellWidget(tableCellConfig, item),
          ),
        ),
      ],
    );
  }
}

class _HoverSelectedContainer extends ConsumerWidget {
  const _HoverSelectedContainer({
    required this.sessionId,
    required this.hoverIndex,
  });
  final String sessionId;
  final int hoverIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tableProperties = context.appTheme.tableProperties;
    final isHovered = ref.watch(
      appTableStateProvider(sessionId).select(
        (value) => value.hoveredRow == hoverIndex,
      ),
    );
    final isSelected = ref.watch(
      appTableStateProvider(sessionId).select(
        (value) => value.selectedRows.contains(hoverIndex),
      ),
    );
    return Container(
      color: isSelected
          ? tableProperties.selectedColor
          : isHovered
              ? tableProperties.hoverColor
              : null,
    );
  }
}
