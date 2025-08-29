// import 'dart:math';

// import 'package:elbdesk_core/elbdesk_core.dart';

// /// Minimum height for a dashboard tile.
// const double kMinTileHeight = 300;

// /// Controls resize operations for dashboard tiles
// class DashboardResizeController {
//   /// Updates tile width during horizontal resize
//   static List<DashboardTileConfig> handleHorizontalResize({
//     required List<DashboardTileConfig> configs,
//     required String tileId,
//     required double startX,
//     required double currentX,
//     required double tileWidth,
//     required int maxColumns,
//   }) {
//     final updatedConfigs = List<DashboardTileConfig>.from(configs);
//     final tileIndex =
//         updatedConfigs.indexWhere((config) => config.id == tileId);
//     if (tileIndex == -1) return configs;

//     final resizingTile = updatedConfigs[tileIndex];

//     // Calculate new span
//     final newSpan = ((currentX - startX) / tileWidth).round() + 1;
//     final clampedSpan = newSpan.clamp(1, maxColumns);

//     // Calculate affected slots
//     final startSlot = resizingTile.slotIndex;
//     final currentRow = startSlot ~/ maxColumns;
//     final affectedSlots = List.generate(
//       clampedSpan,
//       (i) => startSlot + i,
//     ).where((slot) => slot ~/ maxColumns == currentRow).toList();

//     // Find and move affected tiles
//     final tilesToMove = updatedConfigs.where((config) {
//       final configRow = config.slotIndex ~/ maxColumns;
//       return configRow == currentRow &&
//           config.id != resizingTile.id &&
//           affectedSlots.contains(config.slotIndex);
//     }).toList();

//     if (tilesToMove.isNotEmpty) {
//       var nextAvailableSlot = startSlot + clampedSpan;
//       final maxSlotInRow = (currentRow + 1) * maxColumns - 1;

//       for (final tileToMove in tilesToMove) {
//         if (nextAvailableSlot > maxSlotInRow) {
//           nextAvailableSlot = (currentRow + 1) * maxColumns;
//         }

//         while (updatedConfigs.any(
//           (config) =>
//               config.id != tileToMove.id &&
//               config.slotIndex == nextAvailableSlot,
//         )) {
//           nextAvailableSlot++;
//         }

//         final index = updatedConfigs.indexOf(tileToMove);
//         updatedConfigs[index] = tileToMove.copyWith(
//           slotIndex: nextAvailableSlot,
//         );

//         nextAvailableSlot++;
//       }
//     }

//     // Update resizing tile
//     updatedConfigs[tileIndex] = resizingTile.copyWith(
//       columnSpan: clampedSpan,
//     );

//     return updatedConfigs;
//   }

//   /// Updates tile height during vertical resize with snapping behavior
//   static List<DashboardTileConfig> handleVerticalResize({
//     required List<DashboardTileConfig> configs,
//     required String tileId,
//     required double deltaY,
//     required double currentHeight,
//     required double minHeight,
//     required double spacing,
//     required Map<int, List<DashboardTileConfig>> slotTiles,
//     required int columns,
//   }) {
//     final updatedConfigs = List<DashboardTileConfig>.from(configs);
//     final tileIndex =
//         updatedConfigs.indexWhere((config) => config.id == tileId);
//     if (tileIndex == -1) return configs;

//     final tile = updatedConfigs[tileIndex];
//     final currentSlot = tile.slotIndex;
//     final currentRow = currentSlot ~/ columns;

//     // Calculate new height with minimum constraint
//     var newHeight = max(currentHeight + deltaY, minHeight);

//     // Get current stack tiles and calculate total height
//     final currentStackTiles = slotTiles[currentSlot] ?? [];
//     var totalStackHeight = 0.0;
//     for (var i = 0; i < currentStackTiles.length; i++) {
//       final stackTile = currentStackTiles[i];
//       if (stackTile.id == tile.id) {
//         totalStackHeight += newHeight;
//       } else {
//         totalStackHeight += stackTile.height;
//       }
//       if (i < currentStackTiles.length - 1) {
//         totalStackHeight += spacing;
//       }
//     }

//     // Get heights of neighboring slots in the same row
//     final neighborSlots = List.generate(
//       columns,
//       (col) => currentRow * columns + col,
//     ).where((slot) => slot != currentSlot);

//     // Collect neighbor heights for snapping
//     final snapHeights = <double>{};

//     // Add neighbor total heights
//     for (final slot in neighborSlots) {
//       final stackTiles = slotTiles[slot] ?? [];
//       if (stackTiles.isEmpty) {
//         snapHeights.add(kMinTileHeight);
//         continue;
//       }

//       // Calculate total height of neighbor stack
//       var neighborHeight = 0.0;
//       for (var i = 0; i < stackTiles.length; i++) {
//         neighborHeight += stackTiles[i].height;
//         if (i < stackTiles.length - 1) neighborHeight += spacing;
//       }
//       snapHeights.add(neighborHeight);
//     }

//     // Check for snapping
//     const snapThreshold = 20.0;
//     for (final height in snapHeights) {
//       if ((totalStackHeight - height).abs() < snapThreshold) {
//         // Adjust height to snap to neighbor
//         final heightDiff = height - totalStackHeight;
//         newHeight += heightDiff;
//         break;
//       }
//     }

//     // Update the tile with new height
//     updatedConfigs[tileIndex] = tile.copyWith(height: newHeight);

//     return updatedConfigs;
//   }
// }
