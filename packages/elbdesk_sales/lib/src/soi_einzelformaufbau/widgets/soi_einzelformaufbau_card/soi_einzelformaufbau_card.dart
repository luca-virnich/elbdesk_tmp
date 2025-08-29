import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/src/sales_order_item/widgets/soi_general_shared_section.dart';
import 'package:elbdesk_sales/src/soi_einzelformaufbau/logic/soi_einzelformaufbau_state.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
// ignore: no_flutter_material_import
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

part 'pages/soi_einzelformaufbau_card_main_page.dart';

class SoiEinzelformaufbauCard extends HookConsumerWidget {
  const SoiEinzelformaufbauCard({
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

    Future<SoiEinzelformaufbau> onSavePressed(
      int entityId,
      String sessionId,
    ) async {
      final data = ref
          .read(soiEinzelformaufbauStateProvider(entityId, sessionId))
          .requireValue;

      // if not company, check if we
      // check if contact has customer

      await ref.read(soiEinzelformaufbauRepositoryProvider).update(
            entity: data,
            release: false,
            sessionId: sessionId,
          );
      ref
          .read(
            soiEinzelformaufbauStateProvider(entityId, sessionId).notifier,
          )
          .updateMetaAfterSave();

      final product = data.artwork.product;

      ref.read(recentWindowsProvider.notifier).updateEntityWindow(
            RecentWindow(
              type: floatingWindowType,
              entityId: entityId,
              label: salesL10n.soi_einzelformaufbau_singular,
              additionalData: SoiEinzelformaufbauAdditionalData(
                customerId: customerId,
                artworkCustomId:
                    data.artwork.fullArtworkIdWithProduct(product!),
              ).toJson(),
            ),
          );
      ref.invalidate(findSalesOrderItemsProvider);
      return data;
    }

    return EntityCard<SoiEinzelformaufbau>(
      floatingWindowType: floatingWindowType,
      floatingWindowFocus: floatingWindowFocus,
      formKey: formKey,
      onSave: (entityId, sessionId, navigatorKey) =>
          onSavePressed(entityId, sessionId),
      showTitleBar: true,
      invalidateEntityState: (entityId, sessionId) async {
        ref.invalidate(
          soiEinzelformaufbauStateProvider(entityId, sessionId),
        );
      },
      stateRefetchWithoutLock: (entityId, sessionId) async {
        await ref
            .read(
              soiEinzelformaufbauStateProvider(entityId, sessionId).notifier,
            )
            .refetchWithoutLock();
      },
      streamDataProvider: ({
        required sessionId,
        required dataId,
      }) =>
          watchSoiEinzelformaufbauProvider(
        sessionId: sessionId,
        id: dataId,
      ),
      tableType: TableType.soiEinzelformaufbau.name,
      stateSaveUnlockRefetch: (editingSessionId, dataId, navigatorKey) async {
        await ref
            .read(
              soiEinzelformaufbauStateProvider(
                dataId,
                editingSessionId,
              ).notifier,
            )
            .saveAndUnlockAndRefetch();
      },
      entityId: entityId,
      stateRefetchWithLock: (entityId, sessionId) => ref
          .read(
            soiEinzelformaufbauStateProvider(
              entityId,
              sessionId,
            ).notifier,
          )
          .refetchWithLock(),
      floatingWindowId: floatingWindowId,
      stateProvider: soiEinzelformaufbauStateProvider.call,
      createEntity: (sessionId) => throw UnimplementedError(),
      getTitle: (entity) => entity.soiIdReadable,
      tableIcon: (entityId, sessionId) => AppIcons.soiEinzelformaufbau,
      tablePrefix: (entityId, sessionId) =>
          salesL10n.soi_einzelformaufbau_singular,
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
          soiEinzelformaufbauStateProvider(entityId, sessionId).notifier,
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
                      label: salesL10n.soi_einzelformaufbau_singular,
                      additionalData: SoiEinzelformaufbauAdditionalData(
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
          floatingWindowType: FloatingWindowType.soiEinzelformaufbau.name,
          isFirstRun: isFirstRender.value,
          noteEntityId: entityId,
          initialNoteId: initialNoteId,
          initialNoteParentId: initialNoteParentId,
          noteTableType: TableType.soiEinzelformaufbau.name,
          floatingWindowId: floatingWindowId,
          navigatorKey: navigatorKey,
          formKey: formKey,
          initialNavigationIndexNotifier: selectedNavIndexRef,
          footer: _Footer(
            savedOrInitialEntity: savedOrInitialEntity,
            onSavePressed: () => onSavePressed(entityId, sessionId),
            isSaving: isSaving,
            floatingWindowId: floatingWindowId,
            formKey: formKey,
            readOnly: readOnly,
            navigatorKey: navigatorKey,
            entityId: entityId,
            sessionId: sessionId,
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
              child: _SoiEinzelformaufbauCardMainPage(
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

class _Footer extends HookConsumerWidget {
  const _Footer({
    required this.floatingWindowId,
    required this.formKey,
    required this.readOnly,
    required this.navigatorKey,
    required this.entityId,
    required this.sessionId,
    required this.meta,
    required this.isSaving,
    required this.onSavePressed,
    required this.savedOrInitialEntity,
  });

  final String floatingWindowId;
  final GlobalKey<FormState> formKey;
  final bool readOnly;
  final GlobalKey<NavigatorState> navigatorKey;
  final int entityId;
  final String sessionId;
  final DataMeta meta;
  final ValueNotifier<bool> isSaving;
  final Future<SoiEinzelformaufbau> Function() onSavePressed;
  final ObjectRef<SoiEinzelformaufbau?> savedOrInitialEntity;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return EntityCardFooter<SoiEinzelformaufbau>(
      onSaveError: null,
      savedOrInitialEntity: savedOrInitialEntity,
      isSavingNotifier: isSaving,
      readOnly: readOnly,
      hideDeleteButton: true,
      navigatorKey: navigatorKey,
      formKey: formKey,
      meta: meta,
      floatingWindowId: floatingWindowId,
      onSavePressed: onSavePressed,
      stateProvider: soiEinzelformaufbauStateProvider.call(entityId, sessionId),
    );
  }
}
