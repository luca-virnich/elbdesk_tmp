// import 'dart:math';

// import 'package:elbdesk_app/app/app_dashboard/config/dashboard_ui_constants.dart';
// import 'package:elbdesk_app/app/app_dashboard/logic/dashboard_state.dart';
// import 'package:elbdesk_app/app/app_dashboard/widgets/grid/dashboard_callbacks.dart';
// import 'package:elbdesk_app/app/app_dashboard/widgets/grid/dashboard_drag_controller.dart';
// import 'package:elbdesk_app/app/app_dashboard/widgets/grid/dashboard_position_controller.dart';
// import 'package:elbdesk_app/app/app_dashboard/widgets/grid/dashboard_resize_controller.dart';
// import 'package:elbdesk_app/app/app_dashboard/widgets/grid/dashboard_tile_factory.dart';
// import 'package:elbdesk_app/app/app_dashboard/widgets/grid/draggable_dashboard_tile.dart';
// import 'package:elbdesk_core/elbdesk_core.dart';
// import 'package:elbdesk_ui/elbdesk_ui.dart';
// import 'package:flutter/foundation.dart' show listEquals;
// import 'package:flutter/widgets.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// /// Dashboard grid displays dashboard tiles according to the global state.
// class DashboardGrid extends HookConsumerWidget {
//   /// Constructor
//   const DashboardGrid({
//     required this.columns,
//     super.key,
//     this.spacing = UiConstants.defaultPadding,
//   });

//   final double spacing;
//   final int columns;

//   /// Calculate the required number of rows based on tile positions
//   int _calculateRequiredRows(List<DashboardTileConfig> tiles) {
//     if (tiles.isEmpty) return DashboardUIConstants.minRows;

//     // Find the last used row
//     final lastUsedRow = tiles.fold<int>(0, (maxRow, tile) {
//       final tileRow = tile.slotIndex ~/ columns;
//       return tileRow > maxRow ? tileRow : maxRow;
//     });

//     // Return last used row + buffer rows, minimum of minRows
//     return max(
//       lastUsedRow + DashboardUIConstants.bufferRows + 1,
//       DashboardUIConstants.minRows,
//     );
//   }

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // Use the dashboard state provider to fetch tile configs.
//     final dashboardTilesAsync = ref.watch(dashboardStateProvider);

//     // Add this to track previous width
//     final previousWidth = useRef<double?>(null);
//     final generalColors = context.appTheme.generalColors;
//     final borderRadiuses = context.appTheme.borderRadiuses;

//     return dashboardTilesAsync.fastWhen(
//       data: (tiles) {
//         // Memoize these calculations to prevent recalculation on every rebuild
//         final maxRows = useMemoized(
//           () => _calculateRequiredRows(tiles),
//           [tiles],
//         );

//         /// Adjusts the tile configuration for single column layout to
//         /// avoid whitespace
//         List<DashboardTileConfig> adjustForSingleColumn(
//           List<DashboardTileConfig> configs,
//         ) {
//           if (configs.isEmpty) return configs;

//           // First group tiles by their slot index to identify stacks
//           final stackGroups = <int, List<DashboardTileConfig>>{};
//           for (final config in configs) {
//             stackGroups.putIfAbsent(config.slotIndex, () => []).add(config);
//           }

//           // Sort each stack by stack position
//           for (final stack in stackGroups.values) {
//             stack.sort((a, b) => a.stackPosition.compareTo(b.stackPosition));
//           }

//           // Sort slot indices to maintain vertical order
//           final sortedSlots = stackGroups.keys.toList()..sort();

//           // Prepare the result list
//           final result = <DashboardTileConfig>[];

//           // Current slot index for sequential placement
//           var currentSlot = 0;

//           // Process each stack group in order
//           for (final slotIndex in sortedSlots) {
//             final stack = stackGroups[slotIndex]!;

//             // Add each tile in the stack to the result, preserving stack order
//             for (var i = 0; i < stack.length; i++) {
//               final config = stack[i];
//               result.add(
//                 config.copyWith(
//                   slotIndex: currentSlot,
//                   stackPosition: i, // Preserve stack position within each stack
//                   columnSpan: 1, // Force column span to 1 in single column mode
//                 ),
//               );
//             }

//             // Move to the next slot for the next stack group
//             currentSlot++;
//           }

//           // Ensure stack positions are properly set
//           return DashboardPositionController.recalculateTilePositions(result);
//         }

//         // Local states for dragged tile and resizing operations.
//         final draggedTileId = useState<String?>(null);
//         final dragOffset = useState<Offset?>(null);
//         final dragPosition = useState<Offset?>(null);
//         final hoveredSlot = useState<int?>(null);

//         // Horizontal resize state.
//         final isResizing = useState<bool>(false);
//         final resizingTileId = useState<String?>(null);
//         final resizeStartX = useState<double?>(null);
//         final currentColumnSpan = useState<int?>(null);

//         // Vertical resize state.
//         final isVerticalResizing = useState<bool>(false);
//         final verticalResizingTileId = useState<String?>(null);
//         final resizeStartY = useState<double?>(null);
//         final currentHeight = useState<double?>(null);

//         // State for locked row heights.
//         final lockedRowHeights = useState<List<double>?>(null);

//         // State for stack position detection.
//         final hoveredStackPosition = useState<int?>(null);

//         // Create a temporary configuration for preview from the current
//         // state
//         var previewConfigs = List<DashboardTileConfig>.from(tiles);

//         // Adjust tile configurations for single column layout
//         if (columns == 1) {
//           previewConfigs = adjustForSingleColumn(previewConfigs);
//         }

//         if (draggedTileId.value != null && hoveredSlot.value != null) {
//           final draggedTile = tiles.firstWhere(
//             (config) => config.id == draggedTileId.value,
//           );
//           final targetSlot = hoveredSlot.value!;
//           final targetPosition = hoveredStackPosition.value ?? 0;
//           final targetRow = targetSlot ~/ columns;

//           // Remove dragged tile from preview
//           previewConfigs
//               .removeWhere((config) => config.id == draggedTileId.value);

//           // Check for expanded tiles that need to be collapsed
//           final expandedTiles = previewConfigs.where((config) {
//             final configRow = config.slotIndex ~/ columns;
//             return configRow == targetRow &&
//                 config.columnSpan > 1 &&
//                 config.slotIndex <= targetSlot &&
//                 (config.slotIndex + config.columnSpan) > targetSlot;
//           }).toList();

//           // Collapse overlapping expanded tiles.
//           for (final expandedTile in expandedTiles) {
//             final index = previewConfigs.indexOf(expandedTile);
//             previewConfigs[index] = expandedTile.copyWith(columnSpan: 1);
//           }

//           // Handle expanded tiles during preview.
//           if (draggedTile.columnSpan > 1) {
//             // Calculate affected slots.
//             final affectedSlots = List.generate(
//               draggedTile.columnSpan,
//               (i) => targetSlot + i,
//             ).where((slot) => slot ~/ columns == targetRow).toList();

//             // Shift tiles in affected slots.
//             for (final slot in affectedSlots.skip(1)) {
//               final tilesInSlot = previewConfigs
//                   .where(
//                     (config) =>
//                         config.slotIndex == slot &&
//                         config.slotIndex ~/ columns == targetRow,
//                   )
//                   .toList();

//               for (final tileToMove in tilesInSlot) {
//                 final index = previewConfigs.indexOf(tileToMove);
//                 final nextAvailableSlot = targetSlot + draggedTile.columnSpan;
//                 previewConfigs[index] = tileToMove.copyWith(
//                   slotIndex: nextAvailableSlot,
//                   stackPosition: 0,
//                 );
//               }
//             }
//           }

//           // Add dragged tile to preview.
//           previewConfigs.add(
//             draggedTile.copyWith(
//               slotIndex: targetSlot,
//               stackPosition: targetPosition,
//             ),
//           );

//           // Recalculate positions for preview.
//           previewConfigs = DashboardPositionController.recalculateTilePositions(
//             previewConfigs,
//           );
//         }

//         final rowHeights = useMemoized(
//           () {
//             // Use previewConfigs when dragging, otherwise use tiles
//             final configsToUse =
//                 draggedTileId.value != null ? previewConfigs : tiles;

//             final heights = List<double>.filled(
//               maxRows,
//               DashboardUIConstants.minTileHeight,
//             );

//             // For single column layout, calculate height differently to
//             // eliminate whitespace
//             if (columns == 1) {
//               // Get a fresh list of configs specifically adjusted for single
//               // column
//               final singleColumnConfigs = adjustForSingleColumn(configsToUse);

//               // Track the max slot index to determine actual number of rows
//               // needed
//               var maxSlotIndex = 0;

//               // Group tiles by slot index (which is the row in single column
//               // mode)
//               final slotGroups = <int, List<DashboardTileConfig>>{};
//               for (final config in singleColumnConfigs) {
//                 slotGroups.putIfAbsent(config.slotIndex, () => []).add(config);
//                 maxSlotIndex = max(maxSlotIndex, config.slotIndex);
//               }

//               // Calculate heights for each row based on its stack of tiles
//               for (var row = 0; row <= maxSlotIndex; row++) {
//                 final stackTiles = slotGroups[row] ?? [];
//                 if (stackTiles.isEmpty) {
//                   // Set minimum height for empty rows
//                   heights[row] = DashboardUIConstants.minTileHeight;
//                   continue;
//                 }

//                 // Sort tiles by stack position
//                 stackTiles
//                     .sort((a, b) => a.stackPosition.compareTo(b.stackPosition));

//                 // Calculate total height of the stack
//                 double stackHeight = 0;
//                 for (var i = 0; i < stackTiles.length; i++) {
//                   stackHeight += max(
//                     stackTiles[i].height,
//                     DashboardUIConstants.minTileHeight,
//                   );
//                   if (i < stackTiles.length - 1) stackHeight += spacing;
//                 }

//                 heights[row] = stackHeight;
//               }
//             } else {
//               // Original multi-column calculation
//               for (var row = 0; row < maxRows; row++) {
//                 final rowSlots = List.generate(
//                   columns,
//                   (col) => row * columns + col,
//                 );
//                 var maxStackHeight = DashboardUIConstants.minTileHeight;
//                 for (final slotIndex in rowSlots) {
//                   final stackTiles = configsToUse
//                       .where((config) => config.slotIndex == slotIndex)
//                       .toList();
//                   if (stackTiles.isEmpty) continue;
//                   double stackHeight = 0;
//                   for (var i = 0; i < stackTiles.length; i++) {
//                     stackHeight += max(
//                       stackTiles[i].height,
//                       DashboardUIConstants.minTileHeight,
//                     );
//                     if (i < stackTiles.length - 1) stackHeight += spacing;
//                   }
//                   maxStackHeight = max(maxStackHeight, stackHeight);
//                 }
//                 heights[row] = maxStackHeight;
//               }
//             }
//             return heights;
//           },
//           [tiles, maxRows, previewConfigs, draggedTileId.value, columns],
//         );

//         final cumulativeHeights = useMemoized(
//           () {
//             final heights = List<double>.filled(maxRows + 1, 0);
//             for (var i = 0; i < maxRows; i++) {
//               heights[i + 1] = heights[i] + rowHeights[i] + spacing;
//             }
//             return heights;
//           },
//           [rowHeights, maxRows],
//         );

//         // Ensure immediate position calculation for new tiles
//         useEffect(
//           () {
//             WidgetsBinding.instance.addPostFrameCallback((_) {
//               final recalculated =
//                   DashboardPositionController.recalculateTilePositions(tiles);
//               if (!listEquals(recalculated, tiles)) {
//                 ref
//                     .read(dashboardStateProvider.notifier)
//                     .updateTiles(recalculated);
//               }
//             });
//             return null;
//           },
//           [tiles.length],
//         ); // Only run when the number of tiles changes

//         // Add memoization for slotTiles calculation
//         final slotTiles = useMemoized(
//           () {
//             final result = <int, List<DashboardTileConfig>>{};
//             for (final config in previewConfigs) {
//               result.putIfAbsent(config.slotIndex, () => []).add(config);
//             }
//             for (final tiles in result.values) {
//               tiles.sort((a, b) => a.stackPosition.compareTo(b.stackPosition));
//             }
//             return result;
//           },
//           [previewConfigs],
//         );

//         // Add memoization for slotHeights
//         final slotHeights = useMemoized(
//           () {
//             final result = <int, double>{};
//             for (final entry in slotTiles.entries) {
//               final tiles = entry.value;
//               double height = 0;
//               for (var i = 0; i < tiles.length; i++) {
//                 height += tiles[i].height;
//                 if (i < tiles.length - 1) height += spacing;
//               }
//               result[entry.key] = height;
//             }
//             return result;
//           },
//           [slotTiles, spacing],
//         );

//         return Padding(
//           padding: const EdgeInsets.all(UiConstants.defaultPadding),
//           child: LayoutBuilder(
//             builder: (context, constraints) {
//               final availableWidth = constraints.maxWidth;
//               final tileWidth =
//                   (availableWidth - (spacing * (columns - 1))) / columns;

//               // Detect if size changed due to layout
//               final isLayoutResize = previousWidth.value != null &&
//                   previousWidth.value != availableWidth;
//               previousWidth.value = availableWidth;

//               return _GridBody(
//                 availableWidth: availableWidth,
//                 cumulativeHeights: cumulativeHeights,
//                 maxRows: maxRows,
//                 draggedTileId: draggedTileId,
//                 columns: columns,
//                 isLayoutResize: isLayoutResize,
//                 tileWidth: tileWidth,
//                 spacing: spacing,
//                 slotHeights: slotHeights,
//                 rowHeights: rowHeights,
//                 hoveredSlot: hoveredSlot,
//                 generalColors: generalColors,
//                 borderRadiuses: borderRadiuses,
//                 slotTiles: slotTiles,
//                 hoveredStackPosition: hoveredStackPosition,
//                 previewConfigs: previewConfigs,
//                 dragOffset: dragOffset,
//                 dragPosition: dragPosition,
//                 lockedRowHeights: lockedRowHeights,
//                 resizeStartY: resizeStartY,
//                 tiles: tiles,
//                 isResizing: isResizing,
//                 resizingTileId: resizingTileId,
//                 resizeStartX: resizeStartX,
//                 currentColumnSpan: currentColumnSpan,
//                 isVerticalResizing: isVerticalResizing,
//                 verticalResizingTileId: verticalResizingTileId,
//                 currentHeight: currentHeight,
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }

// class _GridBody extends HookConsumerWidget {
//   const _GridBody({
//     required this.availableWidth,
//     required this.cumulativeHeights,
//     required this.maxRows,
//     required this.draggedTileId,
//     required this.columns,
//     required this.isLayoutResize,
//     required this.tileWidth,
//     required this.spacing,
//     required this.slotHeights,
//     required this.rowHeights,
//     required this.hoveredSlot,
//     required this.generalColors,
//     required this.borderRadiuses,
//     required this.slotTiles,
//     required this.hoveredStackPosition,
//     required this.previewConfigs,
//     required this.dragOffset,
//     required this.dragPosition,
//     required this.lockedRowHeights,
//     required this.resizeStartY,
//     required this.tiles,
//     required this.isResizing,
//     required this.resizingTileId,
//     required this.resizeStartX,
//     required this.currentColumnSpan,
//     required this.isVerticalResizing,
//     required this.verticalResizingTileId,
//     required this.currentHeight,
//   });

//   final double availableWidth;
//   final List<double> cumulativeHeights;
//   final int maxRows;
//   final ValueNotifier<String?> draggedTileId;
//   final int columns;
//   final bool isLayoutResize;
//   final double tileWidth;
//   final double spacing;
//   final Map<int, double> slotHeights;
//   final List<double> rowHeights;
//   final ValueNotifier<int?> hoveredSlot;
//   final AppGeneralColors generalColors;
//   final AppBorderRadiuses borderRadiuses;
//   final Map<int, List<DashboardTileConfig>> slotTiles;
//   final ValueNotifier<int?> hoveredStackPosition;
//   final List<DashboardTileConfig> previewConfigs;
//   final ValueNotifier<Offset?> dragOffset;
//   final ValueNotifier<Offset?> dragPosition;
//   final ValueNotifier<List<double>?> lockedRowHeights;
//   final ValueNotifier<double?> resizeStartY;

//   final List<DashboardTileConfig> tiles;
//   final ValueNotifier<bool> isResizing;
//   final ValueNotifier<String?> resizingTileId;
//   final ValueNotifier<double?> resizeStartX;
//   final ValueNotifier<int?> currentColumnSpan;
//   final ValueNotifier<bool> isVerticalResizing;
//   final ValueNotifier<String?> verticalResizingTileId;
//   final ValueNotifier<double?> currentHeight;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // Update the number of columns based on the available width.
//     useEffect(
//       () {
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           if (availableWidth < DashboardUIConstants.responsiveBreakpoint &&
//               columns != 1) {
//             ref.read(dashboardEditStateProvider.notifier).setEditMode(false);
//             ref.read(dashboardColumnsProvider.notifier).setColumns(1);
//           } else if (availableWidth >=
//                   DashboardUIConstants.responsiveBreakpoint &&
//               columns != 2) {
//             ref.read(dashboardColumnsProvider.notifier).setColumns(2);
//           }
//         });
//         return null;
//       },
//       [availableWidth],
//     );

//     // Update tile position while dragging.
//     void updateTilePosition(
//       String tileId,
//       Offset position,
//       Size tileSize,
//     ) {
//       DashboardDragController.updateTilePosition(
//         context: context,
//         tileId: tileId,
//         position: position,
//         tileSize: tileSize,
//         tileWidth: tileWidth,
//         spacing: spacing,
//         columns: columns,
//         maxRows: maxRows,
//         cumulativeHeights: cumulativeHeights,
//         slotTiles: slotTiles,
//         draggedTileId: draggedTileId,
//         dragPosition: dragPosition,
//         hoveredSlot: hoveredSlot,
//         hoveredStackPosition: hoveredStackPosition,
//       );
//     }

//     // Drop tile in the appropriate slot.
//     void dropTileInSlot() {
//       if (hoveredSlot.value == null ||
//           draggedTileId.value == null ||
//           hoveredStackPosition.value == null) {
//         return;
//       }
//       final updatedConfigs = DashboardDragController.dropTileInSlot(
//         currentConfigs: tiles,
//         draggedTileId: draggedTileId.value!,
//         targetSlot: hoveredSlot.value!,
//         targetPosition: hoveredStackPosition.value!,
//         columns: columns,
//       );
//       final recalculated = DashboardPositionController.recalculateTilePositions(
//         updatedConfigs,
//       );
//       // Update the global dashboard state.
//       ref.read(dashboardStateProvider.notifier).updateTiles(recalculated);
//       // Reset drag state.
//       Future.microtask(() {
//         hoveredSlot.value = null;
//         hoveredStackPosition.value = null;
//         draggedTileId.value = null;
//         dragOffset.value = null;
//         dragPosition.value = null;
//       });
//     }

//     // Handle horizontal resize start.
//     void handleResizeStart(String tileId, double startX) {
//       isResizing.value = true;
//       resizingTileId.value = tileId;
//       resizeStartX.value = startX;
//       // Determine current column span from global state.
//       currentColumnSpan.value =
//           tiles.firstWhere((config) => config.id == tileId).columnSpan;
//     }

//     // Update horizontal resize.
//     void handleResizeUpdate(double dx, double tileWidth) {
//       if (!isResizing.value || resizingTileId.value == null) return;
//       final updatedConfigs = DashboardResizeController.handleHorizontalResize(
//         configs: tiles,
//         tileId: resizingTileId.value!,
//         startX: resizeStartX.value ?? 0,
//         currentX: dx,
//         tileWidth: tileWidth,
//         maxColumns: columns,
//       );
//       ref.read(dashboardStateProvider.notifier).updateTiles(updatedConfigs);
//     }

//     // End horizontal resize.
//     void handleResizeEnd() {
//       if (resizingTileId.value == null) return;
//       ref.read(dashboardStateProvider.notifier).updateTiles(tiles);
//       isResizing.value = false;
//       resizingTileId.value = null;
//       resizeStartX.value = null;
//       currentColumnSpan.value = null;
//     }

//     // Handle vertical resize start.
//     void handleVerticalResizeStart(String tileId, double startY) {
//       isVerticalResizing.value = true;
//       verticalResizingTileId.value = tileId;
//       resizeStartY.value = startY;
//       currentHeight.value =
//           tiles.firstWhere((config) => config.id == tileId).height;
//     }

//     // Update vertical resize.
//     void handleVerticalResizeUpdate(double dy) {
//       if (!isVerticalResizing.value || verticalResizingTileId.value == null) {
//         return;
//       }
//       final updatedConfigs = DashboardResizeController.handleVerticalResize(
//         configs: tiles,
//         tileId: verticalResizingTileId.value!,
//         deltaY: dy,
//         currentHeight:
//             currentHeight.value ?? DashboardUIConstants.defaultTileHeight,
//         minHeight: DashboardUIConstants.minTileHeight,
//         spacing: spacing,
//         slotTiles: slotTiles,
//         columns: columns,
//       );
//       ref.read(dashboardStateProvider.notifier).updateTiles(updatedConfigs);
//     }

//     // End vertical resize.
//     void handleVerticalResizeEnd() {
//       if (verticalResizingTileId.value == null) return;
//       ref.read(dashboardStateProvider.notifier).updateTiles(tiles);
//       isVerticalResizing.value = false;
//       verticalResizingTileId.value = null;
//       resizeStartY.value = null;
//       currentHeight.value = null;
//     }

//     return SizedBox(
//       width: availableWidth,
//       height: cumulativeHeights[maxRows],
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           // * Grid Slots (Underneath all tiles)
//           if (draggedTileId.value != null)
//             for (int slotIndex = 0; slotIndex < columns * maxRows; slotIndex++)
//               AnimatedPositioned(
//                 duration: Duration(
//                   milliseconds: isLayoutResize
//                       ? 0
//                       : AnimationConstants.shortDuration.inMilliseconds,
//                 ),
//                 curve: AnimationConstants.easeOut,
//                 left: (slotIndex % columns) * (tileWidth + spacing),
//                 top: cumulativeHeights[slotIndex ~/ columns],
//                 width: tileWidth,
//                 height:
//                     slotHeights[slotIndex] ?? rowHeights[slotIndex ~/ columns],
//                 child: Stack(
//                   children: [
//                     AnimatedContainer(
//                       duration: AnimationConstants.shortDuration,
//                       curve: AnimationConstants.easeOut,
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: hoveredSlot.value == slotIndex
//                               ? generalColors.primary
//                               : generalColors.divider,
//                           width: hoveredSlot.value == slotIndex ? 2 : 1,
//                         ),
//                         borderRadius: BorderRadius.circular(
//                           borderRadiuses.m,
//                         ),
//                         color: hoveredSlot.value == slotIndex
//                             ? generalColors.primary.withAppOpacity(0.1)
//                             : generalColors.background.withAppOpacity(0.1),
//                       ),
//                     ),
//                     if (hoveredSlot.value == slotIndex)
//                       ...List.generate(
//                         (slotTiles[slotIndex]?.length ?? 0) + 1,
//                         (index) {
//                           final isHovered = hoveredStackPosition.value == index;
//                           if (index == 0) {
//                             return const SizedBox.shrink();
//                           }
//                           return Positioned(
//                             left: 2,
//                             right: 2,
//                             top: DashboardPositionController
//                                 .calculateStackPositionY(
//                               slotTiles[slotIndex] ?? [],
//                               index,
//                               spacing,
//                             ),
//                             height: 2,
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: isHovered
//                                     ? generalColors.primary
//                                     : generalColors.primary.withAppOpacity(0.3),
//                                 borderRadius: BorderRadius.circular(1),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                   ],
//                 ),
//               ),

//           // * Tiles that are in slots
//           // Non-dragged tiles
//           for (final config in previewConfigs.where(
//             (c) =>
//                 !c.id.startsWith('placeholder_') && c.id != draggedTileId.value,
//           ))
//             AnimatedPositioned(
//               key: ValueKey(config.id),
//               duration: Duration(
//                 milliseconds: isLayoutResize
//                     ? 0
//                     : AnimationConstants.shortDuration.inMilliseconds,
//               ),
//               curve: AnimationConstants.easeOut,
//               left: (config.slotIndex % columns) * (tileWidth + spacing),
//               top: DashboardPositionController.calculateTileY(
//                 config,
//                 slotTiles[config.slotIndex] ?? [],
//                 cumulativeHeights[config.slotIndex ~/ columns],
//                 spacing,
//               ),
//               width: (tileWidth * config.columnSpan) +
//                   (spacing * (config.columnSpan - 1)),
//               height: config.height,
//               child: DraggableDashboardTile(
//                 tileId: config.id,
//                 isDragging: false,
//                 dragCallbacks: DragCallbacks(
//                   onDragStarted: (details) {
//                     final gridBox = context.findRenderObject()! as RenderBox;
//                     final localPosition =
//                         gridBox.globalToLocal(details.globalPosition);
//                     draggedTileId.value = config.id;
//                     dragOffset.value = details.localPosition;
//                     dragPosition.value = localPosition;
//                     hoveredSlot.value = config.slotIndex;
//                     hoveredStackPosition.value = config.stackPosition;
//                   },
//                   onDragUpdate: (details) {
//                     updateTilePosition(
//                       config.id,
//                       details.globalPosition,
//                       Size(tileWidth, config.height),
//                     );
//                   },
//                   onDragEnded: () {
//                     lockedRowHeights.value = null;
//                     dropTileInSlot();
//                   },
//                 ),
//                 resizeCallbacks: ResizeCallbacks(
//                   onHorizontalStart: (details) => handleResizeStart(
//                     config.id,
//                     details.globalPosition.dx,
//                   ),
//                   onHorizontalUpdate: (details) => handleResizeUpdate(
//                     details.globalPosition.dx,
//                     tileWidth,
//                   ),
//                   onHorizontalEnd: handleResizeEnd,
//                   onVerticalStart: (details) => handleVerticalResizeStart(
//                     config.id,
//                     details.globalPosition.dy,
//                   ),
//                   onVerticalUpdate: (details) => handleVerticalResizeUpdate(
//                     details.globalPosition.dy - (resizeStartY.value ?? 0),
//                   ),
//                   onVerticalEnd: handleVerticalResizeEnd,
//                 ),
//                 child: DashboardTileFactory(
//                   config: config,
//                   tileWidth: tileWidth,
//                 ),
//               ),
//             ),

//           // * Dragged tile (always on top)
//           if (draggedTileId.value != null)
//             for (final config
//                 in tiles.where((c) => c.id == draggedTileId.value))
//               AnimatedPositioned(
//                 key: ValueKey(config.id),
//                 duration: Duration(
//                   milliseconds: isLayoutResize
//                       ? 0
//                       : (dragPosition.value == null
//                           ? AnimationConstants.shortDuration.inMilliseconds
//                           : 0),
//                 ),
//                 curve: AnimationConstants.easeOut,
//                 left: dragPosition.value != null
//                     ? dragPosition.value!.dx - (dragOffset.value?.dx ?? 0)
//                     : (hoveredSlot.value! % columns) * (tileWidth + spacing),
//                 top: dragPosition.value != null
//                     ? dragPosition.value!.dy - (dragOffset.value?.dy ?? 0)
//                     : DashboardPositionController.calculateTileY(
//                         config.copyWith(
//                           slotIndex: hoveredSlot.value ?? config.slotIndex,
//                           stackPosition: hoveredStackPosition.value ??
//                               config.stackPosition,
//                         ),
//                         slotTiles[hoveredSlot.value ?? config.slotIndex] ?? [],
//                         cumulativeHeights[
//                             (hoveredSlot.value ?? config.slotIndex) ~/ columns],
//                         spacing,
//                         isDragging: true,
//                       ),
//                 width: (tileWidth * config.columnSpan) +
//                     (spacing * (config.columnSpan - 1)),
//                 height: config.height,
//                 child: DraggableDashboardTile(
//                   tileId: config.id,
//                   isDragging: true,
//                   dragCallbacks: DragCallbacks(
//                     onDragStarted: (details) {
//                       final gridBox = context.findRenderObject()! as RenderBox;
//                       final localPosition =
//                           gridBox.globalToLocal(details.globalPosition);
//                       draggedTileId.value = config.id;
//                       dragOffset.value = details.localPosition;
//                       dragPosition.value = localPosition;
//                     },
//                     onDragUpdate: (details) {
//                       updateTilePosition(
//                         config.id,
//                         details.globalPosition,
//                         Size(tileWidth, config.height),
//                       );
//                     },
//                     onDragEnded: () {
//                       dragPosition.value = null;
//                       Future.microtask(() {
//                         lockedRowHeights.value = null;
//                         dropTileInSlot();
//                         draggedTileId.value = null;
//                         dragOffset.value = null;
//                         hoveredSlot.value = null;
//                       });
//                     },
//                   ),
//                   resizeCallbacks: ResizeCallbacks(
//                     onHorizontalStart: (details) => handleResizeStart(
//                       config.id,
//                       details.globalPosition.dx,
//                     ),
//                     onHorizontalUpdate: (details) => handleResizeUpdate(
//                       details.globalPosition.dx,
//                       tileWidth,
//                     ),
//                     onHorizontalEnd: handleResizeEnd,
//                     onVerticalStart: (details) => handleVerticalResizeStart(
//                       config.id,
//                       details.globalPosition.dy,
//                     ),
//                     onVerticalUpdate: (details) => handleVerticalResizeUpdate(
//                       details.globalPosition.dy - (resizeStartY.value ?? 0),
//                     ),
//                     onVerticalEnd: handleVerticalResizeEnd,
//                   ),
//                   child: DashboardTileFactory(
//                     config: config,
//                     tileWidth: tileWidth,
//                   ),
//                 ),
//               ),
//         ],
//       ),
//     );
//   }
// }
