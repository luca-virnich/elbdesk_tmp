import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../theme/window_manager_theme.dart';
import '../models/snap_position.dart';
import '../providers/providers.dart';
import 'snap_overlay.dart';

/// A segment within a snap layout that can be clicked to snap a window
class SnapSegment extends ConsumerStatefulWidget {
  const SnapSegment({
    super.key,
    required this.windowId,
    required this.layoutType,
    required this.position,
    required this.index,
    required this.constraints,
    required this.windowManagementTheme,
    required this.screenSize,
    required this.onClose,
  });

  final String windowId;
  final SnapLayoutType layoutType;
  final SnapPosition position;
  final int index;
  final BoxConstraints constraints;
  final dynamic windowManagementTheme;
  final Size screenSize;
  final VoidCallback onClose;

  @override
  ConsumerState<SnapSegment> createState() => _SnapSegmentState();
}

class _SnapSegmentState extends ConsumerState<SnapSegment> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    // Gap between segments
    const gap = 4.0;

    // Calculate position and size based on layout type
    double left = 0;
    double top = 0;
    double width = widget.constraints.maxWidth;
    double height = widget.constraints.maxHeight;

    switch (widget.layoutType) {
      case SnapLayoutType.half:
        // Two equal halves with gap
        width = (widget.constraints.maxWidth - gap) / 2;
        height = widget.constraints.maxHeight;
        left = widget.index == 0 ? 0 : width + gap;
        top = 0;
        break;

      case SnapLayoutType.twoThirdsLeft:
        // 1/3 and 2/3 split
        if (widget.index == 0) {
          width = (widget.constraints.maxWidth - gap) / 3;
          left = 0;
        } else {
          width = ((widget.constraints.maxWidth - gap) / 3) * 2;
          left = (widget.constraints.maxWidth - gap) / 3 + gap;
        }
        height = widget.constraints.maxHeight;
        top = 0;
        break;

      case SnapLayoutType.twoThirdsRight:
        // 2/3 and 1/3 split
        if (widget.index == 0) {
          width = ((widget.constraints.maxWidth - gap) / 3) * 2;
          left = 0;
        } else {
          width = (widget.constraints.maxWidth - gap) / 3;
          left = ((widget.constraints.maxWidth - gap) / 3) * 2 + gap;
        }
        height = widget.constraints.maxHeight;
        top = 0;
        break;

      case SnapLayoutType.quarters:
        // Four equal quarters with gaps
        width = (widget.constraints.maxWidth - gap) / 2;
        height = (widget.constraints.maxHeight - gap) / 2;
        left = (widget.index % 2) == 0 ? 0 : width + gap;
        top = widget.index < 2 ? 0 : height + gap;
        break;
    }

    return Positioned(
      left: left,
      top: top,
      width: width,
      height: height,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: () {
            final theme = WindowManagerTheme.of(context);
            ref
                .read(windowManagerProvider)
                .snapWindow(
                  widget.windowId,
                  widget.position,
                  widget.screenSize,
                  statusBarHeight: theme.statusBar.height,
                  taskbarHeight: theme.taskbar.height,
                );
            widget.onClose();
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            decoration: BoxDecoration(
              color: _isHovered
                  ? widget.windowManagementTheme.snapLayoutSegmentHoverColor
                  : widget.windowManagementTheme.snapLayoutSegmentColor,
              borderRadius: BorderRadius.circular(3),
              border: Border.all(
                color: _isHovered
                    ? widget
                          .windowManagementTheme
                          .snapLayoutSegmentHoverBorderColor
                    : widget.windowManagementTheme.snapLayoutSegmentBorderColor,
                width: 1.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
