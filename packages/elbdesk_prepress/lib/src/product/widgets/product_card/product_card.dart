import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/product/logic/product_state.dart';
import 'package:elbdesk_prepress/src/product/widgets/history/product_history.dart';
import 'package:elbdesk_prepress/src/product/widgets/product_card/pages/product_main_page.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

/// Product Card
///
/// This widget is used to display the product information.
///
/// E.g. used inside of the FloatingProductCard
class ProductCard extends HookConsumerWidget {
  /// Product Card
  ///
  /// This widget is used to display the product information.
  ///
  /// E.g. used inside of the FloatingProductCard
  ///
  const ProductCard({
    required this.floatingWindowId,
    required this.productId,
    required this.salesOrderId,
    required this.tableSessionId,
    required this.floatingWindowFocus,
    required this.floatingWindowType,
    this.navigatorKey,
    this.initialNoteId,
    this.initialNoteParentId,
    super.key,
  });

  /// Product ID
  final int? productId;

  /// Sales Order ID
  /// Parent salesOrder id -> If the product is created from a sales order
  final int? salesOrderId;

  /// Session ID
  /// Id of the editing session
  final String? tableSessionId;

  /// The type of the floating window
  final String floatingWindowType;

  final String floatingWindowId;

  /// The navigator key
  final GlobalKey<NavigatorState>? navigatorKey;

  /// The focus node for the floating window
  final FocusNode? floatingWindowFocus;

  /// The initial note id
  final int? initialNoteId;

  /// The initial note parent id
  final int? initialNoteParentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final formKey = useFormKey();
    final validationGroupId = useUuid();

    Future<Product> onSavePressed(
      int entityId,
      String sessionId,
    ) async {
      final product =
          ref.read(productStateProvider(entityId, sessionId)).requireValue;

      final updatedProduct = await ref.read(productRepositoryProvider).update(
            entity: product,
            release: false,
            sessionId: sessionId,
          );
      ref.read(recentWindowsProvider.notifier).updateEntityWindow(
            RecentWindow(
              type: floatingWindowType,
              entityId: entityId,
              label: product.fullProductId,
              additionalData: ProductMasterAdditionalData(
                salesOrderId: product.salesOrder?.meta.id ?? 0,
                customSalesOrderId: product.salesOrder?.fullSalesOrderId ?? '',
                productId: product.meta.id,
              ).toJson(),
            ),
          );
      ref
          .read(productStateProvider(entityId, sessionId).notifier)
          .updateMetaAfterSave();
      return updatedProduct;
    }

    final ppL10n = context.prepressL10n;

    return EntityCard<Product>(
      floatingWindowType: floatingWindowType,
      floatingWindowFocus: floatingWindowFocus,
      formKey: formKey,
      onSave: (entityId, sessionId, navigatorKey) =>
          onSavePressed(entityId, sessionId),
      floatingWindowId: floatingWindowId,
      showTitleBar: true,
      entityId: productId,
      invalidateEntityState: (entityId, sessionId) async {
        ref.invalidate(productStateProvider(entityId, sessionId));
      },
      stateRefetchWithoutLock: (entityId, sessionId) async {
        await ref
            .read(productStateProvider(entityId, sessionId).notifier)
            .refetchWithoutLock();
      },
      streamDataProvider: ({
        required sessionId,
        required dataId,
      }) =>
          watchProductProvider(
        sessionId: sessionId,
        productId: dataId,
      ),
      stateSaveUnlockRefetch: (editingSessionId, dataId, navigatorKey) async {
        await ref
            .read(productStateProvider(dataId, editingSessionId).notifier)
            .saveAndUnlockAndRefetch();
      },
      stateRefetchWithLock: (entityId, sessionId) => ref
          .read(productStateProvider(entityId, sessionId).notifier)
          .refetchWithLock(),
      createEntity: (sessionId) => ref.read(productRepositoryProvider).create(
            sessionId: sessionId,
            salesOrderId: salesOrderId,
          ),
      stateProvider: productStateProvider.call,
      tableType: TableType.product.name,
      getTitle: (entity) => entity.fullProductId,
      tableIcon: (entityId, sessionId) => AppIcons.product,
      tablePrefix: (entityId, sessionId) => ppL10n.product_singular,
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
        final stateNotifier =
            ref.watch(productStateProvider(entityId, sessionId).notifier);

        useEffect(
          () {
            if (productId == null || !isFirstRender.value) return;
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              ref.read(recentWindowsProvider.notifier).insertEntityWindow(
                    RecentWindow(
                      type: floatingWindowType,
                      entityId: entityId,
                      label: initialEntity.fullProductId,
                      additionalData: ProductMasterAdditionalData(
                        salesOrderId: initialEntity.salesOrder?.meta.id ?? 0,
                        customSalesOrderId:
                            initialEntity.salesOrder?.fullSalesOrderId ?? '',
                        productId: initialEntity.meta.id,
                      ).toJson(),
                    ),
                  );
            });
            return null;
          },
          [],
        );

        return FloatingCardBody(
          floatingWindowType: FloatingWindowType.product.name,
          isFirstRun: isFirstRender.value,
          floatingWindowId: floatingWindowId,
          navigatorKey: navigatorKey,
          formKey: formKey,
          initialNavigationIndexNotifier: selectedNavIndexRef,
          initialNoteId: initialNoteId,
          initialNoteParentId: initialNoteParentId,
          entityNotesHint: initialEntity.salesOrder?.fullSalesOrderId,
          noteTableType: TableType.productMaster.name,
          noteEntityId: initialEntity.productMasterId,
          footer: EntityCardFooter<Product>(
            stateProvider: productStateProvider.call(entityId, sessionId),
            savedOrInitialEntity: savedOrInitialEntity,
            floatingWindowId: floatingWindowId,
            formKey: formKey,
            readOnly: readOnly,
            navigatorKey: navigatorKey,
            isSavingNotifier: isSaving,
            onSaveError: null,
            onSavePressed: () => onSavePressed(entityId, sessionId),
            meta: meta,
          ),
          navigationGroups: [
            // Sales Order
            CardNavigationGroup(
              items: [
                CardNavigationItem(
                  icon: AppIcons.home,
                  label: ppL10n.sales_sales_order_singular,
                  showErrorBadge: ref.watch(
                    validationGroupProvider(validationGroupId).select(
                      (value) => value.isNotEmpty,
                    ),
                  ),
                ),
              ],
            ),
            // History
            CardNavigationGroup(
              items: [
                CardNavigationItem(
                  label: l10n.gen_history,
                  icon: AppIcons.history,
                ),
              ],
            ),
          ],
          children: [
            CardBodyItem(
              child: ScrollableCardItem.constrained(
                builder: (context, constraints) {
                  return Column(
                    children: [
                      ProductMainPage(
                        readOnly: readOnly,
                        constraints: constraints,
                        validationGroupId: validationGroupId,
                        initialEntity: initialEntity,
                        stateNotifier: stateNotifier,
                        sessionId: sessionId,
                        entityId: entityId,
                      ),
                    ],
                  );
                },
              ),
            ),
            // History
            CardBodyItem(
              keepAlive: false,
              child: ProductHistory(
                productMasterId: initialEntity.productMasterId!,
              ),
            ),
          ],
        );
      },
    );
  }
}
