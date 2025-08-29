import 'package:elbdesk_prepress/src/artwork/models/artwork.dart';
import 'package:elbdesk_prepress/src/nutzenlayout/models/nutzenlayout_cell.dart';
import 'package:elbdesk_prepress/src/nutzenlayout/models/nutzenlayout_column.dart';
import 'package:elbdesk_prepress/src/nutzenlayout/widgets/nutzenlayout_cell_view.dart';
import 'package:flutter/material.dart';

class NutzenLayoutColumnView extends StatelessWidget {
  const NutzenLayoutColumnView({
    required this.column,
    required this.navigatorKey,
    required this.cells,
    required this.drucklaenge,
    required this.columnIndex,
    required this.sessionId,
    required this.isExistingMultiNutzenlayout,
    this.availableArtworks,
    super.key,
  });
  final NutzenlayoutColumn column;

  final List<NutzenlayoutCell> cells;
  final double drucklaenge;
  final List<Artwork>? availableArtworks;
  final GlobalKey<NavigatorState> navigatorKey;
  final int columnIndex;
  final String sessionId;
  final bool isExistingMultiNutzenlayout;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < cells.length; i++)
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 1),
            ),
            child: NutzenLayoutCellView(
              isExistingMultiNutzenlayout: isExistingMultiNutzenlayout,
              sessionId: sessionId,
              navigatorKey: navigatorKey,
              cell: cells[i],
              cellIndex: i,
              columnIndex: columnIndex,
              columnOffset: column.offset,
              availableArtworks: availableArtworks,
            ),
          ),
      ],
    );
  }
}
