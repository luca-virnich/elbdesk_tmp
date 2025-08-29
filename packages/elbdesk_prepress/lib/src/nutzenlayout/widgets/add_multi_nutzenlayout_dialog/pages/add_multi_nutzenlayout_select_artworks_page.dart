part of '../add_multi_nutzenlayout_dialog.dart';

class _AddMultiNutzenlayoutSelectArtworksPage extends HookConsumerWidget {
  const _AddMultiNutzenlayoutSelectArtworksPage({
    required this.salesOrderId,
    required this.sessionId,
    required this.customerId,
    required this.navigatorKey,
    this.artworkId,
  });
  final int salesOrderId;
  final String sessionId;
  final int customerId;
  final GlobalKey<NavigatorState> navigatorKey;
  final int? artworkId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // we want to show all products with artworks, so the user can select
    // the artworks for which he wants to add/create a nutzenlayout
    final products = ref.watch(
      watchProductsBySalesOrderProvider(salesOrderId, sessionId),
    );
    // whether the list should only show products with artworks that have
    // no nutzenlayout
    final showOnlyWithoutNutzelayoutNotifier = useValueNotifier<bool>(true);

    final scrollController = useScrollController();

    // Auto-select artwork if artworkId is provided
    useEffect(
      () {
        if (artworkId != null) {
          products.whenData((productsList) {
            // Find the artwork in the products list
            for (final product in productsList) {
              final matchingArtwork = product.artworks.firstWhereOrNull(
                (artwork) => artwork.id == artworkId,
              );
              if (matchingArtwork != null) {
                // Wait for first frame
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  // Select the artwork
                  ref
                      .read(
                        selectedArtworksForSammelformaufbauProvider(sessionId)
                            .notifier,
                      )
                      .toggleArtwork(
                        MultiNutzenlayoutArtworkSelection(
                          artwork: matchingArtwork.copyWith(product: product),
                        ),
                      );
                });
              }
            }
          });
        }
        return null;
      },
      [artworkId],
    );

    return products.fastWhen(
      data: (products) {
        return Column(
          children: [
            CardSectionTitle(
              title: '',
              trailingWidgets: [
                _ToggleOnlyArtworksWithoutNutzenlayoutButton(
                  salesOrderId: salesOrderId,
                  sessionId: sessionId,
                  showOnlyWithoutNutzelayoutNotifier:
                      showOnlyWithoutNutzelayoutNotifier,
                ),
              ],
            ),
            const SizedBox(height: AppSpace.l),
            Expanded(
              child: AppScrollbar(
                controller: scrollController,
                child: ListView.separated(
                  controller: scrollController,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) =>
                      const AppListViewSeperator.divider(height: 1),
                  padding: const EdgeInsets.only(
                    right: UiConstants.defaultPadding,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) => _ProductTile(
                    key: ValueKey(products[index].meta.id),
                    product: products[index],
                    customerId: customerId,
                    salesOrderId: salesOrderId,
                    sessionId: sessionId,
                    navigatorKey: navigatorKey,
                    showOnlyWithoutNutzelayoutNotifier:
                        showOnlyWithoutNutzelayoutNotifier,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _ProductTile extends HookWidget {
  const _ProductTile({
    required this.product,
    required this.customerId,
    required this.salesOrderId,
    required this.sessionId,
    required this.navigatorKey,
    required this.showOnlyWithoutNutzelayoutNotifier,
    super.key,
  });
  final Product product;
  final int customerId;
  final int salesOrderId;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;
  final ValueNotifier<bool> showOnlyWithoutNutzelayoutNotifier;
  @override
  Widget build(BuildContext context) {
    useValueListenable(showOnlyWithoutNutzelayoutNotifier);
    return Column(
      children: [
        for (final artwork in product.artworks)
          _ArtworkTile(
            artwork: artwork,
            product: product,
            sessionId: sessionId,
            salesOrderId: salesOrderId,
            customerId: customerId,
            navigatorKey: navigatorKey,
            showOnlyWithoutNutzenlayout:
                showOnlyWithoutNutzelayoutNotifier.value,
            key: ValueKey(artwork.id.toString()),
          ),
      ],
    );
  }
}

class _ArtworkTile extends ConsumerWidget {
  const _ArtworkTile({
    required this.artwork,
    required this.product,
    required this.sessionId,
    required this.navigatorKey,
    required this.salesOrderId,
    required this.customerId,
    required this.showOnlyWithoutNutzenlayout,
    super.key,
  });
  final Artwork artwork;
  final Product product;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;
  final int salesOrderId;
  final int customerId;
  final bool showOnlyWithoutNutzenlayout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (artwork.height == 0 || artwork.width == 0) {
      return const SizedBox.shrink();
    }

    final nutzenlayoutsByArtwork = ref.watch(
      fetchAndWatchArtworkNutzenlayoutsBySalesOrderProvider(
        salesOrderId: salesOrderId,
        artworkId: artwork.id!,
      ),
    );

    return nutzenlayoutsByArtwork.fastWhen(
      data: (nutzenlayouts) {
        if (showOnlyWithoutNutzenlayout) {
          return nutzenlayouts.isEmpty
              ? _SelectArtwork(
                  artwork: artwork,
                  product: product,
                  sessionId: sessionId,
                  navigatorKey: navigatorKey,
                  nutzenlayouts: nutzenlayouts,
                  customerId: customerId,
                )
              : const SizedBox.shrink();
        }
        return _SelectArtwork(
          artwork: artwork,
          product: product,
          sessionId: sessionId,
          navigatorKey: navigatorKey,
          nutzenlayouts: nutzenlayouts,
          customerId: customerId,
        );
      },
    );
  }
}

class _SelectArtwork extends HookConsumerWidget {
  const _SelectArtwork({
    required this.artwork,
    required this.product,
    required this.sessionId,
    required this.navigatorKey,
    required this.nutzenlayouts,
    required this.customerId,
  });
  final Artwork artwork;
  final Product product;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;
  final List<Nutzenlayout> nutzenlayouts;
  final int customerId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // we are checking if the artwork is already selected
    final isSelected = ref
        .watch(selectedArtworksForSammelformaufbauProvider(sessionId))
        .any((selection) => selection.artwork.id == artwork.id);

    final onToggle = useCallback(
      () {
        final res = ref
            .read(
              selectedArtworksForSammelformaufbauProvider(sessionId).notifier,
            )
            .toggleArtwork(
              MultiNutzenlayoutArtworkSelection(
                artwork: artwork.copyWith(product: product),
              ),
            );
        // we are checking the the size is the same as the already selected size
        // as we are only showing artworks with the same size as soon one is
        // selected, this should never happen, just in case we check it

        if (!res) {
          AppNotificationOverlay.error(
            context,
            'Die Breite und Höhe der Artworks muss gleich sein'.hc,
            navigatorKey: navigatorKey,
          );
        }
      },
      [],
    );

    return ElbListTile(
      leading: AppCheckbox(
        value: isSelected,
        onChanged: (v) {
          onToggle();
        },
      ),
      onPressed: onToggle,
      child: Expanded(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: AppSpace.m,
            ),
            ArtworkListItem(
              artwork: artwork.copyWith(product: product),
              customerId: customerId,
            ),
            const SizedBox(width: UiConstants.defaultPadding),
            AppWrap(
              children: nutzenlayouts
                  .map(
                    (nutzenlayout) => NutzenlayoutTag(
                      nutzenlayout: nutzenlayout,
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _ToggleOnlyArtworksWithoutNutzenlayoutButton extends HookConsumerWidget {
  const _ToggleOnlyArtworksWithoutNutzenlayoutButton({
    required this.salesOrderId,
    required this.sessionId,
    required this.showOnlyWithoutNutzelayoutNotifier,
  });
  final int salesOrderId;
  final String sessionId;
  final ValueNotifier<bool> showOnlyWithoutNutzelayoutNotifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useValueListenable(showOnlyWithoutNutzelayoutNotifier);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText(
          'Nur Artworks ohne Formaufbau anzeigen'.hc,
        ),
        AppCheckbox(
          value: showOnlyWithoutNutzelayoutNotifier.value,
          onChanged: (v) {
            // when we change the value to true, so we only show artworks
            // without nutzenlayouts, we need to remove all artworks that are
            // in the current selection which have a nutzenlayout.
            //
            // The reason is, when toggle to false, and then select an artwork
            // which has a nutzenlayout, the artwork will be added to the
            // selection, but the nutzenlayout will not be visible in the list
            // when toggle back to true.
            //
            // So we have a selected artwork which is not visible which is
            // and unexpected behavior.

            if (v == true) {
              // we need to fetch all nutzenlayouts for the sales order
              final addedMultiNutzenlayouts = ref
                  .read(
                    fetchAndWatchSalesOrderMultiNutzenlayoutsProvider(
                      salesOrderId: salesOrderId,
                    ),
                  )
                  .requireValue;
              final addedSingleNutzenlayouts = ref
                  .read(
                    fetchAndWatchSalesOrderSingleNutzenlayoutsProvider(
                      salesOrderId: salesOrderId,
                    ),
                  )
                  .requireValue;

              // the current selected artworks for this session
              final currentSelection = ref.read(
                selectedArtworksForSammelformaufbauProvider(
                  sessionId,
                ),
              );

              // we have to loop through all current selected artworks
              // and remove them from the selection if they have a nutzenlayout
              for (final s in currentSelection) {
                // we are checking if the artwork is in any of the nutzenlayouts
                // for the sales order
                final hasSingleNutzenlayout =
                    addedSingleNutzenlayouts.firstWhereOrNull(
                          (element) =>
                              element.artworkIds.contains(s.artwork.id),
                        ) !=
                        null;
                final hasMultiNutzenlayout =
                    addedMultiNutzenlayouts.firstWhereOrNull(
                          (element) =>
                              element.artworkIds.contains(s.artwork.id),
                        ) !=
                        null;
                if (hasSingleNutzenlayout || hasMultiNutzenlayout) {
                  // if the artwork is in a nutzenlayout, we remove it from
                  //the selection
                  ref
                      .read(
                        selectedArtworksForSammelformaufbauProvider(
                          sessionId,
                        ).notifier,
                      )
                      .removeArtwork(s);
                }
              }
            }

            showOnlyWithoutNutzelayoutNotifier.value = v;
          },
        ),
      ],
    );
  }
}
