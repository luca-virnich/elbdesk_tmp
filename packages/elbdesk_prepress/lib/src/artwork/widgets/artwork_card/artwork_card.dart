import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork/config/artwork_fields.dart';
import 'package:elbdesk_prepress/src/artwork/extensions/artwork_die_cutter_type_extension.dart';
import 'package:elbdesk_prepress/src/artwork/logic/artwork_state.dart';
import 'package:elbdesk_prepress/src/artwork/widgets/artwork_card/artwork_codes_view.dart';
import 'package:elbdesk_prepress/src/artwork/widgets/artwork_card/history/artwork_history.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine/widgets/table/artwork_quarantine_missing_colors_table.dart';
import 'package:elbdesk_prepress/src/artwork_shared/widgets/artwork_color_table/artwork_color_table.dart';
import 'package:elbdesk_prepress/src/artwork_shared/widgets/artwork_color_table/artwork_quarantine_color_table.dart';
import 'package:elbdesk_prepress/src/artwork_shared/widgets/artwork_layer_table/artwork_layer_table.dart';
import 'package:elbdesk_prepress/src/artwork_shared/widgets/artwork_trapping/artwork_trapping.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
// ignore: no_flutter_material_import
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

part 'pages/artwork_card_codes_page.dart';
part 'pages/artwork_card_main_page.dart';

/// Artwork Card
///
/// This card is used to display an artwork
///
/// It also shows the Artwork History, which contains the changes to the
/// Artwork Master, and also show the Artworks that are based on it.
class ArtworkCard extends HookConsumerWidget {
  const ArtworkCard({
    required this.floatingWindowId,
    required this.artworkId,
    required this.customerId,
    required this.floatingWindowFocus,
    required this.floatingWindowType,
    this.navigatorKey,
    this.initialNoteId,
    this.initialNoteParentId,
    super.key,
  });
  final String floatingWindowId;
  final int? artworkId;
  final int customerId;

  final GlobalKey<NavigatorState>? navigatorKey;

  final FocusNode floatingWindowFocus;

  final int? initialNoteId;
  final int? initialNoteParentId;
  final String floatingWindowType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useFormKey();
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;

    Future<Artwork> onSavePressed(
      int entityId,
      String sessionId,
    ) async {
      final artworkForSave = ref
          .read(artworkStateProvider(entityId, sessionId).notifier)
          .forSave();

      // if not company, check if we
      // check if contact has customer

      final updatedArtwork = await ref.read(artworkRepositoryProvider).update(
            entity: artworkForSave,
            release: false,
            sessionId: sessionId,
          );
      ref.read(recentWindowsProvider.notifier).updateEntityWindow(
            RecentWindow(
              type: floatingWindowType,
              entityId: entityId,
              label: artworkForSave.fullArtworkIdWithProduct(
                artworkForSave.product!,
              ),
              additionalData: ArtworkAdditionalData(
                customerId: customerId,
                customSalesOrderId: artworkForSave.salesOrder?.fullSalesOrderId,
                artworkId: artworkForSave.id,
                width: artworkForSave.width,
                height: artworkForSave.height,
              ).toJson(),
            ),
          );
      ref
          .read(artworkStateProvider(entityId, sessionId).notifier)
          .updateMetaAfterSave();
      return updatedArtwork;
    }

    return EntityCard<Artwork>(
      floatingWindowType: floatingWindowType,
      floatingWindowFocus: floatingWindowFocus,
      formKey: formKey,
      onSave: (entityId, sessionId, navigatorKey) =>
          onSavePressed(entityId, sessionId),
      showTitleBar: true,
      invalidateEntityState: (entityId, sessionId) async {
        ref.invalidate(
          artworkStateProvider(entityId, sessionId),
        );
      },
      stateRefetchWithoutLock: (entityId, sessionId) async {
        await ref
            .read(artworkStateProvider(entityId, sessionId).notifier)
            .refetchWithoutLock();
      },
      streamDataProvider: ({
        required sessionId,
        required dataId,
      }) =>
          watchArtworkProvider(
        sessionId: sessionId,
        id: dataId,
      ),
      tableType: TableType.artwork.name,
      stateSaveUnlockRefetch: (editingSessionId, dataId, navigatorKey) async {
        await ref
            .read(artworkStateProvider(dataId, editingSessionId).notifier)
            .saveAndUnlockAndRefetch();
      },
      entityId: artworkId,
      stateRefetchWithLock: (entityId, sessionId) => ref
          .read(artworkStateProvider(entityId, sessionId).notifier)
          .refetchWithLock(),
      floatingWindowId: floatingWindowId,
      stateProvider: artworkStateProvider.call,
      createEntity: (sessionId) => ref.read(artworkRepositoryProvider).create(
            sessionId: sessionId,
            customerId: customerId,
            preSelectionId: 0,
            selectionId: 0,
          ),
      getTitle: (entity) => entity.fullArtworkIdWithProduct(entity.product!),
      tableIcon: (entityId, sessionId) => AppIcons.artwork,
      tablePrefix: (entityId, sessionId) => ppL10n.artwork_singular,
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
          artworkStateProvider(entityId, sessionId).notifier,
        );
        final isLocked = ref.watch(
          artworkStateProvider(entityId, sessionId)
              .select((state) => state.requireValue.isLocked),
        );
        useEffect(
          () {
            if (artworkId == null || !isFirstRender.value) return;
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              ref.read(recentWindowsProvider.notifier).insertEntityWindow(
                    RecentWindow(
                      type: floatingWindowType,
                      entityId: entityId,
                      label: initialEntity
                          .fullArtworkIdWithProduct(initialEntity.product!),
                      additionalData: ArtworkAdditionalData(
                        customerId: customerId,
                        customSalesOrderId:
                            initialEntity.salesOrder?.fullSalesOrderId,
                        artworkId: initialEntity.id,
                        width: initialEntity.width,
                        height: initialEntity.height,
                      ).toJson(),
                    ),
                  );
            });
            return null;
          },
          [],
        );

        return FloatingCardBody(
          floatingWindowType: FloatingWindowType.artwork.name,
          isFirstRun: isFirstRender.value,
          header: _Header(
            sessionId: sessionId,
            entityId: entityId,
            initialLocked: isLocked,
          ),
          navigatorKey: navigatorKey,
          showShareButton: true,
          shareEntityId: initialEntity.id,
          floatingWindowId: floatingWindowId,
          initialNoteId: initialNoteId,
          initialNoteParentId: initialNoteParentId,
          noteEntityId: initialEntity.artworkMasterId,
          entityNotesHint: initialEntity.salesOrder?.fullSalesOrderId,
          noteTableType: TableType.artworkMaster.name,
          formKey: formKey,
          initialNavigationIndexNotifier: selectedNavIndexRef,
          footer: EntityCardFooter<Artwork>(
            stateProvider: artworkStateProvider.call(entityId, sessionId),
            savedOrInitialEntity: savedOrInitialEntity,
            onSaveError: null,
            onSavePressed: () => onSavePressed(entityId, sessionId),
            isSavingNotifier: isSaving,
            floatingWindowId: floatingWindowId,
            formKey: formKey,
            readOnly: readOnly || isLocked,
            navigatorKey: navigatorKey,
            meta: meta,
          ),
          navigationGroups: [
            // Artwork
            CardNavigationGroup(
              items: [
                // General
                CardNavigationItem(
                  label: ppL10n.artwork_singular,
                  icon: AppIcons.artwork,
                ),
                // Artwork Codes
                CardNavigationItem(
                  label: ppL10n.artwork_code_plural,
                  icon: AppIcons.artworkCode,
                ),
              ],
            ),

            // Artwork History
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
            // Artwork
            CardBodyItem(
              child: _ArtworkCardMainPage(
                entityId: entityId,
                customerId: customerId,
                floatingWindowFocus: floatingWindowFocus,
                stateNotifier: stateNotifier,
                initialEntity: initialEntity,
                readOnly: readOnly || isLocked,
                floatingWindowId: floatingWindowId,
                navigatorKey: navigatorKey,
                artworkSessionId: sessionId,
              ),
            ),

            // Artwork Codes
            CardBodyItem(
              child: _ArtworkCardCodesPage(
                entityId: entityId,
                sessionId: sessionId,
                navigatorKey: navigatorKey,
                floatingWindowFocus: floatingWindowFocus,
                floatingWindowId: floatingWindowId,
                readOnly: readOnly || isLocked,
                stateNotifier: stateNotifier,
              ),
            ),

            // Artwork History
            CardBodyItem(
              keepAlive: false,
              loadLazy: true,
              child: ArtworkHistory(
                currentArtwork: initialEntity,
                navigatorKey: navigatorKey,
                floatingWindowId: floatingWindowId,
                floatingWindowFocus: floatingWindowFocus,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _Header extends HookConsumerWidget {
  const _Header({
    required this.sessionId,
    required this.entityId,
    required this.initialLocked,
  });
  final String sessionId;
  final int entityId;
  final bool initialLocked;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ppL10n = context.prepressL10n;
    final isLocked = useState<bool>(initialLocked);

    ref.listen(
      watchArtworkProvider(sessionId: sessionId, id: entityId),
      (previous, next) {
        final artwork = next.asData?.value;
        if (artwork == null) return;
        final newLock = artwork.isLocked;
        if (newLock == isLocked.value) return;
        isLocked.value = newLock;
        ref
            .read(artworkStateProvider(entityId, sessionId).notifier)
            .updateIsLocked(newLock);
      },
    );
    if (!isLocked.value) return const SizedBox.shrink();
    return ColoredBox(
      color: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.all(UiConstants.defaultPadding),
        child: Align(
          alignment: Alignment.centerLeft,
          // TODO(lv): Themeing/Translations
          child: AppText(
            ppL10n.artwork_locked_message,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
