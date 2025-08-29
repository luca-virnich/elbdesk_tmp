import 'package:elbdesk_window_manager/src/features/floating_windows/widgets/edge_snap_preview_consumer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/management/open_windows_provider.dart';
import '../providers/management/window_z_order_provider.dart';
import '../providers/state/topmost_window_positions_provider.dart';
import '../services/window_registry.dart';
import '../services/window_size_preferences.dart';
import 'floating_window.dart';

/// Optimized stack widget that caches windows to prevent unnecessary rebuilds
class WindowsStackOptimized extends ConsumerStatefulWidget {
  const WindowsStackOptimized({super.key});

  @override
  ConsumerState<WindowsStackOptimized> createState() =>
      _WindowsStackOptimizedState();
}

class _WindowsStackOptimizedState extends ConsumerState<WindowsStackOptimized> {
  // Cache for window widgets to prevent rebuilds
  final Map<String, _CachedWindow> _windowCache = {};

  @override
  void dispose() {
    _windowCache.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Watch z-order to maintain correct stacking
    final windowOrder = ref.watch(windowZOrderProvider);

    if (windowOrder.isEmpty) {
      return const SizedBox.expand();
    }

    // Clean up cache - remove windows that no longer exist
    final currentWindowIds = windowOrder.toSet();
    final cachedWindowIds = _windowCache.keys.toSet();
    final windowsToRemove = cachedWindowIds.difference(currentWindowIds);

    for (final windowId in windowsToRemove) {
      _windowCache.remove(windowId);
    }

    // Build the stack with cached windows
    final List<Widget> windowWidgets = <Widget>[];

    for (final windowId in windowOrder) {
      // Get or create cached window
      final cachedWindow = _windowCache.putIfAbsent(
        windowId,
        () => _CachedWindow(
          key: ValueKey(windowId),
          windowId: windowId,
        ),
      );

      // FloatingWindow returns a Positioned widget, so it must be direct child of Stack
      windowWidgets.add(cachedWindow);
    }

    if (windowWidgets.isNotEmpty) {
      final snapPreview = const EdgeSnapPreviewConsumer();
      windowWidgets.insert(windowWidgets.length - 1, snapPreview);
    }

    return Stack(
      clipBehavior: Clip.none,
      children: windowWidgets,
    );
  }
}

/// Individual cached window that manages its own state and prevents rebuilds
class _CachedWindow extends ConsumerWidget {
  const _CachedWindow({
    super.key,
    required this.windowId,
  });

  final String windowId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Only watch this specific window's data
    final windowData = ref.watch(
      openWindowsProvider.select((windows) => windows[windowId]),
    );

    if (windowData == null) {
      return const SizedBox.shrink();
    }

    // Get the window type name
    final windowType = windowData.runtimeType.toString();

    // Load saved preferences for this window type
    final savedConfig = WindowPreferences.loadWindowConfig(windowType);

    // Get default position from saved config or defaults
    final defaultPosition = Offset(
      savedConfig.position?.dx ?? 100.0,
      savedConfig.position?.dy ?? 100.0,
    );

    // Get screen size for cascade bounds
    final screenSize = MediaQuery.sizeOf(context);

    // Get position with cascade from topmost window of same type
    final position = ref
        .read(topmostWindowPositionsProvider.notifier)
        .getPositionForNewWindow(windowType, defaultPosition, screenSize);

    double initialX = position.dx;
    double initialY = position.dy;

    // Update the provider with this window's position so the next window cascades from here
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(topmostWindowPositionsProvider.notifier)
          .updatePosition(windowType, Offset(initialX, initialY));
    });

    // Ensure windows don't cascade too far off screen
    final maxX = screenSize.width - 200; // Leave at least 200px visible
    final maxY = screenSize.height - 200; // Leave at least 200px visible

    // Clamp position to screen bounds
    initialX = initialX.clamp(0, maxX);
    initialY = initialY.clamp(0, maxY);

    // Ensure saved size respects current minimum constraints
    double initialWidth =
        savedConfig.size?.width ?? windowData.defaultSize.width;
    double initialHeight =
        savedConfig.size?.height ?? windowData.defaultSize.height;

    // Clamp to minimum size if saved size is too small
    if (initialWidth < windowData.minSize.width) {
      initialWidth = windowData.minSize.width;
    }
    if (initialHeight < windowData.minSize.height) {
      initialHeight = windowData.minSize.height;
    }

    // FloatingWindow returns a Positioned widget, so it must be a direct child of Stack
    // However, we can wrap the child content in RepaintBoundary
    return FloatingWindow(
      key: ValueKey(windowId),
      windowId: windowId,
      windowType: windowType,
      initialX: initialX,
      initialY: initialY,
      initialWidth: initialWidth,
      initialHeight: initialHeight,
      minWidth: windowData.minSize.width,
      minHeight: windowData.minSize.height,
      child: RepaintBoundary(
        child: _WindowContent(
          key: ValueKey('${windowId}_content'),
          windowId: windowId,
          windowData: windowData,
        ),
      ),
    );
  }
}

/// Separate widget for window content to further isolate rebuilds
class _WindowContent extends StatefulWidget {
  const _WindowContent({
    super.key,
    required this.windowId,
    required this.windowData,
  });

  final String windowId;
  final dynamic windowData;

  @override
  State<_WindowContent> createState() => _WindowContentState();
}

class _WindowContentState extends State<_WindowContent>
    with AutomaticKeepAliveClientMixin {
  Widget? _cachedContent;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _buildContent();
  }

  @override
  void didUpdateWidget(_WindowContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Only rebuild if window data actually changed
    if (oldWidget.windowData != widget.windowData) {
      _buildContent();
    }
  }

  void _buildContent() {
    _cachedContent = WindowRegistry.buildWindow(context, widget.windowData);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required for AutomaticKeepAliveClientMixin

    return _cachedContent!;
  }
}
