import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork/models/trapping.dart';
import 'package:elbdesk_prepress/src/artwork_shared/widgets/artwork_color_table/artwork_color_table.dart';
import 'package:elbdesk_prepress/src/artwork_shared/widgets/artwork_layer_table/artwork_layer_table.dart';
import 'package:elbdesk_prepress/src/artwork_shared/widgets/artwork_trapping/artwork_trapping.dart';
import 'package:elbdesk_prepress/src/artwork_template/config/artwork_template_fields.dart';
import 'package:elbdesk_prepress/src/artwork_template/logic/artwork_template_provider.dart';
import 'package:elbdesk_prepress/src/artwork_template/logic/artwork_template_state.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

// part 'artwork_template_card_colors.dart';
// part 'artwork_template_card_layer.dart';
part 'artwork_template_card_trapping.dart';

class ArtworkTemplateCard extends HookConsumerWidget {
  const ArtworkTemplateCard({
    required this.floatingWindowId,
    required this.artworkTemplateId,
    required this.customerId,
    required this.preSelectionId,
    required this.selectionId,
    required this.floatingWindowFocus,
    required this.floatingWindowType,
    super.key,
  });
  final String floatingWindowId;
  final int? artworkTemplateId;
  final int? customerId;
  final int? preSelectionId;
  final int? selectionId;
  final String floatingWindowType;
  final FocusNode floatingWindowFocus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useFormKey();

    Future<ArtworkTemplate> onSavePressed(
      int entityId,
      String sessionId,
    ) async {
      ref
          .read(artworkTemplateStateProvider(entityId, sessionId).notifier)
          .removeColorsWithoutColorPalette();
      final artworkTemplate = ref
          .read(artworkTemplateStateProvider(entityId, sessionId).notifier)
          .forSave();

      await ref.read(artworkTemplateRepositoryProvider).update(
            entity: artworkTemplate,
            release: false,
            sessionId: sessionId,
          );
      ref.read(recentWindowsProvider.notifier).updateEntityWindow(
            RecentWindow(
              type: floatingWindowType,
              entityId: entityId,
              label: '${artworkTemplate.customerName ?? ""} '
                  '- ${artworkTemplate.description}',
              additionalData: ArtworkAdditionalData(
                customerId: customerId,
                customSalesOrderId: null,
                artworkId: artworkTemplateId,
                width: null,
                height: null,
              ).toJson(),
            ),
          );
      ref
        ..invalidate(
          findArtworkTemplatesByCustomerProvider,
        )
        ..invalidate(
          findGeneralArtworkTemplatesProvider,
        );
      ref
          .read(artworkTemplateStateProvider(entityId, sessionId).notifier)
          .updateMetaAfterSave();
      return artworkTemplate;
    }

    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;
    return EntityCard<ArtworkTemplate>(
      floatingWindowType: floatingWindowType,
      floatingWindowFocus: floatingWindowFocus,
      formKey: formKey,
      onSave: (entityId, sessionId, navigatorKey) =>
          onSavePressed(entityId, sessionId),
      showTitleBar: true,
      invalidateEntityState: (entityId, sessionId) async {
        ref.invalidate(
          artworkTemplateStateProvider(entityId, sessionId),
        );
      },
      stateRefetchWithoutLock: (entityId, sessionId) async {
        await ref
            .read(artworkTemplateStateProvider(entityId, sessionId).notifier)
            .refetchWithoutLock();
      },
      streamDataProvider: ({
        required sessionId,
        required dataId,
      }) =>
          watchArtworkTemplateProvider(
        sessionId: sessionId,
        id: dataId,
      ),
      tableType: TableType.artworkTemplate.name,
      stateSaveUnlockRefetch: (editingSessionId, dataId, navigatorKey) async {
        await ref
            .read(
              artworkTemplateStateProvider(dataId, editingSessionId).notifier,
            )
            .saveAndUnlockAndRefetch();
      },
      entityId: artworkTemplateId,
      stateRefetchWithLock: (entityId, sessionId) => ref
          .read(artworkTemplateStateProvider(entityId, sessionId).notifier)
          .refetchWithLock(),
      floatingWindowId: floatingWindowId,
      stateProvider: artworkTemplateStateProvider.call,
      createEntity: (sessionId) =>
          ref.read(artworkTemplateRepositoryProvider).create(
                sessionId: sessionId,
                customerId: customerId,
                preSelectionId: preSelectionId!,
                selectionId: selectionId!,
              ),
      getTitle: (entity) => entity.description,
      tableIcon: (entityId, sessionId) => AppIcons.artworkTemplate,
      tablePrefix: (entityId, sessionId) => ppL10n.artwork_template_singular,
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
          artworkTemplateStateProvider(entityId, sessionId).notifier,
        );

        final contactName = savedOrInitialEntity.value?.customerName;
        final description = savedOrInitialEntity.value?.description;

        useEffect(
          () {
            if (!isFirstRender.value) return;
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              if (artworkTemplateId == null) return;
              // final customId = initialEntity.
              ref.read(recentWindowsProvider.notifier).insertEntityWindow(
                    RecentWindow(
                      type: floatingWindowType,
                      entityId: entityId,
                      label: '${contactName ?? ''} - ${description ?? ''}',
                      additionalData: {
                        'customerId': customerId,
                      },
                    ),
                  );
            });
            return null;
          },
          [],
        );
        return FloatingCardBody(
          floatingWindowType: FloatingWindowType.artworkTemplate.name,
          isFirstRun: isFirstRender.value,
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
                // General
                CardNavigationItem(
                  label: ppL10n.artwork_singular,
                  icon: AppIcons.artwork,
                ),
                // Artwork Codes
              ],
            ),
            // CardNavigationGroup(
            //   items: [
            //     CardNavigationItem(
            //       label: l10n.gen_history,
            //       icon: AppIcons.history,
            //     ),
            //   ],
            // ),
          ],
          childrenBuilder: (context, constraints) => [
            CardBodyItem(
              child: _Body(
                customerId: customerId,
                floatingWindowFocus: floatingWindowFocus,
                stateNotifier: stateNotifier,
                initialEntity: initialEntity,
                readOnly: readOnly,
                floatingWindowId: floatingWindowId,
                navigatorKey: navigatorKey,
                sessionId: sessionId,
              ),
            ),
            // CardBodyItem(
            //   keepAlive: false,
            //   child: EntityLogTable(
            //    fieldTitle: (log) => ArtworkTemplateFieldWrapper.fromFieldKey(
            //       log.field,
            //     ).readable(l10n),
            //     entityId: entityId,
            //     tableType: TableType.artworkTemplate,
            //     navigatorKey: navigatorKey,
            //   ),
            // ),
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
  final Future<ArtworkTemplate> Function() onSavePressed;
  final ObjectRef<ArtworkTemplate?> savedOrInitialEntity;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return EntityCardFooter<ArtworkTemplate>(
      onSaveError: null,
      savedOrInitialEntity: savedOrInitialEntity,
      isSavingNotifier: isSaving,
      readOnly: readOnly,
      navigatorKey: navigatorKey,
      hideDeleteButton: true,
      onDeletePressed: () async {
        Future<void> deleteOperation() async {
          await ref
              .read(artworkTemplateRepositoryProvider)
              .delete(entityId, sessionId);
        }

        final (:success, :exception, :data) =
            await AsyncHandler.handleAsyncOperation(
          context,
          deleteOperation,
          successMessage: l10n.gen_saving_success,
          successNavigatorKey: navigatorKey,
          errorNavigatorKey: navigatorKey,
        );
        if (success) {
          ref.removeWindow(floatingWindowId);
        }
      },
      formKey: formKey,
      meta: meta,
      floatingWindowId: floatingWindowId,
      onSavePressed: onSavePressed,
      stateProvider: artworkTemplateStateProvider.call(entityId, sessionId),
    );
  }
}

class _Body extends HookConsumerWidget {
  const _Body({
    required this.stateNotifier,
    required this.initialEntity,
    required this.readOnly,
    required this.floatingWindowId,
    required this.navigatorKey,
    required this.sessionId,
    required this.floatingWindowFocus,
    required this.customerId,
  });
  final ArtworkTemplateState stateNotifier;
  final ArtworkTemplate initialEntity;
  final bool readOnly;
  final String? floatingWindowId;
  final GlobalKey<NavigatorState> navigatorKey;
  final String sessionId;
  final FocusNode floatingWindowFocus;
  final int? customerId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;
    return ScrollableCardItem.constrained(
      builder: (context, constraints) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TwoColumnWrap(
              builder: (labelPosition, childWidth) {
                return [
                  NextCardFormField.text(
                    initialText: initialEntity.description,
                    labelPosition: NextCardFormFieldLabelPosition.left,
                    validationGroup: null,
                    validator: ArtworkTemplateFields.fromEnum(
                      ArtworkTemplateField.description,
                    ).validator(l10n, ppL10n),
                    onChanged: stateNotifier.updateDescription,
                    label: l10n.gen_description,
                    focusOrder: 1,
                    readOnly: readOnly,
                  ),
                  const SizedBox(),
                ];
              },
              width: constraints.maxWidth,
            ),
            const CardSectionDivider(),
            ArtworkColorsTable(
              floatingWindowId: floatingWindowId!,
              customerId: customerId,
              onUpdateCustomText: stateNotifier.updateColorCustomText,
              onCopy: stateNotifier.copyColor,
              onMoveUp: stateNotifier.moveColorUp,
              onMoveDown: stateNotifier.moveColorDown,
              dataProvider: watchArtworkTemplateColorsProvider(
                initialEntity.meta.id!,
                sessionId,
              ),
              onAddColor: stateNotifier.addBlankColor,
              onSelectPrintProcess: stateNotifier.updateColorPrintProcess,
              onUpdateScreenLineature: stateNotifier.updateColorScreenLineature,
              onUpdateScreenAngle: stateNotifier.updateColorScreenAngle,
              onUpdateScreenPointForm: stateNotifier.updateColorScreenPointForm,
              onUpdateBoost: stateNotifier.updateColorBoost,
              onDelete: stateNotifier.deleteColor,
              onUpdateColorName: stateNotifier.updateColorName,
              onResetColorName: stateNotifier.resetColorName,
              onSelectColorSpecType: stateNotifier.updateColorSpecType,
              onSelectColorType: stateNotifier.updateColorType,
              onSelectVerarbeitungsEbene:
                  stateNotifier.updateColorVerarbeitungsEbene,
              readOnly: readOnly,
              navigatorKey: navigatorKey,
              sessionId: sessionId,
              floatingWindowFocus: floatingWindowFocus,
              componentIdentifier:
                  ComponentIdentifier.artworkTemplateCardColorsTable,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: FocusTraversalGroup(
                    child: ArtworkLayerTable(
                      dataProvider: watchArtworkTemplateLayersProvider(
                        initialEntity.meta.id!,
                        sessionId,
                      ),
                      onAddLayer: stateNotifier.addBlankLayer,
                      onMoveUp: stateNotifier.moveLayerUp,
                      onMoveDown: stateNotifier.moveLayerDown,
                      onDelete: stateNotifier.deleteLayer,
                      onUpdateName: stateNotifier.updateLayerName,
                      onSelectLayerType: stateNotifier.updateLayerType,
                      onUpdatePrintable: stateNotifier.updateLayerPrintable,
                      onUpdateLocked: stateNotifier.updateLayerLocked,
                      readOnly: readOnly,
                      floatingWindowId: floatingWindowId,
                      navigatorKey: navigatorKey,
                      sessionId: sessionId,
                      floatingWindowFocus: floatingWindowFocus,
                      componentIdentifier:
                          ComponentIdentifier.artworkTemplateCardLayerTable,
                    ),
                  ),
                ),
                const SizedBox(width: UiConstants.defaultPadding * 3),
                Expanded(
                  child: ArtworkTrappingAndBleed(
                    initialBleed: initialEntity.anschnitt,
                    initialTrapping: initialEntity.trapping,
                    readOnly: readOnly,
                    width: (constraints.maxWidth / 2) -
                        ((UiConstants.defaultPadding * 3) / 2),
                    onBleedChanged: stateNotifier.updateAnschnitt,
                    onTrappingNormalChanged: stateNotifier.updateTrappingNormal,
                    onTrappingBlackChanged: stateNotifier.updateTrappingBlack,
                    onTrappingBilderChanged: stateNotifier.updateTrappingBilder,
                    onTrappingSonderfarbenChanged:
                        stateNotifier.updateTrappingSonderfarben,
                    onTrappingRueckzugChanged:
                        stateNotifier.updateTrappingRueckzug,
                    identifier:
                        ComponentIdentifier.artworkTemplateCardTrappingAndBleed,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
