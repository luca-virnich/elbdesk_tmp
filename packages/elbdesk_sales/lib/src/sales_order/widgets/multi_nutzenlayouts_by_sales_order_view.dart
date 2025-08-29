import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

class MultiNutzenlayoutsBySalesOrderView extends ConsumerWidget {
  const MultiNutzenlayoutsBySalesOrderView({
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
    final salesL10n = context.salesL10n;
    final salesOrderNutzenlayouts = ref.watch(
      fetchAndWatchSalesOrderMultiNutzenlayoutsProvider(
        salesOrderId: salesOrderId,
      ),
    );
    return Column(
      children: [
        CollapsibleCardSection(
          leadingIcon: AppIcons.soiSammelformaufbau,
          identifier: ComponentIdentifier
              .salesOrderCardItemsPageMultiNutzenlayouts.name,
          title: salesL10n.soi_sammelformaufbau_plural,
          trailingWidgets: [
            AddEntityInCardButton(
              tooltip: '',
              onPressed: () async {
                await showElbDialog<void>(
                  context: context,
                  child: AddSammelformaufbauDialog(
                    customerId: customerId,
                    salesOrderId: salesOrderId,
                    sessionId: sessionId,
                    floatingWindowId: floatingWindowId,
                    floatingWindowFocus: floatingWindowFocus,
                    navigatorKey: navigatorKey,
                  ),
                  navigatorKey: navigatorKey,
                );
              },
            ),
          ],
          child: salesOrderNutzenlayouts.fastWhen(
            data: (layouts) => ListView.separated(
              separatorBuilder: (context, index) =>
                  const AppListViewSeperator.space(),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: layouts.length,
              itemBuilder: (context, index) {
                final salesOrderNutzenlayout = layouts[index];

                return _MultiNutzenlayoutTile(
                  salesOrderNutzenlayout: salesOrderNutzenlayout,
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

class _MultiNutzenlayoutTile extends HookConsumerWidget {
  const _MultiNutzenlayoutTile({
    required this.salesOrderNutzenlayout,
    required this.customerId,
    required this.salesOrderId,
    required this.sessionId,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.navigatorKey,
  });

  final SalesOrderMultiNutzenlayoutLight salesOrderNutzenlayout;
  final int customerId;
  final int salesOrderId;
  final String sessionId;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final generalColors = context.appTheme.generalColors;
    final borderRadiuses = context.appTheme.borderRadiuses;
    final locale = l10n.localeName;

    final nutzenlayout = salesOrderNutzenlayout.nutzenlayout;
    final artworkIdsFromNutzenlayout = salesOrderNutzenlayout.artworkIds;

    final products = ref.watch(
      watchProductsBySalesOrderProvider(salesOrderId, sessionId),
    );

    return products.fastWhen(
      data: (products) {
        final artworks = products
            .expand(
              (product) => product.artworks
                  .map((artwork) => artwork.copyWith(product: product)),
            )
            .toList();

        final artworksIncludedInNutzenlayout = artworks
            .where(
              (artwork) => artworkIdsFromNutzenlayout.contains(artwork.id),
            )
            .toList()
          ..sort((a, b) {
            // First compare by productId
            final productIdComparison =
                a.product!.productId.compareTo(b.product!.productId);
            // If productIds are the same, compare by product.index
            return productIdComparison != 0
                ? productIdComparison
                : a.product!.productIndex.compareTo(b.product!.productIndex);
          });
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
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isSmallLayout = constraints.maxWidth < 450;
              final infoRowWidth = isSmallLayout
                  ? constraints.maxWidth
                  : constraints.maxWidth * 0.4;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //title row

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: AppText(
                          salesOrderNutzenlayout.nutzenlayout.description,
                          style: context.appTheme.textStyles.h2,
                          maxLines: 1,
                        ),
                      ),
                      AppIconButton.secondary(
                        onPressed: () async {
                          await showElbDialog<void>(
                            context: context,
                            child: EditMultiNutzenlayoutSelectionDialog(
                              nutzenlayout: salesOrderNutzenlayout.nutzenlayout,
                              customerId: customerId,
                              salesOrderId: salesOrderId,
                              sessionId: sessionId,
                              floatingWindowId: floatingWindowId,
                              floatingWindowFocus: floatingWindowFocus,
                              navigatorKey: navigatorKey,
                              includedArtworks: artworksIncludedInNutzenlayout,
                            ),
                            navigatorKey: navigatorKey,
                          );
                        },
                        iconData: AppIcons.edit,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpace.m),

                  //info row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: AppSpace.xl,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Column(
                          children: [
                            LabeledValueRow(
                              title: 'Drucklänge'.hc,
                              value: nutzenlayout
                                  .formattedDrucklaengeAndZaehne(locale),
                              width: infoRowWidth,
                            ),
                            LabeledValueRow(
                              title: 'Laufrichtung'.hc,
                              value: nutzenlayout.laufrichtung.readable(l10n),
                              width: infoRowWidth,
                            ),
                            LabeledValueRow(
                              title: 'Matrix'.hc,
                              value: salesOrderNutzenlayout.nutzenlayout.matrix,
                              width: infoRowWidth,
                            ),
                            LabeledValueRow(
                              title: 'Offset'.hc,
                              value: salesOrderNutzenlayout.nutzenlayout
                                  .offset(locale),
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
                              return ArtworkListGridView(
                                artworks: artworksIncludedInNutzenlayout,
                                customerId: customerId,
                                defaultRows: 3,
                                maxColumns: 4,
                                maxWidth: constraints.maxWidth,
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                  if (isSmallLayout)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: AppSpace.l,
                        ),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return ArtworkListGridView(
                              artworks: artworksIncludedInNutzenlayout,
                              customerId: customerId,
                              defaultRows: 2,
                              maxColumns: 2,
                              maxWidth: constraints.maxWidth,
                            );
                          },
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
