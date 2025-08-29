import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_prepress/src/product/config/product_fields.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

/// Card item to display product history details
class ProductHistoryCardItem extends ConsumerWidget {
  const ProductHistoryCardItem({
    required this.product,
    required this.masterProductId,
    super.key,
  });

  final Product product;
  final int masterProductId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;
    final crmL10n = context.crmL10n;
    return ScrollableCardItem.constrained(
      builder: (context, constraints) {
        return Column(
          children: [
            CollapsibleCardSection(
              title: ppL10n.product_general,
              identifier:
                  ComponentIdentifier.productHistoryCardItemGeneral.name,
              trailingWidgets: [
                AppOpenInNewTextButton(
                  onPressed: () {
                    ref.openWindow(
                      FloatingSalesOrderWindowData(
                        salesOrderId: product.salesOrder!.meta.id,
                      ),
                    );
                  },
                  label: product.salesOrder!.fullSalesOrderId,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: UiConstants.elementMargin,
                  ),
                  child: AppText('/'),
                ),
                AppOpenInNewTextButton(
                  label: '${product.customer?.contact?.general.name}',
                  tooltipMessage: l10n.gen_open_new_table(
                    crmL10n.customer_singular,
                  ),
                  onPressed: () {
                    ref.openWindow(
                      FloatingCustomerWindowData(
                        customerId: product.customer!.id,
                      ),
                    );
                  },
                ),
              ],
              child: ElbTwoColumnWrap(
                width: constraints.maxWidth,
                customL10n: ppL10n,
                readOnly: true,
                validationGroupId: null,
                columnLeft: [
                  //* Product Desciption *//

                  ElbTwoColumnItem.text(
                    field: ProductFields.fromEnum(ProductField.keywords),
                    readOnly: true,
                    initialValue: product.keywords,
                    onChanged: (p0) {},
                  ),
                  ElbTwoColumnItem.text(
                    field: ProductFields.fromEnum(ProductField.description),
                    readOnly: true,
                    initialValue: product.description,
                    onChanged: (p0) {},
                  ),
                ],
                columnRight: [
                  ElbTwoColumnItem.text(
                    field:
                        ProductFields.fromEnum(ProductField.customerReference),
                    readOnly: true,
                    initialValue: product.customerReference,
                    onChanged: (p0) {},
                  ),
                  ElbTwoColumnDropdown.text(
                    field: ProductFields.fromEnum(ProductField.productType),
                    readOnly: true,
                    initialValue: product.productType,
                    onChanged: (p0) {},
                  ),
                  ElbTwoColumnDropdown.text(
                    field:
                        ProductFields.fromEnum(ProductField.printProcessType),
                    readOnly: true,
                    initialValue: product.printProcessType,
                    onChanged: (p0) {},
                  ),
                ],
              ),
            ),
            const CardSectionDivider(),
            CollapsibleCardSection(
              title: ppL10n.artwork_plural,
              identifier:
                  ComponentIdentifier.productHistoryCardItemArtworks.name,
              child: _Artworks(
                entityId: product.meta.id!,
                initialProduct: product,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _Artworks extends HookConsumerWidget {
  const _Artworks({
    required this.entityId,
    required this.initialProduct,
  });

  final int entityId;

  final Product initialProduct;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionId = useUuid();
    final product = ref.watch(
      watchProductProvider(productId: entityId, sessionId: sessionId),
    );
    return product.when(
      skipLoadingOnRefresh: true,
      error: (error, stack) => Text(error.toString()),
      loading: () {
        return _ArtworkList(product: initialProduct);
      },
      data: (product) {
        return _ArtworkList(product: product);
      },
    );
  }
}

class _ArtworkList extends StatelessWidget {
  const _ArtworkList({
    required this.product,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const AppListViewSeperator.space(),
      shrinkWrap: true,
      itemCount: product.artworks.length,
      itemBuilder: (context, index) {
        final artwork = product.artworks[index];
        return ArtworkRealtimeCompactView(
          artworkId: artwork.id!,
          sessionId: '1',
        );
      },
    );
  }
}
