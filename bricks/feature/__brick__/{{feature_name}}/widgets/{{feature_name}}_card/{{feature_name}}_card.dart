import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import '../../logic/{{#snakeCase}}{{feature_name}}{{/snakeCase}}_state.dart';
import '../../models/{{#snakeCase}}{{feature_name}}{{/snakeCase}}.dart';
import '../../repositories/{{feature_name}}_repository.dart';
import '../../logic/{{#snakeCase}}{{feature_name}}{{/snakeCase}}_provider.dart';
import '../../config/floating_{{feature_name}}_window_data.dart';
import '../../widgets/{{#snakeCase}}{{feature_name}}{{/snakeCase}}_card/{{#snakeCase}}{{feature_name}}{{/snakeCase}}_card.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
// ignore: no_flutter_material_import
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'pages/{{#snakeCase}}{{feature_name}}{{/snakeCase}}_card_main_page.dart';

/// {{#pascalCase}}{{feature_name}}{{/pascalCase}} Card
/// 
/// This is the card that displays the {{#pascalCase}}{{feature_name}}{{/pascalCase}} entity
///
/// Usually displayed in the corresponding FloatingWindow
class {{#pascalCase}}{{feature_name}}{{/pascalCase}}Card extends HookConsumerWidget {
  /// {{#pascalCase}}{{feature_name}}{{/pascalCase}}Card constructor
  const {{#pascalCase}}{{feature_name}}{{/pascalCase}}Card({
    required this.floatingWindowId,
    required this.entityId,
    required this.customerId,
    required this.floatingWindowFocus,
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

  final int? initialNoteId;
  final int? initialNoteParentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useFormKey();
    final l10n = context.l10n;

    /// On save pressed
    /// 
    /// This method is triggered through the Footer of the card or the
    /// save intent (cmd + s)
    Future<{{#pascalCase}}{{feature_name}}{{/pascalCase}}> onSavePressed(
      int entityId,
      String sessionId,
    ) async {

      // Fetch current state
      final data = ref
          .read({{#camelCase}}{{feature_name}}{{/camelCase}}StateProvider(entityId, sessionId))
          .requireValue;

      // Update database
      final updated{{#pascalCase}}{{feature_name}}{{/pascalCase}} =
          await ref.read({{#camelCase}}{{feature_name}}{{/camelCase}}RepositoryProvider).update(
                entity: data,
                release: false,
                sessionId: sessionId,
              );

      // Update the meta data after save 
      // (Necessary for proper state management)
      ref
          .read({{#camelCase}}{{feature_name}}{{/camelCase}}StateProvider(entityId, sessionId).notifier)
          .updateMetaAfterSave();

      // Set Recent window
      ref.read(recentWindowsProvider.notifier).updateEntityWindow(
            RecentWindow(
              type: FloatingWindowType.{{#camelCase}}{{feature_name}}{{/camelCase}},
              entityId: entityId,
              label: '${l10n.{{#camelCase}}{{feature_name}}{{/camelCase}}_singular} '
                  '${updated{{#pascalCase}}{{feature_name}}{{/pascalCase}}.meta.id}', 
              additionalData: {{#pascalCase}}{{feature_name}}{{/pascalCase}}AdditionalData(
                name: data.name,
                description: data.description,
              ).toJson(),
            ),
          );


      return updated{{#pascalCase}}{{feature_name}}{{/pascalCase}};
    }

    return EntityCard<{{#pascalCase}}{{feature_name}}{{/pascalCase}}>(
      floatingWindowFocus: floatingWindowFocus,
      formKey: formKey,
      onSave: onSavePressed,
      ribbonsBuilder: null,
      showTitleBar: true,
      invalidateEntityState: (entityId, sessionId) async {
        ref.invalidate(
          {{#camelCase}}{{feature_name}}{{/camelCase}}StateProvider(entityId, sessionId),
        );
      },
      stateRefetchWithoutLock: (entityId, sessionId) async {
        await ref
            .read({{#camelCase}}{{feature_name}}{{/camelCase}}StateProvider(entityId, sessionId).notifier)
            .refetchWithoutLock();
      },
      streamDataProvider: ({
        required sessionId,
        required dataId,
      }) =>
          watch{{#pascalCase}}{{feature_name}}{{/pascalCase}}Provider(
        sessionId: sessionId,
        entityId: dataId,
      ),
      tableType: TableType.{{#camelCase}}{{feature_name}}{{/camelCase}},
      stateSaveUnlockRefetch: (editingSessionId, dataId, navigatorKey) async {
        await ref
            .read(
              {{#camelCase}}{{feature_name}}{{/camelCase}}StateProvider(dataId, editingSessionId).notifier,
            )
            .saveAndUnlockAndRefetch();
      },
      entityId: entityId,
      stateRefetchWithLock: (entityId, sessionId) => ref
          .read({{#camelCase}}{{feature_name}}{{/camelCase}}StateProvider(entityId, sessionId).notifier)
          .refetchWithLock(),
      floatingWindowId: floatingWindowId,
      stateProvider: {{#camelCase}}{{feature_name}}{{/camelCase}}StateProvider.call,
      createEntity: (sessionId) => throw UnimplementedError(),
      getTitle: (entity) => '${l10n.{{#camelCase}}{{feature_name}}{{/camelCase}}_singular}: ${entity.name}',
      tableIcon: (entityId, sessionId) => AppIcons.{{#camelCase}}{{feature_name}}{{/camelCase}},
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
          {{#camelCase}}{{feature_name}}{{/camelCase}}StateProvider(entityId, sessionId).notifier,
        );

        useEffect(
          () {
            if (!isFirstRender.value) return;
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              ref.read(recentWindowsProvider.notifier).insertEntityWindow(
                    RecentWindow(
                      type: FloatingWindowType.{{#camelCase}}{{feature_name}}{{/camelCase}},
                      entityId: entityId,
                      label: l10n.{{#camelCase}}{{feature_name}}{{/camelCase}}_singular,
                      additionalData: {{#pascalCase}}{{feature_name}}{{/pascalCase}}AdditionalData(
                        name: initialEntity.name,
                        description: initialEntity.description,
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
          noteEntity: TableType.{{#camelCase}}{{feature_name}}{{/camelCase}},
          floatingWindowId: floatingWindowId,
          navigatorKey: navigatorKey,
          showShareButton: true,
          formKey: formKey,
          floatingWindowType: FloatingWindowType.{{#camelCase}}{{feature_name}}{{/camelCase}},
          initialNavigationIndexNotifier: selectedNavIndexRef,
          footer: EntityCardFooter<{{#pascalCase}}{{feature_name}}{{/pascalCase}}>(
            stateProvider:
                {{#camelCase}}{{feature_name}}{{/camelCase}}StateProvider.call(entityId, sessionId),
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
                  label: l10n.crm_general,
                  showErrorBadge: false,
                ),
              ],
            ),
          ],
          childrenBuilder: (context, constraints) => [
            CardBodyItem(
              child: _{{#pascalCase}}{{feature_name}}{{/pascalCase}}CardMainPage(
                entityId: entityId,
                customerId: customerId,
                floatingWindowFocus: floatingWindowFocus,
                stateNotifier: stateNotifier,
                initialEntity: initialEntity,
                readOnly: readOnly,
                sessionId: sessionId,
                floatingWindowId: floatingWindowId,
                navigatorKey: navigatorKey,
              ),
            ),
          ],
        );
      },
    );
  }
} 
