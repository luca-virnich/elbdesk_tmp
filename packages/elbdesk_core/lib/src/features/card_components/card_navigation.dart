import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_core/src/features/entity_notes/entity_note_core_repository.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
// ignore: no_flutter_material_import
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'card_navigation.g.dart';

@riverpod
class CardNavigationExpandedState extends _$CardNavigationExpandedState {
  @override
  bool build(String floatingWindowId) {
    return false;
  }

  void toggle(String floatingWindowId) {
    state = !state;
  }

  void updateExpanded(bool value) {
    state = value;
  }
}

/// A customizable, expandable navigation rail widget.
///
/// The [CardNavigation] provides a vertical list of navigation items
/// that can be expanded or collapsed. It's designed to be used as a side
/// navigation component in applications.
///
/// Key features:
/// - Expandable/collapsible behavior
/// - Customizable navigation items
/// - Animated transitions
/// - Support for badges on navigation items
///
/// Usage example:
/// ```dart
/// ExpandableNavigationRail(
///   items: [
///     ExpandableNavigationRailItem(
///       icon: Icons.home,
///       label: 'Home',
///     ),
///     ExpandableNavigationRailItem(
///       icon: Icons.settings,
///       label: 'Settings',
///       badge: Badge(label: Text('New')),
///     ),
///   ],
///   selectedIndex: _selectedIndex,
///   onSelectedIndexChanged: (index) {
///     setState(() {
///       _selectedIndex = index;
///     });
///   },
/// )
/// ```
class CardNavigation extends HookConsumerWidget {
  /// Creates an [CardNavigation].
  ///
  /// The `items`, [selectedIndex], and [onSelectedIndexChanged] parameters
  /// must not be null.
  const CardNavigation({
    required this.groups,
    required this.selectedIndex,
    required this.onSelectedIndexChanged,
    required this.hasEntityNotes,
    required this.floatingWindowId,
    required this.floatingWindowType,
    required this.shareEntityId,
    required this.showShareButton,
    super.key,
    this.canToggle = true,
    this.initialExpanded = false,
    this.footer,
    this.backgroundColor,
    this.activeItemBackgroundColor,
    this.inactiveItemBackgroundColor,
    this.hoverItemBackgroundColor,
    this.activeItemTextColor,
    this.inactiveItemTextColor,
    this.hoverItemTextColor,
    this.entityId,
    this.tableType,
  });

  final List<CardNavigationGroup> groups;
  final String floatingWindowType;
  final bool showShareButton;

  final bool canToggle;
  final bool hasEntityNotes;
  final bool initialExpanded;
  final int? shareEntityId;
  final int selectedIndex;

  final void Function(int) onSelectedIndexChanged;

  final Widget? footer;

  final Color? backgroundColor;

  final Color? activeItemBackgroundColor;

  final Color? inactiveItemBackgroundColor;

  final Color? hoverItemBackgroundColor;

  final Color? activeItemTextColor;

  final Color? inactiveItemTextColor;

  final Color? hoverItemTextColor;

  final String floatingWindowId;

  final int? entityId;
  final String? tableType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final isExpanded =
        ref.watch(cardNavigationExpandedStateProvider(floatingWindowId));

    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          ref
              .read(
                cardNavigationExpandedStateProvider(floatingWindowId).notifier,
              )
              .updateExpanded(initialExpanded);
        });
        return null;
      },
      [],
    );

    return AnimatedContainer(
      duration: AnimationConstants.defaultDuration,
      width: isExpanded ? 200 : 70,
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.separated(
              controller: scrollController,
              shrinkWrap: true,
              padding: const EdgeInsets.only(
                right: AppSpace.l,
                top: AppSpace.l,
              ),
              itemCount: groups.length,
              separatorBuilder: (context, index) => const AppDivider(
                height: AppSpace.l,
              ),
              itemBuilder: (context, index) {
                final group = groups[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (group.label != null)
                      Padding(
                        padding: const EdgeInsets.only(
                          left: AppSpace.s,
                          bottom: AppSpace.s,
                        ),
                        child: AppText(
                          group.label!,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: group.items.length,
                      separatorBuilder: (context, itemIndex) =>
                          const SizedBox(height: AppSpace.s),
                      itemBuilder: (context, itemIndex) {
                        final item = group.items[itemIndex];
                        final globalIndex = groups
                                .take(index)
                                .fold(0, (sum, g) => sum + g.items.length) +
                            itemIndex;
                        return _ItemView(
                          item: item,
                          index: globalIndex,
                          selectedIndex: selectedIndex,
                          onSelectedIndexChanged: onSelectedIndexChanged,
                          isExpanded: isExpanded,
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: AppSpace.l),
            child: AppDivider(),
          ),
          if (((shareEntityId ?? entityId) != null) && showShareButton)
            Padding(
              padding: const EdgeInsets.only(
                right: AppSpace.l,
                top: AppSpace.s,
              ),
              child: _ShareButton(
                isExpanded: isExpanded,
                entityId: shareEntityId ?? entityId!,
                floatingWindowType: floatingWindowType,
              ),
            ),
          if (hasEntityNotes && entityId != null && tableType != null)
            Padding(
              padding: const EdgeInsets.only(
                right: AppSpace.l,
                top: AppSpace.s,
              ),
              child: _NotesButton(
                floatingWindowId: floatingWindowId,
                isExpanded: isExpanded,
                entityId: entityId!,
                tableType: tableType!,
              ),
            ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 28,
                bottom: 26,
                top: AppSpace.s,
              ),
              child: AppIconButton.rotating(
                turns: isExpanded ? 0.5 : 0,
                onPressed: () {
                  ref
                      .read(
                        cardNavigationExpandedStateProvider(
                          floatingWindowId,
                        ).notifier,
                      )
                      .toggle(floatingWindowId);
                },
                icon: Icon(
                  AppIcons.keyboard_double_arrow_left,
                  color:
                      context.appTheme.navigationProperties.foregroundIconColor,
                ),
              ),
            ),
          ),
          if (footer != null) ...[
            const SizedBox(height: AppSpace.l),
            footer!,
          ],
        ],
      ),
    );
  }
}

class _ShareButton extends HookConsumerWidget {
  const _ShareButton({
    required this.isExpanded,
    required this.entityId,
    required this.floatingWindowType,
  });
  final bool isExpanded;
  final int entityId;
  final String floatingWindowType;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final generalColors = context.appTheme.generalColors;
    final appNavigationProperties = context.appTheme.navigationProperties;
    final isLoading = useState<bool>(false);

    return Material(
      color: generalColors.transparent,
      borderRadius: BorderRadius.circular(
        appNavigationProperties.borderRadius,
      ),
      child: InkWell(
        splashColor: generalColors.transparent,
        splashFactory: NoSplash.splashFactory,
        highlightColor: appNavigationProperties.overlayColor,
        enableFeedback: false,
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.hovered)) {
              return appNavigationProperties.overlayColor;
            }
            return null;
          },
        ),
        onTap: isLoading.value
            ? null
            : () async {
                isLoading.value = true;
                final (:data, :exception, :success) =
                    await AsyncHandler.handleAsyncOperation<String>(
                  context,
                  () => ref.read(deeplinkCoreRepositoryProvider).getDeepLinkUrl(
                        floatingWindowType,
                        entityId,
                      ),
                  successMessage: l10n.gen_copied_to_clipboard,
                );
                if (success) {
                  await Clipboard.setData(ClipboardData(text: data!));
                }
                if (context.mounted) {
                  isLoading.value = false;
                }
              },
        borderRadius: BorderRadius.circular(
          appNavigationProperties.borderRadius,
        ),
        child: Container(
          decoration: const BoxDecoration(),
          padding: const EdgeInsets.symmetric(
            vertical: AppSpace.s,
            horizontal: AppSpace.s,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTooltip(
                preferBelow: false,
                message: isExpanded ? '' : l10n.gen_share,
                child: ElbIcon(
                  Icons.share,
                  size: AppIconSize.xl,
                  color: appNavigationProperties.foregroundIconColor,
                ),
              ),
              Flexible(
                child: AnimatedContainer(
                  duration: AnimationConstants.defaultDuration,
                  width: isExpanded ? 130 : 0,
                  curve: AnimationConstants.defaultCurve,
                  child: ClipRect(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: AppSpace.m),
                        child: AppText(
                          l10n.gen_share,
                          maxLines: 1,
                          autoSize: false,
                          style:
                              context.appTheme.textStyles.defaultText.copyWith(
                            color: appNavigationProperties.foregroundTextColor,
                          ),
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

class _NotesButton extends HookConsumerWidget {
  const _NotesButton({
    required this.isExpanded,
    required this.floatingWindowId,
    required this.entityId,
    required this.tableType,
  });

  final bool isExpanded;
  final String floatingWindowId;
  final int entityId;
  final String tableType;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOpen = ref.watch(showEntityNotesProvider(floatingWindowId));
    final now = useMemoized(DateTime.now);

    final generalColors = context.appTheme.generalColors;
    final appNavigationProperties = context.appTheme.navigationProperties;
    final newMessageColor = context.appTheme.statusColors.favorite;
    final oldMessageColor = context.appTheme.statusColors.disabled;

    final hasUndeletedMessages = ref
            .watch(watchNotesProvider(tableType, entityId))
            .value
            ?.any((note) => note.deletedAt == null) ??
        false;

    // Only updates on widget updates
    final hasUndeletedMessagesYoungerThan14Days =
        ref.watch(watchNotesProvider(tableType, entityId)).value?.any(
                  (note) =>
                      note.createdAt != null &&
                      note.createdAt!.isAfter(
                        now.subtract(
                          // 12 hours to always make the switch at night
                          // This way the user will never see the switch
                          const Duration(days: 14, hours: 12),
                        ),
                      ),
                ) ??
            false;

    final l10n = context.l10n;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Material(
          color: isOpen
              ? appNavigationProperties.overlayColor
              : generalColors.transparent,
          borderRadius: BorderRadius.circular(
            appNavigationProperties.borderRadius,
          ),
          child: InkWell(
            splashColor: generalColors.transparent,
            splashFactory: NoSplash.splashFactory,
            highlightColor: appNavigationProperties.overlayColor,
            enableFeedback: false,
            overlayColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.hovered)) {
                  return appNavigationProperties.overlayColor;
                }
                return null;
              },
            ),
            onTap: () {
              // Always toggle the side panel - let FloatingCardBody handle the display
              ref
                  .read(showEntityNotesProvider(floatingWindowId).notifier)
                  .toggle();
            },
            borderRadius: BorderRadius.circular(
              appNavigationProperties.borderRadius,
            ),
            child: Container(
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.symmetric(
                vertical: AppSpace.s,
                horizontal: AppSpace.s,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTooltip(
                    preferBelow: false,
                    message: isExpanded ? '' : l10n.chat_notes,
                    child: ElbIcon(
                      Icons.chat,
                      size: AppIconSize.xl,
                      color: isOpen
                          ? (appNavigationProperties.foregroundActiveIconColor)
                          : (appNavigationProperties.foregroundIconColor),
                    ),
                  ),
                  Flexible(
                    child: AnimatedContainer(
                      duration: AnimationConstants.defaultDuration,
                      width: isExpanded ? 130 : 0,
                      curve: AnimationConstants.defaultCurve,
                      child: ClipRect(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: AppSpace.m),
                            child: AppText(
                              l10n.chat_notes,
                              maxLines: 1,
                              autoSize: false,
                              style: context.appTheme.textStyles.defaultText
                                  .copyWith(
                                color: isOpen
                                    ? (appNavigationProperties
                                        .foregroundActiveTextColor)
                                    : appNavigationProperties
                                        .foregroundTextColor,
                              ),
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
        if (hasUndeletedMessages)
          Positioned(
            top: -5,
            right: -5,
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: hasUndeletedMessagesYoungerThan14Days
                    ? newMessageColor
                    : oldMessageColor,
                shape: BoxShape.circle,
              ),
              child: ElbIcon(
                AppIcons.priority_high,
                size: AppIconSize.s,
                color: appNavigationProperties.errorBadgeForegroundColor,
              ),
            ),
          ),
      ],
    );
  }
}

class _ItemView extends ConsumerWidget {
  const _ItemView({
    required this.index,
    required this.onSelectedIndexChanged,
    required this.isExpanded,
    required this.selectedIndex,
    required this.item,
  });
  final CardNavigationItem item;
  final int index;
  final int selectedIndex;
  final void Function(int) onSelectedIndexChanged;
  final bool isExpanded;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isActive = index == selectedIndex;

    final generalColors = context.appTheme.generalColors;
    final appNavigationProperties = context.appTheme.navigationProperties;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Material(
          color: isActive
              ? appNavigationProperties.overlayColor
              : generalColors.transparent,
          borderRadius: BorderRadius.circular(
            appNavigationProperties.borderRadius,
          ),
          child: InkWell(
            splashColor: generalColors.transparent,
            splashFactory: NoSplash.splashFactory,
            highlightColor: appNavigationProperties.overlayColor,
            enableFeedback: false,
            overlayColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.hovered)) {
                  return appNavigationProperties.overlayColor;
                }
                return null;
              },
            ),
            onTap: () => onSelectedIndexChanged.call(index),
            borderRadius: BorderRadius.circular(
              appNavigationProperties.borderRadius,
            ),
            child: Container(
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.symmetric(
                vertical: AppSpace.s,
                horizontal: AppSpace.s,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTooltip(
                    preferBelow: false,
                    message: isExpanded ? '' : item.label,
                    child: ElbIcon(
                      item.icon,
                      size: AppIconSize.xl,
                      color: isActive
                          ? (appNavigationProperties.foregroundActiveIconColor)
                          : (appNavigationProperties.foregroundIconColor),
                    ),
                  ),
                  Flexible(
                    child: AnimatedContainer(
                      duration: AnimationConstants.defaultDuration,
                      width: isExpanded ? 130 : 0,
                      curve: AnimationConstants.defaultCurve,
                      child: ClipRect(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: AppSpace.m),
                            child: AppText(
                              item.label,
                              maxLines: 1,
                              autoSize: false,
                              style: context.appTheme.textStyles.defaultText
                                  .copyWith(
                                color: isActive
                                    ? (appNavigationProperties
                                        .foregroundActiveTextColor)
                                    : appNavigationProperties
                                        .foregroundTextColor,
                              ),
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
        if (item.showErrorBadge ?? false)
          Positioned(
            top: -5,
            right: -5,
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: appNavigationProperties.errorBadgeBackgroundColor,
                shape: BoxShape.circle,
              ),
              child: ElbIcon(
                AppIcons.priority_high,
                size: AppIconSize.s,
                color: appNavigationProperties.errorBadgeForegroundColor,
              ),
            ),
          ),
      ],
    );
  }
}

/// Represents a group of items in the [CardNavigation].
///
/// This class allows for organizing multiple [CardNavigationItem]s
/// into a single group, optionally with a label.
class CardNavigationGroup {
  /// Creates an [CardNavigationGroup].
  ///
  /// The [items] parameter must not be null and should contain at least
  /// one item.
  /// The [label] parameter is optional and can be used to provide a title for
  /// the group.
  CardNavigationGroup({
    required this.items,
    this.label,
  });

  /// The list of [CardNavigationItem]s in this group.
  final List<CardNavigationItem> items;

  /// An optional label for the group.
  ///
  /// If provided, this label can be used to display a title or header for
  /// the group.
  final String? label;
}

/// Represents an item in the [CardNavigation].
///
/// Each item consists of an icon, a label, and optionally a custom child widget
/// and a badge.
class CardNavigationItem {
  /// Creates an [CardNavigationItem].
  ///
  /// The [icon] and [label] parameters must not be null.
  const CardNavigationItem({
    required this.icon,
    required this.label,
    this.showErrorBadge,
    this.validationGroupId,
  });

  /// The icon to display for this item.
  final IconData icon;

  /// The label text for this item.
  final String label;

  /// An optional badge widget to display on top of the item.
  final bool? showErrorBadge;
  final String? validationGroupId;
}
