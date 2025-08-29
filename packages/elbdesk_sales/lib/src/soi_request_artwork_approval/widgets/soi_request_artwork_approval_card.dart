import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/src/sales_order_item/widgets/soi_general_shared_section.dart';
import 'package:elbdesk_sales/src/soi_request_artwork_approval/config/soi_request_artwork_approval_fields.dart';
import 'package:elbdesk_sales/src/soi_request_artwork_approval/logic/soi_request_artwork_approval_state.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
// ignore: no_flutter_material_import
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

part '../pages/soi_request_approval_card_main_page.dart';

class SoiRequestArtworkApprovalCard extends HookConsumerWidget {
  const SoiRequestArtworkApprovalCard({
    required this.floatingWindowId,
    required this.entityId,
    required this.customerId,
    required this.floatingWindowFocus,
    required this.floatingWindowType,
    this.navigatorKey,
    this.initialNoteId,
    this.initialNoteParentId,
    super.key,
  });
  final String floatingWindowId;
  final int? entityId;
  final int customerId;
  final String floatingWindowType;
  final GlobalKey<NavigatorState>? navigatorKey;

  final FocusNode floatingWindowFocus;

  final int? initialNoteId;
  final int? initialNoteParentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useFormKey();
    final l10n = context.l10n;
    final salesL10n = context.salesL10n;

    Future<SoiRequestArtworkApproval> onSavePressed(
      int entityId,
      String sessionId,
    ) async {
      final data = ref
          .read(soiRequestArtworkApprovalStateProvider(entityId, sessionId))
          .requireValue;

      // if not company, check if we
      // check if contact has customer

      final updatedSoiRequestArtworkApproval =
          await ref.read(soiRequestArtworkApprovalRepositoryProvider).update(
                entity: data,
                release: false,
                sessionId: sessionId,
              );
      ref
          .read(
            soiRequestArtworkApprovalStateProvider(entityId, sessionId)
                .notifier,
          )
          .updateMetaAfterSave();

      final product = data.artwork.product;

      ref.read(recentWindowsProvider.notifier).updateEntityWindow(
            RecentWindow(
              type: floatingWindowType,
              entityId: entityId,
              label: salesL10n.soi_request_artwork_approval_singular,
              additionalData: SoiRequestArtworkApprovalAdditionalData(
                customerId: customerId,
                artworkCustomId:
                    data.artwork.fullArtworkIdWithProduct(product!),
                status: null,
              ).toJson(),
            ),
          );
      ref.invalidate(findSalesOrderItemsProvider);
      return updatedSoiRequestArtworkApproval;
    }

    return EntityCard<SoiRequestArtworkApproval>(
      floatingWindowType: floatingWindowType,
      floatingWindowFocus: floatingWindowFocus,
      formKey: formKey,
      onSave: (entityId, sessionId, navigatorKey) =>
          onSavePressed(entityId, sessionId),
      showTitleBar: true,
      invalidateEntityState: (entityId, sessionId) async {
        ref.invalidate(
          soiRequestArtworkApprovalStateProvider(entityId, sessionId),
        );
      },
      stateRefetchWithoutLock: (entityId, sessionId) async {
        await ref
            .read(
              soiRequestArtworkApprovalStateProvider(entityId, sessionId)
                  .notifier,
            )
            .refetchWithoutLock();
      },
      streamDataProvider: ({
        required sessionId,
        required dataId,
      }) =>
          watchSoiRequestArtworkApprovalProvider(
        sessionId: sessionId,
        id: dataId,
      ),
      tableType: TableType.soiRequestArtworkApproval.name,
      stateSaveUnlockRefetch: (editingSessionId, dataId, navigatorKey) async {
        await ref
            .read(
              soiRequestArtworkApprovalStateProvider(
                dataId,
                editingSessionId,
              ).notifier,
            )
            .saveAndUnlockAndRefetch();
      },
      entityId: entityId,
      stateRefetchWithLock: (entityId, sessionId) => ref
          .read(
            soiRequestArtworkApprovalStateProvider(
              entityId,
              sessionId,
            ).notifier,
          )
          .refetchWithLock(),
      floatingWindowId: floatingWindowId,
      stateProvider: soiRequestArtworkApprovalStateProvider.call,
      createEntity: (sessionId) => throw UnimplementedError(),
      getTitle: (entity) =>
          '${salesL10n.soi_request_artwork_approval_singular}: '
          '${entity.artwork.fullArtworkIdWithProduct(entity.artwork.product!)}',
      tableIcon: (entityId, sessionId) => AppIcons.soiRequestArtworkApproval,
      tablePrefix: (entityId, sessionId) => '',
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
          soiRequestArtworkApprovalStateProvider(entityId, sessionId).notifier,
        );

        useEffect(
          () {
            if (!isFirstRender.value) return;
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              final product = initialEntity.artwork.product;

              ref.read(recentWindowsProvider.notifier).insertEntityWindow(
                    RecentWindow(
                      type: floatingWindowType,
                      entityId: entityId,
                      label: salesL10n.soi_request_artwork_approval_singular,
                      additionalData: SoiRequestArtworkApprovalAdditionalData(
                        customerId: customerId,
                        artworkCustomId:
                            initialEntity.artwork.fullArtworkIdWithProduct(
                          product!,
                        ),
                        status: null,
                      ).toJson(),
                    ),
                  );
            });
            return null;
          },
          [],
        );

        return FloatingCardBody(
          isFirstRun: isFirstRender.value,
          noteEntityId: entityId,
          initialNoteId: initialNoteId,
          initialNoteParentId: initialNoteParentId,
          noteTableType: TableType.soiRequestArtworkApproval.name,
          floatingWindowId: floatingWindowId,
          navigatorKey: navigatorKey,
          formKey: formKey,
          floatingWindowType: FloatingWindowType.soiRequestArtworkApproval.name,
          initialNavigationIndexNotifier: selectedNavIndexRef,
          footer: EntityCardFooter<SoiRequestArtworkApproval>(
            stateProvider: soiRequestArtworkApprovalStateProvider.call(
              entityId,
              sessionId,
            ),
            savedOrInitialEntity: savedOrInitialEntity,
            onSaveError: null,
            onSavePressed: () => onSavePressed(entityId, sessionId),
            isSavingNotifier: isSaving,
            floatingWindowId: floatingWindowId,
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
                  label: l10n.gen_general,
                  showErrorBadge: false,
                ),
              ],
            ),
          ],
          children: [
            CardBodyItem(
              child: _SoiRequestApprovalCardMainPage(
                entityId: entityId,
                customerId: customerId,
                floatingWindowFocus: floatingWindowFocus,
                stateNotifier: stateNotifier,
                initialEntity: initialEntity,
                readOnly: readOnly,
                sessionId: sessionId,
                floatingWindowId: floatingWindowId,
                navigatorKey: navigatorKey,
                artworkSessionId: sessionId,
              ),
            ),
          ],
        );
      },
    );
  }
}
