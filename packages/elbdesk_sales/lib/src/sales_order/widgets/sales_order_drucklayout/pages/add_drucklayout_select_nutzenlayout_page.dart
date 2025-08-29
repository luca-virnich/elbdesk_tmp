part of '../add_drucklayout_to_sales_order_dialog.dart';

/// Page for selecting Nutzenlayouts to assign to the selected Drucklayout
class _AddDrucklayoutSelectNutzenlayoutPage extends ConsumerWidget {
  const _AddDrucklayoutSelectNutzenlayoutPage({
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
    final salesL10n = context.salesL10n;
    final ppL10n = context.prepressL10n;
    final selectedDrucklayout =
        ref.watch(selectedExistingDrucklayoutStateProvider(sessionId));

    // Einzelnutzen
    final singleNutzenlayoutsAsync = ref.watch(
      fetchAndWatchSalesOrderSingleNutzenlayoutsProvider(
        salesOrderId: salesOrderId,
      ),
    );

    // Sammelnutzen
    final multiNutzenlayoutsAsync = ref.watch(
      fetchAndWatchSalesOrderMultiNutzenlayoutsProvider(
        salesOrderId: salesOrderId,
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(AppSpace.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and selected Drucklayout info
          _SelectedDrucklayoutHeader(
            drucklayout: selectedDrucklayout,
          ),
          const SizedBox(height: AppSpace.l),

          // Description
          AppText(
            ppL10n.drucklayout_choose_nutzenlayout,
            style: context.appTheme.textStyles.defaultText,
          ),
          const SizedBox(height: AppSpace.l),

          // Nutzenlayouts selection
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Single Nutzenlayouts
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        ppL10n.soi_einzelformaufbau_plural,
                        style: context.appTheme.textStyles.h3,
                      ),
                      const SizedBox(height: AppSpace.m),
                      Expanded(
                        child: singleNutzenlayoutsAsync.fastWhen(
                          data: (nutzenlayouts) {
                            if (nutzenlayouts.isEmpty) {
                              return _EmptyNutzenlayoutsPlaceholder(
                                type: salesL10n.soi_einzelformaufbau_plural,
                              );
                            }

                            return ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const AppListViewSeperator.space(),
                              itemCount: nutzenlayouts.length,
                              itemBuilder: (context, index) {
                                final singleNutzenlayout = nutzenlayouts[index];
                                return _NutzenlayoutSelectionTile(
                                  nutzenlayout: singleNutzenlayout.nutzenlayout,
                                  sessionId: sessionId,
                                  customerId: customerId,
                                  navigatorKey: navigatorKey,
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: AppSpace.l),
                const AppDivider.vertical(),
                const SizedBox(width: AppSpace.l),

                // Multi Nutzenlayouts
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        salesL10n.soi_sammelformaufbau_plural,
                        style: context.appTheme.textStyles.h3,
                      ),
                      const SizedBox(height: AppSpace.m),
                      Expanded(
                        child: multiNutzenlayoutsAsync.fastWhen(
                          data: (nutzenlayouts) {
                            if (nutzenlayouts.isEmpty) {
                              return _EmptyNutzenlayoutsPlaceholder(
                                type: salesL10n.soi_sammelformaufbau_plural,
                              );
                            }

                            return ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const AppListViewSeperator.space(),
                              itemCount: nutzenlayouts.length,
                              itemBuilder: (context, index) {
                                final multiNutzenlayout = nutzenlayouts[index];
                                return _NutzenlayoutSelectionTile(
                                  nutzenlayout: multiNutzenlayout.nutzenlayout,
                                  sessionId: sessionId,
                                  customerId: customerId,
                                  navigatorKey: navigatorKey,
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Header showing the selected Drucklayout
class _SelectedDrucklayoutHeader extends StatelessWidget {
  const _SelectedDrucklayoutHeader({
    required this.drucklayout,
  });

  final Drucklayout? drucklayout;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;

    if (drucklayout == null) {
      return const SizedBox.shrink();
    }

    final generalColors = context.appTheme.generalColors;
    final borderRadiuses = context.appTheme.borderRadiuses;

    return Container(
      padding: const EdgeInsets.all(AppSpace.m),
      decoration: BoxDecoration(
        color: generalColors.primary.withAppOpacity(0.1),
        borderRadius: BorderRadius.circular(borderRadiuses.s),
        border: Border.all(
          color: generalColors.primary.withAppOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          ElbIcon(
            AppIcons.drucklayout,
            size: AppIconSize.l,
            color: generalColors.primary,
          ),
          const SizedBox(width: AppSpace.m),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  l10n.gen_chosen_entity(ppL10n.drucklayout_singular),
                  style: context.appTheme.textStyles.defaultText.copyWith(
                    color: generalColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppSpace.xs),
                AppText(
                  drucklayout!.title,
                  style: context.appTheme.textStyles.h3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Empty state for when no Nutzenlayouts are available
class _EmptyNutzenlayoutsPlaceholder extends StatelessWidget {
  const _EmptyNutzenlayoutsPlaceholder({
    required this.type,
  });

  final String type;

  @override
  Widget build(BuildContext context) {
    final ppL10n = context.prepressL10n;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElbIcon(
            AppIcons.soiEinzelformaufbau,
            size: AppIconSize.xl,
            color:
                context.appTheme.generalColors.onBackground.withAppOpacity(0.5),
          ),
          const SizedBox(height: AppSpace.m),
          AppText(
            ppL10n.none_for_sales_order(type),
            style: context.appTheme.textStyles.defaultText.copyWith(
              color: context.appTheme.generalColors.onBackground
                  .withAppOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

/// Tile for selecting/deselecting a Nutzenlayout
class _NutzenlayoutSelectionTile extends ConsumerWidget {
  const _NutzenlayoutSelectionTile({
    required this.nutzenlayout,
    required this.sessionId,
    required this.customerId,
    required this.navigatorKey,
  });

  final Nutzenlayout nutzenlayout;
  final String sessionId;
  final int customerId;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final locale = l10n.localeName;
    final generalColors = context.appTheme.generalColors;
    final borderRadiuses = context.appTheme.borderRadiuses;

    final formattedDrucklaengeAndZaehne =
        nutzenlayout.formattedDrucklaengeAndZaehne(locale);

    // Watch selection state from the provider
    final selectedNutzenlayouts = ref.watch(
      selectedNutzenlayoutsForDrucklayoutStateProvider(sessionId),
    );

    final isSelected = selectedNutzenlayouts.contains(nutzenlayout.id);

    return Container(
      decoration: BoxDecoration(
        color: isSelected
            ? generalColors.primary.withAppOpacity(0.1)
            : generalColors.background,
        border: Border.all(
          color: isSelected
              ? generalColors.primary
              : generalColors.primarySurfaceBorder,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(borderRadiuses.s),
      ),
      child: ElbListTile(
        isActive: isSelected,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        leading: Padding(
          padding: const EdgeInsets.only(right: AppSpace.s),
          child: ElbIcon(
            nutzenlayout.formType == NutzenlayoutFormType.einzelform
                ? AppIcons.soiEinzelformaufbau
                : AppIcons.soiSammelformaufbau,
            size: AppIconSize.l,
            color: isSelected ? generalColors.primary : null,
          ),
        ),
        onPressed: () {
          // Toggle selection state
          ref
              .read(
                selectedNutzenlayoutsForDrucklayoutStateProvider(sessionId)
                    .notifier,
              )
              .toggleNutzenlayout(nutzenlayout.id!);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpace.s),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title
              AppText(
                nutzenlayout.description,
                style: context.appTheme.textStyles.defaultText.copyWith(
                  fontWeight: FontWeight.w600,
                  color: context.appTheme.generalColors.onBackground,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: AppSpace.s),

              // Details in two columns
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left column
                  Flexible(
                    fit: FlexFit.loose,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppText(
                          '• ${nutzenlayout.formattedDimensions(locale)}',
                          style:
                              context.appTheme.textStyles.defaultText.copyWith(
                            color: context.appTheme.generalColors.onBackground
                                .withAppOpacity(0.8),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: AppSpace.xs),
                        AppText(
                          '• Matrix: ${nutzenlayout.matrix} | '
                          '${nutzenlayout.laufrichtung.shortReadable(l10n)}',
                          style:
                              context.appTheme.textStyles.defaultText.copyWith(
                            color: context.appTheme.generalColors.onBackground
                                .withAppOpacity(0.8),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: AppSpace.xxl),

                  // Right column
                  Flexible(
                    fit: FlexFit.loose,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppText(
                          '• $formattedDrucklaengeAndZaehne',
                          style:
                              context.appTheme.textStyles.defaultText.copyWith(
                            color: context.appTheme.generalColors.onBackground
                                .withAppOpacity(0.8),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: AppSpace.xs),
                        AppText(
                          '• Offset: ${nutzenlayout.offset(locale)}',
                          style:
                              context.appTheme.textStyles.defaultText.copyWith(
                            color: context.appTheme.generalColors.onBackground
                                .withAppOpacity(0.8),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
