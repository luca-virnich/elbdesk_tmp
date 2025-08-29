import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

class GeneralSalesOrderItemsBySalesOrder extends ConsumerWidget {
  const GeneralSalesOrderItemsBySalesOrder({
    required this.salesOrderId,
    required this.customerId,
    required this.sessionId,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.navigatorKey,
    super.key,
  });
  final int salesOrderId;
  final int customerId;
  final String sessionId;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final salesL10n = context.salesL10n;
    final salesOrderItems = ref.watch(
      watchGeneralSalesOrderItemsBySalesOrderProvider(
        salesOrderId: salesOrderId,
        sessionId: sessionId,
      ),
    );

    return CollapsibleCardSection(
      identifier: ComponentIdentifier
          .salesOrderCardItemsPageGeneralSalesOrderItems.name,
      title: salesL10n.sales_order_general_sois,
      trailingWidgets: [
        NextPopupMenu(
          child: (controller) {
            return AddEntityInCardButton(
              tooltip: '',
              onPressed: () async {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
            );
          },
          menuChildren: [
            NextMenuItemButton(
              onPressed: () async {
                final (:success, :data, :exception) =
                    await AsyncHandler.handleAsyncOperation(
                  context,
                  () => ref.read(soiConsultingRepositoryProvider).create(
                        sessionId: sessionId,
                        salesOrderId: salesOrderId,
                        customerId: customerId,
                      ),
                  errorNavigatorKey: navigatorKey,
                );
                if (!success) {
                  final errorMsg = exception?.constraintName?.contains(
                            'soi_prepare_artwork_artwork_idx',
                          ) ??
                          false
                      ? salesL10n.sales_order_soi_already_created
                      : '${l10n.exception_unexpected_error} '
                          '${exception?.message}';
                  AppNotificationOverlay.error(
                    context,
                    errorMsg,
                    navigatorKey: navigatorKey,
                  );
                }
              },
              child: Text(salesL10n.soi_consulting_singular),
            ),
            NextMenuItemButton(
              onPressed: () async {
                await showElbDialog<void>(
                  context: context,
                  child: AddEinzelformaufbauDialog(
                    customerId: customerId,
                    salesOrderId: salesOrderId,
                    sessionId: sessionId,
                    floatingWindowId: floatingWindowId,
                    floatingWindowFocus: floatingWindowFocus,
                    navigatorKey: navigatorKey,
                  ),
                  navigatorKey: navigatorKey,
                );
              },
              child: Text(salesL10n.soi_einzelformaufbau_singular),
            ),
          ],
        ),
      ],
      child: salesOrderItems.fastWhen(
        data: (sois) {
          return Align(
            alignment: Alignment.topLeft,
            child: Wrap(
              spacing: AppSpace.s,
              runSpacing: AppSpace.s,
              children: sois
                  .map(
                    (soi) => _Tile(
                      soi: soi,
                      customerId: customerId,
                      key: Key(soi.id.toString()),
                    ),
                  )
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}

class _Tile extends ConsumerWidget {
  const _Tile({
    required this.soi,
    required this.customerId,
    super.key,
  });
  final SalesOrderItem soi;
  final int customerId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final salesL10n = context.salesL10n;
    return ElbTag(
      color: soi.status.color,
      label: soi.type.readable(l10n, salesL10n),
      onPressed: () {
        ref.openWindow(
          FloatingSoiConsultingWindowData(
            entityId: soi.soiTypePrimaryKey,
            salesOrderId: soi.salesOrderId,
            customerId: customerId,
          ),
        );
      },
    );
  }
}
