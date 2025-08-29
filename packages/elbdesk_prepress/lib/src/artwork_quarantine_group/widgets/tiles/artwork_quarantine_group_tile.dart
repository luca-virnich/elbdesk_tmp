import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine/widgets/create_product_product_part_dialog/create_product_product_dialog.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/extensions/artwork_quarantine_status_extension.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/extensions/artwork_quarantine_type_extension.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

/// Artwork Quarantine Group Tile
///
/// Expandable tile for displaying artwork quarantine groups with detailed
/// artwork management using either grid or table view
class ArtworkQuarantineGroupTile extends HookConsumerWidget {
  const ArtworkQuarantineGroupTile({
    required this.group,
    required this.onTap,
    this.navigatorKey,
    this.floatingWindowFocus,
    this.floatingWindowId,
    this.customerId,
    this.salesOrderId,
    this.showGridView = false,
    super.key,
  });

  final ArtworkQuarantineGroup group;
  final VoidCallback? onTap;
  final GlobalKey<NavigatorState>? navigatorKey;
  final FocusNode? floatingWindowFocus;
  final String? floatingWindowId;
  final int? customerId;
  final int? salesOrderId;
  final bool showGridView;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.appTheme;
    final isExpanded = useState<bool>(false);

    // Filter out deleted quarantines
    final activeArtworks = group.artworkQuarantines ?? [];

    return Container(
      decoration: BoxDecoration(
        color: theme.generalColors.primarySurface,
        borderRadius: BorderRadius.circular(theme.borderRadiuses.m),
        border: Border.all(
          color: theme.generalColors.primarySurfaceBorder.withAppOpacity(0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAppOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Group header row
          Row(
            children: [
              // Clickable front area (icon + group info)
              _ClickableGroupHeader(
                group: group,
                onTap: onTap,
                activeArtworks: activeArtworks,
              ),
              const SizedBox(width: AppSpace.m),

              // Description and series
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    group.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              const Spacer(),

              // Action buttons area
              _GroupActions(
                isExpanded: isExpanded,
                group: group,
                navigatorKey: navigatorKey,
                floatingWindowFocus: floatingWindowFocus,
                floatingWindowId: floatingWindowId,
                customerId: customerId,
                salesOrderId: salesOrderId,
              ),

              const SizedBox(width: AppSpace.s),
            ],
          ),

          // Animated expanded artwork content
          _ArtworkQuarantineGridTableSwitchView(
            isExpanded: isExpanded,
            activeArtworks: activeArtworks,
            showGridView: showGridView,
            navigatorKey: navigatorKey,
            floatingWindowFocus: floatingWindowFocus,
            floatingWindowId: floatingWindowId,
            customerId: customerId,
            salesOrderId: salesOrderId,
            group: group,
          ),
        ],
      ),
    );
  }
}

// This widget is used to be able to display group quarantine children
// in either a grid or a table view.
class _ArtworkQuarantineGridTableSwitchView extends StatelessWidget {
  const _ArtworkQuarantineGridTableSwitchView({
    required this.isExpanded,
    required this.activeArtworks,
    required this.showGridView,
    required this.navigatorKey,
    required this.floatingWindowFocus,
    required this.floatingWindowId,
    required this.customerId,
    required this.salesOrderId,
    required this.group,
  });

  final ValueNotifier<bool> isExpanded;
  final List<ArtworkQuarantine> activeArtworks;
  final bool showGridView;
  final GlobalKey<NavigatorState>? navigatorKey;
  final FocusNode? floatingWindowFocus;
  final String? floatingWindowId;
  final int? customerId;
  final int? salesOrderId;
  final ArtworkQuarantineGroup group;

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    // The AutoAnimatedSize widget is used to animate the size of the widget
    // when expanding the group.
    return AutoAnimatedSize(
      expanded: isExpanded.value && activeArtworks.isNotEmpty,
      animationDuration: AnimationConstants.defaultDuration,
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeInOut,
      keepAliveChildren: true,
      animateOpacity: true,
      child: AnimatedSwitcher(
        duration: AnimationConstants.shortDuration,
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        transitionBuilder: (Widget child, Animation<double> animation) {
          // The fade transistion is used to "hide" the loading state of the
          // table, when switching between grid and table view.
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        child: showGridView
            ? Container(
                key: UniqueKey(),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: theme.generalColors.primarySurfaceBorder
                          .withAppOpacity(0.2),
                      width: 1,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const AppDivider(),
                    // Grid view
                    _ArtworkQuarantinesGridView(
                      artworkQuarantines: activeArtworks,
                      navigatorKey: navigatorKey,
                      floatingWindowFocus: floatingWindowFocus,
                      floatingWindowId: floatingWindowId,
                      customerId: customerId,
                      salesOrderId: salesOrderId,
                    ),
                  ],
                ),
              )
            : Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: theme.generalColors.primarySurfaceBorder
                          .withAppOpacity(0.2),
                      width: 1,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const AppDivider(),
                    // Table view
                    CardTablePadding(
                      child: ArtworkQuarantineTable.byGroup(
                        groupId: group.meta.id,
                        floatingWindowFocus: floatingWindowFocus,
                        floatingWindowId: floatingWindowId,
                        toolbarTrailingActions: null,
                        customerId: customerId,
                        salesOrderId: salesOrderId,
                        componentIdentifier:
                            ComponentIdentifier.artworkQuarantineTableGroupCard,
                        isCollapsible: false,
                        navigatorKey: navigatorKey,
                        readOnly: false,
                        tableDensity: AppTableDensity.minimal,
                        dataProvider: (sessionId) {
                          // Filter out deleted quarantines and return
                          // as AsyncValue
                          final activeArtworks = group.artworkQuarantines
                                  ?.where(
                                    (artwork) => artwork.meta.deletedAt == null,
                                  )
                                  .toList() ??
                              [];

                          // Return a provider that provides the
                          // filtered artworks
                          return AutoDisposeProvider<
                              AsyncValue<List<ArtworkQuarantine>>>(
                            (ref) => AsyncValue.data(activeArtworks),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class _GroupActions extends StatelessWidget {
  const _GroupActions({
    required this.isExpanded,
    required this.group,
    required this.navigatorKey,
    required this.floatingWindowFocus,
    required this.floatingWindowId,
    required this.customerId,
    required this.salesOrderId,
  });

  final ValueNotifier<bool> isExpanded;
  final ArtworkQuarantineGroup group;
  final GlobalKey<NavigatorState>? navigatorKey;
  final FocusNode? floatingWindowFocus;
  final String? floatingWindowId;
  final int? customerId;
  final int? salesOrderId;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;

    // Filter out deleted quarantines
    final activeArtworks = group.artworkQuarantines
            ?.where(
              (artwork) =>
                  artwork.meta.deletedAt == null &&
                  artwork.general.status == ArtworkQuarantineGroupStatus.done,
            )
            .toList() ??
        [];

    final readOnly = activeArtworks.isEmpty ||
        customerId == null ||
        salesOrderId == null ||
        navigatorKey == null ||
        floatingWindowFocus == null ||
        floatingWindowId == null;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppButton.secondary(
          icon: const Icon(
            AppIcons.add,
          ),
          label: l10n.gen_create_entity(ppL10n.product_plural),
          onPressed: readOnly
              ? null
              : () async {
                  await showElbDialog<bool?>(
                    context: context,
                    child: CreateBulkProductDialog(
                      customerId: customerId!,
                      salesOrderId: salesOrderId!,
                      artworkQuarantines: activeArtworks,
                      floatingWindowId: floatingWindowId!,
                    ),
                  );
                },
        ),

        const SizedBox(width: AppSpace.s),

        AppButton.secondary(
          icon: const Icon(
            AppIcons.product,
          ),
          label: l10n.gen_create_entity(ppL10n.product_part_plural),
          onPressed: readOnly
              ? null
              : () async {
                  await showElbDialog<bool?>(
                    context: context,
                    navigatorKey: navigatorKey,
                    child: CreateBulkProductPartDialog(
                      customerId: customerId!,
                      salesOrderId: salesOrderId!,
                      artworkQuarantines: activeArtworks,
                      navigatorKey: navigatorKey!,
                      floatingWindowFocus: floatingWindowFocus!,
                      floatingWindowId: floatingWindowId!,
                    ),
                  );
                },
        ),

        const SizedBox(width: AppSpace.s),

        // Expand button
        AppIconButton(
          iconData:
              isExpanded.value ? AppIcons.expand_less : AppIcons.expand_more,
          onPressed: () => isExpanded.value = !isExpanded.value,
          tooltip: isExpanded.value ? l10n.gen_collapse : l10n.gen_expand,
        ),
      ],
    );
  }
}

/// Grid view for artwork quarantines within a group
class _ArtworkQuarantinesGridView extends StatelessWidget {
  const _ArtworkQuarantinesGridView({
    required this.artworkQuarantines,
    required this.navigatorKey,
    required this.floatingWindowFocus,
    required this.floatingWindowId,
    required this.customerId,
    required this.salesOrderId,
  });

  final List<ArtworkQuarantine> artworkQuarantines;
  final GlobalKey<NavigatorState>? navigatorKey;
  final FocusNode? floatingWindowFocus;
  final String? floatingWindowId;
  final int? customerId;
  final int? salesOrderId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpace.s),
      child: AppWrap(
        spacing: AppSpace.m,
        runSpacing: AppSpace.m,
        alignment: WrapAlignment.start,
        runAlignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: artworkQuarantines.map((artworkQuarantine) {
          final currentIndex =
              artworkQuarantines.indexOf(artworkQuarantine) + 1;

          return SizedBox(
            width: 500, // Fixed width instead of using LayoutBuilder
            child: ArtworkQuarantineTile.compact(
              artworkQuarantine: artworkQuarantine,
              index: currentIndex,
              entityId: artworkQuarantine.meta.id!,
              totalArtworks: artworkQuarantines.length,
              customerId: customerId,
              salesOrderId: salesOrderId,
              navigatorKey: navigatorKey,
              floatingWindowFocus: floatingWindowFocus,
              floatingWindowId: floatingWindowId,
            ),
          );
        }).toList(),
      ),
    );
  }
}

/// Clickable group header with hover effects
class _ClickableGroupHeader extends HookWidget {
  const _ClickableGroupHeader({
    required this.group,
    required this.onTap,
    required this.activeArtworks,
  });

  final ArtworkQuarantineGroup group;
  final VoidCallback? onTap;
  final List<ArtworkQuarantine> activeArtworks;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;
    final theme = context.appTheme;
    final isHovered = useState<bool>(false);

    return ElbMouseRegionGestureDetector(
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      onTap: onTap,
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: AnimationConstants.defaultDuration,
        padding: const EdgeInsets.all(AppSpace.s),
        decoration: BoxDecoration(
          color: isHovered.value
              ? theme.generalColors.primary.withAppOpacity(0.08)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(theme.borderRadiuses.s),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: AppSpace.s),
            // Group icon with hover effect
            Container(
              padding: const EdgeInsets.all(AppSpace.xs),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    group.status.color.withAppOpacity(0.85),
                    group.status.color.withAppOpacity(0.95),
                  ],
                ),
                borderRadius: BorderRadius.circular(theme.borderRadiuses.s),
                boxShadow: [
                  BoxShadow(
                    color: theme.generalColors.primary.withAppOpacity(0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ElbIcon(
                AppIcons.artworkQuarantineGroup,
                size: AppIconSize.l,
                color: theme.generalColors.onPrimary,
              ),
            ),

            const SizedBox(width: AppSpace.m),

            // Group information
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    AppText(
                      group.meta.id.toString(),
                      style: theme.textStyles.defaultText.copyWith(
                        color: theme.generalColors.onBackground,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (group.type != null)
                      AppText(
                        ' - ${group.type?.readable(ppL10n) ?? ''}',
                        style: theme.textStyles.defaultText.copyWith(
                          color: theme.generalColors.onBackground
                              .withAppOpacity(0.5),
                          fontSize: 14,
                        ),
                      ),
                  ],
                ),
                AppText(
                  '${activeArtworks.length} ${ppL10n.artwork_plural} • '
                  '${group.meta.createdAt?.toDate(l10n.localeName) ?? ''}',
                  style: theme.textStyles.defaultText.copyWith(
                    color: theme.generalColors.onBackground.withAppOpacity(0.5),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
