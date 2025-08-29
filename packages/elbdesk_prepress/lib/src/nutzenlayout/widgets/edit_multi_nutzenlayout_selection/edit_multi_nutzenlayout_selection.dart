import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_prepress/src/nutzenlayout/widgets/nutzenlayout_matrix_list_view.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditMultiNutzenlayoutSelectionDialog extends HookConsumerWidget {
  const EditMultiNutzenlayoutSelectionDialog({
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.navigatorKey,
    required this.salesOrderId,
    required this.sessionId,
    required this.customerId,
    required this.nutzenlayout,
    this.includedArtworks,
    super.key,
  });
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  final GlobalKey<NavigatorState> navigatorKey;
  final int salesOrderId;
  final String sessionId;
  final int customerId;
  final Nutzenlayout nutzenlayout;
  final List<Artwork>? includedArtworks;

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final isSaving = useValueNotifier<bool>(false);
    final onSave = useCallback(
      () async {
        // if (isSaving.value) return;
        // isSaving.value = true;
        // final (:data, :exception, :success) =
        //     await AsyncHandler.handleAsyncOperation(
        //   context,
        //   () => ref
        //       .read(nutzenlayoutRepositoryProvider)
        //       .detachArtworksFromSalesOrderNutzenlayout(
        //         salesOrderId: salesOrderId,
        //         nutzenlayoutId: nutzenlayout.id!,
        //         artworkIds: deselectedArtworkIds.value,
        //       ),
        //   errorNavigatorKey: navigatorKey,
        // );
        // if (success && context.mounted) {
        //   Navigator.of(context).pop();
        // }
      },
      [],
    );

    // If includedArtworks is null, fetch them from the products
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

        final artworksIncludedInNutzenlayout = includedArtworks ??
            artworks
                .where(
                  (artwork) => nutzenlayout.columns.any(
                    (column) => column.cells.any(
                      (cell) => cell.artworkId == artwork.id,
                    ),
                  ),
                )
                .toList()
          ..sort((a, b) {
            // First compare by productId
            // Compare directly, this will work even if the product
            // is not included
            final productIdComparison = a.productId.compareTo(b.productId);
            // If productIds are the same, compare by product.index
            return productIdComparison != 0
                ? productIdComparison
                : a.product!.productIndex.compareTo(b.product!.productIndex);
          });

        return ElbDialog(
          isSelfScrollable: true,
          onSaveAndCloseShortcut: onSave,
          maxWidth: 2400,
          title: 'Sammelformaufbau'.hc,
          floatingWindowId: floatingWindowId,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _Body(
                nutzenlayout: nutzenlayout,
                salesOrderId: salesOrderId,
                sessionId: sessionId,
                customerId: customerId,
                navigatorKey: navigatorKey,
                includedArtworks: artworksIncludedInNutzenlayout,
              ),
              const AppDivider(),
              const SizedBox(height: AppSpace.m),
              _SubmitButton(
                nutzenlayout: nutzenlayout,
                sessionId: sessionId,
                salesOrderId: salesOrderId,
                navigatorKey: navigatorKey,
                isSaving: isSaving,
                onSave: onSave,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SubmitButton extends HookConsumerWidget {
  const _SubmitButton({
    required this.nutzenlayout,
    required this.sessionId,
    required this.salesOrderId,
    required this.navigatorKey,
    required this.isSaving,
    required this.onSave,
  });

  final String sessionId;
  final int salesOrderId;

  final GlobalKey<NavigatorState> navigatorKey;
  final VoidCallback onSave;

  final Nutzenlayout nutzenlayout;

  final ValueNotifier<bool> isSaving;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    useValueListenable(isSaving);

    return Align(
      alignment: Alignment.centerRight,
      child: AppButton.secondary(
        isLoading: isSaving.value,
        onPressed: isSaving.value ? null : () => Navigator.of(context).pop(),
        label: l10n.gen_close,
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.nutzenlayout,
    required this.salesOrderId,
    required this.sessionId,
    required this.customerId,
    required this.navigatorKey,
    required this.includedArtworks,
  });
  final Nutzenlayout nutzenlayout;
  final int salesOrderId;
  final String sessionId;
  final int customerId;
  final GlobalKey<NavigatorState> navigatorKey;
  final List<Artwork> includedArtworks;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 280,
            child: _ArtworksInNutzenlayout(
              nutzenlayout: nutzenlayout,
              salesOrderId: salesOrderId,
              sessionId: sessionId,
              customerId: customerId,
              navigatorKey: navigatorKey,
              includedArtworks: includedArtworks,
            ),
          ),
          const SizedBox(width: UiConstants.defaultPadding),
          const AppDivider.vertical(),
          const SizedBox(width: UiConstants.defaultPadding),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 2,
                  child: NutzenlayoutMatrixListView(
                    nutzenlayout: nutzenlayout,
                    formType: NutzenlayoutFormType.einzelform,
                  ),
                ),
                const SizedBox(width: UiConstants.defaultPadding),
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: IgnorePointer(
                      ignoring: true,
                      child: NutzenlayoutMatrixView(
                        availableArtworks: includedArtworks,
                        nutzenlayout: nutzenlayout,
                        navigatorKey: navigatorKey,
                        sessionId: sessionId,
                        isExistingMultiNutzenlayout: true,
                      ),
                    ),
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

class _ArtworksInNutzenlayout extends HookConsumerWidget {
  const _ArtworksInNutzenlayout({
    required this.salesOrderId,
    required this.sessionId,
    required this.customerId,
    required this.navigatorKey,
    required this.nutzenlayout,
    required this.includedArtworks,
  });
  final int salesOrderId;
  final String sessionId;
  final int customerId;
  final GlobalKey<NavigatorState> navigatorKey;
  final Nutzenlayout nutzenlayout;
  final List<Artwork> includedArtworks;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();

    return AppScrollbar(
      controller: scrollController,
      child: ListView.separated(
        controller: scrollController,
        itemCount: includedArtworks.length,
        separatorBuilder: (context, index) =>
            const AppListViewSeperator.divider(),
        itemBuilder: (context, index) {
          final artwork = includedArtworks[index];
          return _ArtworkTile(
            customerId: customerId,
            nutzenlayout: nutzenlayout,
            artwork: artwork,
            sessionId: sessionId,
            salesOrderId: salesOrderId,
            navigatorKey: navigatorKey,
            includedArtworks: includedArtworks,
            key: ValueKey(artwork.id),
          );
        },
      ),
    );
  }
}

class _ArtworkTile extends HookConsumerWidget {
  const _ArtworkTile({
    required this.artwork,
    required this.sessionId,
    required this.navigatorKey,
    required this.salesOrderId,
    required this.nutzenlayout,
    required this.includedArtworks,
    required this.customerId,
    super.key,
  });
  final Artwork artwork;

  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;
  final int salesOrderId;
  final Nutzenlayout nutzenlayout;
  final List<Artwork> includedArtworks;
  final int customerId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          '${includedArtworks.indexWhere((a) => a.id == artwork.id) + 1}:  ',
        ),
        ArtworkListItem(
          artwork: artwork,
          customerId: customerId,
        ),
      ],
    );
  }
}
