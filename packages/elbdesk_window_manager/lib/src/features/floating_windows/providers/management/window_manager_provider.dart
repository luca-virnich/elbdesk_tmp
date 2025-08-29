import 'package:elbdesk_window_manager/src/features/floating_windows/models/floating_window_title_data.dart';
import 'package:elbdesk_window_manager/src/features/floating_windows/providers/state/floating_window_title_state.dart';
import 'package:elbdesk_window_manager/src/features/floating_windows/providers/ui_state/window_highlight_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../initialization.dart';
import '../../../taskbar/providers/taskbar_window_order_provider.dart';
import '../../models/floating_window_data.dart';
import '../../models/snap_position.dart';
import '../state/floating_window_is_maximized_state.dart';
import '../state/floating_window_is_minimized_state.dart';
import '../state/topmost_window_positions_provider.dart';
import '../state/window_position_provider.dart';
import '../ui_state/background_window_overlay_color_provider.dart';
import '../ui_state/minimize_requests_provider.dart';
import '../ui_state/show_titlebar_base_title_provider.dart';
import '../ui_state/snapshot_request_provider.dart';
import '../ui_state/taskbar_tile_positions_provider.dart';
import 'open_windows_provider.dart';
import 'window_focus_provider.dart';
import 'window_z_order_provider.dart';
import 'windows_list_provider.dart';

part 'window_manager_provider.g.dart';

/// Optimized window manager that consolidates all window management operations
@Riverpod(keepAlive: true)
WindowManager windowManager(Ref ref) {
  return WindowManager(ref);
}

class WindowManager {
  WindowManager(this.ref);
  final Ref ref;
  void openWindow(FloatingWindowData window) {
    // Check for duplicate
    final duplicateCheck = WindowDuplicateCheckRegistry.get(window.runtimeType);

    if (duplicateCheck != null) {
      final existingWindows = ref.read(openWindowsProvider);

      for (final existingWindow in existingWindows.values) {
        if (existingWindow.runtimeType != window.runtimeType) continue;

        if (duplicateCheck(existingWindow, window)) {
          // Duplicate found - restore and bring to front
          final windowId = existingWindow.floatingWindowId;
          restoreWindow(windowId);
          bringToFront(windowId);
          return;
        }
      }
    }

    // No duplicate found, open the window
    ref.read(openWindowsProvider.notifier).openWindow(window);
    ref.read(windowZOrderProvider.notifier).addWindow(window.floatingWindowId);
    ref
        .read(taskbarWindowOrderProvider.notifier)
        .addWindow(window.floatingWindowId);
  }

  /// Close a window and clean up all associated resources
  void removeWindow(String windowId) {
    // Get window type before removing
    final windows = ref.read(openWindowsProvider);
    final windowData = windows[windowId];
    final windowType = windowData?.runtimeType.toString();

    // Check if this window currently has focus
    final hadFocus = ref
        .read(windowFocusManagerProvider.notifier)
        .hasFocus(windowId);

    // Remove the window
    ref.read(openWindowsProvider.notifier).closeWindow(windowId);
    ref.read(windowZOrderProvider.notifier).removeWindow(windowId);
    ref.read(windowFocusManagerProvider.notifier).removeFocusNode(windowId);
    ref.read(taskbarWindowOrderProvider.notifier).removeWindow(windowId);
    // Window size provider will auto-dispose when no longer watched

    // Check if there are any remaining windows of the same type
    if (windowType != null) {
      final remainingWindows = ref.read(openWindowsProvider);
      final hasWindowsOfSameType = remainingWindows.values.any(
        (w) => w.runtimeType.toString() == windowType,
      );

      // Clear topmost position if no windows of this type remain
      if (!hasWindowsOfSameType) {
        ref
            .read(topmostWindowPositionsProvider.notifier)
            .removeWindowType(windowType);
      }
    }

    // If the closed window had focus, focus the next top window
    if (hadFocus) {
      final newTopWindowId = topWindowId;
      if (newTopWindowId != null && !isMinimized(newTopWindowId)) {
        ref
            .read(windowFocusManagerProvider.notifier)
            .requestFocus(newTopWindowId);
      }
    }
  }

  /// Bring window to front and request focus
  void bringToFront(String windowId) {
    restoreWindow(windowId);
    ref.read(windowZOrderProvider.notifier).bringToFront(windowId);
    ref.read(windowFocusManagerProvider.notifier).requestFocus(windowId);
  }

  /// Minimize a window
  void minimizeWindow(String windowId, {bool animate = true}) {
    // Check if this window is currently the top window
    final isTopWindow = topWindowId == windowId;

    if (animate) {
      // Request minimize through the minimize requests provider
      // This will trigger the animation in the floating window
      ref.read(minimizeRequestsProvider(windowId).notifier).requestMinimize();
    } else {
      // Immediately minimize without animation
      ref
          .read(floatingWindowIsMinimizedStateProvider(windowId).notifier)
          .minimize();
    }

    // If this was the top window, focus the next window in z-order
    if (isTopWindow) {
      // Get all windows in z-order
      final windows = ref.read(windowsListProvider);

      // Find the next non-minimized window
      for (final window in windows.reversed) {
        if (window.floatingWindowId != windowId &&
            !isMinimized(window.floatingWindowId)) {
          // Bring this window to front
          bringToFront(window.floatingWindowId);
          break;
        }
      }
    }
  }

  /// Minimize all windows with snapshot capture
  Future<void> minimizeAllWindows() async {
    final windows = ref.read(openWindowsProvider);
    final minimizedWindows = ref.read(allFloatingWindowsMinimizedStateProvider);

    // Get list of windows to minimize
    final windowsToMinimize = windows.entries
        .where((entry) => !minimizedWindows.contains(entry.key))
        .toList();

    if (windowsToMinimize.isEmpty) return;

    // First, request snapshots for all non-minimized windows
    for (final entry in windowsToMinimize) {
      ref.read(snapshotRequestProvider(entry.key).notifier).requestSnapshot();
    }

    // Wait longer for snapshots to be captured
    await Future.delayed(const Duration(milliseconds: 200));

    // Then minimize all windows
    for (final entry in windowsToMinimize) {
      ref
          .read(floatingWindowIsMinimizedStateProvider(entry.key).notifier)
          .minimize();
    }
  }

  void startHighlight(String windowId) {
    ref.read(windowHighlightProvider.notifier).startHighlight(windowId);
  }

  void stopHighlight(String windowId) {
    ref.read(windowHighlightProvider.notifier).stopHighlight(windowId);
  }

  /// Restore a minimized window
  void restoreWindow(String windowId, {bool animate = true}) {
    if (animate) {
      // We'll handle restore animation directly here since we need window bounds
      final windowData = ref.read(openWindowsProvider)[windowId];
      if (windowData != null) {
        final position = ref.read(windowPositionNotifierProvider(windowId));
        if (position == null) {
          // No position, restore without animation
          ref
              .read(floatingWindowIsMinimizedStateProvider(windowId).notifier)
              .maximize();
          return;
        }

        // Get taskbar tile bounds
        final tileBounds = ref
            .read(taskbarTilePositionProvider(windowId).notifier)
            .getTileBounds();

        if (tileBounds != null) {
          // First restore the window state
          ref
              .read(floatingWindowIsMinimizedStateProvider(windowId).notifier)
              .maximize();

          // Then trigger the restore animation
          // Note: We need to pass a TickerProvider, which will be done in the UI
          // For now, just restore without animation
        } else {
          // No tile bounds, restore without animation
          ref
              .read(floatingWindowIsMinimizedStateProvider(windowId).notifier)
              .maximize();
        }
      }
    } else {
      // Immediately restore without animation
      ref
          .read(floatingWindowIsMinimizedStateProvider(windowId).notifier)
          .maximize();
    }
  }

  /// Toggle maximize state
  void toggleMaximize(String windowId) {
    ref
        .read(floatingWindowIsMaximizedStateProvider(windowId).notifier)
        .toggleMaximized();
  }

  /// Set maximize state
  void setMaximized(String windowId, bool maximized) {
    ref
        .read(floatingWindowIsMaximizedStateProvider(windowId).notifier)
        .setMaximized(maximized);
  }

  /// Snap window to a position
  void snapWindow(
    String windowId,
    SnapPosition position,
    Size screenSize, {
    double statusBarHeight = 0,
    double taskbarHeight = 48,
  }) {
    final windowData = ref.read(openWindowsProvider)[windowId];
    if (windowData == null) return;

    final minWidth = windowData.minSize.width;
    final minHeight = windowData.minSize.height;

    // Calculate position and size based on snap position
    // Subtract both status bar and taskbar height for available window area
    final availableHeight = screenSize.height - statusBarHeight - taskbarHeight;

    final (newPosition, newSize) = _calculateSnapPosition(
      position,
      screenSize,
      availableHeight,
      statusBarHeight,
    );

    // Ensure the new size respects minimum constraints
    final constrainedSize = Size(
      newSize.width.clamp(minWidth, double.infinity),
      newSize.height.clamp(minHeight, double.infinity),
    );

    // Adjust position if the constrained width exceeds the intended snap width
    Offset adjustedPosition = newPosition;
    if (constrainedSize.width > newSize.width) {
      // Window is wider than the snap area
      switch (position) {
        case SnapPosition.right:
        case SnapPosition.topRight:
        case SnapPosition.bottomRight:
          // For right-side snaps, align to the right edge
          adjustedPosition = Offset(
            screenSize.width - constrainedSize.width,
            newPosition.dy,
          );
          break;
        case SnapPosition.rightOneThird:
          // For right one-third snap, align to the right edge
          adjustedPosition = Offset(
            screenSize.width - constrainedSize.width,
            newPosition.dy,
          );
          break;
        case SnapPosition.rightTwoThirds:
          // For right two-thirds snap, check if it should align right
          final intendedRightEdge = newPosition.dx + newSize.width;
          if (intendedRightEdge >= screenSize.width - 10) {
            // This was intended to reach the right edge, so align there
            adjustedPosition = Offset(
              screenSize.width - constrainedSize.width,
              newPosition.dy,
            );
          }
          break;
        default:
          // For left-side and other snaps, keep the original position
          break;
      }
    }

    // Update window state
    ref
        .read(windowPositionNotifierProvider(windowId).notifier)
        .updatePosition(adjustedPosition, constrainedSize);

    // Ensure window is not minimized or maximized
    restoreWindow(windowId);
    setMaximized(windowId, false);
  }

  /// Calculate snap position and size
  (Offset, Size) _calculateSnapPosition(
    SnapPosition position,
    Size screenSize,
    double availableHeight,
    double statusBarHeight,
  ) {
    return switch (position) {
      SnapPosition.left => (
        Offset.zero,
        Size(screenSize.width / 2, availableHeight),
      ),
      SnapPosition.right => (
        Offset(screenSize.width / 2, 0),
        Size(screenSize.width / 2, availableHeight),
      ),
      SnapPosition.leftTwoThirds => (
        Offset.zero,
        Size(screenSize.width * 2 / 3, availableHeight),
      ),
      SnapPosition.rightOneThird => (
        Offset(screenSize.width * 2 / 3, 0),
        Size(screenSize.width / 3, availableHeight),
      ),
      SnapPosition.leftOneThird => (
        Offset.zero,
        Size(screenSize.width / 3, availableHeight),
      ),
      SnapPosition.rightTwoThirds => (
        Offset(screenSize.width / 3, 0),
        Size(screenSize.width * 2 / 3, availableHeight),
      ),
      SnapPosition.topLeft => (
        Offset.zero,
        Size(screenSize.width / 2, availableHeight / 2),
      ),
      SnapPosition.topRight => (
        Offset(screenSize.width / 2, 0),
        Size(screenSize.width / 2, availableHeight / 2),
      ),
      SnapPosition.bottomLeft => (
        Offset(0, availableHeight / 2),
        Size(screenSize.width / 2, availableHeight / 2),
      ),
      SnapPosition.bottomRight => (
        Offset(screenSize.width / 2, availableHeight / 2),
        Size(screenSize.width / 2, availableHeight / 2),
      ),
    };
  }

  /// Close all windows
  void closeAllWindows() {
    // Create a copy to avoid modification during iteration
    final windowIds = ref.read(openWindowsProvider).keys.toList();
    for (final windowId in windowIds) {
      removeWindow(windowId);
    }
  }

  void updateWindowTitle(String windowId, String title) {
    ref
        .read(floatingWindowTitleStateProvider(windowId).notifier)
        .updateTitle(title);
  }

  void updateWindowIcon(String windowId, IconData icon) {
    ref
        .read(floatingWindowTitleStateProvider(windowId).notifier)
        .updateIcon(icon);
  }

  void updateWindowBaseTitle(String windowId, String baseTitle) {
    ref
        .read(floatingWindowTitleStateProvider(windowId).notifier)
        .updateBaseTitle(baseTitle);
  }

  void updateWindowTitleData(String windowId, FloatingWindowTitlebarData data) {
    ref
        .read(floatingWindowTitleStateProvider(windowId).notifier)
        .updateData(data);
  }

  /// Check if a window exists
  bool hasWindow(String windowId) {
    return ref.read(openWindowsProvider).containsKey(windowId);
  }

  bool isInFront(String windowId) {
    final zOrder = ref.read(windowZOrderProvider);
    return zOrder.isNotEmpty && zOrder.last == windowId;
  }

  bool isMinimized(String windowId) {
    return ref.read(floatingWindowIsMinimizedStateProvider(windowId));
  }

  /// Get the current top window ID
  String? get topWindowId =>
      ref.read(windowZOrderProvider.notifier).topWindowId;

  /// Get ordered list of windows
  List<FloatingWindowData> get windowsList {
    final windows = ref.read(openWindowsProvider);
    final zOrder = ref.read(windowZOrderProvider);

    return zOrder
        .where((id) => windows.containsKey(id))
        .map((id) => windows[id]!)
        .toList();
  }

  /// Set whether to show base titles in title bars and taskbar
  void setShowTitlebarBaseTitle(bool show) {
    ref.read(showTitlebarBaseTitleProvider.notifier).update(show);
  }

  /// Set the overlay color for background windows
  void setBackgroundWindowOverlayColor(Color? color) {
    ref.read(backgroundWindowOverlayColorProvider.notifier).update(color);
  }
}
