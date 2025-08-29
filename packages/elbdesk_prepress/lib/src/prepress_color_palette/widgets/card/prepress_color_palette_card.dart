import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/prepress_color_palette/logic/prepress_color_palette_state.dart';
import 'package:elbdesk_prepress/src/prepress_color_palette/widgets/card/prepress_color_palette_card_colors_page.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

/// Floating Sales Order Item Card
///
/// This card displays the information of a Sales Order Item
class PrepressColorPaletteCard extends HookConsumerWidget {
  /// Constructor
  const PrepressColorPaletteCard({
    required this.floatingWindowId,
    required this.tableSessionId,
    required this.colorPaletteId,
    required this.floatingWindowFocus,
    required this.customerId,
    required this.floatingWindowType,
    super.key,
  });

  /// The id of the floating window
  final String floatingWindowId;

  /// The session id of the table
  final String? tableSessionId;

  final int? colorPaletteId;

  /// The navigator key

  /// The focus node for the floating window
  final FocusNode? floatingWindowFocus;

  /// The id of the customer
  final int? customerId;

  /// The type of the floating window
  final String floatingWindowType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ppL10n = context.prepressL10n;
    final formKey = useFormKey();

    return EntityCard<PrepressColorPalette>(
      floatingWindowType: floatingWindowType,
      floatingWindowFocus: floatingWindowFocus,
      formKey: formKey,
      ignoreChangesOnSave: true,
      onSave: null,
      invalidateEntityState: (entityId, sessionId) async {
        ref.invalidate(
          prepressColorPaletteStateProvider(entityId, sessionId),
        );
      },
      stateRefetchWithoutLock: (entityId, sessionId) async {
        await ref
            .read(
              prepressColorPaletteStateProvider(entityId, sessionId).notifier,
            )
            .refetchWithoutLock();
      },
      streamDataProvider: ({
        required sessionId,
        required dataId,
      }) =>
          watchPrepressColorPaletteProvider(
        sessionId: sessionId,
        colorPaletteId: dataId,
      ),
      tableType: TableType.prepressColorPalette.name,
      stateSaveUnlockRefetch: (editingSessionId, dataId, navigatorKey) async {
        await ref
            .read(
              prepressColorPaletteStateProvider(
                dataId,
                editingSessionId,
              ).notifier,
            )
            .saveAndUnlockAndRefetch();
      },
      entityId: colorPaletteId,
      stateRefetchWithLock: (entityId, sessionId) => ref
          .read(
            prepressColorPaletteStateProvider(entityId, sessionId).notifier,
          )
          .refetchWithLock(),
      floatingWindowId: floatingWindowId,
      stateProvider: prepressColorPaletteStateProvider.call,
      createEntity: (sessionId) =>
          ref.read(prepressColorPaletteRepositoryProvider).create(
                sessionId: sessionId,
                customerId: customerId,
              ),
      getTitle: (entity) => entity.paletteName,
      tableIcon: (entityId, sessionId) => AppIcons.color_palette,
      tablePrefix: (entityId, sessionId) => ppL10n.color_palette_singular,
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
        return FloatingCardBody(
          floatingWindowType: FloatingWindowType.colorPalette.name,
          isFirstRun: isFirstRender.value,
          floatingWindowId: floatingWindowId,
          navigatorKey: navigatorKey,
          formKey: formKey,
          initialNavigationIndexNotifier: selectedNavIndexRef,
          footer: null,
          navigationGroups: [
            CardNavigationGroup(
              items: [
                CardNavigationItem(
                  icon: AppIcons.color,
                  label: ppL10n.color_singular,
                ),
              ],
            ),
          ],
          children: [
            CardBodyItem(
              keepAlive: true,
              loadLazy: false,
              child: CardTablePadding(
                child: PrepressColorPaletteCardColorsPage(
                  readOnly: readOnly,
                  stateNotifier: ref.read(
                    prepressColorPaletteStateProvider(entityId, sessionId)
                        .notifier,
                  ),
                  initialEntity: savedOrInitialEntity.value!,
                  sessionId: sessionId,
                  validationGroupId: formKey.toString(),
                  navigatorKey: navigatorKey,
                  floatingWindowId: floatingWindowId,
                  floatingWindowFocus: floatingWindowFocus!,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
