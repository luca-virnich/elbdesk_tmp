import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'all_soi_from_sales_order_card.g.dart';

@riverpod
class SelectedSoiTypes extends _$SelectedSoiTypes {
  @override
  Set<SalesOrderItemType> build(String sessionId) {
    return SalesOrderItemType.values.toSet();
  }

  void addSoiType(SalesOrderItemType type) {
    state = {...state, type};
  }

  void removeSoiType(SalesOrderItemType type) {
    final current = {...state};
    state = current.where((e) => e != type).toSet();
  }

  void toggleSoiType(SalesOrderItemType type) {
    if (state.contains(type)) {
      removeSoiType(type);
    } else {
      addSoiType(type);
    }
  }
}

@riverpod
class SelectedSoiStatus extends _$SelectedSoiStatus {
  @override
  Set<SalesOrderItemStatus> build(String sessionId) {
    return SalesOrderItemStatus.values.toSet();
  }

  void addSoiStatus(SalesOrderItemStatus status) {
    state = {...state, status};
  }

  void removeSoiStatus(SalesOrderItemStatus status) {
    final current = {...state};
    state = current.where((e) => e != status).toSet();
  }

  void toggleSoiStatus(SalesOrderItemStatus status) {
    if (state.contains(status)) {
      removeSoiStatus(status);
    } else {
      addSoiStatus(status);
    }
  }
}

class AllSoiFromSalesOrderCard extends HookWidget {
  const AllSoiFromSalesOrderCard({
    required this.salesOrderId,
    required this.customerId,
    required this.floatingWindowFocus,
    required this.floatingWindowId,
    required this.fullSalesOrderId,
    required this.floatingWindowType,
    super.key,
  });

  /// The id of the sales order
  final int salesOrderId;
  final int customerId;
  final String fullSalesOrderId;

  /// The focus node for the floating window
  final FocusNode floatingWindowFocus;

  /// The id of the floating window
  final String floatingWindowId;

  /// The type of the floating window
  final String floatingWindowType;

  @override
  Widget build(BuildContext context) {
    final sessionId = useUuid();
    return CustomCard(
      baseTitle: 'Fertigungsaufträge $fullSalesOrderId'.hc,
      iconData: AppIcons.salesOrderItem,
      floatingWindowFocus: floatingWindowFocus,
      floatingWindowId: floatingWindowId,
      floatingWindowType: floatingWindowType,
      childBuilder: (
        context,
        ref,
        navigatorKey,
      ) {
        return FloatingCardBody(
          floatingWindowType: FloatingWindowType.allSoiFromSalesOrder.name,
          isFirstRun: true,
          navigatorKey: navigatorKey,
          floatingWindowId: floatingWindowId,
          children: [
            CardBodyItem(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: UiConstants.defaultPadding,
                  right: UiConstants.defaultPadding,
                ),
                child: _SoiList(
                  salesOrderId: salesOrderId,
                  sessionId: sessionId,
                  customerId: customerId,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _SoiList extends HookConsumerWidget {
  const _SoiList({
    required this.salesOrderId,
    required this.sessionId,
    required this.customerId,
  });

  final int salesOrderId;
  final String sessionId;
  final int customerId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(
      watchProductsBySalesOrderProvider(salesOrderId, sessionId),
    );
    final controller = useScrollController();
    return products.fastWhen(
      data: (products) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const CardSectionDivider(),
            Expanded(
              child: AppScrollbar(
                controller: controller,
                child: ListView.builder(
                  controller: controller,
                  shrinkWrap: true,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];

                    return _ProductTile(
                      key: ValueKey(product.meta.id!.toString()),
                      product: products[index],
                      customerId: customerId,
                      salesOrderId: salesOrderId,
                      sessionId: sessionId,
                    );
                  },
                ),
              ),
            ),
            const AppDivider(),
            const CardSectionDivider(),
            _SelectedSoiTypes(sessionId: sessionId),
            const CardSectionDivider(),
            const AppDivider(),
            const CardSectionDivider(),
            _SelectedSoiStatus(sessionId: sessionId),
            const CardSectionDivider(),
          ],
        );
      },
    );
  }
}

class _SelectedSoiStatus extends ConsumerWidget {
  const _SelectedSoiStatus({
    required this.sessionId,
  });

  final String sessionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSoiStatus = ref.watch(selectedSoiStatusProvider(sessionId));
    const allSoiStatus = SalesOrderItemStatus.values;
    return AppWrap(
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.start,
      spacing: UiConstants.elementMargin,
      runSpacing: UiConstants.elementMargin,
      children: allSoiStatus
          .map(
            (e) => ElbTag(
              isSelected: selectedSoiStatus.contains(e),
              color: e.color,
              label: e.readable(context.l10n),
              onPressed: () {
                ref
                    .read(selectedSoiStatusProvider(sessionId).notifier)
                    .toggleSoiStatus(e);
              },
            ),
          )
          .toList(),
    );
  }
}

class _SelectedSoiTypes extends ConsumerWidget {
  const _SelectedSoiTypes({
    required this.sessionId,
  });
  final String sessionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = context.appTheme.statusColors.disabled;
    final selectedSoiTypes = ref.watch(selectedSoiTypesProvider(sessionId));
    final artworkSoiTypes = SalesOrderItemType.values.artworkSoiTypes;
    return AppWrap(
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.start,
      spacing: UiConstants.elementMargin,
      runSpacing: UiConstants.elementMargin,
      children: artworkSoiTypes
          .map(
            (e) => ElbTag(
              isSelected: selectedSoiTypes.contains(e),
              color: color,
              hideDot: true,
              label: e.readable(context.l10n, context.salesL10n),
              onPressed: () {
                ref
                    .read(selectedSoiTypesProvider(sessionId).notifier)
                    .toggleSoiType(e);
              },
            ),
          )
          .toList(),
    );
  }
}

class _ProductTile extends ConsumerWidget {
  const _ProductTile({
    required this.product,
    required this.customerId,
    required this.salesOrderId,
    required this.sessionId,
    super.key,
  });

  final Product product;
  final int customerId;
  final int salesOrderId;
  final String sessionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        for (final (index, artwork) in product.artworks.indexed)
          _ArtworkLine(
            product: product,
            artwork: artwork,
            index: index,
            customerId: customerId,
            salesOrderId: salesOrderId,
            sessionId: sessionId,
          ),
      ],
    );
  }
}

class _ArtworkLine extends HookConsumerWidget {
  const _ArtworkLine({
    required this.artwork,
    required this.index,
    required this.customerId,
    required this.product,
    required this.salesOrderId,
    required this.sessionId,
  });

  final Artwork artwork;
  final int index;
  final int customerId;
  final Product product;
  final int salesOrderId;
  final String sessionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final soisForArtwork = ref
        .watch(
          watchSalesOrderItemsByArtworkProvider(
            artwork.meta.id!,
          ),
        )
        .valueOrNull;

    final soiStatus = ref.watch(selectedSoiStatusProvider(sessionId));
    final soiType = ref.watch(selectedSoiTypesProvider(sessionId));

    final artworkContainsSoiType =
        soisForArtwork?.any((soi) => soiType.contains(soi.type)) ?? false;
    final artworkContainsSoiStatus =
        soisForArtwork?.any((soi) => soiStatus.contains(soi.status)) ?? false;

    final shouldShowArtwork =
        artworkContainsSoiType && artworkContainsSoiStatus;
    if (!shouldShowArtwork) return const SizedBox();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            AppOpenInNewTextButton(
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
            const SizedBox(width: AppSpace.s),
          ],
        ),
        const SizedBox(height: AppSpace.s),
        Wrap(
          spacing: AppSpace.s,
          runSpacing: AppSpace.s,
          children: [
            if (soisForArtwork != null)
              for (final soiArt in soisForArtwork.toList()
                ..sort(
                  (a, b) => a.type.sortOrder.compareTo(b.type.sortOrder),
                ))
                _SoiStatusBadge(
                  salesOrderItem: soiArt,
                  customerId: customerId,
                  soiType: soiArt.type,
                ),
          ],
        ),
        const SizedBox(height: UiConstants.defaultPadding),
      ],
    );
  }
}

class _SoiStatusBadge extends ConsumerWidget {
  const _SoiStatusBadge({
    required this.salesOrderItem,
    required this.customerId,
    required this.soiType,
  });

  final SalesOrderItem salesOrderItem;
  final int customerId;
  final SalesOrderItemType soiType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final status = salesOrderItem.status;

    return ElbTag(
      onPressed: () {
        switch (soiType) {
          case SalesOrderItemType.prepareArtwork:
            ref.openWindow(
              FloatingSoiPrepareArtworkWindowData(
                entityId: salesOrderItem.soiTypePrimaryKey,
                customerId: salesOrderItem.salesOrderId,
              ),
            );
          case SalesOrderItemType.requestArtworkApproval:
            ref.openWindow(
              FloatingSoiRequestArtworkApprovalWindowData(
                entityId: salesOrderItem.soiTypePrimaryKey,
                customerId: salesOrderItem.salesOrderId,
              ),
            );
          case SalesOrderItemType.einzelformaufbau:
            ref.openWindow(
              FloatingSoiEinzelformaufbauWindowData(
                entityId: salesOrderItem.soiTypePrimaryKey,
                customerId: salesOrderItem.salesOrderId,
              ),
            );
          // isnt visible in UI but just to be safe, maybe will be added later
          case SalesOrderItemType.consulting:
            ref.openWindow(
              FloatingSoiConsultingWindowData(
                entityId: salesOrderItem.soiTypePrimaryKey,
                customerId: customerId,
                salesOrderId: salesOrderItem.salesOrderId,
              ),
            );
        }
      },
      color: status.color,
      label: salesOrderItem.type.readable(l10n, context.salesL10n),
    );
  }
}
