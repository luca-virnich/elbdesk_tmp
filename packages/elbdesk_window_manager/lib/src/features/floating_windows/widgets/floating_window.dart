import 'dart:async';
import 'dart:ui' as ui;

import 'package:elbdesk_window_manager/src/features/floating_windows/providers/state/dragging_mouse_cursor_state.dart';
import 'package:elbdesk_window_manager/src/features/floating_windows/providers/state/floating_window_title_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/constants/window_manager_constants.dart';
import '../../../theme/window_manager_theme.dart';
import '../../mobile/mobile_state.dart';
import '../constants/animation_constants.dart';
import '../models/snap_position.dart';
import '../providers/management/window_manager_provider.dart';
import '../providers/management/window_z_order_provider.dart';
import '../providers/state/floating_window_is_maximized_state.dart';
import '../providers/state/floating_window_is_minimized_state.dart';
import '../providers/state/minimized_window_positions_provider.dart';
import '../providers/state/safe_area_padding_provider.dart';
import '../providers/state/topmost_window_positions_provider.dart';
import '../providers/state/window_position_provider.dart';
import '../providers/state/window_size_provider.dart';
import '../providers/ui_state/background_window_overlay_color_provider.dart';
import '../providers/ui_state/dragging_window_id_provider.dart';
import '../providers/ui_state/edge_snap_preview_provider.dart';
import '../providers/ui_state/minimize_animation_provider.dart';
import '../providers/ui_state/minimize_requests_provider.dart';
import '../providers/ui_state/snapshot_request_provider.dart';
import '../providers/ui_state/taskbar_tile_positions_provider.dart';
import '../providers/ui_state/window_snapshot_provider.dart';
import '../services/window_size_preferences.dart';

/// The one and only floating window implementation
/// Manages its own position and size for optimal performance
class FloatingWindow extends ConsumerStatefulWidget {
  const FloatingWindow({
    super.key,
    required this.windowId,
    required this.child,
    this.windowType,
    this.initialX,
    this.initialY,
    this.initialWidth,
    this.initialHeight,
    required this.minWidth,
    required this.minHeight,
  });

  /// The unique identifier for this window
  final String windowId;

  /// The window type (e.g., ContactWindowData) for saving preferences
  final String? windowType;

  /// The window content (including title bar if needed)
  final Widget child;

  /// Initial position and size
  final double? initialX;
  final double? initialY;
  final double? initialWidth;
  final double? initialHeight;

  /// Minimum size constraints
  final double minWidth;
  final double minHeight;

  @override
  ConsumerState<FloatingWindow> createState() => _FloatingWindowState();
}

class _FloatingWindowState extends ConsumerState<FloatingWindow>
    with TickerProviderStateMixin {
  // Position and size as separate variables for performance
  late double _x;
  late double _y;
  late double _width;
  late double _height;

  // Animation controller for maximize/restore
  late AnimationController _animationController;
  late Animation<double> _animation;

  // Animation controller for minimize/restore
  late AnimationController _minimizeAnimationController;
  late Animation<double> _minimizeAnimation;

  // Drag state
  bool _isDragging = false;
  double _dragStartX = 0;
  double _dragStartY = 0;
  double _windowStartX = 0;
  double _windowStartY = 0;

  // Resize state
  bool _isResizing = false;
  String _resizeHandle = '';
  double _resizeStartX = 0;
  double _resizeStartY = 0;
  double _resizeStartWidth = 0;
  double _resizeStartHeight = 0;

  // Store pre-maximize state
  double _preMaximizeX = 0;
  double _preMaximizeY = 0;
  double _preMaximizeWidth = 0;
  double _preMaximizeHeight = 0;

  // Store pre-mobile state
  double _preMobileX = 0;
  double _preMobileY = 0;
  double _preMobileWidth = 0;
  double _preMobileHeight = 0;
  bool _wasMaximizedBeforeMobile = false;
  bool? _previousMobileState;

  // Store animation listener reference
  VoidCallback? _updateAnimation;

  // Cancellation token for async operations
  bool _isDisposed = false;

  // Key for capturing window content
  final GlobalKey _windowContentKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    // Initialize position and size
    _x = widget.initialX ?? 100;
    _y = widget.initialY ?? 100;
    _width = widget.initialWidth ?? 800;
    _height = widget.initialHeight ?? 600;

    // Report initial size to provider
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(windowSizeProvider(widget.windowId).notifier)
          .updateSize(Size(_width, _height));
    });

    // Initialize animation controller
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutCubic,
    );

    // Initialize minimize animation controller
    _minimizeAnimationController = AnimationController(
      duration: AnimationConstants.windowFadeAnimationDuration,
      vsync: this,
      value: 1.0, // Start fully visible
    );
    _minimizeAnimation = CurvedAnimation(
      parent: _minimizeAnimationController,
      curve: Curves.easeInOut,
    );

    // Ensure window is visible on screen after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _ensureVisible();
    });
  }

  @override
  void dispose() {
    _isDisposed = true;

    // Remove any animation listener
    if (_updateAnimation != null) {
      _animation.removeListener(_updateAnimation!);
      _updateAnimation = null;
    }

    _animationController.dispose();
    _minimizeAnimationController.dispose();
    super.dispose();
  }

  void _ensureVisible() {
    final size = MediaQuery.of(context).size;

    // Apply the same constraints as in drag
    double newX = _x;
    double newY = _y;

    // Prevent moving above the top
    newY = newY.clamp(0, double.infinity);

    // Prevent moving completely below the bottom (keep 100px visible)
    final maxY = size.height - 100;
    newY = newY.clamp(double.negativeInfinity, maxY);

    // Allow horizontal movement beyond screen edges (but clamp to reasonable limits)
    newX = newX.clamp(-_width + 100, size.width - 100);

    if (newX != _x || newY != _y) {
      setState(() {
        _x = newX;
        _y = newY;
      });
    }
  }

  /// Capture window content as an image for animation
  Future<bool> _captureWindowSnapshot() async {
    try {
      final RenderRepaintBoundary? boundary =
          _windowContentKey.currentContext?.findRenderObject()
              as RenderRepaintBoundary?;

      if (boundary != null && boundary.debugNeedsPaint == false) {
        final ui.Image image = await boundary.toImage(pixelRatio: 1.0);

        // Verify image is valid
        if (image.width > 0 && image.height > 0) {
          final size = Size(_width, _height);

          // Send the snapshot to the overlay
          ref
              .read(windowSnapshotProvider(widget.windowId).notifier)
              .captureSnapshot(image, size);
          return true;
        } else {
          image.dispose();
        }
      }
    } catch (e) {
      // If capture fails, the animation will use a placeholder
    }
    return false;
  }

  /// Handle window restore when animation is detected
  void _handleRestoreWithAnimation() {
    // Keep window hidden while animation plays
    _minimizeAnimationController.value = 0.0;

    // Get the animation to listen to it directly
    final animations = ref.read(minimizeAnimationsProvider);
    final animation = animations[widget.windowId];

    if (animation != null && animation.animationController != null) {
      final controller = animation.animationController!;

      // Listen to animation progress
      void onProgress() {
        if (!_isDisposed && mounted) {
          final progress = controller.value;

          // Start fading in the window when animation is 80% complete
          if (progress >= 0.8) {
            // Calculate fade value based on remaining animation progress
            // When animation is at 0.8, fade starts at 0
            // When animation is at 1.0, fade should be at 1
            final fadeProgress = (progress - 0.8) * 5.0; // Maps 0.8-1.0 to 0-1
            _minimizeAnimationController.value = fadeProgress.clamp(0.0, 1.0);
          }
        }
      }

      // Listen to animation
      controller.addListener(onProgress);

      // Also listen for completion to clean up
      controller.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.removeListener(onProgress);

          // Ensure window is fully visible
          if (mounted) {
            _minimizeAnimationController.value = 1.0;
          }

          // Clean up snapshot after a short delay
          Future.delayed(const Duration(milliseconds: 150), () {
            if (!_isDisposed && mounted) {
              ref
                  .read(windowSnapshotProvider(widget.windowId).notifier)
                  .clearSnapshot();
            }
          });
        }
      });
    } else {
      // No animation found, show immediately
      _minimizeAnimationController.value = 1.0;
    }
  }

  void _startDrag(DragStartDetails details) {
    // Check if window is maximized
    final isMaximized = ref.read(
      floatingWindowIsMaximizedStateProvider(widget.windowId),
    );

    // If maximized, unmaximize and adjust position to follow cursor
    if (isMaximized) {
      ref
          .read(
            floatingWindowIsMaximizedStateProvider(widget.windowId).notifier,
          )
          .setMaximized(false);

      // Calculate position to center window under cursor
      final cursorX = details.globalPosition.dx;
      final cursorY = details.globalPosition.dy;

      // Use pre-maximize dimensions or defaults
      final double windowWidth = _preMaximizeWidth > 0
          ? _preMaximizeWidth
          : 800;
      final double windowHeight = _preMaximizeHeight > 0
          ? _preMaximizeHeight
          : 600;

      // Center window under cursor
      setState(() {
        _x = (cursorX - windowWidth / 2).toDouble();
        _y = (cursorY - 20).toDouble(); // Small offset from top
        _width = windowWidth;
        _height = windowHeight;
        _isDragging = true;
        _dragStartX = cursorX;
        _dragStartY = cursorY;
        _windowStartX = _x;
        _windowStartY = _y;
      });
    } else {
      // Normal drag start
      setState(() {
        _isDragging = true;
        _dragStartX = details.globalPosition.dx;
        _dragStartY = details.globalPosition.dy;
        _windowStartX = _x;
        _windowStartY = _y;
      });
    }

    // Bring window to front when starting to drag
    ref.read(windowManagerProvider).bringToFront(widget.windowId);

    // Set this window as the one being dragged
    ref.read(draggingWindowIdProvider.notifier).update(widget.windowId);
  }

  void _updateDrag(DragUpdateDetails details) {
    if (!_isDragging) return;

    // Check if mouse is still within the app bounds
    final screenSize = MediaQuery.of(context).size;
    final globalPos = details.globalPosition;

    // Only update position if mouse is within the app window
    if (globalPos.dx >= 0 &&
        globalPos.dy >= 0 &&
        globalPos.dx <= screenSize.width &&
        globalPos.dy <= screenSize.height) {
      // Calculate new position
      double newX = _windowStartX + (details.globalPosition.dx - _dragStartX);
      double newY = _windowStartY + (details.globalPosition.dy - _dragStartY);

      // Apply constraints
      // Prevent moving above the top
      newY = newY.clamp(0, double.infinity);

      // Prevent moving completely below the bottom (keep 100px visible)
      final maxY = screenSize.height - 100;
      newY = newY.clamp(double.negativeInfinity, maxY);

      // Allow horizontal movement beyond screen edges (but clamp to reasonable limits)
      newX = newX.clamp(-_width + 100, screenSize.width - 100);

      setState(() {
        _x = newX;
        _y = newY;
      });

      // Check for edge snap
      _checkEdgeSnap(globalPos, screenSize);
    }
    // If mouse is outside, we don't update position but keep _isDragging true
    // so dragging can resume when mouse re-enters
  }

  void _checkEdgeSnap(Offset mousePos, Size screenSize) {
    const edgeThreshold = 20.0; // Distance from edge to trigger snap preview
    const cornerThreshold =
        100.0; // Distance from corner to trigger corner snap

    SnapPosition? snapPosition;

    final nearLeft = mousePos.dx < edgeThreshold;
    final nearRight = mousePos.dx > screenSize.width - edgeThreshold;
    final nearTop = mousePos.dy < edgeThreshold;
    final nearBottom = mousePos.dy > screenSize.height - edgeThreshold;

    // Check corners first (they take priority)
    if (nearLeft && nearTop) {
      snapPosition = SnapPosition.topLeft;
    } else if (nearRight && nearTop) {
      snapPosition = SnapPosition.topRight;
    } else if (nearLeft && nearBottom) {
      snapPosition = SnapPosition.bottomLeft;
    } else if (nearRight && nearBottom) {
      snapPosition = SnapPosition.bottomRight;
    }
    // Check if we're in corner zones even if not at the very edge
    else if (mousePos.dx < cornerThreshold && mousePos.dy < cornerThreshold) {
      snapPosition = SnapPosition.topLeft;
    } else if (mousePos.dx > screenSize.width - cornerThreshold &&
        mousePos.dy < cornerThreshold) {
      snapPosition = SnapPosition.topRight;
    } else if (mousePos.dx < cornerThreshold &&
        mousePos.dy > screenSize.height - cornerThreshold) {
      snapPosition = SnapPosition.bottomLeft;
    } else if (mousePos.dx > screenSize.width - cornerThreshold &&
        mousePos.dy > screenSize.height - cornerThreshold) {
      snapPosition = SnapPosition.bottomRight;
    }
    // Then check edges
    else if (nearLeft) {
      snapPosition = SnapPosition.left;
    } else if (nearRight) {
      snapPosition = SnapPosition.right;
    } else if (nearTop) {
      // Top edge could trigger maximize instead of snap
      // For now, we'll leave it null
      snapPosition = null;
    }

    // Update the snap preview
    ref.read(edgeSnapPreviewProvider.notifier).update(snapPosition);
  }

  void _endDrag(DragEndDetails details) {
    // Check if we should snap
    final snapPosition = ref.read(edgeSnapPreviewProvider);
    if (snapPosition != null) {
      // Perform the snap
      final screenSize = MediaQuery.of(context).size;
      final theme = WindowManagerTheme.of(context);
      ref
          .read(windowManagerProvider)
          .snapWindow(
            widget.windowId,
            snapPosition,
            screenSize,
            statusBarHeight: theme.statusBar.height,
            taskbarHeight: theme.taskbar.height,
          );
    }

    // Clear the dragging window ID and snap preview
    ref.read(draggingWindowIdProvider.notifier).update(null);
    ref.read(edgeSnapPreviewProvider.notifier).update(null);

    setState(() {
      _isDragging = false;
    });

    // Save the new position if window type is specified
    if (widget.windowType != null) {
      WindowPreferences.saveWindowConfig(
        widget.windowType!,
        position: Offset(_x, _y),
      );
      // Update topmost position for this window type
      ref
          .read(topmostWindowPositionsProvider.notifier)
          .updatePosition(widget.windowType!, Offset(_x, _y));
    }
  }

  void _startResize(
    String handle,
    DragStartDetails details,
    MouseCursor cursor,
  ) {
    // Don't allow resizing when maximized
    final isMaximized = ref.read(
      floatingWindowIsMaximizedStateProvider(widget.windowId),
    );
    if (isMaximized) return;

    // Bring window to front when starting to resize
    ref.read(windowManagerProvider).bringToFront(widget.windowId);

    ref.read(draggingMouseCursorStateProvider.notifier).update(cursor);

    setState(() {
      _isResizing = true;
      _resizeHandle = handle;
      _resizeStartX = details.globalPosition.dx;
      _resizeStartY = details.globalPosition.dy;
      _resizeStartWidth = _width;
      _resizeStartHeight = _height;
      _windowStartX = _x;
      _windowStartY = _y;
    });
  }

  void _updateResize(DragUpdateDetails details) {
    if (!_isResizing) return;

    // Check if mouse is still within the app bounds
    final screenSize = MediaQuery.sizeOf(context);
    final globalPos = details.globalPosition;

    // Only update size if mouse is within the app window
    if (globalPos.dx < 0 ||
        globalPos.dy < 0 ||
        globalPos.dx > screenSize.width ||
        globalPos.dy > screenSize.height) {
      // Mouse is outside, don't update but keep resizing active
      return;
    }

    final dx = details.globalPosition.dx - _resizeStartX;
    final dy = details.globalPosition.dy - _resizeStartY;

    setState(() {
      switch (_resizeHandle) {
        case 'right':
          _width = (_resizeStartWidth + dx).clamp(
            widget.minWidth,
            double.infinity,
          );
          break;
        case 'bottom':
          _height = (_resizeStartHeight + dy).clamp(
            widget.minHeight,
            double.infinity,
          );
          break;
        case 'bottom-right':
          _width = (_resizeStartWidth + dx).clamp(
            widget.minWidth,
            double.infinity,
          );
          _height = (_resizeStartHeight + dy).clamp(
            widget.minHeight,
            double.infinity,
          );
          break;
        case 'left':
          final newWidth = (_resizeStartWidth - dx).clamp(
            widget.minWidth,
            double.infinity,
          );
          _x = _windowStartX + (_resizeStartWidth - newWidth);
          _width = newWidth;
          break;
        case 'top':
          final newHeight = (_resizeStartHeight - dy).clamp(
            widget.minHeight,
            double.infinity,
          );
          _y = _windowStartY + (_resizeStartHeight - newHeight);
          _height = newHeight;
          break;
        case 'top-left':
          final newWidth = (_resizeStartWidth - dx).clamp(
            widget.minWidth,
            double.infinity,
          );
          final newHeight = (_resizeStartHeight - dy).clamp(
            widget.minHeight,
            double.infinity,
          );
          _x = _windowStartX + (_resizeStartWidth - newWidth);
          _y = _windowStartY + (_resizeStartHeight - newHeight);
          _width = newWidth;
          _height = newHeight;
          break;
        case 'top-right':
          final newHeight = (_resizeStartHeight - dy).clamp(
            widget.minHeight,
            double.infinity,
          );
          _y = _windowStartY + (_resizeStartHeight - newHeight);
          _width = (_resizeStartWidth + dx).clamp(
            widget.minWidth,
            double.infinity,
          );
          _height = newHeight;
          break;
        case 'bottom-left':
          final newWidth = (_resizeStartWidth - dx).clamp(
            widget.minWidth,
            double.infinity,
          );
          _x = _windowStartX + (_resizeStartWidth - newWidth);
          _width = newWidth;
          _height = (_resizeStartHeight + dy).clamp(
            widget.minHeight,
            double.infinity,
          );
          break;
      }
    });
  }

  void _endResize(DragEndDetails details) {
    ref.read(draggingMouseCursorStateProvider.notifier).reset();

    setState(() {
      _isResizing = false;
      _resizeHandle = '';
    });

    // Report new size to provider
    ref
        .read(windowSizeProvider(widget.windowId).notifier)
        .updateSize(
          Size(_width, _height),
        );

    // Save the new size and position if window type is specified
    if (widget.windowType != null) {
      WindowPreferences.saveWindowConfig(
        widget.windowType!,
        size: Size(_width, _height),
        position: Offset(_x, _y),
      );
    }
  }

  void _animateToPosition(
    double targetX,
    double targetY,
    double targetWidth,
    double targetHeight,
  ) {
    final startX = _x;
    final startY = _y;
    final startWidth = _width;
    final startHeight = _height;

    // Remove any existing listener
    if (_updateAnimation != null) {
      _animation.removeListener(_updateAnimation!);
    }

    // Create animation update function
    void updateAnimation() {
      setState(() {
        final t = _animation.value;
        _x = startX + (t * (targetX - startX));
        _y = startY + (t * (targetY - startY));
        _width = startWidth + (t * (targetWidth - startWidth));
        _height = startHeight + (t * (targetHeight - startHeight));
      });
    }

    // Store reference for removal
    _updateAnimation = updateAnimation;

    _animation.addListener(updateAnimation);
    _animationController.forward(from: 0).then((_) {
      // Remove listener when animation completes
      _animation.removeListener(updateAnimation);

      // Report final size to provider
      ref
          .read(windowSizeProvider(widget.windowId).notifier)
          .updateSize(
            Size(_width, _height),
          );

      // Clear the position update after animation completes
      ref
          .read(windowPositionNotifierProvider(widget.windowId).notifier)
          .clearUpdate();

      // Save the new position and size after animation completes
      if (widget.windowType != null) {
        // Only save if not maximized (don't save maximized state as default)
        final isMaximized = ref.read(
          floatingWindowIsMaximizedStateProvider(widget.windowId),
        );
        if (!isMaximized) {
          WindowPreferences.saveWindowConfig(
            widget.windowType!,
            size: Size(_width, _height),
            position: Offset(_x, _y),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size and mobile state first
    final screenSize = MediaQuery.of(context).size;
    final mobileState = MobileState.maybeOf(context);
    final isMobile = mobileState?.isMobile ?? false;

    // Listen to minimize state
    final isMinimized = ref.watch(
      floatingWindowIsMinimizedStateProvider(widget.windowId),
    );

    // DONT REMOVE THIS!
    ref.listen(windowSnapshotProvider(widget.windowId), (previous, next) {});
    ref.listen(
      floatingWindowTitleStateProvider(widget.windowId),
      (previous, next) {},
    );
    ref.listen(windowSizeProvider(widget.windowId), (previous, next) {});
    ref.listen(
      minimizedWindowPositionsProvider(widget.windowId),
      (previous, next) {},
    );

    // Listen for snapshot requests
    ref.listen<bool>(
      snapshotRequestProvider(widget.windowId),
      (previous, next) async {
        if (next && !isMinimized) {
          // Store position for potential minimize without animation
          ref
              .read(minimizedWindowPositionsProvider(widget.windowId).notifier)
              .storePosition(
                Offset(_x, _y),
                Size(_width, _height),
              );

          // Capture snapshot when requested and wait for it
          await _captureWindowSnapshot();
        }
      },
    );

    // Listen for minimize requests to trigger animation
    ref.listen<bool>(
      minimizeRequestsProvider(widget.windowId),
      (previous, next) async {
        if (next) {
          // Store window position before minimizing
          ref
              .read(minimizedWindowPositionsProvider(widget.windowId).notifier)
              .storePosition(
                Offset(_x, _y),
                Size(_width, _height),
              );

          // Start minimize animation
          final windowBounds = Rect.fromLTWH(_x, _y, _width, _height);
          final tileBounds = ref
              .read(taskbarTilePositionProvider(widget.windowId).notifier)
              .getTileBounds();

          if (tileBounds != null) {
            // Capture window content and wait for it to complete
            await _captureWindowSnapshot();

            // Hide the window immediately after capture is done
            if (mounted) {
              _minimizeAnimationController.value = 0.0;
            }

            // Start the minimize animation
            ref
                .read(minimizeAnimationsProvider.notifier)
                .startMinimizeAnimation(
                  windowId: widget.windowId,
                  windowBounds: windowBounds,
                  taskbarTileBounds: tileBounds,
                  tickerProvider: this,
                  onComplete: () {
                    // Actually minimize the window through window manager
                    // This ensures proper focus management
                    ref
                        .read(windowManagerProvider)
                        .minimizeWindow(widget.windowId, animate: false);
                    // Don't remove snapshot - keep it for restore animation
                  },
                );
          } else {
            // No tile bounds, minimize without animation
            ref
                .read(windowManagerProvider)
                .minimizeWindow(widget.windowId, animate: false);
          }

          // Clear the request
          ref
              .read(minimizeRequestsProvider(widget.windowId).notifier)
              .clearRequest();
        }
      },
    );

    // Listen for minimize state changes to trigger simple fade animation
    ref.listen<bool>(
      floatingWindowIsMinimizedStateProvider(widget.windowId),
      (previous, next) {
        if (next && !previous!) {
          // Minimizing - store position for restore animation
          ref
              .read(minimizedWindowPositionsProvider(widget.windowId).notifier)
              .storePosition(
                Offset(_x, _y),
                Size(_width, _height),
              );

          // Check if we already have a snapshot (from minimize all)
          final existingSnapshot = ref.read(
            windowSnapshotProvider(widget.windowId),
          );
          if (existingSnapshot == null) {
            // No snapshot yet, capture it now
            _captureWindowSnapshot().then((_) {
              // Fade out after capture
              if (mounted && _minimizeAnimationController.value > 0) {
                _minimizeAnimationController.animateTo(
                  0.0,
                  duration: AnimationConstants.fadeAnimationDuration,
                  curve: Curves.easeOut,
                );
              }
            });
          } else {
            // Snapshot already exists, just fade out
            if (mounted && _minimizeAnimationController.value > 0) {
              _minimizeAnimationController.animateTo(
                0.0,
                duration: AnimationConstants.fadeAnimationDuration,
                curve: Curves.easeOut,
              );
            }
          }
        } else if (!next && previous!) {
          // Restoring
          _minimizeAnimationController.value = 0.0; // Start hidden

          // Check if an animation is already running
          final animations = ref.read(minimizeAnimationsProvider);
          final hasRestoreAnimation = animations.containsKey(widget.windowId);

          if (hasRestoreAnimation) {
            _handleRestoreWithAnimation();
          } else {
            // No animation, just fade in
            _minimizeAnimationController.forward();
          }
        }
      },
    );

    // Listen for restore animations that might start after the minimize state change
    ref.listen<Map<String, MinimizeAnimationState>>(
      minimizeAnimationsProvider,
      (previous, next) {
        // Check if a restore animation was just added for this window
        if (!isMinimized &&
            next.containsKey(widget.windowId) &&
            !next[widget.windowId]!.isMinimizing &&
            _minimizeAnimationController.value == 0.0) {
          _handleRestoreWithAnimation();
        }
      },
    );

    // Listen to maximize state
    final isMaximized = ref.watch(
      floatingWindowIsMaximizedStateProvider(widget.windowId),
    );

    // Listen for maximize state changes
    ref.listen<bool>(
      floatingWindowIsMaximizedStateProvider(widget.windowId),
      (previous, next) {
        if (next && !previous!) {
          // Maximizing - store current state and animate to fullscreen
          _preMaximizeX = _x;
          _preMaximizeY = _y;
          _preMaximizeWidth = _width;
          _preMaximizeHeight = _height;

          final screenSize = MediaQuery.of(context).size;
          final theme = WindowManagerTheme.of(context);
          final statusBarHeight = theme.statusBar.height;
          final taskbarHeight = theme.taskbar.height;

          // On desktop, window starts at 0,0 but height excludes both status bar and taskbar
          _animateToPosition(
            0,
            0,
            screenSize.width,
            screenSize.height - statusBarHeight - taskbarHeight,
          );
        } else if (!next && previous!) {
          // Restoring - animate back to previous state
          _animateToPosition(
            _preMaximizeX,
            _preMaximizeY,
            _preMaximizeWidth,
            _preMaximizeHeight,
          );
        }
      },
    );

    // Update maximized window dimensions when screen size changes
    if (isMaximized && !isMobile) {
      final theme = WindowManagerTheme.of(context);
      final statusBarHeight = theme.statusBar.height;
      final taskbarHeight = theme.taskbar.height;
      final maxWidth = screenSize.width;
      final maxHeight = screenSize.height - statusBarHeight - taskbarHeight;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_width != maxWidth || _height != maxHeight || _y != 0) {
          setState(() {
            _x = 0;
            _y = 0;
            _width = maxWidth;
            _height = maxHeight;
          });
        }
      });
    }

    // Listen for position updates from snap actions
    ref.listen<WindowPositionUpdate?>(
      windowPositionNotifierProvider(widget.windowId),
      (previous, next) {
        if (next != null) {
          // Animate to the new position
          _animateToPosition(
            next.position.dx,
            next.position.dy,
            next.size.width,
            next.size.height,
          );
          // Update is cleared in _animateToPosition after animation completes
        }
      },
    );
    if (_previousMobileState == null && isMobile) {
      // We're starting in mobile mode, save the initial desktop values
      _preMobileX = widget.initialX ?? 100;
      _preMobileY = widget.initialY ?? 100;
      // Use provided initial size or fall back to minimum size constraints
      // The initialWidth/Height already contains the window's default size from WindowsStackOptimized
      _preMobileWidth = widget.initialWidth ?? widget.minWidth;
      _preMobileHeight = widget.initialHeight ?? widget.minHeight;
      _wasMaximizedBeforeMobile = false;
    }

    // Handle mobile state transitions
    if (_previousMobileState != null && _previousMobileState != isMobile) {
      if (isMobile && !_previousMobileState!) {
        // Entering mobile mode - save current state
        _preMobileX = _x;
        _preMobileY = _y;
        _preMobileWidth = _width;
        _preMobileHeight = _height;
        _wasMaximizedBeforeMobile = isMaximized;
      } else if (!isMobile && _previousMobileState!) {
        // Leaving mobile mode - restore previous state
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!_wasMaximizedBeforeMobile) {
            // Restore the pre-mobile state
            ref
                .read(
                  floatingWindowIsMaximizedStateProvider(
                    widget.windowId,
                  ).notifier,
                )
                .setMaximized(false);
            setState(() {
              _x = _preMobileX;
              _y = _preMobileY;
              _width = _preMobileWidth;
              _height = _preMobileHeight;
            });
          } else {
            // Was maximized before mobile, keep it maximized
            ref
                .read(
                  floatingWindowIsMaximizedStateProvider(
                    widget.windowId,
                  ).notifier,
                )
                .setMaximized(true);
          }
        });
      }
    }

    // Update previous mobile state for next build
    if (_previousMobileState != isMobile) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            _previousMobileState = isMobile;
          });
        }
      });
    }

    // Get safe area padding from provider
    final safeAreaPadding = ref.watch(safeAreaPaddingProvider);

    // Get themes
    final windowTheme = WindowManagerTheme.of(context).window;
    final titleBarTheme = WindowManagerTheme.of(context).windowTitleBar;
    final titleBarHeight = titleBarTheme.height;

    // Check if this window is in the foreground

    final isInForeground = ref.watch(
      windowZOrderProvider.select(
        (zOrder) => zOrder.isNotEmpty && zOrder.last == widget.windowId,
      ),
    );

    final overlayColor = ref.watch(backgroundWindowOverlayColorProvider);

    // On mobile, force full screen dimensions without any top offset
    final displayX = isMobile ? 0.0 : _x;
    final displayY = isMobile ? 0.0 : _y;
    final displayWidth = isMobile ? screenSize.width : _width;
    final displayHeight = isMobile
        ? screenSize.height -
              WindowManagerConstants.mobileBottomBarHeight -
              safeAreaPadding.bottom -
              safeAreaPadding.top
        : _height;

    return Positioned(
      left: displayX,
      top: displayY,
      child: AnimatedBuilder(
        animation: _minimizeAnimation,
        builder: (context, child) {
          return Offstage(
            offstage: isMinimized && _minimizeAnimation.value == 0.0,
            child: Transform.scale(
              scale: 0.9 + (_minimizeAnimation.value * 0.1),
              child: Opacity(
                opacity: _minimizeAnimation.value,
                child: child!,
              ),
            ),
          );
        },
        child: Semantics(
          container: true,
          label: 'Window ${widget.windowId}',
          child: RepaintBoundary(
            child: SizedBox(
              width: displayWidth,
              height: displayHeight,
              child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                  // Main window content with shadow
                  RepaintBoundary(
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onPanDown: (_) {
                        // Bring window to front immediately when touching it
                        ref
                            .read(windowManagerProvider)
                            .bringToFront(widget.windowId);
                        // Update topmost position for this window type
                        if (widget.windowType != null) {
                          ref
                              .read(topmostWindowPositionsProvider.notifier)
                              .updatePosition(
                                widget.windowType!,
                                Offset(_x, _y),
                              );
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: windowTheme.backgroundColor,
                          borderRadius: BorderRadius.circular(
                            (isMaximized || isMobile)
                                ? 0
                                : windowTheme.borderRadius,
                          ),
                          border: windowTheme.borderWidth > 0
                              ? Border.all(
                                  color: windowTheme.borderColor,
                                  width: windowTheme.borderWidth,
                                )
                              : null,
                          boxShadow: (isMaximized || isMobile)
                              ? []
                              : [
                                  BoxShadow(
                                    color: windowTheme.shadowColor,
                                    blurRadius: windowTheme.shadowBlurRadius,
                                    offset: windowTheme.shadowOffset,
                                  ),
                                ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            (isMaximized || isMobile)
                                ? 0
                                : windowTheme.borderRadius,
                          ),
                          child: Stack(
                            children: [
                              RepaintBoundary(
                                key: _windowContentKey,
                                // Isolate window content from window chrome
                                child: widget.child,
                              ),
                              // Overlay for background windows
                              if (!isInForeground && overlayColor != null)
                                Positioned.fill(
                                  child: IgnorePointer(
                                    child: Container(
                                      color: overlayColor,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Drag area - only covers the title bar height (disabled on mobile)
                  if (!isMobile)
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      height: titleBarHeight,
                      child: RepaintBoundary(
                        child: IgnorePointer(
                          ignoring: _isResizing,
                          child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onPanStart: _startDrag,
                            onPanUpdate: _updateDrag,
                            onPanEnd: _endDrag,
                          ),
                        ),
                      ),
                    ),

                  // Resize handles - positioned outside the main content (hidden when maximized or on mobile)
                  if (!isMaximized && !isMobile)
                    RepaintBoundary(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: _buildResizeHandles(),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildResizeHandles() {
    final windowTheme = WindowManagerTheme.of(context).window;
    final handleSize = windowTheme.resizeHandleSize;
    final cornerSize = handleSize * 1.67; // Proportionally larger corners
    final halfHandle = handleSize / 2;

    return [
      // Right edge
      Positioned(
        right: -halfHandle,
        top: cornerSize,
        bottom: cornerSize,
        width: handleSize,
        child: _ResizeHandle(
          cursor: SystemMouseCursors.resizeColumn,
          onStart: (d) =>
              _startResize('right', d, SystemMouseCursors.resizeColumn),
          onUpdate: _updateResize,
          onEnd: _endResize,
        ),
      ),
      // Bottom edge
      Positioned(
        left: cornerSize,
        right: cornerSize,
        bottom: -halfHandle,
        height: handleSize,
        child: _ResizeHandle(
          cursor: SystemMouseCursors.resizeRow,
          onStart: (d) =>
              _startResize('bottom', d, SystemMouseCursors.resizeRow),
          onUpdate: _updateResize,
          onEnd: _endResize,
        ),
      ),
      // Left edge
      Positioned(
        left: -halfHandle,
        top: cornerSize,
        bottom: cornerSize,
        width: handleSize,
        child: _ResizeHandle(
          cursor: SystemMouseCursors.resizeColumn,
          onStart: (d) =>
              _startResize('left', d, SystemMouseCursors.resizeColumn),
          onUpdate: _updateResize,
          onEnd: _endResize,
        ),
      ),
      // Top edge
      Positioned(
        left: cornerSize,
        right: cornerSize,
        top: -halfHandle,
        height: handleSize,
        child: _ResizeHandle(
          cursor: SystemMouseCursors.resizeRow,
          onStart: (d) => _startResize('top', d, SystemMouseCursors.resizeRow),
          onUpdate: _updateResize,
          onEnd: _endResize,
        ),
      ),

      // Bottom-right corner
      Positioned(
        right: -halfHandle,
        bottom: -halfHandle,
        width: cornerSize,
        height: cornerSize,
        child: _ResizeHandle(
          cursor: SystemMouseCursors.move, // Using move cursor for corners
          onStart: (d) =>
              _startResize('bottom-right', d, SystemMouseCursors.move),
          onUpdate: _updateResize,
          onEnd: _endResize,
        ),
      ),
      // Top-left corner
      Positioned(
        left: -halfHandle,
        top: -halfHandle,
        width: cornerSize,
        height: cornerSize,
        child: _ResizeHandle(
          cursor: SystemMouseCursors.move, // Using move cursor for corners
          onStart: (d) => _startResize('top-left', d, SystemMouseCursors.move),
          onUpdate: _updateResize,
          onEnd: _endResize,
        ),
      ),
      // Top-right corner
      Positioned(
        right: -halfHandle,
        top: -halfHandle,
        width: cornerSize,
        height: cornerSize,
        child: _ResizeHandle(
          cursor: SystemMouseCursors.move, // Using move cursor for corners
          onStart: (d) => _startResize('top-right', d, SystemMouseCursors.move),
          onUpdate: _updateResize,
          onEnd: _endResize,
        ),
      ),
      // Bottom-left corner
      Positioned(
        left: -halfHandle,
        bottom: -halfHandle,
        width: cornerSize,
        height: cornerSize,
        child: _ResizeHandle(
          cursor: SystemMouseCursors.move, // Using move cursor for corners
          onStart: (d) =>
              _startResize('bottom-left', d, SystemMouseCursors.move),
          onUpdate: _updateResize,
          onEnd: _endResize,
        ),
      ),
    ];
  }
}

class _ResizeHandle extends StatefulWidget {
  const _ResizeHandle({
    required this.cursor,
    required this.onStart,
    required this.onUpdate,
    required this.onEnd,
  });

  final MouseCursor cursor;
  final Function(DragStartDetails) onStart;
  final Function(DragUpdateDetails) onUpdate;
  final Function(DragEndDetails) onEnd;

  @override
  State<_ResizeHandle> createState() => _ResizeHandleState();
}

class _ResizeHandleState extends State<_ResizeHandle> {
  bool _isHovered = false;
  bool _isDragging = false;

  @override
  Widget build(BuildContext context) {
    // Get theme colors
    final windowTheme = WindowManagerTheme.of(context).window;

    return MouseRegion(
      cursor: widget.cursor,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onPanStart: (details) {
          setState(() => _isDragging = true);
          widget.onStart(details);
        },
        onPanUpdate: widget.onUpdate,
        onPanEnd: (details) {
          setState(() => _isDragging = false);
          widget.onEnd(details);
        },
        child: RepaintBoundary(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            decoration: BoxDecoration(
              color: _isDragging || _isHovered
                  ? windowTheme.resizeHandleHoverColor.withValues(
                      alpha: _isDragging ? 0.2 : 0.1,
                    )
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(4),
              border: (_isHovered || _isDragging)
                  ? Border.all(
                      color: _isDragging
                          ? windowTheme.resizeHandleHoverColor.withValues(
                              alpha: 0.6,
                            )
                          : windowTheme.resizeHandleColor.withValues(
                              alpha: 0.3,
                            ),
                      width: _isDragging ? 2 : 1,
                    )
                  : null,
              boxShadow: _isDragging
                  ? [
                      BoxShadow(
                        color: windowTheme.resizeHandleHoverColor.withValues(
                          alpha: 0.3,
                        ),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ]
                  : null,
            ),
            child: null,
          ),
        ),
      ),
    );
  }
}
