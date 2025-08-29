import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork_color/config/artwork_color_fields.dart';
import 'package:elbdesk_prepress/src/artwork_color/logic/artwork_color_state.dart';
import 'package:elbdesk_prepress/src/artwork_color/widgets/prepress_color_card_general_view.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

/// Floating CoeColor Card
///
/// This card displays the information of a CoeColor
class PrepressColorCard extends HookConsumerWidget {
  /// Constructor
  const PrepressColorCard({
    required this.floatingWindowId,
    required this.tableSessionId,
    required this.colorId,
    required this.colorPaletteId,
    required this.floatingWindowFocus,
    required this.floatingWindowType,
    this.navigatorKey,
    super.key,
  });

  /// The id of the floating window
  final String floatingWindowId;

  /// The session id of the table
  final String? tableSessionId;

  /// The id of the color
  final int? colorId;

  /// The id of the color book that the color belongs to
  final int colorPaletteId;

  /// The navigator key
  final GlobalKey<NavigatorState>? navigatorKey;

  /// The focus node for the floating window
  final FocusNode? floatingWindowFocus;

  /// The type of the floating window
  final String floatingWindowType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final formKey = useFormKey();
    final validationGroupId = useUuid();
    final ppL10n = context.prepressL10n;

    Future<ArtworkColor> onSavePressed(
      int entityId,
      String sessionId,
    ) async {
      final color =
          ref.read(artworkColorStateProvider(entityId, sessionId)).requireValue;

      await ref.read(artworkColorRepositoryProvider).update(
            entity: color,
            release: false,
            sessionId: sessionId,
          );
      ref
          .read(artworkColorStateProvider(entityId, sessionId).notifier)
          .updateMetaAfterSave();
      ref.invalidate(findArtworkColorsProvider);
      return color;
    }

    return EntityCard<ArtworkColor>(
      floatingWindowType: floatingWindowType,
      floatingWindowFocus: floatingWindowFocus,
      formKey: formKey,
      onSave: (entityId, sessionId, navigatorKey) =>
          onSavePressed(entityId, sessionId),
      invalidateEntityState: (entityId, sessionId) async {
        ref.invalidate(
          artworkColorStateProvider(entityId, sessionId),
        );
      },
      stateRefetchWithoutLock: (entityId, sessionId) async {
        await ref
            .read(artworkColorStateProvider(entityId, sessionId).notifier)
            .refetchWithoutLock();
      },
      streamDataProvider: ({
        required sessionId,
        required dataId,
      }) =>
          watchArtworkColorProvider(
        sessionId: sessionId,
        colorId: dataId,
      ),
      tableType: TableType.artworkColor.name,
      stateSaveUnlockRefetch: (editingSessionId, dataId, navigatorKey) async {
        await ref
            .read(artworkColorStateProvider(dataId, editingSessionId).notifier)
            .saveAndUnlockAndRefetch();
      },
      entityId: colorId,
      stateRefetchWithLock: (entityId, sessionId) => ref
          .read(artworkColorStateProvider(entityId, sessionId).notifier)
          .refetchWithLock(),
      floatingWindowId: floatingWindowId,
      stateProvider: artworkColorStateProvider.call,
      createEntity: (sessionId) => ref
          .read(artworkColorRepositoryProvider)
          .create(sessionId: sessionId, colorPaletteId: colorPaletteId),
      getTitle: (entity) => entity.colorName,
      tableIcon: (entityId, sessionId) => AppIcons.color,
      tablePrefix: (entityId, sessionId) => ppL10n.color_singular,
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
            ref.watch(artworkColorStateProvider(entityId, sessionId).notifier);

        return FloatingCardBody(
          floatingWindowType: FloatingWindowType.color.name,
          isFirstRun: isFirstRender.value,
          floatingWindowId: floatingWindowId,
          navigatorKey: navigatorKey,
          formKey: formKey,
          initialNavigationIndexNotifier: selectedNavIndexRef,
          footer: _Footer(
            savedOrInitialEntity: savedOrInitialEntity,
            isSaving: isSaving,
            onSavePressed: onSavePressed,
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
                  label: ppL10n.color_general,
                  showErrorBadge: ref.watch(
                    validationGroupProvider(validationGroupId).select(
                      (value) => value.isNotEmpty,
                    ),
                  ),
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
              child: _Body(
                entityId: entityId,
                sessionId: sessionId,
                navigatorKey: navigatorKey,
                readOnly: readOnly,
                stateNotifier: stateNotifier,
                initialEntity: initialEntity,
                validationGroupId: validationGroupId,
              ),
            ),
            CardBodyItem(
              keepAlive: false,
              child: EntityLogTable(
                fieldTitle: (log) => ArtworkColorFields.fromFieldKey(
                  log.field,
                ).readable(l10n, ppL10n),
                entityId: entityId,
                tableType: TableType.artworkColor,
                navigatorKey: navigatorKey,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _Footer extends HookConsumerWidget {
  /// Constructor
  const _Footer({
    required this.floatingWindowId,
    required this.formKey,
    required this.readOnly,
    required this.navigatorKey,
    required this.entityId,
    required this.sessionId,
    required this.meta,
    required this.onSavePressed,
    required this.isSaving,
    required this.savedOrInitialEntity,
  });

  /// The id of the floating window
  final String floatingWindowId;

  /// Form key to validate the card
  final GlobalKey<FormState> formKey;

  /// Wether the card is read only
  final bool readOnly;

  /// The navigator key
  final GlobalKey<NavigatorState> navigatorKey;

  /// The id of the entity
  final int entityId;

  /// The sessionId of the color card
  final String sessionId;

  /// The meta data of the card
  final DataMeta meta;

  /// The value notifier for the saving state
  final ValueNotifier<bool> isSaving;

  /// The function to save the color
  final Future<ArtworkColor> Function(int entityId, String sessionId)
      onSavePressed;
  final ObjectRef<ArtworkColor?> savedOrInitialEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return EntityCardFooter<ArtworkColor>(
      onSaveError: null,
      savedOrInitialEntity: savedOrInitialEntity,
      stateProvider: artworkColorStateProvider.call(entityId, sessionId),
      isSavingNotifier: isSaving,
      readOnly: readOnly,
      navigatorKey: navigatorKey,
      hideDeleteButton: true,
      onDeletePressed: () async {
        Future<void> deleteOperation() async {
          await ref
              .read(artworkColorRepositoryProvider)
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
          ref.invalidate(findArtworkColorsProvider);
          ref.removeWindow(floatingWindowId);
        }
      },
      formKey: formKey,
      meta: meta,
      floatingWindowId: floatingWindowId,
      onSavePressed: () => onSavePressed(
        entityId,
        sessionId,
      ),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({
    required this.readOnly,
    required this.stateNotifier,
    required this.initialEntity,
    required this.validationGroupId,
    required this.entityId,
    required this.sessionId,
    required this.navigatorKey,
  });

  final bool readOnly;
  final ArtworkColorState stateNotifier;
  final ArtworkColor initialEntity;
  final String validationGroupId;
  final int entityId;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ppL10n = context.prepressL10n;
    final colorBookName = ref.watch(
      artworkColorStateProvider(entityId, sessionId).select(
        (value) => value.requireValue.colorPalette?.paletteName,
      ),
    );
    return ScrollableCardItem.constrained(
      builder: (context, constraints) {
        return Column(
          children: [
            CardSectionTitle(
              title: ppL10n.color_general,
              trailingWidgets: [
                AppText(colorBookName ?? ''),
              ],
            ),
            PrepressColorCardGeneralView(
              navigatorKey: navigatorKey,
              readOnly: readOnly,
              constraints: constraints,
              stateNotifier: stateNotifier,
              initialEntity: initialEntity,
              validationGroupId: validationGroupId,
              entityId: entityId,
              sessionId: sessionId,
            ),
          ],
        );
      },
    );
  }
}
