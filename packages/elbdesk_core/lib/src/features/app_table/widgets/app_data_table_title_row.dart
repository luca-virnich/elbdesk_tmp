import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_core/src/features/app_table/logic/app_table_state.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
// ignore: no_flutter_material_import
import 'package:flutter/material.dart';

const _minimumCellWidth = 80.0;
const _maximumCellWidth = 600.0;

/// AppDataTableTitleRow
///
/// The title row of a data table
/// This row contains the column titles and controls for the table
/// such as sorting and resizing
class AppDataTableTitleRow extends HookWidget {
  /// Constructor
  const AppDataTableTitleRow({
    required this.isSelectable,
    required this.viewConfig,
    required this.rowHeight,
    required this.checkColumnWidth,
    required this.componentIdentifier,
    required this.horizontalScrollController,
    required this.updateTableConfig,
    // required this.onSort,
    required this.sessionId,
    required this.tableLength,
    required this.tablePadding,
    required this.columnSort,
    required this.tableDefaultConfig,
    required this.onlyDefaultTableConfig,
    required this.selfGrowable,
    required this.itemsLength,
    required this.isResizable,
    required this.namePlural,
    super.key,
  });

  final int itemsLength;
  final bool isResizable;
  final bool selfGrowable;

  /// @nodoc
  final List<TableFieldConfig> viewConfig;

  /// @nodoc
  final double checkColumnWidth;

  /// Height of the table rows
  final double rowHeight;

  /// @nodoc
  final Widget Function(String) columnSort;

  /// Set if the table is selectable
  /// This will add a column of checkboxes to the table
  final bool isSelectable;

  /// @nodoc
  final void Function(List<TableFieldConfig>) updateTableConfig;

  /// @nodoc
  final ScrollController horizontalScrollController;

  /// SessionId of the table
  final String sessionId;

  /// @nodoc
  final int tableLength;

  /// Type of the table
  final String componentIdentifier;

  /// Name of the table
  final String namePlural;

  /// Default config of the table
  final List<TableFieldConfig> tableDefaultConfig;

  /// Only default table config
  final bool onlyDefaultTableConfig;

  /// Padding of the table
  final double tablePadding;
  @override
  Widget build(BuildContext context) {
    final isLocked = useState<bool>(true);

    final parentScrollOffset = useListenableSelector(
      horizontalScrollController,
      () => horizontalScrollController.position.pixels,
    );

    final scrollController = useScrollController();

    useEffect(
      () {
        if (scrollController.hasClients) {
          scrollController.jumpTo(parentScrollOffset);
        }
        return null;
      },
      [parentScrollOffset],
    );

    return SizedBox(
      height: isLocked.value
          ? rowHeight
          : selfGrowable
              ? itemsLength * rowHeight + rowHeight
              : null,
      child: Padding(
        padding: EdgeInsets.only(right: tablePadding),
        child: ListView(
          shrinkWrap: true,
          controller: scrollController,
          primary: false,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            if (isSelectable)
              const SizedBox(
                width: checkWidth,
              ),
            for (final (index, e) in viewConfig.indexed)
              _TitleCellWithControls(
                namePlural: namePlural,
                isResizable: isResizable,
                onlyDefaultTableConfig: onlyDefaultTableConfig,
                key: ValueKey(e.fieldKey),
                fieldConfig: e,
                columnSort: columnSort,
                componentIdentifier: componentIdentifier,
                updateTableConfig: updateTableConfig,
                isLocked: isLocked,
                sessionId: sessionId,
                fieldIndex: index,
                tableViewConfig: viewConfig,
                // onSort: onSort,
                // updateTableConfig: updateTableConfig,
                tableDefaultConfig: tableDefaultConfig,
              ),
          ],
        ),
      ),
    );
  }
}

/// DataTableTitleCheckBox
///
/// A checkbox that can be used in the first column of a data table title row
class DataTableTitleCheckBox extends ConsumerWidget {
  /// Constructor
  const DataTableTitleCheckBox({
    required this.sessionId,
    required this.tableLength,
    super.key,
  });

  /// SessionId of the table
  final String sessionId;

  /// @nodoc
  final int tableLength;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tableProperties = context.appTheme.tableProperties;
    final selectedItemsLength = ref.watch(
      appTableStateProvider(sessionId)
          .select((value) => value.selectedRows.length),
    );
    return Checkbox(
      tristate: true,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      side: WidgetStateBorderSide.resolveWith(
        (states) => BorderSide(color: tableProperties.borderColor),
      ),
      visualDensity: VisualDensity.compact,
      // value: isSelected,
      value: selectedItemsLength == tableLength
          ? true
          : selectedItemsLength > 0
              ? null
              : false,
      activeColor: tableProperties.activeColor,
      checkColor: tableProperties.checkedBoxIconColor,
      // checkColor: context.appColors.tableSelectedColor,
      // activeColor: Colors.red,
      // overlayColor: MaterialStateProperty.all(Colors.amber),
      // fillColor: MaterialStateProperty.all(Colors.purple),
      onChanged: (v) {
        if (selectedItemsLength > 0) {
          ref.read(appTableStateProvider(sessionId).notifier).uncheckAll();
          return;
        }
        final selectedLength = ref.read(
          appTableStateProvider(sessionId)
              .select((value) => value.selectedRows.length),
        );
        if (selectedLength == 0) {
          ref
              .read(appTableStateProvider(sessionId).notifier)
              .checkAll(tableLength);
        }
      },
    );
  }
}

class _TitleCellWithControls extends HookConsumerWidget {
  const _TitleCellWithControls({
    required this.fieldConfig,
    required this.updateTableConfig,
    required this.isLocked,
    required this.tableViewConfig,
    required this.columnSort,
    required this.fieldIndex,
    required this.componentIdentifier,
    required this.tableDefaultConfig,
    required this.onlyDefaultTableConfig,
    // required this.onSort,
    required this.sessionId,
    required this.isResizable,
    required this.namePlural,
    super.key,
  });
  final TableFieldConfig fieldConfig;
  final List<TableFieldConfig> tableViewConfig;
  final void Function(List<TableFieldConfig>) updateTableConfig;
  final ValueNotifier<bool> isLocked;
  final int fieldIndex;
  final String sessionId;
  final Widget Function(String) columnSort;
  final String componentIdentifier;
  final List<TableFieldConfig> tableDefaultConfig;
  final bool onlyDefaultTableConfig;
  final bool isResizable;
  final String namePlural;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDragging = useState<bool>(false);
    final cellWidth = useState<double>(fieldConfig.width);
    final isHovered = useState<bool>(false);

    final currentTableConfig = ref
        .watch(
          appTableConfigStateProvider(
            componentIdentifier,
            sessionId,
          ),
        )
        .requireValue;

    final fieldWidth = currentTableConfig!.tableFieldConfig[fieldIndex].width;

    useEffect(
      () {
        if (fieldWidth != cellWidth.value) {
          cellWidth.value = fieldWidth;
        }
        return null;
      },
      [fieldWidth],
    );
    final tableProperties = context.appTheme.tableProperties;

    return SizedBox(
      width: cellWidth.value,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isLocked.value)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: columnSort(fieldConfig.fieldKey),
              ),
            ),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              if (isResizable)
                MouseRegion(
                  cursor: SystemMouseCursors.resizeColumn,
                  child: Container(
                    width: 3,
                    color: !isLocked.value
                        ? tableProperties.titleBorderColor.withAppOpacity(.5)
                        : context.appTheme.generalColors.transparent,
                  ),
                ),
              if (isResizable)
                MouseRegion(
                  onEnter: (event) {
                    isHovered.value = true;
                  },
                  onExit: (event) {
                    isHovered.value = false;
                  },
                  cursor: SystemMouseCursors.resizeColumn,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onHorizontalDragStart: (details) {
                      isDragging.value = true;
                      isLocked.value = false;
                    },
                    onHorizontalDragEnd: (details) {
                      isDragging.value = false;
                      isLocked.value = true;
                      final column = tableViewConfig.indexOf(fieldConfig);
                      final updated = [...tableViewConfig];
                      updated[column] =
                          fieldConfig.copyWith(width: cellWidth.value);
                      updateTableConfig(updated);
                    },
                    onHorizontalDragUpdate: (details) {
                      final newWidth = (cellWidth.value + details.primaryDelta!)
                          .clamp(_minimumCellWidth, _maximumCellWidth);
                      cellWidth.value = newWidth;
                    },
                    child: !isLocked.value
                        // we need this container so that the mouse region is
                        // not affected when the resizing
                        ? Container(
                            width: 20,
                          )
                        : Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Icon(
                                Icons.drag_indicator_rounded,
                                size: 20,
                                color: isHovered.value
                                    ? tableProperties.titleBorderColor
                                    : tableProperties.borderColor,
                              ),
                            ),
                          ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
