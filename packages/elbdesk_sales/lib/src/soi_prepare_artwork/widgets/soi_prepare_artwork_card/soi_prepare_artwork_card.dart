import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/src/sales_order_item/widgets/soi_general_shared_section.dart';
import 'package:elbdesk_sales/src/soi_prepare_artwork/extensions/eye_c_status_extension.dart';
import 'package:elbdesk_sales/src/soi_prepare_artwork/extensions/soi_prepare_artwork_difficulty_extension.dart';
import 'package:elbdesk_sales/src/soi_prepare_artwork/logic/soi_prepare_artwork_state.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
// ignore: no_flutter_material_import
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

part 'pages/soi_prepare_artwork_card_main_page.dart';

class SoiPrepareArtworkCard extends HookConsumerWidget {
  const SoiPrepareArtworkCard({
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

  final GlobalKey<NavigatorState>? navigatorKey;

  final FocusNode floatingWindowFocus;
  final String floatingWindowType;
  final int? initialNoteId;
  final int? initialNoteParentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useFormKey();
    final l10n = context.l10n;
    final salesL10n = context.salesL10n;

    Future<SoiPrepareArtwork> onSavePressed(
      int entityId,
      String sessionId,
    ) async {
      final data = ref
          .read(soiPrepareArtworkStateProvider(entityId, sessionId))
          .requireValue;

      // if not company, check if we
      // check if contact has customer

      final updatedSoiPrepareArtwork =
          await ref.read(soiPrepareArtworkRepositoryProvider).update(
                entity: data,
                release: false,
                sessionId: sessionId,
              );
      ref
          .read(soiPrepareArtworkStateProvider(entityId, sessionId).notifier)
          .updateMetaAfterSave();

      final product = data.artwork.product;

      ref.read(recentWindowsProvider.notifier).updateEntityWindow(
            RecentWindow(
              type: floatingWindowType,
              entityId: entityId,
              label: salesL10n.prepress_prepare_artwork,
              additionalData: SoiPrepareArtworkAdditionalData(
                customerId: customerId,
                artworkCustomId:
                    data.artwork.fullArtworkIdWithProduct(product!),
              ).toJson(),
            ),
          );
      ref.invalidate(findSalesOrderItemsProvider);
      return updatedSoiPrepareArtwork;
    }

    return EntityCard<SoiPrepareArtwork>(
      floatingWindowType: floatingWindowType,
      floatingWindowFocus: floatingWindowFocus,
      formKey: formKey,
      onSave: (entityId, sessionId, navigatorKey) =>
          onSavePressed(entityId, sessionId),
      showTitleBar: true,
      invalidateEntityState: (entityId, sessionId) async {
        ref.invalidate(
          soiPrepareArtworkStateProvider(entityId, sessionId),
        );
      },
      stateRefetchWithoutLock: (entityId, sessionId) async {
        await ref
            .read(soiPrepareArtworkStateProvider(entityId, sessionId).notifier)
            .refetchWithoutLock();
      },
      streamDataProvider: ({
        required sessionId,
        required dataId,
      }) =>
          watchSoiPrepareArtworkProvider(
        sessionId: sessionId,
        id: dataId,
      ),
      tableType: TableType.soiPrepareArtwork.name,
      stateSaveUnlockRefetch: (editingSessionId, dataId, navigatorKey) async {
        await ref
            .read(
              soiPrepareArtworkStateProvider(dataId, editingSessionId).notifier,
            )
            .saveAndUnlockAndRefetch();
      },
      entityId: entityId,
      stateRefetchWithLock: (entityId, sessionId) => ref
          .read(soiPrepareArtworkStateProvider(entityId, sessionId).notifier)
          .refetchWithLock(),
      floatingWindowId: floatingWindowId,
      stateProvider: soiPrepareArtworkStateProvider.call,
      createEntity: (sessionId) => throw UnimplementedError(),
      getTitle: (entity) => '${salesL10n.prepress_prepare_artwork}: '
          '${entity.artwork.fullArtworkIdWithProduct(entity.artwork.product!)}',
      tableIcon: (entityId, sessionId) => AppIcons.soiPrepareArtwork,
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
          soiPrepareArtworkStateProvider(entityId, sessionId).notifier,
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
                      label: salesL10n.prepress_prepare_artwork,
                      additionalData: SoiPrepareArtworkAdditionalData(
                        customerId: customerId,
                        artworkCustomId:
                            initialEntity.artwork.fullArtworkIdWithProduct(
                          product!,
                        ),
                      ).toJson(),
                    ),
                  );
            });
            return null;
          },
          [],
        );

        return FloatingCardBody(
          noteEntityId: entityId,
          initialNoteId: initialNoteId,
          initialNoteParentId: initialNoteParentId,
          isFirstRun: isFirstRender.value,
          noteTableType: TableType.soiPrepareArtwork.name,
          floatingWindowId: floatingWindowId,
          navigatorKey: navigatorKey,
          showShareButton: true,
          formKey: formKey,
          floatingWindowType: FloatingWindowType.soiPrepareArtwork.name,
          initialNavigationIndexNotifier: selectedNavIndexRef,
          footer: EntityCardFooter<SoiPrepareArtwork>(
            stateProvider:
                soiPrepareArtworkStateProvider.call(entityId, sessionId),
            floatingWindowId: floatingWindowId,
            onSaveError: null,
            savedOrInitialEntity: savedOrInitialEntity,
            isSavingNotifier: isSaving,
            onSavePressed: () => onSavePressed(entityId, sessionId),
            readOnly: readOnly,
            navigatorKey: navigatorKey,
            meta: meta,
            formKey: formKey,
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
              child: _SoiPrepareArtworkCardMainPage(
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
