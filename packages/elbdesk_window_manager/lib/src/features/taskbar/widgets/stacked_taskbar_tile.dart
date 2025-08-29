import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../theme/window_manager_theme.dart';
import '../../floating_windows/models/floating_window_data.dart';
import '../../floating_windows/providers/providers.dart';
import '../desktop_taskbar.dart';

class StackedTaskbarTile extends ConsumerStatefulWidget {
  const StackedTaskbarTile({
    required this.windows,
    required this.windowType,
    required this.tileId,
    required this.onHoverChanged,
    super.key,
  });

  final List<FloatingWindowData> windows;
  final String windowType;
  final String tileId;
  final Function(bool) onHoverChanged;

  @override
  ConsumerState<StackedTaskbarTile> createState() => _StackedTaskbarTileState();
}

class _StackedTaskbarTileState extends ConsumerState<StackedTaskbarTile>
    with TickerProviderStateMixin {
  final GlobalKey _tileKey = GlobalKey();
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  Timer? _hideTimer;
  bool _isHovered = false;
  bool _isMenuHovered = false;
  late AnimationController _flashController;
  late Animation<double> _flashAnimation;
  bool _isPaused = false;

  @override
  void initState() {
    super.initState();

    // Register this tile's position for all windows in the group
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _registerTilePositions();
    });

    _flashController = AnimationController(
      duration: const Duration(milliseconds: 1500), // Same as regular tile
      vsync: this,
    );
    _flashAnimation =
        Tween<double>(
          begin: 0.0,
          end: 0.6, // Same intensity as regular tile
        ).animate(
          CurvedAnimation(
            parent: _flashController,
            curve: Curves.easeInOut,
          ),
        );
  }

  @override
  void didUpdateWidget(StackedTaskbarTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Re-register positions if windows changed
    if (oldWidget.windows != widget.windows) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _registerTilePositions();
      });
    }
  }

  @override
  void dispose() {
    _flashController.dispose();
    _hideTimer?.cancel();
    _removeOverlay();
    super.dispose();
  }

  void _registerTilePositions() {
    // Register this tile's position for all windows in the group
    for (final window in widget.windows) {
      ref
          .read(taskbarTilePositionProvider(window.floatingWindowId).notifier)
          .setKey(_tileKey);
    }
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
    if (mounted) {
      // Check if any window in the stack is still highlighted
      final highlightedWindows = ref.read(windowHighlightProvider);
      final hasHighlighted = widget.windows.any(
        (window) => highlightedWindows.contains(window.floatingWindowId),
      );
      if (hasHighlighted) {
        _startFlashingWithPause();
      }
    }
  }

  String _getDisplayName(String windowType) {
    final match = RegExp(r'(\w+)WindowData').firstMatch(windowType);
    if (match != null) {
      final name = match.group(1) ?? windowType;
      return name.replaceAllMapped(
        RegExp(r'([a-z])([A-Z])'),
        (Match m) => '${m[1]} ${m[2]}',
      );
    }
    return windowType;
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _cancelHideTimer() {
    _hideTimer?.cancel();
    _hideTimer = null;
  }

  void _startHideTimer() {
    _cancelHideTimer();
    _hideTimer = Timer(const Duration(milliseconds: 200), () {
      if (!_isHovered && !_isMenuHovered) {
        _removeOverlay();
      }
    });
  }

  void _showWindowMenu() {
    if (_overlayEntry != null) return; // Already showing

    // Check if this tile is the active one
    final activeTileId = ref.read(activeStackedTileProvider);
    if (activeTileId != widget.tileId) return;

    final RenderBox renderBox =
        _tileKey.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) => _WindowMenuOverlay(
        link: _layerLink,
        windows: widget.windows,
        onWindowSelected: (window) {
          _removeOverlay();
          // Stop highlighting when window is selected
          ref
              .read(windowHighlightProvider.notifier)
              .stopHighlight(window.floatingWindowId);

          final isMinimized = ref.read(
            floatingWindowIsMinimizedStateProvider(window.floatingWindowId),
          );
          if (isMinimized) {
            ref
                .read(windowManagerProvider)
                .restoreWindow(window.floatingWindowId);
          }
          ref.read(windowManagerProvider).bringToFront(window.floatingWindowId);
        },
        onEnter: () {
          _isMenuHovered = true;
          _cancelHideTimer();
        },
        onExit: () {
          _isMenuHovered = false;
          _startHideTimer();
        },
        tileWidth: size.width,
        ref: ref,
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    // Get the window manager theme
    final taskbarTheme = WindowManagerTheme.of(context).taskbar;

    // Watch for active tile changes
    final activeTileId = ref.watch(activeStackedTileProvider);
    // If another tile becomes active, close our overlay
    if (activeTileId != null &&
        activeTileId != widget.tileId &&
        _overlayEntry != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _removeOverlay();
      });
    }

    // Check if any window in the stack is active
    final activeWindows = ref.watch(windowsListProvider);
    final hasActiveWindow = widget.windows.any((window) {
      final isMinimized = ref.watch(
        floatingWindowIsMinimizedStateProvider(window.floatingWindowId),
      );
      return activeWindows.isNotEmpty &&
          activeWindows.last.floatingWindowId == window.floatingWindowId &&
          !isMinimized;
    });

    // Check if any window in the stack is highlighted
    final highlightedWindows = ref.watch(windowHighlightProvider);
    final hasHighlightedWindow = widget.windows.any(
      (window) => highlightedWindows.contains(window.floatingWindowId),
    );

    // Start or stop flashing based on highlight state
    if (hasHighlightedWindow) {
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

    // Get the first window for icon and basic info
    final firstWindow = widget.windows.first;
    // Get the base title from the first window
    final firstWindowTitleData = ref.watch(
      floatingWindowTitleStateProvider(firstWindow.floatingWindowId),
    );
    final displayName = firstWindowTitleData.baseTitle.isNotEmpty
        ? firstWindowTitleData.baseTitle
        : _getDisplayName(widget.windowType);

    return CompositedTransformTarget(
      link: _layerLink,
      child: MouseRegion(
        key: _tileKey,
        onEnter: (_) {
          setState(() => _isHovered = true);
          _cancelHideTimer();
          widget.onHoverChanged(true);
          if (widget.windows.length > 1) {
            // Small delay to prevent flickering when moving between tiles
            Future.delayed(const Duration(milliseconds: 50), () {
              if (_isHovered && mounted) {
                _showWindowMenu();
              }
            });
          }
        },
        onExit: (_) {
          setState(() => _isHovered = false);
          widget.onHoverChanged(false);
          _startHideTimer();
        },
        child: GestureDetector(
          onTap: () {
            // Stop highlighting for all windows in the stack when clicked
            for (final window in widget.windows) {
              ref
                  .read(windowHighlightProvider.notifier)
                  .stopHighlight(window.floatingWindowId);
            }

            if (widget.windows.length == 1) {
              final window = widget.windows.first;
              final isMinimized = ref.read(
                floatingWindowIsMinimizedStateProvider(window.floatingWindowId),
              );
              if (isMinimized) {
                ref
                    .read(windowManagerProvider)
                    .restoreWindow(window.floatingWindowId);
              }
              ref
                  .read(windowManagerProvider)
                  .bringToFront(window.floatingWindowId);
            }
          },
          child: AnimatedBuilder(
            animation: _flashAnimation,
            builder: (context, child) {
              final flashColor = ColorTween(
                begin: null,
                end: taskbarTheme.tileHighlightColor,
              ).animate(_flashAnimation).value;

              return Container(
                constraints: const BoxConstraints(
                  maxWidth: 200,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: hasHighlightedWindow && flashColor != null
                      ? flashColor
                      : hasActiveWindow
                      ? taskbarTheme.tileActiveBackgroundColor
                      : _isHovered
                      ? taskbarTheme.tileHoverBackgroundColor
                      : taskbarTheme.tileBackgroundColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: hasActiveWindow
                        ? taskbarTheme.borderColor
                        : Colors.transparent,
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (widget.windows.length > 1) ...[
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Icon(
                            firstWindow.taskbarIcon,
                            size: 16,
                            color: hasActiveWindow
                                ? taskbarTheme.iconActiveColor
                                : taskbarTheme.iconColor,
                          ),
                          Positioned(
                            left: -10,
                            top: -10,
                            child: Container(
                              width: widget.windows.length > 9 ? 18 : 14,
                              height: widget.windows.length > 9 ? 18 : 14,
                              decoration: BoxDecoration(
                                color: taskbarTheme.iconActiveColor,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: taskbarTheme.tileBackgroundColor,
                                  width: 1.5,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  widget.windows.length > 9
                                      ? '9+'
                                      : '${widget.windows.length}',
                                  style: TextStyle(
                                    fontSize: widget.windows.length > 9 ? 8 : 9,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    height: 1.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 12),
                    ] else ...[
                      Icon(
                        firstWindow.taskbarIcon,
                        size: 16,
                        color: hasActiveWindow
                            ? taskbarTheme.iconActiveColor
                            : taskbarTheme.iconColor,
                      ),
                      const SizedBox(width: 6),
                    ],
                    Flexible(
                      child: Text(
                        displayName,
                        style: TextStyle(
                          fontWeight: hasActiveWindow ? FontWeight.bold : null,
                          color: hasActiveWindow
                              ? taskbarTheme.textActiveColor
                              : taskbarTheme.textColor,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _WindowMenuOverlay extends ConsumerWidget {
  const _WindowMenuOverlay({
    required this.link,
    required this.windows,
    required this.onWindowSelected,
    required this.onEnter,
    required this.onExit,
    required this.tileWidth,
    required this.ref,
  });

  final LayerLink link;
  final List<FloatingWindowData> windows;
  final Function(FloatingWindowData) onWindowSelected;
  final VoidCallback onEnter;
  final VoidCallback onExit;
  final double tileWidth;
  final WidgetRef ref;

  Widget _buildWindowTitle(
    BuildContext context,
    WidgetRef ref,
    FloatingWindowData window,
    bool isActive,
    bool isMinimized,
  ) {
    final titlebarData = ref.watch(
      floatingWindowTitleStateProvider(window.floatingWindowId),
    );

    return Text(
      titlebarData.titleText(false),
      style: TextStyle(
        fontWeight: isActive ? FontWeight.bold : null,
        fontStyle: isMinimized ? FontStyle.italic : null,
        color: isActive
            ? WindowManagerTheme.of(context).taskbar.textActiveColor
            : WindowManagerTheme.of(context).taskbar.textColor,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Positioned(
      left: 0,
      top: 0,
      child: CompositedTransformFollower(
        link: link,
        targetAnchor: Alignment.topCenter,
        followerAnchor: Alignment.bottomCenter,
        offset: const Offset(0, -8), // 8px gap above tile
        child: MouseRegion(
          onEnter: (_) => onEnter(),
          onExit: (_) => onExit(),
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(8),
            color: Colors.transparent,
            child: Container(
              constraints: BoxConstraints(
                minWidth: tileWidth,
                maxWidth: 300,
              ),
              decoration: BoxDecoration(
                color: WindowManagerTheme.of(context).window.backgroundColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: WindowManagerTheme.of(context).window.borderColor,
                ),
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: windows.map((window) {
                    final isMinimized = ref.watch(
                      floatingWindowIsMinimizedStateProvider(
                        window.floatingWindowId,
                      ),
                    );
                    final windowsList = ref.watch(windowsListProvider);
                    final isActive =
                        windowsList.isNotEmpty &&
                        windowsList.last.floatingWindowId ==
                            window.floatingWindowId &&
                        !isMinimized;

                    // Check if this window is highlighted
                    final highlightedWindows = ref.watch(
                      windowHighlightProvider,
                    );
                    final isHighlighted = highlightedWindows.contains(
                      window.floatingWindowId,
                    );

                    return InkWell(
                      onTap: () => onWindowSelected(window),
                      borderRadius: BorderRadius.circular(4),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: isHighlighted
                              ? WindowManagerTheme.of(
                                  context,
                                ).taskbar.tileHighlightColor
                              : null,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              window.taskbarIcon,
                              size: 16,
                              color: isActive
                                  ? WindowManagerTheme.of(
                                      context,
                                    ).taskbar.iconActiveColor
                                  : WindowManagerTheme.of(
                                      context,
                                    ).taskbar.iconColor,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: _buildWindowTitle(
                                context,
                                ref,
                                window,
                                isActive,
                                isMinimized,
                              ),
                            ),
                            if (isMinimized)
                              Icon(
                                Icons.minimize,
                                size: 14,
                                color: WindowManagerTheme.of(
                                  context,
                                ).taskbar.iconDisabledColor,
                              ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
