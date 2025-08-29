import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_prepress/src/nutzenlayout/widgets/nutzenlayout_matrix_list_view.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditEinzelformaufbauDialog extends HookConsumerWidget {
  const EditEinzelformaufbauDialog({
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.navigatorKey,
    required this.salesOrderId,
    required this.sessionId,
    required this.customerId,
    required this.nutzenlayout,
    super.key,
  });
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  final GlobalKey<NavigatorState> navigatorKey;
  final int salesOrderId;
  final String sessionId;
  final int customerId;
  final Nutzenlayout nutzenlayout;
  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final deselectedArtworkIds = useValueNotifier<Set<int>>({});
    final isSaving = useValueNotifier<bool>(false);
    final onSave = useCallback(
      () async {
        if (isSaving.value) return;
        isSaving.value = true;
        final (:data, :exception, :success) =
            await AsyncHandler.handleAsyncOperation(
          context,
          () => ref
              .read(nutzenlayoutRepositoryProvider)
              .detachArtworksFromSalesOrderNutzenlayout(
                salesOrderId: salesOrderId,
                nutzenlayoutId: nutzenlayout.id!,
                artworkIds: deselectedArtworkIds.value,
              ),
          errorNavigatorKey: navigatorKey,
        );
        if (success && context.mounted) {
          Navigator.of(context).pop();
        }
      },
      [],
    );

    return ElbDialog(
      isSelfScrollable: true,
      onSaveAndCloseShortcut: onSave,
      maxWidth: 2400,
      title: 'Einzelformaufbau Zuordnung'.hc,
      floatingWindowId: floatingWindowId,
      footer: _SubmitButton(
        nutzenlayout: nutzenlayout,
        sessionId: sessionId,
        salesOrderId: salesOrderId,
        navigatorKey: navigatorKey,
        deselectedArtworkIds: deselectedArtworkIds,
        isSaving: isSaving,
        onSave: onSave,
      ),
      child: _Body(
        nutzenlayout: nutzenlayout,
        salesOrderId: salesOrderId,
        sessionId: sessionId,
        customerId: customerId,
        navigatorKey: navigatorKey,
        deselectedArtworkIds: deselectedArtworkIds,
      ),
    );
  }
}

class _SubmitButton extends HookConsumerWidget {
  const _SubmitButton({
    required this.nutzenlayout,
    required this.sessionId,
    required this.salesOrderId,
    required this.navigatorKey,
    required this.deselectedArtworkIds,
    required this.isSaving,
    required this.onSave,
  });

  final String sessionId;
  final int salesOrderId;

  final GlobalKey<NavigatorState> navigatorKey;
  final VoidCallback onSave;

  final Nutzenlayout nutzenlayout;
  final ValueNotifier<Set<int>> deselectedArtworkIds;
  final ValueNotifier<bool> isSaving;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    useValueListenable(deselectedArtworkIds);
    useValueListenable(isSaving);
    final hasDeselectedArtworks = deselectedArtworkIds.value.isNotEmpty;

    return InWindowCardDialogFooter(
      trailingActions: [
        if (hasDeselectedArtworks)
          AppButton.primary(
            onPressed: isSaving.value ? null : onSave,
            label: l10n.gen_save_and_close,
            isLoading: isSaving.value,
          )
        else
          AppButton.secondary(
            isLoading: isSaving.value,
            onPressed:
                isSaving.value ? null : () => Navigator.of(context).pop(),
            label: l10n.gen_close,
          ),
      ],
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
    required this.deselectedArtworkIds,
  });
  final Nutzenlayout nutzenlayout;
  final int salesOrderId;
  final String sessionId;
  final int customerId;
  final GlobalKey<NavigatorState> navigatorKey;
  final ValueNotifier<Set<int>> deselectedArtworkIds;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
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
              deselectedArtworkIds: deselectedArtworkIds,
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
                    child: NutzenlayoutMatrixView(
                      nutzenlayout: nutzenlayout,
                      navigatorKey: navigatorKey,
                      sessionId: sessionId,
                      isExistingMultiNutzenlayout: false,
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
    required this.deselectedArtworkIds,
  });
  final int salesOrderId;
  final String sessionId;
  final int customerId;
  final GlobalKey<NavigatorState> navigatorKey;
  final Nutzenlayout nutzenlayout;
  final ValueNotifier<Set<int>> deselectedArtworkIds;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final products = ref.watch(
      watchProductsBySalesOrderProvider(salesOrderId, sessionId),
    );

    return products.fastWhen(
      data: (products) {
        return AppScrollbar(
          controller: scrollController,
          child: ListView.builder(
            controller: scrollController,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return _ProductTile(
                key: ValueKey(product.meta.id),
                nutzenlayout: nutzenlayout,
                product: product,
                customerId: customerId,
                salesOrderId: salesOrderId,
                sessionId: sessionId,
                navigatorKey: navigatorKey,
                deselectedArtworkIds: deselectedArtworkIds,
              );
            },
          ),
        );
      },
    );
  }
}

class _ProductTile extends StatelessWidget {
  const _ProductTile({
    required this.product,
    required this.customerId,
    required this.salesOrderId,
    required this.sessionId,
    required this.nutzenlayout,
    required this.navigatorKey,
    required this.deselectedArtworkIds,
    super.key,
  });
  final Product product;
  final int customerId;
  final int salesOrderId;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;
  final Nutzenlayout nutzenlayout;
  final ValueNotifier<Set<int>> deselectedArtworkIds;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final artwork in product.artworks)
          _ArtworkTile(
            nutzenlayout: nutzenlayout,
            artwork: artwork,
            product: product,
            sessionId: sessionId,
            salesOrderId: salesOrderId,
            navigatorKey: navigatorKey,
            deselectedArtworkIds: deselectedArtworkIds,
            key: ValueKey(artwork.id),
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
    required this.salesOrderId,
    required this.nutzenlayout,
    required this.deselectedArtworkIds,
    super.key,
  });
  final Artwork artwork;
  final Product product;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;
  final int salesOrderId;
  final Nutzenlayout nutzenlayout;
  final ValueNotifier<Set<int>> deselectedArtworkIds;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useValueListenable(deselectedArtworkIds);
    final nutzenlayoutBySalesOrderByArtwork = ref.watch(
      fetchAndWatchArtworkSingleNutzenlayoutsBySalesOrderProvider(
        salesOrderId: salesOrderId,
        artworkId: artwork.id!,
      ),
    );

    return nutzenlayoutBySalesOrderByArtwork.fastWhen(
      data: (layouts) {
        final nutzenlayoutIds = layouts.map((e) => e.id!).toSet();
        final isInThisNutzenlayout = nutzenlayoutIds.contains(nutzenlayout.id);
        if (isInThisNutzenlayout) {
          return ElbListTile(
            leading: AppCheckbox(
              value: !deselectedArtworkIds.value.contains(artwork.id),
              onChanged: (v) {
                final isDeselected =
                    deselectedArtworkIds.value.contains(artwork.id);

                if (isDeselected) {
                  final updated = deselectedArtworkIds.value
                    ..remove(artwork.id);
                  deselectedArtworkIds.value = {...updated};
                } else {
                  deselectedArtworkIds.value = {
                    ...deselectedArtworkIds.value,
                    artwork.id!,
                  };
                }
              },
            ),
            onPressed: () {
              final isDeselected =
                  deselectedArtworkIds.value.contains(artwork.id);

              if (isDeselected) {
                final updated = deselectedArtworkIds.value..remove(artwork.id);
                deselectedArtworkIds.value = {...updated};
              } else {
                deselectedArtworkIds.value = {
                  ...deselectedArtworkIds.value,
                  artwork.id!,
                };
              }
            },
            child: Expanded(
              child: Text(artwork.fullArtworkIdWithProduct(product)),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
