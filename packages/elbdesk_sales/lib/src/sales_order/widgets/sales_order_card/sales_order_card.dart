import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/src/sales_order/config/sales_order_fields.dart';
import 'package:elbdesk_sales/src/sales_order/logic/sales_order_state.dart';
import 'package:elbdesk_sales/src/sales_order/widgets/sales_order_card/pages/sales_order_assets_page.dart';
import 'package:elbdesk_sales/src/sales_order/widgets/sales_order_card/pages/sales_order_main_page.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

/// Sales Order Card
///
/// Displays a editable [SalesOrder], typically used in  a [FloatingWindow].
class SalesOrderCard extends HookConsumerWidget {
  /// Sales Order Card
  ///
  /// Displays a editable [SalesOrder], typically used in  a [FloatingWindow].
  ///
  ///  __Performance Note:__
  /// For better performance it's best to provide the [size].
  /// If the [size] is not provided, the widget will fall back to using a
  /// [LayoutBuilder] to calculate the constraints on its own.
  const SalesOrderCard({
    required this.salesOrderId,
    required this.customerId,
    required this.onClose,
    required this.onSave,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.floatingWindowType,
    this.initialNoteId,
    this.initialNoteParentId,
    this.size,
    super.key,
    this.showBottomStatusBar = true,
  });

  /// The size of the card.
  ///
  /// __Performance Note:__
  /// For better performance it's best to provide the [size].
  /// If the [size] is not provided, the widget will fall back to using a
  /// [LayoutBuilder] to calculate the constraints on its own.
  final Size? size;

  /// The id of the sales order to display/fetch, if null a new sales order is
  final int? salesOrderId;

  /// The id of the customer
  final int? customerId;

  /// Callback when the user closes the card
  final VoidCallback? onClose;

  /// Callback when the user saves the sales order
  final VoidCallback? onSave;

  /// Wether to show the bottom status bar
  final bool showBottomStatusBar;

  /// The floating window id
  final String floatingWindowId;

  /// The focus node for the floating window
  final FocusNode floatingWindowFocus;

  /// The type of the floating window
  final String floatingWindowType;

  final int? initialNoteId;
  final int? initialNoteParentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final salesL10n = context.salesL10n;
    final formKey = useFormKey();

    final generalValidationGroupId = useUuid();

    Future<SalesOrder> onSavePressed(
      int entityId,
      String sessionId,
    ) async {
      final salesOrder =
          ref.read(salesOrderStateProvider(entityId, sessionId)).requireValue;

      final updatedSalesOrder =
          await ref.read(salesOrderRepositoryProvider).update(
                entity: salesOrder,
                release: false,
                sessionId: sessionId,
              );
      ref.read(recentWindowsProvider.notifier).updateEntityWindow(
            RecentWindow(
              type: floatingWindowType,
              entityId: entityId,
              label: salesOrder.fullSalesOrderId,
              additionalData: SalesOrderAdditionalData(
                customerName: salesOrder.customer?.contact?.general.name ?? '',
                customId: salesOrder.fullSalesOrderId,
                status: salesOrder.status.name,
              ).toJson(),
            ),
          );
      ref
          .read(salesOrderStateProvider(entityId, sessionId).notifier)
          .updateMetaAfterSave();
      ref
        ..invalidate(
          findSalesOrdersProvider,
        )
        ..invalidate(
          findSalesOrdersByCustomerIdProvider,
        );
      return updatedSalesOrder;
    }

    return EntityCard<SalesOrder>(
      floatingWindowType: floatingWindowType,
      ignoreEntityEditStatusRibbon: false,
      floatingWindowFocus: floatingWindowFocus,
      onSave: (entityId, sessionId, navigatorKey) =>
          onSavePressed(entityId, sessionId),
      floatingWindowId: floatingWindowId,
      formKey: formKey,
      showTitleBar: true,
      invalidateEntityState: (entityId, sessionId) async {
        ref.invalidate(salesOrderStateProvider(entityId, sessionId));
      },
      stateRefetchWithoutLock: (entityId, sessionId) async {
        await ref
            .read(salesOrderStateProvider(entityId, sessionId).notifier)
            .refetchWithoutLock();
      },
      streamDataProvider: ({
        required sessionId,
        required dataId,
      }) =>
          watchSalesOrderProvider(
        sessionId: sessionId,
        salesOrderId: dataId,
      ),
      tableType: TableType.salesOrder.name,
      stateSaveUnlockRefetch: (editingSessionId, dataId, navigatorKey) async {
        await ref
            .read(salesOrderStateProvider(dataId, editingSessionId).notifier)
            .saveAndUnlockAndRefetch();
      },
      entityId: salesOrderId,
      stateRefetchWithLock: (entityId, sessionId) => ref
          .read(salesOrderStateProvider(entityId, sessionId).notifier)
          .refetchWithLock(),
      stateProvider: salesOrderStateProvider.call,
      createEntity: (sessionId) =>
          ref.read(salesOrderRepositoryProvider).create(
                sessionId: sessionId,
                customerId: customerId,
              ),
      getTitle: (entity) => entity.fullSalesOrderId,
      tableIcon: (_, __) => AppIcons.salesOrder,
      tablePrefix: (_, __) => salesL10n.sales_order_singular,
      childBuilder: (
        context,
        entityId,
        sessionId,
        selectedNavIndexRef,
        navigatorKey,
        readOnly,
        meta,
        initialEntity,
        isSaving,
        savedOrInitialEntity,
        isFirstRender,
      ) {
        final stateNotifier = ref.watch(
          salesOrderStateProvider(entityId, sessionId).notifier,
        );
        useEffect(
          () {
            if (!isFirstRender.value) return;
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              ref.read(recentWindowsProvider.notifier).insertEntityWindow(
                    RecentWindow(
                      type: floatingWindowType,
                      entityId: entityId,
                      label: initialEntity.fullSalesOrderId,
                      additionalData: SalesOrderAdditionalData(
                        customerName:
                            initialEntity.customer?.contact?.general.name ?? '',
                        customId: initialEntity.fullSalesOrderId,
                        status: initialEntity.status.name,
                      ).toJson(),
                    ),
                  );
            });
            ref
              ..invalidate(
                findSalesOrdersProvider,
              )
              ..invalidate(
                findSalesOrdersByCustomerIdProvider,
              );
            return null;
          },
          [],
        );

        return FloatingCardBody(
          isFirstRun: isFirstRender.value,
          initialNoteId: initialNoteId,
          initialNoteParentId: initialNoteParentId,
          navigatorKey: navigatorKey,
          formKey: formKey,
          noteTableType: TableType.salesOrder.name,
          showShareButton: true,
          floatingWindowType: FloatingWindowType.salesOrder.name,
          noteEntityId: entityId,
          floatingWindowId: floatingWindowId,
          footer: EntityCardFooter<SalesOrder>(
            stateProvider: salesOrderStateProvider.call(entityId, sessionId),
            floatingWindowId: floatingWindowId,
            onSaveError: null,
            savedOrInitialEntity: savedOrInitialEntity,
            isSavingNotifier: isSaving,
            onSavePressed: () => onSavePressed(entityId, sessionId),
            formKey: formKey,
            readOnly: readOnly,
            navigatorKey: navigatorKey,
            meta: meta,
          ),
          navigationGroups: [
            CardNavigationGroup(
              items: [
                CardNavigationItem(
                  icon: AppIcons.home,
                  label: salesL10n.sales_order_plural,
                  showErrorBadge: ref.watch(
                    validationGroupProvider(generalValidationGroupId).select(
                      (value) => value.isNotEmpty,
                    ),
                  ),
                ),
                CardNavigationItem(
                  icon: AppIcons.salesOrderItem,
                  label: salesL10n.sales_order_item_assets,
                ),
              ],
            ),
            CardNavigationGroup(
              items: [
                CardNavigationItems.changelog(l10n),
              ],
            ),
          ],
          children: [
            CardBodyItem(
              child: SalesOrderMainPage(
                savedOrInitialEntity: savedOrInitialEntity,
                floatingWindowFocus: floatingWindowFocus,
                floatingWindowId: floatingWindowId,
                validationGroupId: generalValidationGroupId,
                salesOrderId: entityId,
                sessionId: sessionId,
                readOnly: readOnly,
                stateNotifier: stateNotifier,
                initialEntity: initialEntity,
                navigatorKey: navigatorKey,
              ),
            ),
            CardBodyItem(
              loadLazy: true,
              child: SalesOrderAssetsPage(
                customerId: initialEntity.customer!.meta.id!,
                salesOrderId: entityId,
                navigatorKey: navigatorKey,
                floatingWindowFocus: floatingWindowFocus,
                floatingWindowId: floatingWindowId,
                sessionId: sessionId,
                initialEntity: initialEntity,
              ),
            ),
            CardBodyItem(
              keepAlive: false,
              child: EntityLogTable(
                fieldTitle: (log) => SalesOrderFields.fromFieldKey(log.field)
                    .readable(l10n, salesL10n),
                entityId: entityId,
                tableType: TableType.salesOrder,
                navigatorKey: navigatorKey,
              ),
            ),
          ],
        );
      },
    );
  }
}
