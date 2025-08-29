// import 'package:elbdesk_app/app/app_dashboard/logic/dashboard_state.dart';
// import 'package:elbdesk_app/app/app_dashboard/widgets/grid/dashboard_callbacks.dart';
// import 'package:elbdesk_core/elbdesk_core.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// /// A widget representing a dashboard tile that can be dragged
// /// from its fixed size top area.
// class DraggableDashboardTile extends HookConsumerWidget {
//   /// Constructor for [DraggableDashboardTile].
//   const DraggableDashboardTile({
//     required this.child,
//     required this.tileId,
//     required this.dragCallbacks,
//     required this.resizeCallbacks,
//     super.key,
//     this.isDragging = false,
//   });

//   /// The widget content of the tile.
//   final Widget child;

//   /// Unique identifier for the tile.
//   final String tileId;

//   /// Flag that indicates whether the tile is currently being dragged.
//   final bool isDragging;

//   /// Callbacks for drag interactions.
//   final DragCallbacks dragCallbacks;

//   /// Callbacks for resize interactions.
//   final ResizeCallbacks resizeCallbacks;

//   /// Fixed height for the draggable top area.
//   static const double _dragAreaHeight = 20;

//   /// Builds the widget tree for the draggable dashboard tile.
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final isEditMode = ref.watch(dashboardEditStateProvider);
//     return RepaintBoundary(
//       child: AnimatedScale(
//         // Provide visual feedback by slightly scaling the widget when dragging.
//         scale: isDragging ? 1.02 : 1.0,
//         duration: AnimationConstants.staggeredDelay,
//         child: Stack(
//           children: [
//             // Display the underlying tile content.
//             Positioned.fill(child: child),
//             // Draggable overlay covering the top fixed area of the tile.
//             if (isEditMode) ...[
//               Positioned(
//                 top: 0,
//                 left: 0,
//                 right: 0,
//                 height: _dragAreaHeight,
//                 child: MouseRegion(
//                   cursor: SystemMouseCursors.grab,
//                   child: Listener(
//                     // Start drag when pointer goes down.
//                     onPointerDown: (event) => dragCallbacks.onDragStarted(
//                       DragStartDetails(
//                         globalPosition: event.position,
//                         localPosition: event.localPosition,
//                       ),
//                     ),
//                     // Update drag as pointer moves.
//                     onPointerMove: (event) => dragCallbacks.onDragUpdate(
//                       DragUpdateDetails(
//                         globalPosition: event.position,
//                         localPosition: event.localPosition,
//                         delta: event.delta,
//                       ),
//                     ),
//                     // End drag when pointer is lifted.
//                     onPointerUp: (_) => dragCallbacks.onDragEnded(),
//                     child: Container(
//                       // Transparent container to capture pointer events.
//                       color: Colors.transparent,
//                     ),
//                   ),
//                 ),
//               ),
//               // Horizontal resize handle placed on the right side.
//               Positioned(
//                 right: 0,
//                 top: 0,
//                 bottom: 0,
//                 width: 8,
//                 child: MouseRegion(
//                   cursor: SystemMouseCursors.resizeColumn,
//                   child: GestureDetector(
//                     onPanStart: resizeCallbacks.onHorizontalStart,
//                     onPanUpdate: resizeCallbacks.onHorizontalUpdate,
//                     onPanEnd: (_) => resizeCallbacks.onHorizontalEnd(),
//                   ),
//                 ),
//               ),
//               // Vertical resize handle placed at the bottom.
//               Positioned(
//                 left: 0,
//                 right: 0,
//                 bottom: 0,
//                 height: 8,
//                 child: MouseRegion(
//                   cursor: SystemMouseCursors.resizeRow,
//                   child: GestureDetector(
//                     onPanStart: resizeCallbacks.onVerticalStart,
//                     onPanUpdate: resizeCallbacks.onVerticalUpdate,
//                     onPanEnd: (_) => resizeCallbacks.onVerticalEnd(),
//                   ),
//                 ),
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }
