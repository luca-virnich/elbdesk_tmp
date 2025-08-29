import 'dart:math';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

const double _threshold = .65;

class ArtworkListGridView extends HookWidget {
  const ArtworkListGridView({
    required this.artworks,
    required this.customerId,
    required this.defaultRows,
    required this.maxColumns,
    required this.maxWidth,
    super.key,
  });

  final List<Artwork> artworks;
  final int customerId;
  final int defaultRows;
  final int maxColumns;
  final double maxWidth;

  static const double _fullWidth = 240;
  static const double _hSpacing = 8;
  static const double _vSpacing = 8;

  @override
  Widget build(BuildContext context) {
    int calculateColumns(int maxCols, double width) {
      var cols = maxCols;
      for (var c = maxCols; c > 1; c--) {
        final threshold =
            (c - 1) * (_fullWidth + _hSpacing) + (_fullWidth * _threshold);
        if (width < threshold) cols = c - 1;
      }
      return cols;
    }

    int rowCount(int visibleCount, bool overflow, int columns) {
      final extra = overflow ? 1 : 0;
      return (visibleCount + extra + columns - 1) ~/ columns;
    }

    int visibleItemCount({
      required int total,
      required int columns,
      required int defaultItems,
      required bool isExpanded,
    }) {
      if (!isExpanded && total > defaultItems) {
        return defaultItems - 1; // leave room for button
      }
      return total;
    }

    final isExpanded = useState(false);
    final columns = calculateColumns(maxColumns, maxWidth);
    final maxDefaultItems = columns * defaultRows;
    final hasOverflow = artworks.length > maxDefaultItems;

    // collapse automatically when no overflow remains
    useEffect(
      () {
        if (isExpanded.value && !hasOverflow) {
          isExpanded.value = false;
        }
        return;
      },
      [hasOverflow],
    );

    final visibleCount = visibleItemCount(
      total: artworks.length,
      columns: columns,
      defaultItems: maxDefaultItems,
      isExpanded: isExpanded.value,
    );

    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      alignment: Alignment.topLeft,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          rowCount(visibleCount, hasOverflow, columns),
          (row) => Padding(
            padding: const EdgeInsets.only(bottom: _vSpacing),
            child: Row(
              children: List.generate(
                columns,
                (col) => _ArtworkCell(
                  row: row,
                  col: col,
                  columns: columns,
                  visibleCount: visibleCount,
                  hasOverflow: hasOverflow,
                  isExpanded: isExpanded,
                  maxWidth: maxWidth,
                  hSpacing: _hSpacing,
                  fullWidth: _fullWidth,
                  artworks: artworks,
                  customerId: customerId,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ArtworkCell extends StatelessWidget {
  const _ArtworkCell({
    required this.row,
    required this.col,
    required this.columns,
    required this.visibleCount,
    required this.hasOverflow,
    required this.isExpanded,
    required this.maxWidth,
    required this.hSpacing,
    required this.fullWidth,
    required this.artworks,
    required this.customerId,
  });
  final int row;
  final int col;
  final int columns;
  final int visibleCount;
  final bool hasOverflow;
  final ValueNotifier<bool> isExpanded;
  final double maxWidth;
  final double hSpacing;
  final double fullWidth;
  final List<Artwork> artworks;
  final int customerId;

  @override
  Widget build(BuildContext context) {
    final idx = row * columns + col;
    final needsButton = hasOverflow ? 1 : 0;
    final totalSlots = visibleCount + needsButton;
    if (idx >= totalSlots) return const SizedBox();

    // calculate width for this cell
    final slotsThisRow = min(columns, totalSlots - row * columns);
    final isLastInRow = col == slotsThisRow - 1;
    final cellWidth = isLastInRow
        ? (maxWidth - (fullWidth + hSpacing) * (slotsThisRow - 1))
            .clamp(fullWidth * _threshold, fullWidth)
        : fullWidth;

    final padding = EdgeInsets.only(left: col > 0 ? hSpacing : 0);
    if (idx < visibleCount) {
      final artwork = artworks[idx];
      return Padding(
        padding: padding,
        child: SizedBox(
          width: cellWidth,
          child: ArtworkListItem(
            artwork: artwork,
            customerId: customerId,
            width: cellWidth,
          ),
        ),
      );
    }

    // overflow button slot
    return Padding(
      padding: padding,
      child: SizedBox(
        width: cellWidth,
        child: _ExpandButton(
          isExpanded: isExpanded.value,
          onPressed: () => isExpanded.value = !isExpanded.value,
        ),
      ),
    );
  }
}

class _ExpandButton extends StatelessWidget {
  const _ExpandButton({
    required this.isExpanded,
    required this.onPressed,
  });

  final bool isExpanded;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AppButton.blank(
      onPressed: onPressed,
      label: isExpanded ? 'Weniger anzeigen'.hc : 'Mehr anzeigen'.hc,
    );
  }
}
