import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../theme/window_manager_theme.dart';
import '../../models/snap_position.dart';
import '../../providers/management/window_manager_provider.dart';

/// macOS-style snap overlay that positions from the left
class MacOSSnapOverlay extends ConsumerStatefulWidget {
  const MacOSSnapOverlay({
    super.key,
    required this.windowId,
    required this.anchorPosition,
    required this.onClose,
  });

  final String windowId;
  final Offset anchorPosition;
  final VoidCallback onClose;

  @override
  ConsumerState<MacOSSnapOverlay> createState() => _MacOSSnapOverlayState();
}

class _MacOSSnapOverlayState extends ConsumerState<MacOSSnapOverlay> {
  SnapPosition? _hoveredPosition;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    // Get the window management theme
    final windowManagementTheme = WindowManagerTheme.of(
      context,
    ).windowManagement;

    return Positioned(
      left: widget.anchorPosition.dx, // Position from left instead of right
      top: widget.anchorPosition.dy + 4,
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
                  _buildSnapLayout(
                    context: context,
                    layoutType: _SnapLayoutType.half,
                    positions: [SnapPosition.left, SnapPosition.right],
                    screenSize: screenSize,
                    windowManagementTheme: windowManagementTheme,
                  ),
                  const SizedBox(width: 12),
                  _buildSnapLayout(
                    context: context,
                    layoutType: _SnapLayoutType.quarters,
                    positions: [
                      SnapPosition.topLeft,
                      SnapPosition.topRight,
                      SnapPosition.bottomLeft,
                      SnapPosition.bottomRight,
                    ],
                    screenSize: screenSize,
                    windowManagementTheme: windowManagementTheme,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Second row - Thirds
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildSnapLayout(
                    context: context,
                    layoutType: _SnapLayoutType.twoThirdsLeft,
                    positions: [
                      SnapPosition.leftOneThird,
                      SnapPosition.rightTwoThirds,
                    ],
                    screenSize: screenSize,
                    windowManagementTheme: windowManagementTheme,
                  ),
                  const SizedBox(width: 12),
                  _buildSnapLayout(
                    context: context,
                    layoutType: _SnapLayoutType.twoThirdsRight,
                    positions: [
                      SnapPosition.leftTwoThirds,
                      SnapPosition.rightOneThird,
                    ],
                    screenSize: screenSize,
                    windowManagementTheme: windowManagementTheme,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSnapLayout({
    required BuildContext context,
    required _SnapLayoutType layoutType,
    required List<SnapPosition> positions,
    required Size screenSize,
    required windowManagementTheme,
  }) {
    return Container(
      width: 110,
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(
          color: windowManagementTheme.snapLayoutBorderColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(6),
        color: windowManagementTheme.snapLayoutBackgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: positions.asMap().entries.map((entry) {
                final index = entry.key;
                final position = entry.value;
                return _buildSegment(
                  context: context,
                  layoutType: layoutType,
                  position: position,
                  index: index,
                  constraints: constraints,
                  windowManagementTheme: windowManagementTheme,
                  screenSize: screenSize,
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSegment({
    required BuildContext context,
    required _SnapLayoutType layoutType,
    required SnapPosition position,
    required int index,
    required BoxConstraints constraints,
    required windowManagementTheme,
    required Size screenSize,
  }) {
    final isHovered = _hoveredPosition == position;

    // Gap between segments
    const gap = 4.0;

    // Calculate position and size based on layout type
    double left = 0;
    double top = 0;
    double width = constraints.maxWidth;
    double height = constraints.maxHeight;

    switch (layoutType) {
      case _SnapLayoutType.half:
        // Two equal halves with gap
        width = (constraints.maxWidth - gap) / 2;
        height = constraints.maxHeight;
        left = index == 0 ? 0 : width + gap;
        top = 0;
        break;

      case _SnapLayoutType.twoThirdsLeft:
        // 1/3 and 2/3 split
        if (index == 0) {
          width = (constraints.maxWidth - gap) / 3;
          left = 0;
        } else {
          width = ((constraints.maxWidth - gap) / 3) * 2;
          left = (constraints.maxWidth - gap) / 3 + gap;
        }
        height = constraints.maxHeight;
        top = 0;
        break;

      case _SnapLayoutType.twoThirdsRight:
        // 2/3 and 1/3 split
        if (index == 0) {
          width = ((constraints.maxWidth - gap) / 3) * 2;
          left = 0;
        } else {
          width = (constraints.maxWidth - gap) / 3;
          left = ((constraints.maxWidth - gap) / 3) * 2 + gap;
        }
        height = constraints.maxHeight;
        top = 0;
        break;

      case _SnapLayoutType.quarters:
        // Four equal quarters with gaps
        width = (constraints.maxWidth - gap) / 2;
        height = (constraints.maxHeight - gap) / 2;
        left = (index % 2) == 0 ? 0 : width + gap;
        top = index < 2 ? 0 : height + gap;
        break;
    }

    return Positioned(
      left: left,
      top: top,
      width: width,
      height: height,
      child: MouseRegion(
        onEnter: (_) => setState(() => _hoveredPosition = position),
        onExit: (_) => setState(() => _hoveredPosition = null),
        child: GestureDetector(
          onTap: () {
            final theme = WindowManagerTheme.of(context);
            ref
                .read(windowManagerProvider)
                .snapWindow(
                  widget.windowId,
                  position,
                  screenSize,
                  statusBarHeight: theme.statusBar.height,
                  taskbarHeight: theme.taskbar.height,
                );
            widget.onClose();
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            decoration: BoxDecoration(
              color: isHovered
                  ? windowManagementTheme.snapLayoutSegmentHoverColor
                  : windowManagementTheme.snapLayoutSegmentColor,
              borderRadius: BorderRadius.circular(3),
              border: Border.all(
                color: isHovered
                    ? windowManagementTheme.snapLayoutSegmentHoverBorderColor
                    : windowManagementTheme.snapLayoutSegmentBorderColor,
                width: 1.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum _SnapLayoutType {
  half,
  twoThirdsLeft,
  twoThirdsRight,
  quarters,
}
