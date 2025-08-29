import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_prepress/src/nutzenlayout/models/nutzenlayout_cell.dart';
import 'package:elbdesk_prepress/src/nutzenlayout/widgets/nutzenlayout_cell_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class NutzenlayoutMatrixView extends HookWidget {
  const NutzenlayoutMatrixView({
    required this.nutzenlayout,
    required this.navigatorKey,
    required this.sessionId,
    required this.isExistingMultiNutzenlayout,
    this.availableArtworks,
    super.key,
  });
  final Nutzenlayout nutzenlayout;
  final List<Artwork>? availableArtworks;
  final GlobalKey<NavigatorState> navigatorKey;
  final String sessionId;
  final bool isExistingMultiNutzenlayout;
  @override
  Widget build(BuildContext context) {
    final drucklaenge = nutzenlayout.drucklaenge;
    final heightLongestReihe = useMemoized(
      () {
        // Calculate the height of the longest reihe
        if (nutzenlayout.columns.isEmpty) {
          return 0.0;
        }

        var maxHeight = 0.0;
        for (final column in nutzenlayout.columns) {
          var columnHeight = column.offset;
          for (final cell in column.cells) {
            columnHeight += cell.cellHeight;
          }

          final gapVertical = column.gapVertical(nutzenlayout.drucklaenge) *
              column.cells.length;

          columnHeight += gapVertical;

          if (columnHeight > maxHeight) {
            maxHeight = columnHeight;
          }
        }

        return maxHeight;
      },
      [nutzenlayout],
    );

    final width = useMemoized(
      () {
        // get the width of the widest cell in each reihe
        final widths = <double>[];
        for (final column in nutzenlayout.columns) {
          var maxWidth = 0.0;
          for (final cell in column.cells) {
            if (cell.cellWidth + cell.gapHorizontal > maxWidth) {
              maxWidth = cell.cellWidth + cell.gapHorizontal;
            }
          }
          widths.add(maxWidth);
        }

        return widths.fold<double>(0, (sum, width) => sum + width);
      },
      [nutzenlayout],
    );
    final maxCellWidthPerColumn = useMemoized(
      () {
        return nutzenlayout.columns.map((column) {
          return column.width;
        }).toList();
      },
      [nutzenlayout],
    );

    double cellPosition({
      required int columnIndex,
      required int cellIndexInColumn,
      required NutzenlayoutCell cell,
    }) {
      return maxCellWidthPerColumn.sublist(0, columnIndex).fold<double>(
                0,
                (sum, width) => sum + width,
              ) +
          cell.gapHorizontal;
    }

    return Stack(
      alignment: Alignment.topLeft,
      // fit: StackFit.loose,
      children: [
        ColoredBox(
          color: Colors.grey.shade200,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              height: nutzenlayout.drucklaenge,
              width: nutzenlayout.width,
              // child: Stack(
              //   children: [
              //     for (int columnIndex = 0;
              //         columnIndex < nutzenlayout.columns.length;
              //         columnIndex++)
              //       Positioned(
              //         left: columnIndex == 0
              //             ? 0
              //             : maxCellWidthPerColumn
              //                 .sublist(0, columnIndex)
              //                 .fold<double>(
              //                   0,
              //                   (sum, width) => sum + width,
              //                 ),
              //         child: NutzenLayoutColumnView(
              //           isExistingMultiNutzenlayout:
              //               isExistingMultiNutzenlayout,
              //           sessionId: sessionId,
              //           columnIndex: columnIndex,
              //           navigatorKey: navigatorKey,
              //           availableArtworks: availableArtworks,
              //           drucklaenge: drucklaenge,
              //           column: nutzenlayout.columns[columnIndex],
              //           cells: nutzenlayout.columns[columnIndex].cells,
              //         ),
              //       ),
              //   ],
              // ),
              child: Stack(
                children: [
                  for (int columnIndex = 0;
                      columnIndex < nutzenlayout.columns.length;
                      columnIndex++)
                    for (final (cellIndex, cell)
                        in nutzenlayout.columns[columnIndex].cells.indexed)
                      Positioned(
                        left: cell.positionXInMatrix(
                          prevoiusColumnsWidth: maxCellWidthPerColumn
                              .sublist(0, columnIndex)
                              .fold<double>(0, (sum, width) => sum + width),
                        ),
                        top: cell.positionYInMatrix(
                          columnGapVertical: nutzenlayout.columns[columnIndex]
                              .gapVertical(drucklaenge),
                          cellIndexInColumn: cellIndex,
                          columnOffset:
                              nutzenlayout.columns[columnIndex].offset,
                        ),
                        child: NutzenLayoutCellView(
                          isExistingMultiNutzenlayout:
                              isExistingMultiNutzenlayout,
                          sessionId: sessionId,
                          navigatorKey: navigatorKey,
                          cell: cell,
                          cellIndex: cellIndex,
                          columnIndex: columnIndex,
                          columnOffset:
                              nutzenlayout.columns[columnIndex].offset,
                          availableArtworks: availableArtworks,
                        ),
                      ),
                ],
              ),
            ),
          ),
        ),
        IgnorePointer(
          ignoring: true,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              height: drucklaenge,
              width: nutzenlayout.width,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
