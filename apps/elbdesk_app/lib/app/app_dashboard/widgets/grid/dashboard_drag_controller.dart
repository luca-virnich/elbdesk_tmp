// import 'package:elbdesk_core/elbdesk_core.dart';
// import 'package:flutter/widgets.dart';

// /// Manages drag operations and state for dashboard tiles
// class DashboardDragController {
//   /// Cache RenderBox lookup
//   static RenderBox? _cachedRenderBox;
//   static BuildContext? _cachedContext;

//   /// Updates tile position during drag
//   static void updateTilePosition({
//     required BuildContext context,
//     required String tileId,
//     required Offset position,
//     required Size tileSize,
//     required double tileWidth,
//     required double spacing,
//     required int columns,
//     required int maxRows,
//     required List<double> cumulativeHeights,
//     required Map<int, List<DashboardTileConfig>> slotTiles,
//     required ValueNotifier<String?> draggedTileId,
//     required ValueNotifier<Offset?> dragPosition,
//     required ValueNotifier<int?> hoveredSlot,
//     required ValueNotifier<int?> hoveredStackPosition,
//   }) {
//     // Cache and reuse RenderBox
//     if (_cachedContext != context) {
//       _cachedContext = context;
//       _cachedRenderBox = context.findRenderObject()! as RenderBox;
//     }
//     final gridBox = _cachedRenderBox!;

//     if (draggedTileId.value == null) return;

//     // Use local variables for calculations to minimize property access
//     final localPosition = gridBox.globalToLocal(position);

//     // Batch updates to value notifiers
//     dragPosition.value = localPosition;

//     // Fast integer division for column calculation
//     final column = (localPosition.dx / (tileWidth + spacing)).floor();

//     // Early exit for out of bounds
//     if (column < 0 || column >= columns) {
//       hoveredSlot.value = null;
//       hoveredStackPosition.value = null;
//       return;
//     }

//     // Binary search for row position
//     final targetRow = _binarySearchRow(localPosition.dy, cumulativeHeights);

//     if (targetRow < 0 || targetRow >= maxRows) {
//       hoveredSlot.value = null;
//       hoveredStackPosition.value = null;
//       return;
//     }

//     final slotIndex = targetRow * columns + column;
//     hoveredSlot.value = slotIndex;

//     // Calculate stack position
//     final currentStackTiles = (slotTiles[slotIndex] ?? [])
//         .where((t) => t.id != draggedTileId.value)
//         .toList();

//     final slotStartY = cumulativeHeights[targetRow];
//     var accumulatedHeight = slotStartY;
//     var foundPosition = false;

//     // Find stack position based on cursor
//     for (var i = 0; i <= currentStackTiles.length; i++) {
//       final gapTop = accumulatedHeight;
//       final gapBottom = i < currentStackTiles.length
//           ? accumulatedHeight + currentStackTiles[i].height
//           : accumulatedHeight + tileSize.height;

//       if (localPosition.dy >= gapTop && localPosition.dy < gapBottom) {
//         final relativePosition =
//             (localPosition.dy - gapTop) / (gapBottom - gapTop);

//         // Top 20% - place before
//         if (relativePosition < 0.2) {
//           hoveredStackPosition.value = i;
//         }
//         // Bottom 20% - place after
//         else if (relativePosition > 0.8) {
//           hoveredStackPosition.value = i + 1;
//         }
//         // Middle 60% - replace
//         else {
//           hoveredStackPosition.value = i;
//         }

//         foundPosition = true;
//         break;
//       }

//       if (i < currentStackTiles.length) {
//         accumulatedHeight += currentStackTiles[i].height + spacing;
//       }
//     }

//     // Default to end of stack
//     if (!foundPosition) {
//       hoveredStackPosition.value = currentStackTiles.length;
//     }
//   }

//   /// Binary search to find the row based on Y position
//   static int _binarySearchRow(double y, List<double> cumulativeHeights) {
//     var low = 0;
//     var high = cumulativeHeights.length - 2;

//     while (low <= high) {
//       final mid = (low + high) ~/ 2;
//       if (y >= cumulativeHeights[mid] && y < cumulativeHeights[mid + 1]) {
//         return mid;
//       }
//       if (y < cumulativeHeights[mid]) {
//         high = mid - 1;
//       } else {
//         low = mid + 1;
//       }
//     }
//     return -1;
//   }

//   /// Handles dropping a tile into a slot
//   static List<DashboardTileConfig> dropTileInSlot({
//     required List<DashboardTileConfig> currentConfigs,
//     required String draggedTileId,
//     required int targetSlot,
//     required int targetPosition,
//     required int columns,
//   }) {
//     final draggedTile =
//         currentConfigs.firstWhere((config) => config.id == draggedTileId);
//     final targetColumn = targetSlot % columns;

//     // Check if the tile needs to be collapsed due to grid boundaries
//     final newColumnSpan = targetColumn + draggedTile.columnSpan > columns
//         ? columns - targetColumn
//         : draggedTile.columnSpan;

//     // Remove dragged tile from current configs
//     final updatedConfigs = currentConfigs
//         .where((config) => config.id != draggedTileId)
//         .toList()

//       // Add dragged tile at new position with potentially adjusted columnSpan
//       ..add(
//         draggedTile.copyWith(
//           slotIndex: targetSlot,
//           stackPosition: targetPosition,
//           columnSpan: newColumnSpan,
//         ),
//       );

//     return updatedConfigs;
//   }
// }
