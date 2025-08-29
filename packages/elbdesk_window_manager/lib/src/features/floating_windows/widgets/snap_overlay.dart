import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/snap_position.dart';
import '../../../theme/window_manager_theme.dart';
import 'snap_layout.dart';

class SnapOverlay extends ConsumerStatefulWidget {
  const SnapOverlay({
    required this.windowId,
    required this.anchorPosition,
    required this.onClose,
    super.key,
  });

  final String windowId;
  final Offset anchorPosition;
  final VoidCallback onClose;

  @override
  ConsumerState<SnapOverlay> createState() => _SnapOverlayState();
}

class _SnapOverlayState extends ConsumerState<SnapOverlay> {

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    
    // Get the window management theme
    final windowManagementTheme = WindowManagerTheme.of(context).windowManagement;
    
    return Positioned(
      right: MediaQuery.of(context).size.width - widget.anchorPosition.dx,
      top: widget.anchorPosition.dy + 4,
      child: RepaintBoundary(
        child: Material(
          elevation: 8,
          borderRadius: BorderRadius.circular(8),
          shadowColor: windowManagementTheme.snapOverlayShadowColor,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: windowManagementTheme.snapOverlayBackgroundColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: windowManagementTheme.snapOverlayBorderColor,
                width: 1,
              ),
            ),
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // First row - Half and Quarters
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SnapLayout(
                    windowId: widget.windowId,
                    layoutType: SnapLayoutType.half,
                    positions: [SnapPosition.left, SnapPosition.right],
                    screenSize: screenSize,
                    windowManagementTheme: windowManagementTheme,
                    onClose: widget.onClose,
                  ),
                  const SizedBox(width: 12),
                  SnapLayout(
                    windowId: widget.windowId,
                    layoutType: SnapLayoutType.quarters,
                    positions: [
                      SnapPosition.topLeft,
                      SnapPosition.topRight,
                      SnapPosition.bottomLeft,
                      SnapPosition.bottomRight,
                    ],
                    screenSize: screenSize,
                    windowManagementTheme: windowManagementTheme,
                    onClose: widget.onClose,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Second row - Thirds
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SnapLayout(
                    windowId: widget.windowId,
                    layoutType: SnapLayoutType.twoThirdsLeft,
                    positions: [SnapPosition.leftOneThird, SnapPosition.rightTwoThirds],
                    screenSize: screenSize,
                    windowManagementTheme: windowManagementTheme,
                    onClose: widget.onClose,
                  ),
                  const SizedBox(width: 12),
                  SnapLayout(
                    windowId: widget.windowId,
                    layoutType: SnapLayoutType.twoThirdsRight,
                    positions: [SnapPosition.leftTwoThirds, SnapPosition.rightOneThird],
                    screenSize: screenSize,
                    windowManagementTheme: windowManagementTheme,
                    onClose: widget.onClose,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }

}

enum SnapLayoutType {
  half,
  twoThirdsLeft,
  twoThirdsRight,
  quarters,
}