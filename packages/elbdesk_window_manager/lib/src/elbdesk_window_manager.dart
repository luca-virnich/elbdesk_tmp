import 'package:elbdesk_platform_info/elbdesk_platform_info.dart';
import 'package:elbdesk_window_manager/elbdesk_window_manager.dart';
import 'package:elbdesk_window_manager/src/features/floating_windows/providers/state/dragging_mouse_cursor_state.dart';
import 'package:elbdesk_window_manager/src/features/floating_windows/providers/state/topmost_window_positions_provider.dart';
import 'package:elbdesk_window_manager/src/features/taskbar/providers/taskbar_window_order_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'features/floating_windows/providers/providers.dart';
import 'features/floating_windows/widgets/minimize_animation_overlay.dart';
import 'features/floating_windows/widgets/windows_stack_optimized.dart';
import 'features/keyboard_shortcuts/intents/window_manager_intent.dart';
import 'features/mobile/mobile_state.dart';
import 'features/window_overview/dialogs/window_overview_dialog.dart';

class ElbDeskWindowManager extends HookConsumerWidget {
  const ElbDeskWindowManager({
    required this.userId,
    required this.environment,
    required this.sideNavigation,
    required this.child,
    this.topHeader,
    this.allowWindowsOutsideView = false,
    this.mobileBreakpoint = 600,

    this.stackTaskbarTiles = false,
    this.statusBar,
    this.shortcuts = const {},
    this.actions = const {},
    this.language = 'en',

    this.mobileTaskbarItems = const [],
    super.key,
  });

  final int userId;
  final String environment;
  final Widget sideNavigation;
  final Widget child;
  final Widget? topHeader;
  final bool allowWindowsOutsideView;
  final double mobileBreakpoint;

  final bool stackTaskbarTiles;
  final Widget? statusBar;

  final String language;

  final List<MobileTaskbarItem> mobileTaskbarItems;
  final Map<ShortcutActivator, Intent> shortcuts;
  final Map<Type, Action<Intent>> actions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // DON'T REMOVE THIS
    ref.listen(topmostWindowPositionsProvider, (previous, next) {});
    ref.listen(allowWindowsOutsideViewProvider, (previous, next) {});
    ref.listen(backgroundWindowOverlayColorProvider, (previous, next) {});
    ref.listen(draggingWindowIdProvider, (previous, next) {});
    ref.listen(edgeSnapPreviewProvider, (previous, next) {});
    ref.listen(showTitlebarBaseTitleProvider, (previous, next) {});
    ref.listen(taskbarWindowOrderProvider, (previous, next) {});
    ref.listen(safeAreaPaddingProvider, (previous, next) {});
    ref.listen(viewInsetsProvider, (previous, next) {});

    // Update MediaQuery values whenever they change
    final padding = MediaQuery.paddingOf(context);
    final viewInsets = MediaQuery.viewInsetsOf(context);

    useEffect(() {
      // Update providers with current MediaQuery values
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(safeAreaPaddingProvider.notifier).updatePadding(padding);
        ref.read(viewInsetsProvider.notifier).updateInsets(viewInsets);
      });
      return null;
    }, [padding, viewInsets]);

    // Update localizations when language changes

    // Update user and environment when they change
    useEffect(() {
      WindowManagerInitialization.instance.setUserAndEnvironment(
        userId,
        environment,
      );
      WindowManagerInitialization.instance.setMobileBreakpoint(
        mobileBreakpoint,
      );
      return null; // No cleanup needed
    }, [userId, environment, mobileBreakpoint]);

    // Set the allow windows outside view setting
    useEffect(() {
      // Using a microtask to ensure this runs after the current build
      Future.microtask(() {
        ref
            .read(allowWindowsOutsideViewProvider.notifier)
            .update(allowWindowsOutsideView);
      });
      return null; // No cleanup needed
    }, [allowWindowsOutsideView]);

    // Set the status bar height

    final windows = ref.watch(windowsListProvider);

    // Update safe area padding when it changes

    // Define default shortcuts
    final defaultShortcuts = <ShortcutActivator, Intent>{
      LogicalKeySet(LogicalKeyboardKey.alt, LogicalKeyboardKey.tab):
          const ToggleWindowOverviewIntent(),
      LogicalKeySet(
        LogicalKeyboardKey.control,
        LogicalKeyboardKey.tab,
      ): const ToggleWindowOverviewIntent(),
    };

    // Merge user shortcuts with defaults (user shortcuts take precedence)
    final mergedShortcuts = <ShortcutActivator, Intent>{
      ...defaultShortcuts,
      ...shortcuts,
    };

    // Get theme from context
    // final theme = WindowManagerTheme.of(context);

    return Builder(
      builder: (themeContext) {
        // Define default actions that can access the theme context
        final defaultActions = <Type, Action<Intent>>{
          ToggleWindowOverviewIntent:
              CallbackAction<ToggleWindowOverviewIntent>(
                onInvoke: (ToggleWindowOverviewIntent intent) {
                  // Only open overview if there are windows
                  if (windows.isNotEmpty) {
                    showWindowOverviewDialog(themeContext, ref);
                  }
                  return null;
                },
              ),
        };

        // Merge user actions with defaults (user actions take precedence)
        final mergedActions = <Type, Action<Intent>>{
          ...defaultActions,
          ...actions,
        };
        final theme = WindowManagerTheme.of(themeContext);
        return Shortcuts(
          shortcuts: mergedShortcuts,
          child: Actions(
            actions: mergedActions,
            child: Focus(
              autofocus: true,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile =
                      constraints.maxWidth < mobileBreakpoint ||
                      ElbDeskPlatformInfo.isMobileDevice;

                  // Auto-generate drawer from ExpandableSideNavigation if no custom drawer provided

                  // Get the navigation background color for chrome UI

                  // Create the main content with SafeArea
                  Widget mainContent = SafeArea(
                    child: Stack(
                      children: [
                        // Main layout
                        Column(
                          children: [
                            // Top Header - no menu button on mobile (it's in the bottom bar)
                            if (topHeader != null)
                              ColoredBox(
                                color: theme.navigationBackgroundColor,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                  child: topHeader!,
                                ),
                              ),

                            // Main Content Area with side navigation
                            Expanded(
                              child: Row(
                                children: [
                                  // Side Navigation - only show on desktop
                                  if (!isMobile)
                                    Container(
                                      color: theme.navigationBackgroundColor,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          top: 24,
                                        ),
                                        child: sideNavigation,
                                      ),
                                    ),

                                  // Main content with rounded corners on left side (desktop only)
                                  Expanded(
                                    child: isMobile
                                        ? Container(
                                            color: theme.contentBackgroundColor,
                                            child: child,
                                          )
                                        : Container(
                                            color:
                                                theme.navigationBackgroundColor,

                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                left: 0,
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: theme
                                                      .contentBackgroundColor,

                                                  borderRadius:
                                                      BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                              16,
                                                            ),
                                                        bottomLeft:
                                                            Radius.circular(
                                                              16,
                                                            ),
                                                      ),
                                                ),
                                                child: child,
                                              ),
                                            ),
                                          ),
                                  ),
                                ],
                              ),
                            ),

                            // Bottom Bar - Desktop taskbar or mobile bottom bar
                            if (isMobile)
                              MobileBottomBar(
                                additionalItems: mobileTaskbarItems,
                              )
                            else
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height:
                                        WindowManagerConstants
                                            .desktopTaskbarHeight +
                                        32,
                                  ),
                                  // DesktopTaskbar(
                                  //   stackTiles: stackTaskbarTiles,
                                  // ),
                                  // if (statusBar != null)
                                  //   ColoredBox(
                                  //     color: theme.statusBar.backgroundColor,
                                  //     child: statusBar!,
                                  //   ),
                                ],
                              ),
                          ],
                        ),

                        // Wrap window-related widgets with MobileState
                        MobileState(
                          isMobile: isMobile,
                          mobileBreakpoint: mobileBreakpoint,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              // Edge snap preview - below windows
                              // const EdgeSnapPreviewConsumer(),
                              // All windows - optimized architecture for any number of windows
                              const WindowsStackOptimized(),
                              // Minimize/restore animations - above windows
                              const MinimizeAnimationOverlay(),
                            ],
                          ),
                        ),
                        if (!isMobile)
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Column(
                              children: [
                                DesktopTaskbar(
                                  stackTiles: stackTaskbarTiles,
                                ),
                                if (statusBar != null)
                                  ColoredBox(
                                    color: theme.statusBar.backgroundColor,
                                    child: statusBar!,
                                  ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  );

                  // Build the scaffold with proper background color
                  final draggingMouseCursor = ref.watch(
                    draggingMouseCursorStateProvider,
                  );
                  return MouseRegion(
                    cursor: draggingMouseCursor ?? MouseCursor.defer,
                    child: AbsorbPointer(
                      absorbing: draggingMouseCursor != null,
                      child: Scaffold(
                        resizeToAvoidBottomInset: false,
                        backgroundColor: theme.navigationBackgroundColor,
                        drawer: sideNavigation,
                        body: SafeArea(child: mainContent),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
