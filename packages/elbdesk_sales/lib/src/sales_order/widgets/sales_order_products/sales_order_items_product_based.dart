import 'package:collection/collection.dart';
import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_sales/elbdesk_sales.dart';
import 'package:elbdesk_sales/src/sales_order/widgets/sales_order_products/soi_status_picto_tile.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SalesOrderItemsProductBased extends HookConsumerWidget {
  const SalesOrderItemsProductBased({
    required this.customerId,
    required this.salesOrderId,
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.sessionId,
    required this.showProducts,
    super.key,
  });

  final int customerId;

  final int salesOrderId;
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;

  final FocusNode floatingWindowFocus;

  final String sessionId;
  final ValueNotifier<bool> showProducts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. We need all products for the sales order
    final products = ref.watch(
      watchProductsBySalesOrderProvider(salesOrderId, sessionId),
    );

    return products.fastWhen(
      skipLoadingOnRefresh: true,
      data: (products) {
        return ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) {
            return const AppListViewSeperator.divider();
          },
          shrinkWrap: true,
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return _ProductTile(
              key: ValueKey(product.meta.id!.toString()),
              product: product,
              customerId: customerId,
              salesOrderId: salesOrderId,
              sessionId: sessionId,
              navigatorKey: navigatorKey,
              showProducts: showProducts,
              floatingWindowId: floatingWindowId,
              floatingWindowFocus: floatingWindowFocus,
            );
          },
        );
      },
    );
  }
}

// we are showing all the products for the sales order
// and then we are showing the artworks/product parts for each product
class _ProductTile extends HookConsumerWidget {
  const _ProductTile({
    required this.product,
    required this.customerId,
    required this.salesOrderId,
    required this.sessionId,
    required this.navigatorKey,
    required this.showProducts,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    super.key,
  });

  final Product product;
  final int customerId;
  final int salesOrderId;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;
  final ValueNotifier<bool> showProducts;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useValueListenable(showProducts);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AnimatedSize(
          duration: AnimationConstants.defaultDuration,
          curve: AnimationConstants.defaultCurve,
          child: SizedBox(
            width: showProducts.value ? 175 : 0,
            child: showProducts.value
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 1),
                      child: SizedBox(
                        height: UiConstants.buttonHeight,
                        child: AppOpenInNewTextButton(
                          highlightColorOnlyOnHover: true,
                          iconPosition:
                              AppOpenInNewTextButtonStyleIconPosition.left,
                          onPressed: () {
                            ref.openWindow(
                              FloatingProductWindowData(
                                productId: product.meta.id,
                                salesOrderId: salesOrderId,
                              ),
                            );
                          },
                          label: product.fullProductId,
                        ),
                      ),
                    ),
                  )
                : null,
          ),
        ),
        Expanded(
          child: Column(
            spacing: UiConstants.defaultPadding,
            children: [
              for (final (index, artwork) in product.artworks.indexed)
                _ArtworkTile(
                  key: ValueKey(artwork.meta.id!.toString()),
                  product: product,
                  artwork: artwork,
                  index: index,
                  customerId: customerId,
                  salesOrderId: salesOrderId,
                  sessionId: sessionId,
                  navigatorKey: navigatorKey,
                  floatingWindowId: floatingWindowId,
                  floatingWindowFocus: floatingWindowFocus,
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ArtworkTile extends HookConsumerWidget {
  const _ArtworkTile({
    required this.artwork,
    required this.index,
    required this.customerId,
    required this.product,
    required this.salesOrderId,
    required this.sessionId,
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    super.key,
  });

  final Artwork artwork;
  final int index;
  final int customerId;
  final Product product;
  final int salesOrderId;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // we have to fetch all sois for artworks, that can be
    // prepare artwork etc.
    final locale = context.l10n.localeName;

    final nutzenlayoutsAsync = ref.watch(
      fetchAndWatchArtworkNutzenlayoutsBySalesOrderProvider(
        salesOrderId: salesOrderId,
        artworkId: artwork.meta.id!,
      ),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // _AddSalesOrderItemTypeButton(
            //   navigatorKey: navigatorKey,
            //   artwork: artwork,
            //   salesOrderId: salesOrderId,
            //   customerId: customerId,
            // ),
            const SizedBox(width: AppSpace.s),
            SizedBox(
              width: 245,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppOpenInNewTextButton(
                    highlightColorOnlyOnHover: true,
                    iconPosition: AppOpenInNewTextButtonStyleIconPosition.left,
                    onPressed: () {
                      ref.openWindow(
                        FloatingArtworkWindowData(
                          artworkId: artwork.meta.id,
                          customerId: customerId,
                        ),
                      );
                    },
                    label: artwork.fullArtworkIdWithProduct(product),
                  ),
                  AppText(
                    artwork.formattedDimensions(locale),
                    maxLines: 1,
                    color: context.appTheme.generalColors.onBackground
                        .withAppOpacity(0.5),
                    fontSize: 13,
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpace.s),

            Row(
              children: [
                _ArtworkSois(
                  customerId: customerId,
                  artworkId: artwork.meta.id!,
                  navigatorKey: navigatorKey,
                  salesOrderId: salesOrderId,
                  artworkMasterId: artwork.artworkMasterId!,
                ),
                const SizedBox(width: AppSpace.xs),
                nutzenlayoutsAsync.fastWhen(
                  data: (nutzenlayouts) {
                    return Row(
                      children: [
                        _ArtworkNutzenlayouts(
                          customerId: customerId,
                          artworkId: artwork.meta.id!,
                          navigatorKey: navigatorKey,
                          salesOrderId: salesOrderId,
                          sessionId: sessionId,
                          floatingWindowId: floatingWindowId,
                          floatingWindowFocus: floatingWindowFocus,
                          layouts: nutzenlayouts,
                        ),
                        const SizedBox(width: AppSpace.xs),
                        _ArtworkDrucklayouts(
                          isEnabled: nutzenlayouts.isNotEmpty,
                          customerId: customerId,
                          artworkId: artwork.meta.id!,
                          navigatorKey: navigatorKey,
                          salesOrderId: salesOrderId,
                          sessionId: sessionId,
                          floatingWindowId: floatingWindowId,
                          floatingWindowFocus: floatingWindowFocus,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ],
        ),

        // Wrap(
        //   spacing: AppSpace.s,
        //   runSpacing: AppSpace.s,
        //   children: [
        //     if (soisForArtwork != null)
        //       for (final soiArt in soisForArtwork)
        //         SoiStatusTag(
        //           salesOrderItem: soiArt,
        //           customerId: customerId,
        //         ),
        //   ],
        // ),
      ],
    );
  }
}

class _ArtworkNutzenlayouts extends ConsumerWidget {
  const _ArtworkNutzenlayouts({
    required this.customerId,
    required this.artworkId,
    required this.salesOrderId,
    required this.navigatorKey,
    required this.sessionId,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.layouts,
  });

  final int customerId;
  final int artworkId;
  final int salesOrderId;
  final GlobalKey<NavigatorState> navigatorKey;
  final String sessionId;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  final List<Nutzenlayout> layouts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    return Row(
      children: [
        Wrap(
          spacing: AppSpace.s,
          runSpacing: AppSpace.s,
          children: [
            if (layouts.isEmpty) ...[
              // Show NutzenlayoutPictoTile which offers option to create
              NutzenlayoutPictoTile(
                nutzenlayout: null,
                customerId: customerId,
                salesOrderId: salesOrderId,
                artworkId: artworkId,
                sessionId: sessionId,
                floatingWindowId: floatingWindowId,
                floatingWindowFocus: floatingWindowFocus,
                navigatorKey: navigatorKey,
              ),
            ] else if (layouts.length > 1) ...{
              // If several layouts are available, show PictoTile with
              // dialog to show all available Nutzenlayouts
              ElbPopup(
                position: ElbPopupPosition.bottomLeft,
                buttonBuilder: (showOverlay, hideOverlay, isOpen) {
                  return AppPictoTile(
                    label: '${layouts.length} '
                            'Nutzenlayouts'
                        .hc,
                    tooltip: '${layouts.length} '
                            'Nutzenlayouts'
                        .hc,
                    onPressed: showOverlay,
                    icon: AppIcons.soiEinzelformaufbau,
                    size: 55,
                    width: 55 * 2,
                  );
                },
                menuBuilder: (hideOverlay) {
                  return SizedBox(
                    width: 300,
                    child: ElbPopupWrapper(
                      style: ElbPopupStyle(
                        backgroundColor:
                            context.appTheme.generalColors.background,
                        borderColor:
                            context.appTheme.buttonStyles.secondary.borderColor,
                        // borderColor: context.appTheme.generalColors.onBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (final layout in layouts)
                            ElbListTile(
                              leading: Padding(
                                padding:
                                    const EdgeInsets.only(right: AppSpace.s),
                                child: ElbIcon(
                                  size: AppIconSize.xl,
                                  layout.formType ==
                                          NutzenlayoutFormType.einzelform
                                      ? AppIcons.soiEinzelformaufbau
                                      : AppIcons.soiSammelformaufbau,
                                ),
                              ),
                              titleText: layout.matrixReadable(l10n),
                              onPressed: () async {
                                hideOverlay();
                                if (layout.formType ==
                                    NutzenlayoutFormType.einzelform) {
                                  await showElbDialog<void>(
                                    context: context,
                                    child: EditEinzelformaufbauDialog(
                                      nutzenlayout: layout,
                                      customerId: customerId,
                                      salesOrderId: salesOrderId,
                                      sessionId: sessionId,
                                      floatingWindowId: floatingWindowId,
                                      floatingWindowFocus: floatingWindowFocus,
                                      navigatorKey: navigatorKey,
                                    ),
                                    navigatorKey: navigatorKey,
                                  );
                                } else if (layout.formType ==
                                    NutzenlayoutFormType.sammelform) {
                                  await showElbDialog<void>(
                                    context: context,
                                    child: EditMultiNutzenlayoutSelectionDialog(
                                      nutzenlayout: layout,
                                      customerId: customerId,
                                      salesOrderId: salesOrderId,
                                      sessionId: sessionId,
                                      floatingWindowId: floatingWindowId,
                                      floatingWindowFocus: floatingWindowFocus,
                                      navigatorKey: navigatorKey,
                                      includedArtworks: null,
                                    ),
                                    navigatorKey: navigatorKey,
                                  );
                                }
                              },
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            } else
              // If only one layout is available, show PictoTile
              NutzenlayoutPictoTile(
                nutzenlayout: layouts.first,
                customerId: customerId,
                salesOrderId: salesOrderId,
                artworkId: artworkId,
                sessionId: sessionId,
                floatingWindowId: floatingWindowId,
                floatingWindowFocus: floatingWindowFocus,
                navigatorKey: navigatorKey,
              ),
          ],
        ),
      ],
    );
  }
}

/// Drucklayouts associated with a specific artwork
class _ArtworkDrucklayouts extends ConsumerWidget {
  const _ArtworkDrucklayouts({
    required this.customerId,
    required this.artworkId,
    required this.salesOrderId,
    required this.navigatorKey,
    required this.sessionId,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.isEnabled,
  });

  final int customerId;
  final int artworkId;
  final int salesOrderId;
  final GlobalKey<NavigatorState> navigatorKey;
  final String sessionId;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  final bool isEnabled;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ppL10n = context.prepressL10n;

    // Watch drucklayouts associated with this specific artwork
    final drucklayoutsAsync = ref.watch(
      fetchArtworkAssociatedDrucklayoutsBySalesOrderProvider(
        salesOrderId: salesOrderId,
        artworkId: artworkId,
      ),
    );

    return Row(
      children: [
        drucklayoutsAsync.fastWhen(
          data: (drucklayouts) {
            return Wrap(
              spacing: AppSpace.s,
              runSpacing: AppSpace.s,
              children: [
                if (drucklayouts.isEmpty) ...[
                  // Show create button when no drucklayouts exist
                  DrucklayoutPictoTile(
                    isEnabled: isEnabled,
                    drucklayout: null,
                    customerId: customerId,
                    salesOrderId: salesOrderId,
                    artworkId: artworkId,
                    sessionId: sessionId,
                    floatingWindowId: floatingWindowId,
                    floatingWindowFocus: floatingWindowFocus,
                    navigatorKey: navigatorKey,
                  ),
                ] else if (drucklayouts.length > 1) ...[
                  // If several drucklayouts are available, show PictoTile
                  // with overlay
                  AppSimpleOverlay(
                    overlayAlignment: Alignment.topLeft,
                    child: (controller) => AppPictoTile(
                      label: '${drucklayouts.length} '
                          '${ppL10n.drucklayout_plural}',
                      tooltip: '${drucklayouts.length} '
                          '${ppL10n.drucklayout_plural}',
                      onPressed: controller.show,
                      icon: AppIcons.drucklayout,
                      size: 55,
                      width: 55 * 2,
                    ),
                    overlayContent: (controller) => AppSmallOverlayDialog(
                      title: 'Verfügbare ${ppL10n.drucklayout_plural}',
                      content: Column(
                        children: [
                          for (final drucklayout in drucklayouts)
                            ElbListTile(
                              leading: const Padding(
                                padding: EdgeInsets.only(right: AppSpace.s),
                                child: ElbIcon(
                                  size: AppIconSize.xl,
                                  AppIcons.drucklayout,
                                ),
                              ),
                              titleText: drucklayout.title,
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
                                controller.hide();
                              },
                            ),
                        ],
                      ),
                    ),
                  ),
                ] else ...[
                  // If only one drucklayout is available, show PictoTile
                  DrucklayoutPictoTile(
                    drucklayout: drucklayouts.first,
                    customerId: customerId,
                    salesOrderId: salesOrderId,
                    artworkId: artworkId,
                    sessionId: sessionId,
                    floatingWindowId: floatingWindowId,
                    floatingWindowFocus: floatingWindowFocus,
                    navigatorKey: navigatorKey,
                  ),
                ],
              ],
            );
          },
        ),
      ],
    );
  }
}

class _ArtworkSois extends ConsumerWidget {
  const _ArtworkSois({
    required this.customerId,
    required this.artworkId,
    required this.navigatorKey,
    required this.salesOrderId,
    required this.artworkMasterId,
  });

  final int customerId;
  final int artworkId;
  final GlobalKey<NavigatorState> navigatorKey;
  final int salesOrderId;
  final int artworkMasterId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final soisForArtwork = ref
        .watch(
          watchSalesOrderItemsByArtworkProvider(
            artworkId,
          ),
        )
        .valueOrNull;

    final artworkSois = SalesOrderItemType.values.artworkSoiTypes;
    final einzelNutzenAufbauSoi = soisForArtwork?.firstWhereOrNull(
      (soi) => soi.type == SalesOrderItemType.einzelformaufbau,
    );
    return Wrap(
      spacing: AppSpace.xs,
      runSpacing: AppSpace.xs,
      children: [
        for (final soiType in artworkSois)
          SoiStatusPictoTile(
            activeSalesOrderItems: soisForArtwork ?? [],
            customerId: customerId,
            salesOrderItemType: soiType,
            navigatorKey: navigatorKey,
            artworkId: artworkId,
            salesOrderId: salesOrderId,
            artworkMasterId: artworkMasterId,
          ),
        if (einzelNutzenAufbauSoi != null) ...[
          _EinzelformaufbauTag(
            salesOrderItem: einzelNutzenAufbauSoi,
          ),
        ],
      ],
    );
  }
}

class _EinzelformaufbauTag extends ConsumerWidget {
  const _EinzelformaufbauTag({
    required this.salesOrderItem,
  });
  final SalesOrderItem salesOrderItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final salesL10n = context.salesL10n;
    return Padding(
      padding: const EdgeInsets.only(top: 1),
      child: ElbTag(
        color: salesOrderItem.status.color,
        label: salesL10n.soi_einzelformaufbau_singular,
        onPressed: () {
          ref.openWindow(
            FloatingSoiEinzelformaufbauWindowData(
              entityId: salesOrderItem.soiTypePrimaryKey,
              customerId: salesOrderItem.customerId,
            ),
          );
        },
      ),
    );
  }
}
