part of '../add_single_nutzenlayout_dialog.dart';

class _AddSingleNutzenlayoutSelectArtworksPage extends HookConsumerWidget {
  const _AddSingleNutzenlayoutSelectArtworksPage({
    required this.salesOrderId,
    required this.sessionId,
    required this.customerId,
    required this.navigatorKey,
    required this.showOnlyWithoutSingleNutzelayoutNotifier,
    required this.artworkId,
  });
  final int salesOrderId;
  final String sessionId;
  final int customerId;
  final GlobalKey<NavigatorState> navigatorKey;
  final ValueNotifier<bool> showOnlyWithoutSingleNutzelayoutNotifier;
  final int? artworkId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // we want to show all products with artworks, so the user can select
    // the artworks for which he wants to add/create a nutzenlayout
    final products = ref.watch(
      watchProductsBySalesOrderProvider(salesOrderId, sessionId),
    );

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
                        selectedArtworksForEinzelformaufbauProvider(sessionId)
                            .notifier,
                      )
                      .toggleArtwork(
                        matchingArtwork.copyWith(product: product),
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
                  showOnlyWithoutSingleNutzelayoutNotifier:
                      showOnlyWithoutSingleNutzelayoutNotifier,
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
                    showOnlyWithoutSingleNutzelayoutNotifier:
                        showOnlyWithoutSingleNutzelayoutNotifier,
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
    required this.showOnlyWithoutSingleNutzelayoutNotifier,
    super.key,
  });
  final Product product;
  final int customerId;
  final int salesOrderId;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;
  final ValueNotifier<bool> showOnlyWithoutSingleNutzelayoutNotifier;
  @override
  Widget build(BuildContext context) {
    useValueListenable(showOnlyWithoutSingleNutzelayoutNotifier);

    return Column(
      children: [
        for (final artwork in product.artworks)
          _ArtworkTile(
            artwork: artwork,
            customerId: customerId,
            product: product,
            sessionId: sessionId,
            salesOrderId: salesOrderId,
            navigatorKey: navigatorKey,
            showOnlyWithoutEinzelformaufbau:
                showOnlyWithoutSingleNutzelayoutNotifier.value,
            key: ValueKey(artwork.id.toString()),
          ),
      ],
    );
  }
}

class _ArtworkTile extends HookConsumerWidget {
  const _ArtworkTile({
    required this.artwork,
    required this.product,
    required this.sessionId,
    required this.navigatorKey,
    required this.customerId,
    required this.salesOrderId,
    required this.showOnlyWithoutEinzelformaufbau,
    super.key,
  });
  final Artwork artwork;
  final Product product;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;
  final int customerId;
  final int salesOrderId;
  final bool showOnlyWithoutEinzelformaufbau;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // we are fetching all nutzenlayouts for artwork in the sales order
    // to check if the artwork already has a nutzenlayout

    useEffect(
      () {
        // when the artwork sizes changes, deselect the artwork
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          final selectedSize = ref
              .read(
                selectedArtworksForEinzelformaufbauProvider(sessionId),
              )
              .firstOrNull
              ?.size;
          final artworkSize = artwork.size;
          if (selectedSize != artworkSize) {
            ref
                .read(
                  selectedArtworksForEinzelformaufbauProvider(sessionId)
                      .notifier,
                )
                .removeArtwork(artwork.id!);
          }
        });
        return null;
      },
      [artwork.size],
    );
    final nutzenlayoutsByArtwork = ref.watch(
      fetchAndWatchArtworkSingleNutzenlayoutsBySalesOrderProvider(
        salesOrderId: salesOrderId,
        artworkId: artwork.id!,
      ),
    );
    // we are getting the selected size from the first selected artwork, so
    // we can disable all artworks with a different size
    final selectedSize = ref
        .watch(
          selectedArtworksForEinzelformaufbauProvider(sessionId),
        )
        .firstOrNull
        ?.size;

    if (artwork.height == 0 || artwork.width == 0) {
      return const SizedBox.shrink();
    }

    return nutzenlayoutsByArtwork.fastWhen(
      data: (layouts) {
        final isDisabled = selectedSize != null && selectedSize != artwork.size;
        // showing all artworks for selection
        if (!showOnlyWithoutEinzelformaufbau || layouts.isEmpty) {
          return _SelectArtwork(
            customerId: customerId,
            isDisabled: isDisabled,
            artwork: artwork,
            product: product,
            sessionId: sessionId,
            navigatorKey: navigatorKey,
            nutzenlayouts: layouts,
          );
        }

        return const SizedBox.shrink();
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
    required this.isDisabled,
    required this.customerId,
  });
  final Artwork artwork;
  final Product product;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;
  final List<Nutzenlayout> nutzenlayouts;
  final bool isDisabled;
  final int customerId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // we are checking if the artwork is already selected
    final isSelected = ref
        .watch(selectedArtworksForEinzelformaufbauProvider(sessionId))
        .any((selection) => selection.id == artwork.id!);

    final onToggle = useCallback(
      () {
        final res = ref
            .read(
              selectedArtworksForEinzelformaufbauProvider(sessionId).notifier,
            )
            .toggleArtwork(artwork.copyWith(product: product));

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
      [artwork.size],
    );

    return ElbListTile(
      leading: AppCheckbox(
        value: isSelected,
        onChanged: isDisabled
            ? null
            : (v) {
                onToggle();
              },
      ),
      onPressed: isDisabled ? null : onToggle,
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
              isDisabled: isDisabled,
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
    required this.showOnlyWithoutSingleNutzelayoutNotifier,
  });
  final int salesOrderId;
  final String sessionId;
  final ValueNotifier<bool> showOnlyWithoutSingleNutzelayoutNotifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useValueListenable(showOnlyWithoutSingleNutzelayoutNotifier);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText(
          'Nur Artworks ohne Einzelformaufbau anzeigen'.hc,
        ),
        AppCheckbox(
          value: showOnlyWithoutSingleNutzelayoutNotifier.value,
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
              final addedNutzenlayouts = ref
                  .read(
                    fetchAndWatchSalesOrderSingleNutzenlayoutsProvider(
                      salesOrderId: salesOrderId,
                    ),
                  )
                  .requireValue;

              // the current selected artworks for this session
              final currentSelection = ref.read(
                selectedArtworksForEinzelformaufbauProvider(
                  sessionId,
                ),
              );

              // we have to loop through all current selected artworks
              // and remove them from the selection if they have a nutzenlayout
              for (final s in currentSelection) {
                // we are checking if the artwork is in any of the nutzenlayouts
                // for the sales order
                final isInNutzenlayout = addedNutzenlayouts.firstWhereOrNull(
                      (element) => element.artworkIds.contains(s.id),
                    ) !=
                    null;
                if (isInNutzenlayout) {
                  // if the artwork is in a nutzenlayout, we remove it from
                  //the selection
                  ref
                      .read(
                        selectedArtworksForEinzelformaufbauProvider(
                          sessionId,
                        ).notifier,
                      )
                      .removeArtwork(s.id!);
                }
              }
            }

            showOnlyWithoutSingleNutzelayoutNotifier.value = v;
          },
        ),
      ],
    );
  }
}
