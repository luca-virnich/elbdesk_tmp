part of '../add_drucklayout_to_sales_order_dialog.dart';

/// Page for selecting existing Drucklayouts or choosing to create new
class _AddDrucklayoutSelectExistingPage extends ConsumerWidget {
  const _AddDrucklayoutSelectExistingPage({
    required this.customerId,
    required this.salesOrderId,
    required this.sessionId,
    required this.navigatorKey,
  });

  final int customerId;
  final int salesOrderId;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final salesL10n = context.salesL10n;
    final ppL10n = context.prepressL10n;
    // Watch available Drucklayouts for this customer
    final drucklayoutsAsync = ref.watch(
      watchDrucklayoutsByCustomerProvider(customerId, sessionId),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        AppText(
          l10n.gen_choose_entity(ppL10n.drucklayout_singular),
          style: context.appTheme.textStyles.h2,
        ),
        const SizedBox(height: AppSpace.m),

        // Description
        AppText(
          salesL10n.prepress_drucklayout_choose_existing,
          style: context.appTheme.textStyles.defaultText,
        ),
        const SizedBox(height: AppSpace.l),

        const AppDivider(),
        const SizedBox(height: AppSpace.l),

        // Existing Drucklayouts section
        AppText(
          ppL10n.drucklayout_existing,
          style: context.appTheme.textStyles.h3,
        ),
        const SizedBox(height: AppSpace.m),

        // List of existing Drucklayouts
        Expanded(
          child: drucklayoutsAsync.fastWhen(
            data: (drucklayouts) {
              if (drucklayouts.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElbIcon(
                        AppIcons.drucklayout,
                        size: AppIconSize.xl,
                        color: context.appTheme.generalColors.onBackground,
                      ),
                      const SizedBox(height: AppSpace.m),
                      AppText(
                        salesL10n.prepress_drucklayout_none_existing,
                        style: context.appTheme.textStyles.defaultText,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              }

              return ListView.separated(
                separatorBuilder: (context, index) =>
                    const AppListViewSeperator.space(),
                itemCount: drucklayouts.length,
                itemBuilder: (context, index) {
                  final drucklayout = drucklayouts[index];
                  return _DrucklayoutListItem(
                    drucklayout: drucklayout,
                    sessionId: sessionId,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

/// List item widget for displaying a Drucklayout option
class _DrucklayoutListItem extends ConsumerWidget {
  const _DrucklayoutListItem({
    required this.drucklayout,
    required this.sessionId,
  });

  final Drucklayout drucklayout;
  final String sessionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ppL10n = context.prepressL10n;
    final selectedDrucklayout = ref.watch(
      selectedExistingDrucklayoutStateProvider(sessionId),
    );
    final isSelected = selectedDrucklayout?.id == drucklayout.id;

    return ElbListTile(
      isActive: isSelected,
      mainAxisAlignment: MainAxisAlignment.start,
      leading: const Padding(
        padding: EdgeInsets.only(right: AppSpace.s),
        child: ElbIcon(
          AppIcons.drucklayout,
          size: AppIconSize.xl,
        ),
      ),
      onPressed: () {
        ref
            .read(
              selectedExistingDrucklayoutStateProvider(
                sessionId,
              ).notifier,
            )
            .updateSelectedDrucklayout(drucklayout);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: AppSpace.s),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title
            AppText(
              '${drucklayout.formattedId}: ${drucklayout.title}',
              style: context.appTheme.textStyles.defaultText.copyWith(
                color: context.appTheme.generalColors.onBackground,
              ),
            ),
            const SizedBox(height: AppSpace.xs),
            // Description (if available)
            if (drucklayout.description != null) ...[
              AppText(
                drucklayout.description!,
                style: context.appTheme.textStyles.defaultText.copyWith(
                  color: context.appTheme.generalColors.onBackground
                      .withAppOpacity(0.7),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: AppSpace.xs),
            ],
            // Drucklayout details
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Preselection
                Flexible(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppText(
                        '${ppL10n.drucklayout_preselection_singular}: ',
                        style: context.appTheme.textStyles.defaultText.copyWith(
                          color: context.appTheme.generalColors.onBackground
                              .withAppOpacity(0.6),
                        ),
                      ),
                      Flexible(
                        child: AppText(
                          drucklayout.drucklayoutPreSelection.description,
                          style:
                              context.appTheme.textStyles.defaultText.copyWith(
                            color: context.appTheme.generalColors.onBackground
                                .withAppOpacity(0.8),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: AppSpace.m),

                // Selection
                Flexible(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppText(
                        '${ppL10n.drucklayout_selection_singular}: ',
                        style: context.appTheme.textStyles.defaultText.copyWith(
                          color: context.appTheme.generalColors.onBackground
                              .withAppOpacity(0.6),
                        ),
                      ),
                      Flexible(
                        child: AppText(
                          drucklayout.drucklayoutSelection.description,
                          style:
                              context.appTheme.textStyles.defaultText.copyWith(
                            color: context.appTheme.generalColors.onBackground
                                .withAppOpacity(0.8),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
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
