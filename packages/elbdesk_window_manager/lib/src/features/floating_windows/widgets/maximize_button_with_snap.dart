// import 'dart:async';

// import 'package:elbdesk_window_manager/src/features/floating_windows/providers/state/floating_window_is_maximized_state.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../../../localization/window_manager_localizations.dart';
// import '../../../theme/window_manager_theme.dart';
// import 'snap_overlay.dart';

// /// Maximize button with snap layout menu on hover/right-click
// class MaximizeButtonWithSnap extends ConsumerStatefulWidget {
//   const MaximizeButtonWithSnap({
//     required this.windowId,

//     required this.foregroundColor,
//     this.size = 18,
//     super.key,
//   });

//   final String windowId;

//   final Color foregroundColor;
//   final double size;

//   @override
//   ConsumerState<MaximizeButtonWithSnap> createState() =>
//       _MaximizeButtonWithSnapState();
// }

// class _MaximizeButtonWithSnapState
//     extends ConsumerState<MaximizeButtonWithSnap> {
//   OverlayEntry? _overlayEntry;
//   Timer? _hoverTimer;
//   bool _isHovered = false;

//   void _showSnapMenu() {
//     if (_overlayEntry != null) return; // Prevent multiple overlays

//     final RenderBox renderBox = context.findRenderObject() as RenderBox;
//     final position = renderBox.localToGlobal(Offset.zero);
//     final buttonSize = renderBox.size;

//     // Capture the theme data before creating the overlay
//     final windowManagerTheme = WindowManagerTheme.of(context);

//     _overlayEntry = OverlayEntry(
//       builder: (overlayContext) => Stack(
//         children: [
//           // Invisible full-screen barrier
//           Positioned.fill(
//             child: GestureDetector(
//               onTap: _hideSnapMenu,
//               behavior: HitTestBehavior.translucent,
//               child: Container(color: Colors.transparent),
//             ),
//           ),
//           // The snap overlay with theme provider
//           WindowManagerTheme(
//             data: windowManagerTheme,
//             child: SnapOverlay(
//               windowId: widget.windowId,
//               anchorPosition: Offset(
//                 position.dx + buttonSize.width, // Right edge of button
//                 position.dy + buttonSize.height,
//               ),
//               onClose: _hideSnapMenu,
//             ),
//           ),
//         ],
//       ),
//     );

//     Overlay.of(context).insert(_overlayEntry!);
//   }

//   void _hideSnapMenu() {
//     _hoverTimer?.cancel();
//     _overlayEntry?.remove();
//     _overlayEntry = null;
//   }

//   @override
//   void dispose() {
//     // Ensure overlay is removed first
//     _overlayEntry?.remove();
//     _overlayEntry = null;
//     _hoverTimer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Hide snap menu if window gets maximized
//     if (widget.isMaximized && _overlayEntry != null) {
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         _hideSnapMenu();
//       });
//     }

//     return MouseRegion(
//       onEnter: (_) {
//         setState(() => _isHovered = true);
//         // Only show snap menu if not maximized
//         if (!widget.isMaximized) {
//           // Start timer for delayed menu show
//           _hoverTimer?.cancel();
//           _hoverTimer = Timer(const Duration(milliseconds: 300), () {
//             if (mounted && !widget.isMaximized) {
//               _showSnapMenu();
//             }
//           });
//         }
//       },
//       onExit: (_) {
//         setState(() => _isHovered = false);
//         // Cancel timer if we exit before it triggers
//         _hoverTimer?.cancel();
//       },
//       child: GestureDetector(
//         onSecondaryTap: () {
//           _hoverTimer?.cancel();
//           // Only show snap menu if not maximized
//           if (!widget.isMaximized) {
//             _showSnapMenu();
//           }
//         },
//         child: IconButton(
//           icon: Icon(
//             widget.isMaximized ? Icons.restore : Icons.crop_square,
//             color: _isHovered
//                 ? WindowManagerTheme.of(
//                     context,
//                   ).windows.titleBarButtonHoverColor
//                 : widget.foregroundColor,
//             size: widget.size,
//           ),
//           onPressed: () {
//             // Hide any open snap menu and cancel timer
//             _hideSnapMenu();
//             ref
//                 .read(
//                   floatingWindowIsMaximizedStateProvider(
//                     widget.windowId,
//                   ).notifier,
//                 )
//                 .toggleMaximized();
//           },
//           tooltip: widget.isMaximized
//               ? WindowManagerLocalizationsProvider.current.restoreTooltip
//               : WindowManagerLocalizationsProvider.current.maximizeTooltip,
//         ),
//       ),
//     );
//   }
// }
