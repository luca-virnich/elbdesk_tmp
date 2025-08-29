// import 'package:elbdesk_core/elbdesk_core.dart';

// /// Controller class for dashboard grid position calculations
// class DashboardPositionController {
//   /// Recalculates positions for all tiles to ensure consistent stack ordering
//   static List<DashboardTileConfig> recalculateTilePositions(
//     List<DashboardTileConfig> configs,
//   ) {
//     final slotMap = <int, List<DashboardTileConfig>>{};
//     for (final config in configs) {
//       slotMap.putIfAbsent(config.slotIndex, () => []).add(config);
//     }

//     final updatedConfigs = <DashboardTileConfig>[];
//     for (final entry in slotMap.entries) {
//       final slotTiles = entry.value
//         ..sort((a, b) {
//           if (a.stackPosition != b.stackPosition) {
//             return a.stackPosition.compareTo(b.stackPosition);
//           }
//           return a.slotIndex.compareTo(b.slotIndex);
//         });

//       for (var i = 0; i < slotTiles.length; i++) {
//         final tile = slotTiles[i];
//         if (tile.stackPosition != i) {
//           updatedConfigs.add(tile.copyWith(stackPosition: i));
//         } else {
//           updatedConfigs.add(tile);
//         }
//       }
//     }
//     return updatedConfigs;
//   }

//   /// Calculates the Y position for a stack indicator
//   static double calculateStackPositionY(
//     List<DashboardTileConfig> tiles,
//     int position,
//     double spacing,
//   ) {
//     if (position == 0) return 0;
//     double y = 0;
//     for (var i = 0; i < position; i++) {
//       y += tiles[i].height;
//       if (i < position - 1) y += spacing;
//     }
//     return y + spacing / 2;
//   }

//   /// Calculates the Y position for a tile within its slot
//   static double calculateTileY(
//     DashboardTileConfig tile,
//     List<DashboardTileConfig> slotTiles,
//     double slotStartY,
//     double spacing, {
//     bool isDragging = false,
//   }) {
//     if (tile.stackPosition >= slotTiles.length) return slotStartY;

//     var y = slotStartY;
//     for (var i = 0; i < tile.stackPosition && i < slotTiles.length; i++) {
//       y += slotTiles[i].height + spacing;
//     }
//     return y;
//   }
// }
