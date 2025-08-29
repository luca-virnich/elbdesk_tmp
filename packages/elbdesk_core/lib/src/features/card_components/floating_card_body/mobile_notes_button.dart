part of 'floating_card_body.dart';

/// Mobile notes button that matches desktop implementation with badge
class _MobileNotesButton extends HookConsumerWidget {
  const _MobileNotesButton({
    required this.entityId,
    required this.tableType,
    required this.floatingWindowId,
    required this.navigatorKey,
    required this.isFirstRun,
    required this.entityNotesHint,
    required this.additionalEntityData,
    required this.initialNoteId,
    required this.initialNoteParentId,
  });

  final int entityId;
  final String tableType;
  final String floatingWindowId;
  final GlobalKey<NavigatorState> navigatorKey;
  final bool isFirstRun;
  final String? entityNotesHint;
  final AdditionalEntityData? additionalEntityData;
  final int? initialNoteId;
  final int? initialNoteParentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.appTheme;
    final now = useMemoized(DateTime.now);
    final newMessageColor = theme.statusColors.favorite;
    final oldMessageColor = theme.statusColors.disabled;

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

    final generalColors = theme.generalColors;
    final appNavigationProperties = theme.navigationProperties;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Material(
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
            onTap: () {
              EntityNotesBottomSheet.show(
                context,
                entityId: entityId,
                tableType: tableType,
                floatingWindowId: floatingWindowId,
                navigatorKey: navigatorKey,
                isFirstRun: isFirstRun,
                hint: entityNotesHint,
                additionalEntityData: additionalEntityData,
                initialNoteId: initialNoteId,
                initialNoteParentId: initialNoteParentId,
              );
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
              child: AppTooltip(
                preferBelow: false,
                message: context.l10n.chat_notes,
                child: ElbIcon(
                  Icons.chat, // Using Icons.chat to match desktop
                  size: AppIconSize.xl,
                  color: appNavigationProperties.foregroundIconColor,
                ),
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
                color: theme.navigationProperties.errorBadgeForegroundColor,
              ),
            ),
          ),
      ],
    );
  }
}
