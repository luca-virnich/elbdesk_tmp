import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/constants/window_manager_constants.dart';
import '../../../theme/window_manager_theme.dart';
import '../models/snap_position.dart';

class EdgeSnapPreviewWidget extends ConsumerWidget {
  const EdgeSnapPreviewWidget({
    required this.position,
    required this.screenSize,
    super.key,
  });

  final SnapPosition position;
  final Size screenSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the window management theme
    final windowManagementTheme = WindowManagerTheme.of(
      context,
    ).windowManagement;

    // Calculate preview dimensions based on snap position
    final taskbarHeight = WindowManagerConstants.desktopTaskbarHeight;
    final statusBarHeight = WindowManagerTheme.of(context).statusBar.height;
    final totalBottomHeight = taskbarHeight + statusBarHeight;
    final availableHeight = screenSize.height - totalBottomHeight;

    double left = 0;
    double top = 0;  // Always start from top
    double width = screenSize.width;
    double height = availableHeight;

    switch (position) {
      case SnapPosition.left:
        width = screenSize.width / 2;
        break;
      case SnapPosition.right:
        left = screenSize.width / 2;
        width = screenSize.width / 2;
        break;
      case SnapPosition.topLeft:
        width = screenSize.width / 2;
        height = availableHeight / 2;
        break;
      case SnapPosition.topRight:
        left = screenSize.width / 2;
        width = screenSize.width / 2;
        height = availableHeight / 2;
        break;
      case SnapPosition.bottomLeft:
        top = availableHeight / 2;
        width = screenSize.width / 2;
        height = availableHeight / 2;
        break;
      case SnapPosition.bottomRight:
        left = screenSize.width / 2;
        top = availableHeight / 2;
        width = screenSize.width / 2;
        height = availableHeight / 2;
        break;
      default:
        // For other snap positions, use default values
        break;
    }

    return Positioned(
      left: left,
      top: top,
      width: width,
      height: height,
      child: IgnorePointer(
        child: RepaintBoundary(
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: 1.0, // Container opacity is 1, color has its own opacity
            child: Container(
              decoration: BoxDecoration(
                color: windowManagementTheme.snapPreviewColor.withValues(
                  alpha: windowManagementTheme.snapPreviewOpacity,
                ),
                borderRadius: BorderRadius.circular(
                  windowManagementTheme.snapOverlayBorderRadius,
                ),
                border: Border.all(
                  color: windowManagementTheme.snapPreviewBorderColor,
                  width: windowManagementTheme.snapPreviewBorderWidth,
                ),
                boxShadow: [
                  // Inner glow
                  BoxShadow(
                    color: windowManagementTheme.snapPreviewBorderColor.withValues(
                      alpha: 0.5,
                    ),
                    blurRadius: 16,
                    spreadRadius: 2,
                  ),
                  // Outer glow
                  BoxShadow(
                    color: windowManagementTheme.snapPreviewBorderColor.withValues(
                      alpha: 0.3,
                    ),
                    blurRadius: 24,
                    spreadRadius: 4,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
