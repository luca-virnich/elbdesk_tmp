import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../theme/window_manager_theme.dart';
import '../../floating_windows/models/floating_window_data.dart';
import '../../floating_windows/providers/providers.dart';
import '../../floating_windows/services/window_size_preferences.dart';

class TaskbarTile extends ConsumerStatefulWidget {
  const TaskbarTile({
    required this.window,
    required this.isActive,
    super.key,
  });

  final FloatingWindowData window;
  final bool isActive;

  @override
  ConsumerState<TaskbarTile> createState() => _TaskbarTileState();
}

class _TaskbarTileState extends ConsumerState<TaskbarTile>
    with TickerProviderStateMixin {
  late AnimationController _flashController;
  late Animation<double> _flashAnimation;
  bool _isHovered = false;
  final GlobalKey _tileKey = GlobalKey();
  bool _isPaused = false;

  @override
  void initState() {
    super.initState();
    _flashController = AnimationController(
      duration: const Duration(milliseconds: 1500), // Slower animation
      vsync: this,
    );
    _flashAnimation =
        Tween<double>(
          begin: 0.0,
          end: 0.6, // Less intense flash (60% instead of 100%)
        ).animate(
          CurvedAnimation(
            parent: _flashController,
            curve: Curves.easeInOut,
          ),
        );

    // Register tile position
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(
            taskbarTilePositionProvider(
              widget.window.floatingWindowId,
            ).notifier,
          )
          .setKey(_tileKey);
    });
  }

  @override
  void dispose() {
    _flashController.dispose();
    // No need to unregister - the provider will be disposed automatically
    // when there are no more listeners
    super.dispose();
  }

  void _startFlashingWithPause() async {
    if (!mounted) return;

    // Flash twice
    await _flashController.forward();
    if (!mounted) return;
    await _flashController.reverse();
    if (!mounted) return;
    await _flashController.forward();
    if (!mounted) return;
    await _flashController.reverse();

    // Pause for a moment
    if (!mounted) return;
    _isPaused = true;
    await Future.delayed(const Duration(seconds: 2));
    _isPaused = false;

    // Continue if still highlighted
    if (mounted &&
        ref
            .read(windowHighlightProvider)
            .contains(widget.window.floatingWindowId)) {
      _startFlashingWithPause();
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      taskbarTilePositionProvider(widget.window.floatingWindowId),
      (previous, next) {},
    );
    final titlebarData = ref.watch(
      floatingWindowTitleStateProvider(widget.window.floatingWindowId),
    );
    final showBaseTitle = ref.watch(showTitlebarBaseTitleProvider);

    final highlightedWindows = ref.watch(windowHighlightProvider);
    final isHighlighted = highlightedWindows.contains(
      widget.window.floatingWindowId,
    );
    final isMinimized = ref.watch(
      floatingWindowIsMinimizedStateProvider(widget.window.floatingWindowId),
    );

    // Get the window manager theme - with safety check
    final windowManagerTheme = WindowManagerTheme.maybeOf(context);
    if (windowManagerTheme == null) {
      // During drag, the context might not have the theme
      // Return a basic tile that can still be dragged
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            titlebarData.icon != null
                ? Icon(titlebarData.icon, size: 16)
                : Icon(widget.window.taskbarIcon, size: 16),

            const SizedBox(width: 6),
            Text(titlebarData.titleText(showBaseTitle)),
          ],
        ),
      );
    }
    final taskbarTheme = windowManagerTheme.taskbar;

    // Start or stop flashing based on highlight state
    if (isHighlighted && !widget.isActive) {
      if (!_flashController.isAnimating && !_isPaused) {
        _startFlashingWithPause();
      }
    } else {
      if (_flashController.isAnimating || _isPaused) {
        _flashController.stop();
        _flashController.value = 0.0;
        _isPaused = false;
      }
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () {
          // Stop highlighting when clicked
          ref
              .read(windowHighlightProvider.notifier)
              .stopHighlight(widget.window.floatingWindowId);

          if (isMinimized) {
            // For restore, we need to handle animation here since we have the ticker provider
            final windowManager = ref.read(windowManagerProvider);

            // Try to get stored window position first
            final storedPosition = ref.read(
              minimizedWindowPositionsProvider(widget.window.floatingWindowId),
            );

            final windowBounds = storedPosition;

            final tileBounds = ref
                .read(
                  taskbarTilePositionProvider(
                    widget.window.floatingWindowId,
                  ).notifier,
                )
                .getTileBounds();
            if (tileBounds != null && mounted) {
              // Start the restore animation FIRST
              ref
                  .read(minimizeAnimationsProvider.notifier)
                  .startRestoreAnimation(
                    windowId: widget.window.floatingWindowId,
                    taskbarTileBounds: tileBounds,
                    windowBounds: windowBounds,
                    tickerProvider: this,
                    onComplete: () {
                      // Don't remove snapshot here - let the window handle it
                    },
                  );

              // Delay window state change slightly to ensure animation is registered
              Future.microtask(() {
                ref
                    .read(
                      floatingWindowIsMinimizedStateProvider(
                        widget.window.floatingWindowId,
                      ).notifier,
                    )
                    .maximize();
                // Bring window to front after restore
                ref
                    .read(windowManagerProvider)
                    .bringToFront(widget.window.floatingWindowId);
              });
            } else {
              // No animation possible
              windowManager.restoreWindow(
                widget.window.floatingWindowId,
                animate: false,
              );
              windowManager.bringToFront(widget.window.floatingWindowId);
            }
          } else {
            // Window is not minimized
            if (widget.isActive) {
              // Window is in front, minimize it
              ref
                  .read(
                    minimizeRequestsProvider(
                      widget.window.floatingWindowId,
                    ).notifier,
                  )
                  .requestMinimize();
            } else {
              // Window is not in front, bring it to front
              ref
                  .read(windowManagerProvider)
                  .bringToFront(widget.window.floatingWindowId);
            }
          }
        },
        onDoubleTap: () {
          // Move window to top-left position on double-click
          const newPosition = Offset(20, 20);
          // TODO: Implement window position update
          // For now, just bring to front
          ref
              .read(windowManagerProvider)
              .bringToFront(widget.window.floatingWindowId);

          // Save the new position
          final windowType = widget.window.runtimeType.toString();
          WindowPreferences.saveWindowConfig(
            windowType,
            size: widget.window.defaultSize,
            position: newPosition,
          );

          // Also restore the window if it's minimized
          if (isMinimized) {
            ref
                .read(windowManagerProvider)
                .restoreWindow(widget.window.floatingWindowId);
            ref
                .read(windowManagerProvider)
                .bringToFront(widget.window.floatingWindowId);
          }
        },
        child: AnimatedBuilder(
          animation: _flashAnimation,
          builder: (context, child) {
            final flashColor = ColorTween(
              begin: null,
              end: taskbarTheme.tileHighlightColor,
            ).animate(_flashAnimation).value;

            return RepaintBoundary(
              key: _tileKey,
              child: Container(
                width: 200,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: widget.isActive
                      ? taskbarTheme.tileActiveBackgroundColor
                      : isHighlighted
                      ? flashColor
                      : _isHovered
                      ? taskbarTheme.tileHoverBackgroundColor
                      : taskbarTheme.tileBackgroundColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: widget.isActive
                        ? taskbarTheme.borderColor
                        : Colors.transparent,
                    width: 1,
                  ),
                ),
                child: Opacity(
                  opacity: isMinimized
                      ? taskbarTheme.tileMinimizedOpacity
                      : 1.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        widget.window.taskbarIcon,
                        size: 16,
                        color: widget.isActive
                            ? taskbarTheme.iconActiveColor
                            : taskbarTheme.iconColor,
                      ),
                      const SizedBox(width: 6),
                      Flexible(
                        child: Text(
                          titlebarData.titleText(showBaseTitle),
                          style: TextStyle(
                            fontWeight: widget.isActive
                                ? FontWeight.bold
                                : null,
                            fontStyle: isMinimized ? FontStyle.italic : null,
                            color: widget.isActive
                                ? taskbarTheme.textActiveColor
                                : taskbarTheme.textColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
