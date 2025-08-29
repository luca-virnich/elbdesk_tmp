import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_prepress/src/product/config/product_fields.dart';
import 'package:elbdesk_prepress/src/product/logic/product_state.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

/// A widget that displays and allows editing of general product information.
///
/// Displays fields for product ID, name, description, type, serial number,
/// and index number in a card format. The fields can be made read-only
/// through the [readOnly] parameter.
class ProductMainPage extends HookConsumerWidget {
  /// Constructor
  const ProductMainPage({
    required this.readOnly,
    required this.constraints,
    required this.validationGroupId,
    required this.initialEntity,
    required this.stateNotifier,
    required this.sessionId,
    required this.entityId,
    super.key,
  });

  final bool readOnly;
  final BoxConstraints constraints;
  final String validationGroupId;
  final Product initialEntity;
  final ProductState stateNotifier;
  final String sessionId;
  final int entityId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;
    final crmL10n = context.crmL10n;
    final artworkLength = initialEntity.artworks.length;
    return Column(
      children: [
        CollapsibleCardSection(
          title: l10n.gen_general,
          identifier: ComponentIdentifier.productCardMainPageGeneral.name,
          trailingWidgets: [
            AppOpenInNewTextButton(
              onPressed: () {
                ref.openWindow(
                  FloatingSalesOrderWindowData(
                    salesOrderId: initialEntity.salesOrder!.meta.id,
                  ),
                );
              },
              label: initialEntity.salesOrder!.fullSalesOrderId,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: UiConstants.elementMargin,
              ),
              child: AppText('/'),
            ),
            AppOpenInNewTextButton(
              label: '${initialEntity.customer?.contact?.general.name}',
              tooltipMessage: l10n.gen_open_new_table(
                crmL10n.customer_singular,
              ),
              onPressed: () {
                ref.openWindow(
                  FloatingCustomerWindowData(
                    customerId: initialEntity.customer!.id,
                  ),
                );
              },
            ),
          ],
          child: ElbTwoColumnWrap(
            width: constraints.maxWidth,
            customL10n: ppL10n,
            readOnly: readOnly,
            validationGroupId: validationGroupId,
            columnLeft: [
              //* Product Desciption *//
              ElbTwoColumnItem.text(
                field: ProductFields.fromEnum(ProductField.keywords),
                initialValue: initialEntity.keywords,
                readOnly: readOnly,
                onChanged: stateNotifier.updateKeywords,
              ),
              ElbTwoColumnItem.text(
                field: ProductFields.fromEnum(ProductField.description),
                initialValue: initialEntity.description,
                readOnly: readOnly,
                onChanged: stateNotifier.updateDescription,
              ),
            ],
            columnRight: [
              ElbTwoColumnItem.text(
                field: ProductFields.fromEnum(ProductField.customerReference),
                initialValue: initialEntity.customerReference,
                readOnly: readOnly,
                onChanged: stateNotifier.updateCustomerReference,
              ),
              ElbTwoColumnDropdown.text(
                field: ProductFields.fromEnum(ProductField.productType),
                readOnly: readOnly || artworkLength > 1,
                initialValue: initialEntity.productType,
                onChanged: stateNotifier.updateProductType,
              ),
              ElbTwoColumnDropdown.text(
                field: ProductFields.fromEnum(ProductField.printProcessType),
                readOnly: readOnly || artworkLength > 1,
                initialValue: initialEntity.printProcessType,
                onChanged: stateNotifier.updatePrintProcessType,
              ),
            ],
          ),
        ),
        const CardSectionDivider(),
        CollapsibleCardSection(
          title: ppL10n.artwork_plural,
          identifier: ComponentIdentifier.productCardMainPageArtworks.name,
          child: _Artworks(
            entityId: entityId,
            sessionId: sessionId,
            initialProduct: initialEntity,
          ),
        ),
      ],
    );
  }
}

class _Artworks extends HookConsumerWidget {
  const _Artworks({
    required this.entityId,
    required this.sessionId,
    required this.initialProduct,
  });

  final int entityId;
  final String sessionId;
  final Product initialProduct;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        // return ArtworkTile(product: product, artwork: artwork);
        return ArtworkRealtimeCompactView(
          artworkId: artwork.id!,
          sessionId: '1',
        );
      },
    );
  }
}
