import 'dart:math';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Base widget for displaying color data in a table format
class BaseColorTable extends HookConsumerWidget {
  const BaseColorTable({
    required this.colors,
    required this.maxWidth,
    required this.tableViewPage,
    required this.isLoading,
    this.bottomLeadingWidget,
    this.bottomTrailingWidget,
    this.onColorHovered,
    this.buildExtraColumns,
    this.buildExtraDataCells,
    this.isImportMode = false,
    this.buildShortNameCell,
    super.key,
  });

  final List<ArtworkColor> colors;
  final double maxWidth;
  final ValueNotifier<int> tableViewPage;
  final bool isLoading;
  final Widget? bottomLeadingWidget;
  final Widget? bottomTrailingWidget;
  final void Function(ArtworkColor?)? onColorHovered;
  final bool isImportMode;

  /// Optional callback to build additional column headers
  final List<DataColumn> Function()? buildExtraColumns;

  /// Optional callback to build additional data cells for each row
  final List<DataCell> Function(ArtworkColor)? buildExtraDataCells;

  /// Optional callback to build a custom short name cell
  final DataCell Function(ArtworkColor)? buildShortNameCell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (isLoading) {
      return const Center(
        child: AppLoadingIndicator(),
      );
    }

    if (colors.isEmpty) {
      return AppText(
        'No data provided'.hc,
        autoSize: false,
      );
    }

    useValueListenable(tableViewPage);

    const itemsPerPage = 100;
    final totalPages = ((colors.length) / itemsPerPage).ceil();
    final startIndex = tableViewPage.value * itemsPerPage;
    final endIndex =
        min((tableViewPage.value + 1) * itemsPerPage, colors.length);

    final verticalScrollController = useScrollController();
    final horizontalScrollController = useScrollController();

    return Stack(
      children: [
        Positioned(
          child: Padding(
            padding: const EdgeInsets.only(bottom: AppSpace.xxxl),
            child: _ColorTableContent(
              colors: colors,
              startIndex: startIndex,
              endIndex: endIndex,
              maxWidth: maxWidth,
              verticalScrollController: verticalScrollController,
              horizontalScrollController: horizontalScrollController,
              onColorHovered: onColorHovered,
              buildExtraColumns: buildExtraColumns,
              buildExtraDataCells: buildExtraDataCells,
              buildShortNameCell: buildShortNameCell,
            ),
          ),
        ),
        _PaginationBar(
          tableViewPage: tableViewPage,
          totalPages: totalPages,
          bottomLeadingWidget: isImportMode ? bottomLeadingWidget : null,
          bottomTrailingWidget: isImportMode ? bottomTrailingWidget : null,
        ),
      ],
    );
  }
}

class _ColorTableContent extends ConsumerWidget {
  const _ColorTableContent({
    required this.colors,
    required this.startIndex,
    required this.endIndex,
    required this.maxWidth,
    required this.verticalScrollController,
    required this.horizontalScrollController,
    this.onColorHovered,
    this.buildExtraColumns,
    this.buildExtraDataCells,
    this.buildShortNameCell,
  });

  final List<ArtworkColor> colors;
  final int startIndex;
  final int endIndex;
  final double maxWidth;
  final ScrollController verticalScrollController;
  final ScrollController horizontalScrollController;
  final void Function(ArtworkColor?)? onColorHovered;
  final List<DataColumn> Function()? buildExtraColumns;
  final List<DataCell> Function(ArtworkColor)? buildExtraDataCells;
  final DataCell Function(ArtworkColor)? buildShortNameCell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;
    final textStyle = context.appTheme.textStyles.h3;

    return Column(
      children: [
        Expanded(
          child: AppScrollbar(
            controller: verticalScrollController,
            child: SingleChildScrollView(
              controller: verticalScrollController,
              child: AppScrollbar(
                controller: horizontalScrollController,
                child: SingleChildScrollView(
                  controller: horizontalScrollController,
                  child: SizedBox(
                    width: maxWidth,
                    child: DataTable(
                      columnSpacing: AppSpace.l,
                      columns: [
                        DataColumn(
                          columnWidth: const FlexColumnWidth(17),
                          label: AppText(
                            ppL10n.color_name,
                            autoSize: false,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        DataColumn(
                          columnWidth: const FlexColumnWidth(10),
                          label: AppText(
                            ppL10n.color_short_name,
                            autoSize: false,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        DataColumn(
                          columnWidth: const FlexColumnWidth(7),
                          label: AppText(
                            'l'.hc,
                            autoSize: false,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        DataColumn(
                          columnWidth: const FlexColumnWidth(7),
                          label: AppText(
                            'a'.hc,
                            autoSize: false,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        DataColumn(
                          columnWidth: const FlexColumnWidth(7),
                          label: AppText(
                            'b'.hc,
                            autoSize: false,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        DataColumn(
                          columnWidth: const FixedColumnWidth(100),
                          label: AppText(
                            ppL10n.color,
                            autoSize: false,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (buildExtraColumns != null) ...buildExtraColumns!(),
                      ],
                      rows: colors.sublist(startIndex, endIndex).map((color) {
                        return DataRow(
                          cells: [
                            DataCell(
                              AppText(
                                color.colorName,
                                style: textStyle,
                                maxLines: 1,
                              ),
                            ),
                            buildShortNameCell?.call(color) ??
                                DataCell(
                                  AppText(
                                    color.shortName,
                                    style: textStyle,
                                    maxLines: 1,
                                  ),
                                ),
                            DataCell(
                              AppText(
                                color.l.toString(),
                                style: textStyle,
                                maxLines: 1,
                              ),
                            ),
                            DataCell(
                              AppText(
                                color.a.toString(),
                                style: textStyle,
                                maxLines: 1,
                              ),
                            ),
                            DataCell(
                              AppText(
                                color.b.toString(),
                                style: textStyle,
                                maxLines: 1,
                              ),
                            ),
                            DataCell(
                              Center(
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  color: color.color,
                                ),
                              ),
                            ),
                            if (buildExtraDataCells != null)
                              ...buildExtraDataCells!(color),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _PaginationBar extends StatelessWidget {
  const _PaginationBar({
    required this.tableViewPage,
    required this.totalPages,
    this.bottomLeadingWidget,
    this.bottomTrailingWidget,
  });

  final ValueNotifier<int> tableViewPage;
  final int totalPages;
  final Widget? bottomLeadingWidget;
  final Widget? bottomTrailingWidget;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      height: AppSpace.xxxl,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AppDivider(),
          const SizedBox(height: AppSpace.l),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              bottomLeadingWidget ?? const SizedBox.shrink(),
              Row(
                children: [
                  AppIconButton(
                    icon: const Icon(Icons.chevron_left),
                    onPressed: tableViewPage.value > 0
                        ? () => tableViewPage.value--
                        : null,
                  ),
                  AppText('${tableViewPage.value + 1} / $totalPages'),
                  AppIconButton(
                    icon: const Icon(Icons.chevron_right),
                    onPressed: tableViewPage.value < totalPages - 1
                        ? () => tableViewPage.value++
                        : null,
                  ),
                ],
              ),
              bottomTrailingWidget ?? const SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );
  }
}
