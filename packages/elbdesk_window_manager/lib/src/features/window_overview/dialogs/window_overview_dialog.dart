import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../theme/window_manager_theme.dart';
import '../../../theme/window_overview_theme_data.dart';
import '../../../theme/window_theme_data.dart';
import '../../floating_windows/models/floating_window_data.dart';
import '../../floating_windows/providers/providers.dart';
import '../../floating_windows/providers/state/window_size_provider.dart';
import '../../taskbar/providers/taskbar_window_order_provider.dart';
import '../widgets/app_card_mockup_preview.dart';

/// Shows the window overview as a dialog
Future<void> showWindowOverviewDialog(BuildContext context, WidgetRef ref) {
  // Capture the theme data before showing the dialog
  return showDialog(
    context: context,
    barrierDismissible: true,
    useSafeArea: false,
    builder: (context) => const WindowOverviewDialog(),
  );
}

class WindowOverviewDialog extends HookConsumerWidget {
  const WindowOverviewDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get all windows in taskbar order
    final allWindows = ref.watch(windowsInTaskbarOrderProvider);

    // Get the window overview theme
    final overviewTheme = WindowManagerTheme.of(context).windowOverview;

    // Store the stable order when overview opens
    final stableWindowIds = useState<List<String>>([]);

    // Initialize stable order on first render
    useEffect(() {
      if (stableWindowIds.value.isEmpty && allWindows.isNotEmpty) {
        stableWindowIds.value = allWindows
            .map((w) => w.floatingWindowId)
            .toList();
      }
      return null;
    }, []);

    // Get windows in stable order
    final windows = stableWindowIds.value
        .map(
          (id) => allWindows.firstWhere(
            (w) => w.floatingWindowId == id,
            orElse: () => allWindows.first,
          ),
        )
        .where((w) => stableWindowIds.value.contains(w.floatingWindowId))
        .toList();

    // Find the current front window from z-order (not taskbar order)
    final windowsInZOrder = ref.watch(windowsListProvider);
    final frontWindowId = windowsInZOrder.isNotEmpty
        ? windowsInZOrder.last.floatingWindowId
        : null;
    final initialIndex = frontWindowId != null
        ? windows
              .indexWhere((w) => w.floatingWindowId == frontWindowId)
              .clamp(0, windows.length - 1)
        : 0;
    final focusedIndex = useState(initialIndex);
    final focusNode = useFocusNode();

    // Ensure focused index is valid
    useEffect(() {
      if (focusedIndex.value >= windows.length && windows.isNotEmpty) {
        focusedIndex.value = windows.length - 1;
      } else if (windows.isEmpty) {
        focusedIndex.value = 0;
      }
      return null;
    }, [windows.length]);

    void selectFocusedWindow() {
      if (focusedIndex.value >= 0 && focusedIndex.value < windows.length) {
        final window = windows[focusedIndex.value];

        // Unminimize if minimized
        ref.read(windowManagerProvider).restoreWindow(window.floatingWindowId);

        // Bring to front
        ref.read(windowManagerProvider).bringToFront(window.floatingWindowId);
      }
    }

    // Request focus when the widget is built and capture snapshots
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        focusNode.requestFocus();
        // Don't bring window to front when opening overview

        // Request snapshots for all non-minimized windows
        for (final window in allWindows) {
          final isMinimized = ref.read(
            floatingWindowIsMinimizedStateProvider(window.floatingWindowId),
          );

          if (!isMinimized) {
            // Request snapshot capture
            ref
                .read(snapshotRequestProvider(window.floatingWindowId).notifier)
                .requestSnapshot();
          }
        }
      });
      return null;
    }, []);

    void selectWindow(int index) {
      if (index >= 0 && index < windows.length) {
        final window = windows[index];
        // Unminimize if minimized
        ref.read(windowManagerProvider).restoreWindow(window.floatingWindowId);
        ref.read(windowManagerProvider).bringToFront(window.floatingWindowId);
        Navigator.of(context).pop();
      }
    }

    void navigateNext() {
      if (windows.isNotEmpty) {
        focusedIndex.value = (focusedIndex.value + 1) % windows.length;
        // Don't bring window to front while navigating
      }
    }

    void navigatePrevious() {
      if (windows.isNotEmpty) {
        focusedIndex.value =
            (focusedIndex.value - 1 + windows.length) % windows.length;
        // Don't bring window to front while navigating
      }
    }

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      child: KeyboardListener(
        focusNode: focusNode,
        autofocus: true,
        onKeyEvent: (KeyEvent event) {
          if (event is KeyDownEvent) {
            switch (event.logicalKey) {
              case LogicalKeyboardKey.tab:
                if (HardwareKeyboard.instance.isShiftPressed) {
                  navigatePrevious();
                } else {
                  navigateNext();
                }
                break;
              case LogicalKeyboardKey.arrowRight:
                navigateNext();
                break;
              case LogicalKeyboardKey.arrowLeft:
                navigatePrevious();
                break;
              case LogicalKeyboardKey.enter:
              case LogicalKeyboardKey.numpadEnter:
                selectWindow(focusedIndex.value);
                break;
              case LogicalKeyboardKey.escape:
                Navigator.of(context).pop();
                break;
            }
          } else if (event is KeyUpEvent) {
            // Select window and close on Alt or Ctrl release
            if (event.logicalKey == LogicalKeyboardKey.altLeft ||
                event.logicalKey == LogicalKeyboardKey.controlLeft) {
              selectFocusedWindow();
              Navigator.of(context).pop();
            }
          }
        },
        child: Stack(
          children: [
            // Background overlay with blur
            GestureDetector(
              onTap: () {
                // Just close without selecting any window
                Navigator.of(context).pop();
              },
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: overviewTheme.overlayColor,
                ),
              ),
            ),
            // Content
            Center(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // Calculate optimal tile height based on screen size and window count
                  final screenSize = MediaQuery.of(context).size;
                  final availableWidth =
                      screenSize.width * 0.9; // 90% of screen width
                  final availableHeight =
                      screenSize.height * 0.8; // 80% of screen height

                  // Calculate grid dimensions
                  final columns = _calculateColumns(windows.length);
                  final rows = (windows.length / columns).ceil();

                  // Spacing between tiles
                  const spacing = 30.0;
                  const titleBarHeight =
                      32.0; // Height for icon + title below window
                  const minTileHeight = 120.0;
                  const maxTileHeight = 400.0;

                  // Calculate tile height to fit all windows without scrolling
                  // Account for title bar height in the calculation
                  final maxHeightPerRow =
                      (availableHeight -
                          (spacing * (rows - 1)) -
                          (titleBarHeight * rows)) /
                      rows;
                  final tileHeight = maxHeightPerRow.clamp(
                    minTileHeight,
                    maxTileHeight,
                  );

                  return Material(
                    color: Colors.transparent,
                    child: Wrap(
                      spacing: spacing,
                      runSpacing: spacing,
                      children: windows.asMap().entries.map((entry) {
                        final index = entry.key;
                        final window = entry.value;
                        final isFocused = index == focusedIndex.value;

                        return _WindowOverviewTile(
                          window: window,
                          isActive:
                              allWindows.isNotEmpty &&
                              allWindows.last.floatingWindowId ==
                                  window.floatingWindowId,
                          isFocused: isFocused,
                          onTap: () => selectWindow(index),
                          overviewTheme: overviewTheme,
                          targetHeight: tileHeight,
                          maxWidth:
                              (availableWidth - (spacing * (columns - 1))) /
                              columns,
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  int _calculateColumns(int windowCount) {
    // Calculate optimal number of columns based on window count
    if (windowCount <= 1) return 1;
    if (windowCount <= 4) return 2;
    if (windowCount <= 9) return 3;
    if (windowCount <= 16) return 4;
    if (windowCount <= 25) return 5;
    return 6;
  }
}

class _WindowOverviewTile extends ConsumerWidget {
  const _WindowOverviewTile({
    required this.window,
    required this.isActive,
    required this.isFocused,
    required this.onTap,
    required this.overviewTheme,
    required this.targetHeight,
    required this.maxWidth,
  });

  final FloatingWindowData window;
  final bool isActive;
  final bool isFocused;
  final VoidCallback onTap;
  final WindowOverviewThemeData overviewTheme;
  final double targetHeight;
  final double maxWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titlebarData = ref.watch(
      floatingWindowTitleStateProvider(window.floatingWindowId),
    );
    String buildTitle() {
      if (titlebarData.baseTitle.isNotEmpty &&
          titlebarData.title != null &&
          titlebarData.title!.isNotEmpty) {
        return '${titlebarData.baseTitle}: ${titlebarData.title ?? ''}';
      }
      if (titlebarData.baseTitle.isNotEmpty) {
        return titlebarData.baseTitle;
      }
      if (titlebarData.title != null && titlebarData.title!.isNotEmpty) {
        return titlebarData.title!;
      }

      return titlebarData.title ?? '';
    }

    // Get window size to calculate aspect ratio
    final windowSize = ref.watch(windowSizeProvider(window.floatingWindowId));
    final aspectRatio = windowSize != null && windowSize.height > 0
        ? windowSize.width / windowSize.height
        : 16 / 9; // Default aspect ratio

    // Calculate width based on target height and aspect ratio
    double height = targetHeight;
    double width = targetHeight * aspectRatio;

    // Clamp width to max width if necessary, then recalculate height
    if (width > maxWidth) {
      width = maxWidth;
      height = maxWidth / aspectRatio;
    }

    // Get themes
    final titleBarTheme = WindowManagerTheme.of(context).windowTitleBar;
    final windowTheme = WindowManagerTheme.of(context).window;

    return RepaintBoundary(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isFocused ? Colors.blue : Colors.transparent,
              width: isFocused ? 4 : 2,
            ),
            boxShadow: isFocused
                ? [
                    BoxShadow(
                      color: Colors.blue.withValues(alpha: 0.5),
                      blurRadius: 16,
                      spreadRadius: 4,
                    ),
                  ]
                : null,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title bar above window
              Container(
                height: 32,
                decoration: BoxDecoration(
                  color: windowTheme.backgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(6),
                    topRight: Radius.circular(6),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Icon(
                      window.taskbarIcon,
                      size: 16,
                      color: titleBarTheme.iconColor,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        buildTitle(),
                        style: TextStyle(
                          color: titleBarTheme.textColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
              // Window preview
              SizedBox(
                width: width,
                height: height,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(6),
                    bottomRight: Radius.circular(6),
                  ),
                  child: _buildWindowSnapshot(
                    context,
                    window,
                    buildTitle(),
                    ref,
                    windowTheme,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWindowSnapshot(
    BuildContext context,
    FloatingWindowData window,
    String title,
    WidgetRef ref,
    WindowThemeData windowTheme,
  ) {
    // Check if we have a snapshot for this window
    final snapshot = ref.watch(windowSnapshotProvider(window.floatingWindowId));

    if (snapshot != null) {
      // We have a snapshot, display it
      return Container(
        color: windowTheme.backgroundColor,
        child: Center(
          child: FittedBox(
            fit: BoxFit.contain,
            alignment: Alignment.center,
            child: SizedBox(
              width: snapshot.size.width,
              height: snapshot.size.height,
              child: RawImage(
                image: snapshot.image,
                filterQuality: FilterQuality.medium,
              ),
            ),
          ),
        ),
      );
    }

    // No snapshot, use the mockup preview
    return Container(
      color: windowTheme.backgroundColor,
      child: Center(
        child: AppCardMockUpPreview(
          title: title,
          icon: window.taskbarIcon,
        ),
      ),
    );
  }
}
