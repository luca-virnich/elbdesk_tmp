import 'package:elbdesk_window_manager/elbdesk_window_manager.dart';
import 'package:elbdesk_window_manager/src/localization/elbdesk_window_maanger_localizations_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Provider for side navigation expanded state
final sideNavigationExpandedProvider = StateProvider<bool>((ref) => true);

/// Expandable side navigation widget that can toggle between icon-only and icon+text modes
class ExpandableSideNavigation extends HookConsumerWidget {
  const ExpandableSideNavigation({
    required this.items,
    this.expandedWidth = 250,
    this.collapsedWidth = 72,
    this.backgroundColor,
    this.selectedColor,

    this.isMobile = false,
    super.key,
  });

  /// Navigation items to display
  final List<SideNavigationItem> items;

  /// Width when expanded (showing icons and text)
  final double expandedWidth;

  /// Width when collapsed (showing only icons)
  final double collapsedWidth;

  /// Background color of the navigation
  final Color? backgroundColor;

  /// Color for selected/active items
  final Color? selectedColor;

  final bool isMobile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile =
        MediaQuery.sizeOf(context).width <
        WindowManagerInitialization.instance.mobileBreakpoint;
    final isExpanded = isMobile
        ? true
        : ref.watch(sideNavigationExpandedProvider);
    // Get the window manager theme
    final theme = WindowManagerTheme.of(context);
    final sideNavTheme = theme.sideNavigation;

    // Use theme widths
    final effectiveExpandedWidth = sideNavTheme.expandedWidth;
    final effectiveCollapsedWidth = sideNavTheme.collapsedWidth;

    final l10n = context.windowManagerL10n;

    useEffect(() {
      if (!isMobile) {
        if (Scaffold.of(context).isDrawerOpen) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Scaffold.of(context).closeDrawer();
          });
        }
      }
      return null;
    }, [isMobile]);

    return RepaintBoundary(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: isExpanded ? effectiveExpandedWidth : effectiveCollapsedWidth,
        child: ColoredBox(
          color: theme.navigationBackgroundColor,
          child: SafeArea(
            child: Column(
              children: [
                if (isMobile)
                  const SizedBox(
                    height: 16,
                  ),
                // Navigation items
                Expanded(
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(
                      context,
                    ).copyWith(scrollbars: false),
                    child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];

                        if (item is SideNavigationDivider) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: isExpanded ? 16 : 8,
                              vertical: 0,
                            ),
                            child: Divider(
                              color: sideNavTheme.dividerColor,
                            ),
                          );
                        }

                        if (item is SideNavigationSection) {
                          return _SideNavigationSectionWidget(
                            title: item.title,
                            isExpanded: isExpanded,
                          );
                        }

                        if (item is SideNavigationMenuItem) {
                          return _SideNavigationMenuItemWidget(
                            item: item,
                            index: index,
                            isMobile: isMobile,
                            isExpanded: isExpanded,
                            selectedColor: selectedColor,
                          );
                        }

                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ),
                if (isMobile)
                  const SizedBox(
                    height: 16,
                  ),
                // Divider above collapse button
                if (!isMobile)
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Divider(
                      height: 1,
                      color: sideNavTheme.dividerColor,
                    ),
                  ),

                // Expand/Collapse button
                if (!isMobile)
                  Container(
                    padding: const EdgeInsets.only(left: 24), // 16px from left
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Tooltip(
                        message: isExpanded
                            ? l10n.collapseTooltip
                            : l10n.expandTooltip,
                        child: IconButton(
                          onPressed: () {
                            ref
                                    .read(
                                      sideNavigationExpandedProvider.notifier,
                                    )
                                    .state =
                                !isExpanded;
                          },
                          visualDensity: VisualDensity.compact,
                          padding: EdgeInsets.zero,
                          icon: RepaintBoundary(
                            child: AnimatedRotation(
                              duration: const Duration(milliseconds: 200),
                              turns: isExpanded ? 0 : 0.5,
                              child: Icon(
                                Icons.keyboard_double_arrow_left,
                                size: 20,
                                color: sideNavTheme.expandCollapseButtonColor,
                              ),
                            ),
                          ),
                          style:
                              IconButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    sideNavTheme.itemBorderRadius,
                                  ),
                                ),
                              ).copyWith(
                                backgroundColor:
                                    WidgetStateProperty.resolveWith((
                                      states,
                                    ) {
                                      if (states.contains(
                                        WidgetState.hovered,
                                      )) {
                                        return sideNavTheme.hoverColor;
                                      }
                                      return Colors.transparent;
                                    }),
                              ),
                        ),
                      ),
                    ),
                  ),

                // Divider below collapse button
                if (!isMobile)
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Divider(
                      height: 1,
                      color: sideNavTheme.dividerColor,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Widget for rendering a side navigation menu item
class _SideNavigationMenuItemWidget extends ConsumerWidget {
  const _SideNavigationMenuItemWidget({
    required this.item,
    required this.index,
    required this.isExpanded,
    required this.isMobile,
    this.selectedColor,
  });

  final SideNavigationMenuItem item;
  final int index;
  final bool isExpanded;
  final Color? selectedColor;
  final bool isMobile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the window manager theme
    final theme = WindowManagerTheme.of(context);
    final sideNavTheme = theme.sideNavigation;

    final isSelected = item.isSelected;

    return Tooltip(
      message: isExpanded ? '' : item.label,
      waitDuration: const Duration(milliseconds: 500),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(
            sideNavTheme.itemBorderRadius,
          ),
          child: InkWell(
            onTap: item.onTap != null
                ? () {
                    item.onTap!();
                    if (isMobile) {
                      Scaffold.of(context).closeDrawer();
                    }
                  }
                : null,
            hoverColor: sideNavTheme.hoverColor,
            splashFactory: NoSplash.splashFactory,
            borderRadius: BorderRadius.circular(
              sideNavTheme.itemBorderRadius,
            ),
            child: Container(
              height: 40,
              padding: const EdgeInsets.only(left: 8, right: 8),
              decoration: BoxDecoration(
                color: isSelected
                    ? (selectedColor ?? sideNavTheme.selectedBackgroundColor)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(
                  sideNavTheme.itemBorderRadius,
                ),
                border: isSelected
                    ? Border(
                        left: BorderSide(
                          color:
                              selectedColor ?? sideNavTheme.selectedBorderColor,
                          width: 3,
                        ),
                      )
                    : null,
              ),
              child: Row(
                children: [
                  // Icon with badge support
                  SizedBox(
                    width: 40,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Center(
                          child: Icon(
                            item.icon,
                            size: 24,
                            color: isSelected
                                ? (selectedColor ??
                                      sideNavTheme.selectedIconColor)
                                : sideNavTheme.iconColor,
                          ),
                        ),
                        // Badge if enabled
                        if (item.showBadge)
                          Positioned(
                            top: -2,
                            left: -2,
                            child: Container(
                              width: item.badgeCount == null
                                  ? 18
                                  : item.badgeCount! > 9
                                  ? 22
                                  : 18,
                              height: item.badgeCount == null
                                  ? 18
                                  : item.badgeCount! > 9
                                  ? 22
                                  : 18,
                              decoration: BoxDecoration(
                                color: item.badgeColor ?? Colors.red,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: theme.navigationBackgroundColor,
                                  width: 2,
                                ),
                              ),
                              child: item.badgeCount != null
                                  ? Center(
                                      child: Text(
                                        item.badgeCount! > 9
                                            ? '9+'
                                            : item.badgeCount.toString(),
                                        style: TextStyle(
                                          color:
                                              item.badgeForegroundColor ??
                                              Colors.white,
                                          fontSize: item.badgeCount! > 9
                                              ? 9
                                              : 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  : null,
                            ),
                          ),
                      ],
                    ),
                  ),
                  // Text area that expands/collapses
                  Expanded(
                    child: ClipRect(
                      child: AnimatedAlign(
                        duration: const Duration(milliseconds: 200),
                        alignment: Alignment.centerLeft,
                        widthFactor: isExpanded ? 1.0 : 0.0,
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 150),
                          opacity: isExpanded ? 1.0 : 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 4),
                            child: Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    item.label,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: isSelected
                                          ? (selectedColor ??
                                                sideNavTheme.selectedTextColor)
                                          : sideNavTheme.textColor,
                                      fontWeight: isSelected
                                          ? FontWeight.w500
                                          : null,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softWrap: false,
                                  ),
                                ),
                                if (item.trailing != null) ...[
                                  const SizedBox(width: 8),
                                  item.trailing!,
                                ],
                              ],
                            ),
                          ),
                        ),
                      ),
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
}

/// Base class for side navigation items
abstract class SideNavigationItem {}

/// A menu item in the side navigation
class SideNavigationMenuItem extends SideNavigationItem {
  SideNavigationMenuItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.isSelected = false,
    this.trailing,
    this.showBadge = false,
    this.badgeCount,
    this.badgeColor,
    this.badgeForegroundColor,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final bool isSelected;
  final Widget? trailing;
  final bool showBadge;
  final int? badgeCount;
  final Color? badgeColor;
  final Color? badgeForegroundColor;
}

/// A section header in the side navigation
class SideNavigationSection extends SideNavigationItem {
  SideNavigationSection({
    required this.title,
  });

  final String title;
}

/// A divider in the side navigation
class SideNavigationDivider extends SideNavigationItem {
  SideNavigationDivider();
}

/// Widget for rendering a section title with divider lines
class _SideNavigationSectionWidget extends ConsumerWidget {
  const _SideNavigationSectionWidget({
    required this.title,
    required this.isExpanded,
  });

  final String title;
  final bool isExpanded;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sideNavTheme = WindowManagerTheme.of(context).sideNavigation;
    final effectiveExpandedWidth = sideNavTheme.expandedWidth;

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        height: 32,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              // Always show full-width line
              Container(
                height: 1,
                color: sideNavTheme.dividerColor,
              ),
              // Content that appears when expanded
              ClipRect(
                child: AnimatedAlign(
                  duration: const Duration(milliseconds: 200),
                  alignment: Alignment.centerLeft,
                  widthFactor: isExpanded ? 1.0 : 0.0,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 150),
                    opacity: isExpanded ? 1.0 : 0.0,
                    child: Container(
                      color: WindowManagerTheme.of(
                        context,
                      ).navigationBackgroundColor,
                      constraints: BoxConstraints(
                        maxWidth:
                            effectiveExpandedWidth - 32, // Account for padding
                      ),
                      child: ClipRect(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Fixed line before text
                            Container(
                              width: 8,
                              height: 1,
                              color: sideNavTheme.dividerColor,
                            ),
                            // Text with padding - flexible to prevent overflow
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                child: Text(
                                  title,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: sideNavTheme.sectionTextColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ),
                            // Fixed line after text
                            Container(
                              width: 8,
                              height: 1,
                              color: sideNavTheme.dividerColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
