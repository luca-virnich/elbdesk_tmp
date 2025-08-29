import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArtworkListItem extends ConsumerWidget {
  const ArtworkListItem({
    required this.artwork,
    required this.customerId,
    this.width,
    this.isDisabled = false,
    this.allowOpenWhenDisabled = true,

    /// the product is only used for the full artwork id, use it if
    /// artwork.product is null
    this.product,
    super.key,
  });

  final Artwork artwork;
  final int customerId;
  final double? width;
  final bool isDisabled;
  final bool allowOpenWhenDisabled;
  final Product? product;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final locale = l10n.localeName;

    if (artwork.product != null) {
      return _Body(
        width: width,
        isDisabled: isDisabled,
        artwork: artwork,
        customerId: customerId,
        product: artwork.product!,
        locale: locale,
      );
    }

    if (product != null) {
      return _Body(
        width: width,
        isDisabled: isDisabled,
        artwork: artwork,
        customerId: customerId,
        product: product!,
        locale: locale,
      );
    }

    final fetchedProduct = ref.watch(
      fetchProductByIdWithoutRelationsProvider(
        artwork.productId,
      ),
    );
    return fetchedProduct.fastWhen(
      data: (product) => _Body(
        width: width,
        isDisabled: isDisabled,
        artwork: artwork,
        customerId: customerId,
        product: product,
        locale: locale,
      ),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({
    required this.width,
    required this.isDisabled,
    required this.artwork,
    required this.customerId,
    required this.product,
    required this.locale,
  });

  final double? width;
  final bool isDisabled;
  final Artwork artwork;
  final int customerId;
  final Product product;
  final String locale;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppOpenInNewTextButton(
            isDisabled: isDisabled,
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
            label: artwork.fullArtworkIdWithProduct(artwork.product ?? product),
          ),
          AppText(
            artwork.formattedDimensions(locale),
            maxLines: 1,
            color: Colors.grey,
            fontSize: 13,
          ),
        ],
      ),
    );
  }
}
