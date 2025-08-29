import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Base class for all context menu entries
abstract class AppContextMenuEntry {
  const AppContextMenuEntry();
}

/// A menu item for the [AppContextMenu]
class AppContextMenuItem extends AppContextMenuEntry {
  /// Creates a menu item for the context menu
  const AppContextMenuItem({
    required this.label,
    required this.onTap,
    this.icon,
    this.isEnabled = true,
  }) : isDivider = false;

  /// Creates a divider item for the context menu
  const AppContextMenuItem.divider()
      : label = '',
        onTap = null,
        icon = null,
        isEnabled = false,
        isDivider = true;

  /// The text to display for this menu item
  final String label;

  /// The callback when this item is tapped
  final VoidCallback? onTap;

  /// Optional icon to display before the label
  final IconData? icon;

  /// Whether this item is enabled and can be tapped
  final bool isEnabled;

  /// Whether this item is a divider
  final bool isDivider;

  /// Returns true if this item represents a divider
  bool get _isDivider => isDivider == true;
}

/// A context menu that can be shown with right click
///
/// This menu is designed to be used with [AppContextMenuWrapper]
class AppContextMenu extends HookWidget {
  const AppContextMenu({
    required this.items,
    required this.controller,
    super.key,
  });

  final List<AppContextMenuEntry> items;
  final OverlayPortalController controller;

  @override
  Widget build(BuildContext context) {
    final openGroupIndex = useState<int?>(null);

    void onItemHover(int index) {
      openGroupIndex.value = index;
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(context.appTheme.borderRadiuses.m),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: context.appTheme.generalColors.background,
          borderRadius:
              BorderRadius.circular(context.appTheme.borderRadiuses.m),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAppOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (var i = 0; i < items.length; i++)
              if (items[i] is AppContextMenuItem) ...[
                if ((items[i] as AppContextMenuItem)._isDivider)
                  const AppContextMenuDivider()
                else
                  MouseRegion(
                    onEnter: (_) => onItemHover(-1),
                    child: AppContextMenuItemWidget(
                      item: items[i] as AppContextMenuItem,
                      onTap: () {
                        final item = items[i] as AppContextMenuItem;
                        if (item.onTap != null) {
                          item.onTap?.call();
                        }
                        controller.hide();
                      },
                    ),
                  ),
              ],
          ],
        ),
      ),
    );
  }
}

/// A divider for the context menu
class AppContextMenuDivider extends StatelessWidget {
  const AppContextMenuDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpace.s),
      child: AppDivider(),
    );
  }
}

/// The widget that displays a single menu item
class AppContextMenuItemWidget extends HookWidget {
  const AppContextMenuItemWidget({
    required this.item,
    required this.onTap,
    super.key,
  });

  final AppContextMenuItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isHovered = useState(false);
    final theme = context.appTheme;
    final generalColors = theme.generalColors;

    const itemVerticalPadding = 6.0;
    const itemHorizontalPadding = AppSpace.s;
    const iconTextSpacing = AppSpace.xs;

    if (item._isDivider) {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: itemHorizontalPadding),
        child: AppDivider(),
      );
    }

    return MouseRegion(
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: item.isEnabled ? onTap : null,
        child: Container(
          color: isHovered.value && item.isEnabled
              ? generalColors.primary.withAppOpacity(0.1)
              : generalColors.transparent,
          padding: const EdgeInsets.symmetric(
            horizontal: itemHorizontalPadding,
            vertical: itemVerticalPadding,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (item.icon != null)
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: ElbIcon(
                    item.icon!,
                    color: item.isEnabled
                        ? generalColors.primary
                        : generalColors.onBackground.withAppOpacity(0.5),
                  ),
                ),
              if (item.icon != null) const SizedBox(width: iconTextSpacing),
              Expanded(
                child: AppText(
                  item.label,
                  style: TextStyle(
                    color: item.isEnabled
                        ? isHovered.value
                            ? generalColors.primary
                            : generalColors.onBackground
                        : generalColors.onBackground.withAppOpacity(0.5),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
