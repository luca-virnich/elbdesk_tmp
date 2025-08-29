import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_platform_info/elbdesk_platform_info.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:elbdesk_window_manager/elbdesk_window_manager.dart';
import 'package:flutter/material.dart';

/// A tile widget used in the dashboard to group related content.
/// Displays an action button in the header that shows a popup menu.
/// When [tileId] is provided, a built-in "Remove Tile" action is added.
/// External popup menu items can be added via [appPopMenuItems].
///
/// When [isScrollable] is false, the children are not wrapped in a scroll view,
/// allowing for centered content.
///
/// Now, if [onIconTap] is provided, both the leading icon (if any) and the
/// title are wrapped together inside of a secondary button.
class DashboardGridTile extends HookWidget {
  /// Constructs a [DashboardGridTile].
  const DashboardGridTile({
    required this.title,
    required this.children,
    super.key,
    this.leadingIcon,
    this.actions = const [],
    this.tileId,
    this.isScrollable = true,
    this.appPopMenuItems = const [],
    this.onPopMenuItemSelected,
    this.onIconTap,
  });

  /// Title displayed in the header
  final String title;

  /// Leading icon displayed before the title
  final IconData? leadingIcon;

  /// Content widgets displayed inside the tile
  final List<Widget> children;

  /// Additional action widgets displayed in the header
  final List<Widget> actions;

  /// Identifier for the tile used for removal action
  final String? tileId;

  /// Controls whether children are wrapped in a scroll view
  final bool isScrollable;

  /// External popup menu items added to the built-in popup menu
  final List<NextMenuItemButton> appPopMenuItems;

  /// Callback for handling external popup menu item selection
  final ValueChanged<String>? onPopMenuItemSelected;

  /// Callback triggered when the combined icon and title are tapped
  final VoidCallback? onIconTap;

  static final isMobileDevice = ElbDeskPlatformInfo.isMobileDevice;

  static final mobileBreakpoint =
      WindowManagerInitialization.instance.mobileBreakpoint;

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isMobileLayout = (screenWidth < mobileBreakpoint) || isMobileDevice;

    final borderRadius = isMobileLayout
        ? BorderRadius.circular(0)
        : BorderRadius.circular(context.appTheme.borderRadiuses.m);
    // Without the ClipRRect the content would clip through the corners
    return ClipRRect(
      borderRadius: borderRadius,
      child: Container(
        decoration: BoxDecoration(
          color: context.appTheme.generalColors.primarySurface,
          borderRadius: borderRadius,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: AppSpace.m,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header row with interactive icon-title button and actions
              _HeaderRow(
                onIconTap: onIconTap,
                title: title,
                isMobile: isMobileLayout,
                leadingIcon: leadingIcon,
                actions: actions,
                tileId: tileId,
                appPopMenuItems: appPopMenuItems,
                onPopMenuItemSelected: onPopMenuItemSelected,
              ),
              // Tile content
              Expanded(
                child: isScrollable
                    ? AppScrollbar(
                        controller: scrollController,
                        child: ListView.separated(
                          controller: scrollController,
                          padding: EdgeInsets.zero,
                          separatorBuilder: (context, index) =>
                              const AppListViewSeperator.divider(
                            height: 1,
                          ),
                          itemBuilder: (context, index) => Align(
                            alignment: Alignment.centerLeft,
                            child: children[index],
                          ),
                          itemCount: children.length,
                        ),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: children,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderRow extends ConsumerWidget {
  const _HeaderRow({
    required this.onIconTap,
    required this.title,
    required this.leadingIcon,
    required this.actions,
    required this.tileId,
    required this.appPopMenuItems,
    required this.onPopMenuItemSelected,
    required this.isMobile,
  });

  final VoidCallback? onIconTap;
  final String title;
  final IconData? leadingIcon;
  final List<Widget> actions;
  final String? tileId;
  final List<NextMenuItemButton> appPopMenuItems;
  final ValueChanged<String>? onPopMenuItemSelected;
  final bool isMobile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final isEditMode = ref.watch(dashboardEditStateProvider);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 2 : AppSpace.m,
          ).copyWith(bottom: isMobile ? 8 : 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // If an onIconTap is provided, wrap the icon (if any) and
              // title in a button.
              if (onIconTap != null)
                Flexible(
                  child: AppButton.secondary(
                    onPressed: onIconTap,
                    tooltip: title,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (leadingIcon != null) ...[
                          // Leading Icon
                          ElbIcon(
                            leadingIcon!,
                            color: context.appTheme.generalColors.primary,
                            size: AppIconSize.xl,
                          ),
                          const SizedBox(width: UiConstants.defaultPadding),
                        ],
                        // Title
                        Flexible(
                          child: AppText(
                            title,
                            style: context.appTheme.textStyles.h2,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                )

              // Otherwise, display separately
              else ...[
                if (leadingIcon != null) ...[
                  // const SizedBox(width: AppSpace.m),

                  // Leading Icon
                  Padding(
                    padding: const EdgeInsets.only(
                      left: UiConstants.elementMargin,
                    ),
                    child: ElbIcon(
                      leadingIcon!,
                      color: context.appTheme.generalColors.primary,
                      size: AppIconSize.xl,
                    ),
                  ),
                  const SizedBox(width: UiConstants.elementMargin),
                ],
                // Title
                Expanded(
                  child: AppText(
                    title,
                    style: context.appTheme.textStyles.h2,
                    maxLines: 1,
                  ),
                ),
              ],

              _TrailingActions(
                isEditMode: false,
                actions: actions,
                tileId: tileId,
                appPopMenuItems: appPopMenuItems,
                onPopMenuItemSelected: onPopMenuItemSelected,
              ),
            ],
          ),
        ),
        if (isMobile)
          const AppDivider(
            height: 1,
          ),
      ],
    );
  }
}

class _TrailingActions extends ConsumerWidget {
  const _TrailingActions({
    required this.isEditMode,
    required this.actions,
    required this.tileId,
    required this.appPopMenuItems,
    required this.onPopMenuItemSelected,
  });

  final bool isEditMode;
  final List<Widget> actions;
  final String? tileId;
  final List<NextMenuItemButton> appPopMenuItems;
  final ValueChanged<String>? onPopMenuItemSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    // Function to handle tile removal

    const headerHeight = 40.0;
    const animationDuration = AnimationConstants.shortDuration;

    return SizedBox(
      height: headerHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AnimatedContainer(
            duration: animationDuration,
            margin: EdgeInsets.only(right: isEditMode ? AppSpace.s : 0),
            child: Row(children: actions),
          ),
          ClipRect(
            child: AnimatedAlign(
              duration: animationDuration,
              curve: AnimationConstants.defaultCurve,
              alignment: Alignment.centerRight,
              widthFactor: isEditMode ? 1.0 : 0.0,
              child: AnimatedOpacity(
                duration: animationDuration,
                curve: AnimationConstants.defaultCurve,
                opacity: isEditMode ? 1.0 : 0.0,
                child: SizedBox(
                  height: headerHeight,
                  child: (tileId != null || appPopMenuItems.isNotEmpty)
                      ? NextPopupMenu(
                          child: (controller) => ElbIcon(
                            AppIcons.tripleDotVert,
                            color: context.appTheme.generalColors.onBackground
                                .withAppOpacity(0.5),
                            size: AppIconSize.l,
                          ),
                          menuChildren: [
                            if (tileId != null)
                              NextMenuItemButton(
                                child: AppText(
                                  l10n.dashboard_remove_tile,
                                  autoSize: false,
                                ),
                              ),
                            ...appPopMenuItems,
                          ],
                        )
                      : null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
