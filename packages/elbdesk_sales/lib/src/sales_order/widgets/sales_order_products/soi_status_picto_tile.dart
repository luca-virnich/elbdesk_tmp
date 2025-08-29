import 'package:collection/collection.dart';
import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/elbdesk_sales.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// A compact representation of a SalesOrderItem
///
/// Uses a layered card design where the icon represents the type,
/// and the status is shown through accent colors
class SoiStatusPictoTile extends HookConsumerWidget {
  const SoiStatusPictoTile({
    required this.activeSalesOrderItems,
    required this.customerId,
    required this.salesOrderItemType,
    required this.navigatorKey,
    required this.artworkId,
    required this.salesOrderId,
    required this.artworkMasterId,
    this.size = 55.0,
    super.key,
  });

  final List<SalesOrderItem> activeSalesOrderItems;
  final int customerId;
  final SalesOrderItemType salesOrderItemType;
  final GlobalKey<NavigatorState> navigatorKey;
  final int artworkId;
  final int salesOrderId;
  final int artworkMasterId;
  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final salesOrderItem = activeSalesOrderItems.firstWhereOrNull(
      (soi) => soi.type == salesOrderItemType,
    );

    final l10n = context.l10n;
    final salesL10n = context.salesL10n;
    final theme = context.appTheme;
    final generalColors = theme.generalColors;
    final isLoading = useState<bool>(false);

    // Item exists or needs to be created
    final itemExists = salesOrderItem != null;

    // Get status color for existing items or use a neutral color
    final statusColor = salesOrderItem?.status.color ??
        generalColors.background.withAppOpacity(0.7);

    // Get readable labels for type and status
    final typeLabel = salesOrderItemType.readable(l10n, salesL10n);
    final statusLabel = salesOrderItem?.status.readable(l10n) ??
        salesL10n.sales_order_create_soi;

    // Full tooltip that combines type and status
    final tooltipText = itemExists
        ? '$typeLabel: $statusLabel'
        : '$typeLabel: ${salesL10n.sales_order_create_soi}';

    // Create/open action
    Future<void> createOrOpenSoi() async {
      if (isLoading.value) return;

      if (!itemExists) {
        // Create new item
        isLoading.value = true;

        Future<void> performCreation() async {
          return switch (salesOrderItemType) {
            SalesOrderItemType.prepareArtwork =>
              ref.read(soiPrepareArtworkRepositoryProvider).create(
                    artworkId: artworkId,
                    salesOrderId: salesOrderId,
                    artworkMasterId: artworkMasterId,
                    customerId: customerId,
                  ),
            SalesOrderItemType.requestArtworkApproval =>
              ref.read(soiRequestArtworkApprovalRepositoryProvider).create(
                    artworkId: artworkId,
                    salesOrderId: salesOrderId,
                    artworkMasterId: artworkMasterId,
                    customerId: customerId,
                  ),
            _ => Future.value(),
          };
        }

        final (:success, :data, :exception) =
            await AsyncHandler.handleAsyncOperation(
          context,
          performCreation,
          errorNavigatorKey: navigatorKey,
        );

        if (!success) {
          final elbEx = exception is ElbException ? exception : null;
          final errorMsg = elbEx?.constraintName
                      ?.contains('soi_prepare_artwork_artwork_idx') ??
                  false
              ? 'sales_order_soi_already_created'.fixed
              : '${l10n.exception_unexpected_error} ${elbEx?.message}';
          AppNotificationOverlay.error(
            context,
            errorMsg,
            navigatorKey: navigatorKey,
          );
        }

        isLoading.value = false;
      } else {
        // Open existing item
        switch (salesOrderItemType) {
          case SalesOrderItemType.prepareArtwork:
            ref.openWindow(
              FloatingSoiPrepareArtworkWindowData(
                entityId: salesOrderItem.soiTypePrimaryKey,
                customerId: customerId,
              ),
            );
          case SalesOrderItemType.consulting:
            ref.openWindow(
              FloatingSoiConsultingWindowData(
                entityId: salesOrderItem.soiTypePrimaryKey,
                customerId: customerId,
                salesOrderId: salesOrderItem.salesOrderId,
              ),
            );
          case SalesOrderItemType.requestArtworkApproval:
            ref.openWindow(
              FloatingSoiRequestArtworkApprovalWindowData(
                entityId: salesOrderItem.soiTypePrimaryKey,
                customerId: customerId,
              ),
            );
          case SalesOrderItemType.einzelformaufbau:
            ref.openWindow(
              FloatingSoiEinzelformaufbauWindowData(
                entityId: salesOrderItem.soiTypePrimaryKey,
                customerId: customerId,
              ),
            );
        }
      }
    }

    return AppRotateAwayButtonWrapper(
      targetHeight: size,
      targetWidth: size * 1.3,
      primaryActionLabel: l10n.gen_create,
      onPrimaryAction: isLoading.value ? () {} : createOrOpenSoi,
      frontContentBuilder: (context, flipToBack) => AppPictoTile(
        icon: salesOrderItemType.icon,
        label: itemExists
            ? salesOrderItemType.readableShort(l10n, salesL10n)
            : '+ ${l10n.gen_create}',
        tooltip: tooltipText,
        onPressed: !itemExists ? flipToBack : createOrOpenSoi,
        size: size,
        width: size * 1.3,
        isLoading: isLoading.value,
        loadingColor:
            itemExists ? statusColor : generalColors.primarySurfaceBorder,
        iconColor: itemExists ? statusColor.withAppOpacity(0.85) : null,
        labelColor: itemExists ? generalColors.onBackground : null,
        gradientColors: itemExists
            ? [
                generalColors.primarySurfaceBorder.withAppOpacity(0.2),
                generalColors.primarySurfaceBorder.withAppOpacity(0),
              ]
            : [
                generalColors.primarySurfaceBorder.withAppOpacity(0.2),
                generalColors.primarySurfaceBorder.withAppOpacity(0),
              ],
        borderColor: generalColors.primarySurfaceBorder,
        borderRadius: theme.borderRadiuses.s,
        shadowColor: itemExists
            ? statusColor.withAppOpacity(0.05)
            : generalColors.primary.withAppOpacity(0.05),
      ),
    );
  }
}
