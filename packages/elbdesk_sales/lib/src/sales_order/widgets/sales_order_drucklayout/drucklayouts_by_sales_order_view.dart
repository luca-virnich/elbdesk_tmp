import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/src/sales_order/widgets/sales_order_drucklayout/add_drucklayout_to_sales_order_dialog.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

/// Drucklayouts by Sales Order View
///
/// Displays and manages Drucklayouts associated with a sales order
/// Allows assignment of Nutzenlayouts to Drucklayouts
class DrucklayoutsBySalesOrderView extends ConsumerWidget {
  const DrucklayoutsBySalesOrderView({
    required this.salesOrderId,
    required this.customerId,
    required this.sessionId,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.navigatorKey,
    super.key,
  });

  final int salesOrderId;
  final int customerId;
  final String sessionId;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;

    // Watch Drucklayouts for this sales order
    final drucklayoutsAsync = ref.watch(
      watchDrucklayoutsBySalesOrderProvider(salesOrderId),
    );

    return Column(
      children: [
        CollapsibleCardSection(
          leadingIcon: AppIcons.drucklayout,
          identifier:
              ComponentIdentifier.salesOrderCardItemsPageDrucklayouts.name,
          title: ppL10n.drucklayout_plural,
          trailingWidgets: [
            // Add Button
            AddEntityInCardButton(
              tooltip: l10n.gen_add_entity(ppL10n.drucklayout_singular),
              onPressed: () async {
                await showElbDialog<void>(
                  context: context,
                  child: AddDrucklayoutToSalesOrderDialog(
                    customerId: customerId,
                    salesOrderId: salesOrderId,
                    sessionId: sessionId,
                    floatingWindowId: floatingWindowId,
                    floatingWindowFocus: floatingWindowFocus,
                    navigatorKey: navigatorKey,
                  ),
                );
              },
            ),
          ],

          // Body
          child: drucklayoutsAsync.fastWhen(
            data: (drucklayouts) => drucklayouts.isEmpty
                ? _EmptyDrucklayoutsPlaceholder()
                : ListView.separated(
                    separatorBuilder: (context, index) =>
                        const AppListViewSeperator.space(),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: drucklayouts.length,
                    itemBuilder: (context, index) {
                      final drucklayout = drucklayouts[index];
                      return _DrucklayoutTile(
                        drucklayout: drucklayout,
                        customerId: customerId,
                        salesOrderId: salesOrderId,
                        sessionId: sessionId,
                        floatingWindowId: floatingWindowId,
                        floatingWindowFocus: floatingWindowFocus,
                        navigatorKey: navigatorKey,
                      );
                    },
                  ),
          ),
        ),
      ],
    );
  }
}

/// Empty state placeholder for when no Drucklayouts exist
class _EmptyDrucklayoutsPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpace.l),
      child: Column(
        children: [
          ElbIcon(
            AppIcons.drucklayout,
            size: AppIconSize.xxl,
            color: context.appTheme.generalColors.onBackground,
          ),
          const SizedBox(height: AppSpace.m),
          AppText(
            'Keine Drucklayouts vorhanden'.hc,
            style: context.appTheme.textStyles.defaultText.copyWith(
              color: context.appTheme.generalColors.onBackground,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpace.s),
          AppText(
            'Fügen Sie ein Drucklayout hinzu, um Nutzenlayouts zuzuweisen.'.hc,
            style: context.appTheme.textStyles.defaultText.copyWith(
              color: context.appTheme.generalColors.onBackground,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

/// Drucklayout tile
class _DrucklayoutTile extends ConsumerWidget {
  const _DrucklayoutTile({
    required this.drucklayout,
    required this.customerId,
    required this.salesOrderId,
    required this.sessionId,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.navigatorKey,
  });

  final Drucklayout drucklayout;
  final int customerId;
  final int salesOrderId;
  final String sessionId;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final generalColors = context.appTheme.generalColors;
    final borderRadiuses = context.appTheme.borderRadiuses;
    final ppL10n = context.prepressL10n;
    final l10n = context.l10n;

    return Container(
      decoration: BoxDecoration(
        color: generalColors.background,
        border: Border.all(
          color: generalColors.primarySurfaceBorder,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(borderRadiuses.m),
      ),
      padding: const EdgeInsets.all(AppSpace.m),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: AppText(
                  drucklayout.title,
                  style: context.appTheme.textStyles.h2,
                  maxLines: 1,
                ),
              ),
              AppIconButton.secondary(
                onPressed: () async {
                  // Open Drucklayout card for editing
                  ref.openWindow(
                    FloatingDrucklayoutWindowData(
                      entityId: drucklayout.id,
                      customerId: customerId,
                      salesOrderId: salesOrderId,
                      preSelectionId: drucklayout.preSelectionId!,
                      selectionId: drucklayout.selectionId!,
                    ),
                  );
                },
                iconData: AppIcons.edit,
              ),
            ],
          ),
          const SizedBox(height: AppSpace.m),

          // Info row
          LayoutBuilder(
            builder: (context, constraints) {
              final isSmallLayout = constraints.maxWidth < 450;
              final infoRowWidth = isSmallLayout
                  ? constraints.maxWidth
                  : constraints.maxWidth * 0.4;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: AppSpace.xl,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ID
                            LabeledValueRow(
                              title: l10n.gen_id,
                              value: drucklayout.formattedId,
                              width: infoRowWidth,
                            ),
                            if (drucklayout.description != null)
                              LabeledValueRow(
                                title: l10n.gen_description,
                                value: drucklayout.description!,
                                width: infoRowWidth,
                              ),
                            LabeledValueRow(
                              title: ppL10n.drucklayout_preselection_singular,
                              value: drucklayout
                                  .drucklayoutPreSelection.description,
                              width: infoRowWidth,
                            ),
                            LabeledValueRow(
                              title: ppL10n.drucklayout_selection_singular,
                              value:
                                  drucklayout.drucklayoutSelection.description,
                              width: infoRowWidth,
                            ),
                          ],
                        ),
                      ),
                      if (!isSmallLayout)
                        Flexible(
                          flex: 3,
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              return _AssignedNutzenlayoutsDisplay(
                                drucklayoutId: drucklayout.id!,
                                salesOrderId: salesOrderId,
                                customerId: customerId,
                                sessionId: sessionId,
                                floatingWindowId: floatingWindowId,
                                floatingWindowFocus: floatingWindowFocus,
                                navigatorKey: navigatorKey,
                                maxWidth: constraints.maxWidth,
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                  if (isSmallLayout)
                    Padding(
                      padding: const EdgeInsets.only(top: AppSpace.l),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return _AssignedNutzenlayoutsDisplay(
                            drucklayoutId: drucklayout.id!,
                            salesOrderId: salesOrderId,
                            customerId: customerId,
                            sessionId: sessionId,
                            floatingWindowId: floatingWindowId,
                            floatingWindowFocus: floatingWindowFocus,
                            navigatorKey: navigatorKey,
                            maxWidth: constraints.maxWidth,
                          );
                        },
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

/// Widget to display assigned Nutzenlayouts for a Drucklayout
class _AssignedNutzenlayoutsDisplay extends ConsumerWidget {
  const _AssignedNutzenlayoutsDisplay({
    required this.drucklayoutId,
    required this.salesOrderId,
    required this.customerId,
    required this.sessionId,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.navigatorKey,
    required this.maxWidth,
  });

  final int drucklayoutId;
  final int salesOrderId;
  final int customerId;
  final String sessionId;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  final GlobalKey<NavigatorState> navigatorKey;
  final double maxWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assignedNutzenlayouts = ref.watch(
      fetchAssignedNutzenlayoutsForDrucklayoutProvider(
        drucklayoutId: drucklayoutId,
        salesOrderId: salesOrderId,
      ),
    );

    return assignedNutzenlayouts.fastWhen(
      data: (data) {
        final totalCount =
            data.singleNutzenlayouts.length + data.multiNutzenlayouts.length;

        if (totalCount == 0) {
          return AppText(
            'Keine Nutzenlayouts zugewiesen'.hc,
            style: context.appTheme.textStyles.defaultText.copyWith(
              color: context.appTheme.generalColors.onBackground,
            ),
          );
        }

        return _NutzenlayoutListGridView(
          singleNutzenlayouts: data.singleNutzenlayouts,
          multiNutzenlayouts: data.multiNutzenlayouts,
          customerId: customerId,
          salesOrderId: salesOrderId,
          sessionId: sessionId,
          floatingWindowId: floatingWindowId,
          floatingWindowFocus: floatingWindowFocus,
          navigatorKey: navigatorKey,
          defaultRows: 2,
          maxColumns: 3,
          maxWidth: maxWidth,
        );
      },
    );
  }
}

/// Grid view widget for displaying Nutzenlayouts
class _NutzenlayoutListGridView extends HookWidget {
  const _NutzenlayoutListGridView({
    required this.singleNutzenlayouts,
    required this.multiNutzenlayouts,
    required this.customerId,
    required this.salesOrderId,
    required this.sessionId,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.navigatorKey,
    required this.defaultRows,
    required this.maxColumns,
    required this.maxWidth,
  });

  final List<SalesOrderSingleNutzenlayoutDTO> singleNutzenlayouts;
  final List<SalesOrderMultiNutzenlayoutDTO> multiNutzenlayouts;
  final int customerId;
  final int salesOrderId;
  final String sessionId;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  final GlobalKey<NavigatorState> navigatorKey;
  final int defaultRows;
  final int maxColumns;
  final double maxWidth;

  static const double _fullWidth = 200;
  static const double _hSpacing = 8;
  static const double _vSpacing = 8;
  static const double _threshold = 0.65;

  @override
  Widget build(BuildContext context) {
    // Create a combined list with proper typing
    final allNutzenlayoutTiles = <Widget>[
      // Add single Nutzenlayout tiles
      ...singleNutzenlayouts.map(
        (singleNutzenlayout) => _SingleNutzenlayoutTile(
          nutzenlayout: singleNutzenlayout,
          customerId: customerId,
          salesOrderId: salesOrderId,
          sessionId: sessionId,
          floatingWindowId: floatingWindowId,
          floatingWindowFocus: floatingWindowFocus,
          navigatorKey: navigatorKey,
        ),
      ),
      // Add multi Nutzenlayout tiles
      ...multiNutzenlayouts.map(
        (multiNutzenlayout) => _MultiNutzenlayoutTile(
          nutzenlayout: multiNutzenlayout,
          customerId: customerId,
          salesOrderId: salesOrderId,
          sessionId: sessionId,
          floatingWindowId: floatingWindowId,
          floatingWindowFocus: floatingWindowFocus,
          navigatorKey: navigatorKey,
        ),
      ),
    ];

    if (allNutzenlayoutTiles.isEmpty) {
      return const SizedBox.shrink();
    }

    int calculateColumns(int maxCols, double width) {
      var cols = maxCols;
      for (var c = maxCols; c > 1; c--) {
        final threshold =
            (c - 1) * (_fullWidth + _hSpacing) + (_fullWidth * _threshold);
        if (width < threshold) cols = c - 1;
      }
      return cols;
    }

    final columns = calculateColumns(maxColumns, maxWidth);
    final rows = (allNutzenlayoutTiles.length + columns - 1) ~/ columns;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        rows,
        (row) => Padding(
          padding: EdgeInsets.only(bottom: row < rows - 1 ? _vSpacing : 0),
          child: Row(
            children: List.generate(
              columns,
              (col) {
                final index = row * columns + col;
                if (index >= allNutzenlayoutTiles.length) {
                  return const SizedBox();
                }

                final isLast = col == columns - 1;
                final cellWidth = isLast && col > 0
                    ? (maxWidth - (_fullWidth + _hSpacing) * col)
                        .clamp(_fullWidth * _threshold, _fullWidth)
                    : _fullWidth;

                return Padding(
                  padding: EdgeInsets.only(left: col > 0 ? _hSpacing : 0),
                  child: SizedBox(
                    width: cellWidth,
                    child: allNutzenlayoutTiles[index],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

/// Single Nutzenlayout tile
class _SingleNutzenlayoutTile extends ConsumerWidget {
  const _SingleNutzenlayoutTile({
    required this.nutzenlayout,
    required this.customerId,
    required this.salesOrderId,
    required this.sessionId,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.navigatorKey,
  });

  final SalesOrderSingleNutzenlayoutDTO nutzenlayout;
  final int customerId;
  final int salesOrderId;
  final String sessionId;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final salesL10n = context.salesL10n;
    var description = nutzenlayout.nutzenlayout?.description ?? 'N/A';

    if (description.isEmpty) {
      description = salesL10n.soi_einzelformaufbau_singular_short;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        AppOpenInNewTextButton(
          highlightColorOnlyOnHover: true,
          iconPosition: AppOpenInNewTextButtonStyleIconPosition.left,
          onPressed: () async {
            if (nutzenlayout.nutzenlayout != null) {
              await showElbDialog<void>(
                context: context,
                child: EditEinzelformaufbauDialog(
                  nutzenlayout: Nutzenlayout.fromSingleDTO(
                    nutzenlayout.nutzenlayout!,
                  ),
                  customerId: customerId,
                  salesOrderId: salesOrderId,
                  sessionId: sessionId,
                  floatingWindowId: floatingWindowId,
                  floatingWindowFocus: floatingWindowFocus,
                  navigatorKey: navigatorKey,
                ),
                navigatorKey: navigatorKey,
              );
            }
          },
          label: description,
        ),
        AppText(
          salesL10n.soi_einzelformaufbau_singular_short,
          maxLines: 1,
          color:
              context.appTheme.generalColors.onBackground.withAppOpacity(0.8),
          fontSize: 13,
        ),
      ],
    );
  }
}

/// Multi Nutzenlayout tile
class _MultiNutzenlayoutTile extends ConsumerWidget {
  const _MultiNutzenlayoutTile({
    required this.nutzenlayout,
    required this.customerId,
    required this.salesOrderId,
    required this.sessionId,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.navigatorKey,
  });

  final SalesOrderMultiNutzenlayoutDTO nutzenlayout;
  final int customerId;
  final int salesOrderId;
  final String sessionId;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final salesL10n = context.salesL10n;
    var description = nutzenlayout.nutzenlayout?.description ?? 'N/A';

    if (description.isEmpty) {
      description = salesL10n.soi_sammelformaufbau_singular_short;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        AppOpenInNewTextButton(
          highlightColorOnlyOnHover: true,
          iconPosition: AppOpenInNewTextButtonStyleIconPosition.left,
          onPressed: () async {
            if (nutzenlayout.nutzenlayout != null) {
              // Extract artworks from the DTO
              final includedArtworks = nutzenlayout.artworks
                      ?.map((e) => Artwork.fromDTO(e.artwork!))
                      .toList() ??
                  [];

              await showElbDialog<void>(
                context: context,
                child: EditMultiNutzenlayoutSelectionDialog(
                  nutzenlayout: Nutzenlayout.fromSingleDTO(
                    nutzenlayout.nutzenlayout!,
                  ),
                  customerId: customerId,
                  salesOrderId: salesOrderId,
                  sessionId: sessionId,
                  floatingWindowId: floatingWindowId,
                  floatingWindowFocus: floatingWindowFocus,
                  navigatorKey: navigatorKey,
                  includedArtworks: includedArtworks,
                ),
                navigatorKey: navigatorKey,
              );
            }
          },
          label: description,
        ),
        AppText(
          salesL10n.soi_sammelformaufbau_singular_short,
          maxLines: 1,
          color:
              context.appTheme.generalColors.onBackground.withAppOpacity(0.8),
          fontSize: 13,
        ),
      ],
    );
  }
}
