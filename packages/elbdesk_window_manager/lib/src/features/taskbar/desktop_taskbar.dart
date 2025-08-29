import 'package:elbdesk_window_manager/src/localization/elbdesk_window_maanger_localizations_extension.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../theme/taskbar_theme_data.dart';
import '../../theme/window_manager_theme.dart';
import '../floating_windows/models/floating_window_data.dart';
import '../floating_windows/providers/providers.dart';
import '../window_overview/dialogs/window_overview_dialog.dart';
import 'providers/taskbar_window_order_provider.dart';
import 'widgets/hover_icon_button.dart';
import 'widgets/stacked_taskbar_tile.dart';
import 'widgets/taskbar_tile.dart';

// Provider to track which stacked tile overlay is currently open
final activeStackedTileProvider = StateProvider<String?>((ref) => null);

class DesktopTaskbar extends ConsumerStatefulWidget {
  const DesktopTaskbar({
    this.stackTiles = false,
    super.key,
  });

  final bool stackTiles;

  @override
  ConsumerState<DesktopTaskbar> createState() => _DesktopTaskbarState();
}

class _DesktopTaskbarState extends ConsumerState<DesktopTaskbar> {
  final ScrollController _scrollController = ScrollController();
  bool _showLeftChevron = false;
  bool _showRightChevron = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateChevronVisibility);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateChevronVisibility);
    _scrollController.dispose();
    super.dispose();
  }

  void _updateChevronVisibility() {
    if (!_scrollController.hasClients) return;

    setState(() {
      _showLeftChevron = _scrollController.offset > 0;
      _showRightChevron =
          _scrollController.offset < _scrollController.position.maxScrollExtent;
    });
  }

  void _scrollTaskbar(bool scrollRight) {
    if (!_scrollController.hasClients) return;

    const double scrollAmount = 200.0;
    final double targetOffset = scrollRight
        ? (_scrollController.offset + scrollAmount).clamp(
            0.0,
            _scrollController.position.maxScrollExtent,
          )
        : (_scrollController.offset - scrollAmount).clamp(0.0, double.infinity);

    _scrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    // Update the provider with the new order
    ref
        .read(taskbarWindowOrderProvider.notifier)
        .reorderWindows(oldIndex, newIndex);
  }

  @override
  Widget build(BuildContext context) {
    final windows = ref.watch(windowsListProvider);

    // Get the window manager theme
    final theme = WindowManagerTheme.of(context);
    final taskbarTheme = theme.taskbar;

    // Get the current order from the provider - this is our single source of truth
    final orderedWindowIds = ref.watch(taskbarWindowOrderProvider);

    // Process windows based on stacking preference
    final List<dynamic> taskbarItems;
    if (widget.stackTiles) {
      // Group windows by type while maintaining order
      final groupedWindows = <String, List<FloatingWindowData>>{};
      final groupOrder = <String>[];

      for (final windowId in orderedWindowIds) {
        final window = windows.firstWhere(
          (w) => w.floatingWindowId == windowId,
        );
        final windowType = window.runtimeType.toString();

        if (!groupedWindows.containsKey(windowType)) {
          groupOrder.add(windowType);
        }
        groupedWindows.putIfAbsent(windowType, () => []).add(window);
      }

      // Create taskbar items maintaining the order
      taskbarItems = [];
      for (final type in groupOrder) {
        final windowList = groupedWindows[type]!;
        taskbarItems.add({
          'type': type,
          'windows': windowList,
          'isStacked': windowList.length > 1,
          'key': type,
        });
      }
    } else {
      // Create individual tiles maintaining order
      taskbarItems = [];
      for (final windowId in orderedWindowIds) {
        final window = windows.firstWhere(
          (w) => w.floatingWindowId == windowId,
        );
        taskbarItems.add({
          'type': window.runtimeType.toString(),
          'windows': [window],
          'isStacked': false,
          'key': windowId,
        });
      }
    }

    // Update chevron visibility after build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateChevronVisibility();
    });

    return Container(
      height: taskbarTheme.height,
      decoration: BoxDecoration(
        color: theme.navigationBackgroundColor,
      ),
      child: Row(
        children: [
          const SizedBox(width: 8),
          // Minimize/Maximize all buttons
          _MinimizeMaximizeButtons(
            windows: windows,
            taskbarTheme: taskbarTheme,
          ),

          if (taskbarItems.isNotEmpty) ...[
            Container(
              width: 1,
              height: 24,
              color: taskbarTheme.borderColor,
            ),
            const SizedBox(width: 8),
          ],

          // Window tiles with chevron navigation
          Expanded(
            child: RepaintBoundary(
              child: _TaskbarWindowList(
                taskbarItems: taskbarItems,
                windows: windows,
                scrollController: _scrollController,
                showLeftChevron: _showLeftChevron,
                showRightChevron: _showRightChevron,
                onScrollLeft: () => _scrollTaskbar(false),
                onScrollRight: () => _scrollTaskbar(true),
                taskbarTheme: taskbarTheme,
                onReorder: _onReorder,
                stackTiles: widget.stackTiles,
              ),
            ),
          ),

          // Overview button
          _OverviewButton(
            windows: windows,
            taskbarTheme: taskbarTheme,
          ),
        ],
      ),
    );
  }
}

class _MinimizeMaximizeButtons extends ConsumerWidget {
  const _MinimizeMaximizeButtons({
    required this.windows,
    required this.taskbarTheme,
  });

  final List<FloatingWindowData> windows;
  final TaskbarThemeData taskbarTheme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.windowManagerL10n;
    return Row(
      children: [
        // Minimize all button
        HoverIconButton(
          icon: Icon(
            Icons.remove,
            size: 20,
          ),
          iconColor:
              windows.any(
                (w) => !ref.watch(
                  floatingWindowIsMinimizedStateProvider(w.floatingWindowId),
                ),
              )
              ? taskbarTheme.getMinimizeAllIconColor()
              : taskbarTheme.getMinimizeAllIconDisabledColor(),
          tooltip: l10n.minimizeAllTooltip,
          hoverBackgroundColor: taskbarTheme.iconButtonHoverBackgroundColor,
          borderRadius: taskbarTheme.iconButtonBorderRadius,
          onPressed:
              windows.any(
                (w) => !ref.watch(
                  floatingWindowIsMinimizedStateProvider(w.floatingWindowId),
                ),
              )
              ? () {
                  ref.read(windowManagerProvider).minimizeAllWindows();
                }
              : null,
        ),
        const SizedBox(width: 4),
        // Restore all button
        HoverIconButton(
          icon: Icon(
            Icons.open_in_new,
            size: 20,
          ),
          iconColor:
              windows.any(
                (w) => ref.watch(
                  floatingWindowIsMinimizedStateProvider(w.floatingWindowId),
                ),
              )
              ? taskbarTheme.getRestoreAllIconColor()
              : taskbarTheme.getRestoreAllIconDisabledColor(),
          tooltip: l10n.restoreAllTooltip,
          hoverBackgroundColor: taskbarTheme.iconButtonHoverBackgroundColor,
          borderRadius: taskbarTheme.iconButtonBorderRadius,
          onPressed:
              windows.any(
                (w) => ref.watch(
                  floatingWindowIsMinimizedStateProvider(w.floatingWindowId),
                ),
              )
              ? () {
                  final minimizedWindows = ref.read(
                    allFloatingWindowsMinimizedStateProvider,
                  );
                  for (final window in windows) {
                    if (minimizedWindows.contains(window.floatingWindowId)) {
                      ref
                          .read(windowManagerProvider)
                          .restoreWindow(window.floatingWindowId);
                      ref
                          .read(windowManagerProvider)
                          .bringToFront(window.floatingWindowId);
                    }
                  }
                }
              : null,
        ),
      ],
    );
  }
}

class _TaskbarWindowList extends ConsumerWidget {
  const _TaskbarWindowList({
    required this.taskbarItems,
    required this.windows,
    required this.scrollController,
    required this.showLeftChevron,
    required this.showRightChevron,
    required this.onScrollLeft,
    required this.onScrollRight,
    required this.taskbarTheme,
    required this.onReorder,
    required this.stackTiles,
  });

  final List<dynamic> taskbarItems;
  final List<FloatingWindowData> windows;
  final ScrollController scrollController;
  final bool showLeftChevron;
  final bool showRightChevron;
  final VoidCallback onScrollLeft;
  final VoidCallback onScrollRight;
  final TaskbarThemeData taskbarTheme;
  final void Function(int, int) onReorder;
  final bool stackTiles;

  String _getDisplayName(String windowType) {
    // Extract the class name from the full type string
    final match = RegExp(r'(\w+)WindowData').firstMatch(windowType);
    if (match != null) {
      final name = match.group(1) ?? windowType;
      // Add spacing between camelCase words
      return name.replaceAllMapped(
        RegExp(r'([a-z])([A-Z])'),
        (Match m) => '${m[1]} ${m[2]}',
      );
    }
    return windowType;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.windowManagerL10n;
    return Stack(
      children: [
        // Scrollable window list
        taskbarItems.isEmpty
            ? Center(
                child: Text(
                  l10n.noOpenWindows,
                  style: TextStyle(
                    fontSize: 12,
                    color: taskbarTheme.textDisabledColor,
                  ),
                ),
              )
            : Container(
                height: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 8,
                ),
                child: ReorderableListView.builder(
                  scrollController: scrollController,
                  scrollDirection: Axis.horizontal,
                  buildDefaultDragHandles: false,
                  proxyDecorator: (child, index, animation) {
                    return AnimatedBuilder(
                      animation: animation,
                      builder: (context, child) {
                        final animValue = Curves.easeInOut.transform(
                          animation.value,
                        );
                        return Material(
                          elevation: 8,
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          child: Transform.scale(
                            scale:
                                1.0 +
                                (animValue *
                                    0.1), // Slightly scale up when dragging
                            child: Opacity(
                              opacity: 0.8, // Make it slightly transparent
                              child: child,
                            ),
                          ),
                        );
                      },
                      child: child,
                    );
                  },
                  onReorder: onReorder,
                  itemCount: taskbarItems.length,
                  itemBuilder: (context, index) {
                    final item = taskbarItems[index];
                    final isStacked = item['isStacked'] as bool;
                    final itemWindows =
                        item['windows'] as List<FloatingWindowData>;
                    final windowType = item['type'] as String;
                    final itemKey = item['key'] as String;

                    Widget tileWidget;
                    if (isStacked) {
                      tileWidget = StackedTaskbarTile(
                        key: ValueKey(itemKey),
                        windows: itemWindows,
                        windowType: _getDisplayName(windowType),
                        tileId: windowType,
                        onHoverChanged: (isHovered) {
                          if (isHovered) {
                            ref.read(activeStackedTileProvider.notifier).state =
                                windowType;
                          }
                        },
                      );
                    } else {
                      final window = itemWindows.first;
                      // Find if this window is active (last in the original unsorted list)
                      final isActive =
                          windows.isNotEmpty &&
                          windows.last.floatingWindowId ==
                              window.floatingWindowId &&
                          !ref.watch(
                            floatingWindowIsMinimizedStateProvider(
                              window.floatingWindowId,
                            ),
                          );

                      tileWidget = TaskbarTile(
                        key: ValueKey(itemKey),
                        window: window,
                        isActive: isActive,
                      );
                    }

                    return ReorderableDragStartListener(
                      key: ValueKey(itemKey),
                      index: index,
                      child: Container(
                        margin: EdgeInsets.only(
                          right: index < taskbarItems.length - 1 ? 16 : 0,
                        ),
                        child: tileWidget,
                      ),
                    );
                  },
                ),
              ),

        // Left chevron
        if (showLeftChevron)
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: HoverIconButton(
              icon: Icon(
                Icons.chevron_left,
                size: 20,
              ),
              iconColor: taskbarTheme.getChevronIconColor(),
              hoverBackgroundColor: taskbarTheme.iconButtonHoverBackgroundColor,
              borderRadius: taskbarTheme.iconButtonBorderRadius,
              onPressed: onScrollLeft,
              tooltip: l10n.scrollLeftTooltip,
            ),
          ),

        // Right chevron
        if (showRightChevron)
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: HoverIconButton(
              icon: Icon(
                Icons.chevron_right,
                size: 20,
              ),
              iconColor: taskbarTheme.getChevronIconColor(),
              hoverBackgroundColor: taskbarTheme.iconButtonHoverBackgroundColor,
              borderRadius: taskbarTheme.iconButtonBorderRadius,
              onPressed: onScrollRight,
              tooltip: l10n.scrollRightTooltip,
            ),
          ),
      ],
    );
  }
}

class _OverviewButton extends ConsumerWidget {
  const _OverviewButton({
    required this.windows,
    required this.taskbarTheme,
  });

  final List<FloatingWindowData> windows;
  final TaskbarThemeData taskbarTheme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.windowManagerL10n;
    return Container(
      width: 48,
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: taskbarTheme.borderColor,
          ),
        ),
      ),
      child: Center(
        child: HoverIconButton(
          icon: Icon(
            Icons.window,
            size: 20,
          ),
          iconColor: windows.isEmpty
              ? taskbarTheme.getOverviewIconDisabledColor()
              : taskbarTheme.getOverviewIconColor(),
          hoverBackgroundColor: taskbarTheme.iconButtonHoverBackgroundColor,
          borderRadius: taskbarTheme.iconButtonBorderRadius,
          onPressed: windows.isNotEmpty
              ? () {
                  showWindowOverviewDialog(context, ref);
                }
              : null,
          tooltip: l10n.showWindowOverviewTooltip,
        ),
      ),
    );
  }
}
