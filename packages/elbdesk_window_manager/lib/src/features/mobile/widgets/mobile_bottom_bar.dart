import 'package:elbdesk_window_manager/elbdesk_window_manager.dart';
import 'package:elbdesk_window_manager/src/localization/elbdesk_window_maanger_localizations_extension.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../floating_windows/providers/providers.dart';

class MobileBottomBar extends ConsumerWidget {
  const MobileBottomBar({
    this.additionalItems = const [],
    super.key,
  });

  final List<MobileTaskbarItem> additionalItems;

  static const double height = WindowManagerConstants.mobileBottomBarHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final windows = ref.watch(windowsListProvider);

    // Get the mobile bottom bar theme
    final theme = WindowManagerTheme.of(context);
    final mobileTheme = theme.mobileBottomBar;

    // Get active window count
    final minimizedWindows = ref.watch(
      allFloatingWindowsMinimizedStateProvider,
    );
    final activeWindowCount = windows
        .where((w) => !minimizedWindows.contains(w.floatingWindowId))
        .length;
    final l10n = context.windowManagerL10n;
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: theme.navigationBackgroundColor,

        border: Border(
          top: BorderSide(color: mobileTheme.borderColor),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // 1. Menu button (opens drawer)
          _buildBottomBarItem(
            context: context,
            icon: Icons.menu,
            label: l10n.menuLabel,
            mobileTheme: mobileTheme,
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
          ),

          // 2. Minimize all button
          _buildBottomBarItem(
            context: context,
            icon: Icons.minimize,
            label: l10n.minimizeAllLabel,
            isEnabled: activeWindowCount > 0,
            mobileTheme: mobileTheme,
            onTap: () {
              // Minimize all active windows
              ref.read(windowManagerProvider).minimizeAllWindows();
            },
          ),

          // 3. Windows overview
          _buildBottomBarItem(
            context: context,
            icon: Icons.window,
            label: l10n.windowsLabel,
            badge: windows.isNotEmpty ? windows.length.toString() : null,
            isEnabled: windows.isNotEmpty,
            mobileTheme: mobileTheme,
            onTap: () {
              // Show all windows menu
              _showAllWindowsMenu(context, ref, windows);
            },
          ),

          // 4. Additional custom items
          ...additionalItems.map(
            (item) => _buildBottomBarItem(
              context: context,
              icon: item.icon,
              label: item.label,
              badge: item.badge,
              isEnabled: item.isEnabled,
              mobileTheme: mobileTheme,
              onTap: item.onTap,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBarItem({
    required BuildContext context,
    required IconData icon,
    required String label,
    required MobileBottomBarThemeData mobileTheme,
    String? badge,
    bool isActive = false,
    bool isEnabled = true,
    required VoidCallback onTap,
  }) {
    final effectiveOnTap = isEnabled ? onTap : null;

    // Determine icon and text colors based on state
    final iconColor = isEnabled
        ? (isActive ? mobileTheme.activeIconColor : mobileTheme.iconColor)
        : mobileTheme.disabledIconColor;
    final textColor = isEnabled
        ? (isActive ? mobileTheme.activeTextColor : mobileTheme.textColor)
        : mobileTheme.disabledTextColor;

    return Expanded(
      child: InkWell(
        onTap: effectiveOnTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Icon(
                    icon,
                    size: 24,
                    color: iconColor,
                  ),
                  if (badge != null)
                    Positioned(
                      right: -8,
                      top: -4,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: mobileTheme.badgeBackgroundColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Center(
                          child: Text(
                            badge,
                            style: TextStyle(
                              color: mobileTheme.badgeTextColor,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAllWindowsMenu(
    BuildContext context,
    WidgetRef ref,
    List<FloatingWindowData> windows,
  ) {
    if (windows.isEmpty) return;
    final theme = WindowManagerTheme.of(context);
    showModalBottomSheet(
      context: context,

      builder: (context) => Container(
        color: theme.navigationBackgroundColor,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.windowManagerL10n.allWindowsTitle,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    context.windowManagerL10n.windowCount(
                      windows.length,
                    ),
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            ...windows.map((window) {
              final isMinimized = ref.watch(
                floatingWindowIsMinimizedStateProvider(window.floatingWindowId),
              );
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
                if (titlebarData.title != null &&
                    titlebarData.title!.isNotEmpty) {
                  return titlebarData.title!;
                }
                return titlebarData.title ?? '';
              }

              return ListTile(
                leading: Icon(window.taskbarIcon),
                title: Text(buildTitle()),
                subtitle: isMinimized
                    ? Text(
                        context.windowManagerL10n.minimizedLabel,
                      )
                    : null,
                trailing: IconButton(
                  icon: Icon(isMinimized ? Icons.restore : Icons.minimize),
                  onPressed: () {
                    if (isMinimized) {
                      ref
                          .read(windowManagerProvider)
                          .restoreWindow(window.floatingWindowId);
                      ref
                          .read(windowManagerProvider)
                          .bringToFront(window.floatingWindowId);
                    } else {
                      ref
                          .read(windowManagerProvider)
                          .minimizeWindow(window.floatingWindowId);
                    }
                    Navigator.pop(context);
                  },
                ),
                onTap: () {
                  if (isMinimized) {
                    ref
                        .read(windowManagerProvider)
                        .restoreWindow(window.floatingWindowId);
                    ref
                        .read(windowManagerProvider)
                        .bringToFront(window.floatingWindowId);
                  } else {
                    ref
                        .read(windowManagerProvider)
                        .bringToFront(window.floatingWindowId);
                  }
                  Navigator.pop(context);
                },
              );
            }),
            SizedBox(height: ref.watch(safeAreaPaddingProvider).bottom),
          ],
        ),
      ),
    );
  }
}
