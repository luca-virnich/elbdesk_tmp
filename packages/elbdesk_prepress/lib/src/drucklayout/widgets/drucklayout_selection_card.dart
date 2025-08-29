import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';

/// Drucklayout Selection Card
///
/// A card that displays the selection of a drucklayout
///
/// The Selection is the second step of selecting a template
///
class DrucklayoutSelectionCard extends HookConsumerWidget {
  const DrucklayoutSelectionCard({
    required this.floatingWindowId,
    required this.entityId,
    required this.navigatorKey,
    required this.floatingWindowFocus,
    required this.drucklayoutPreSelectionId,
    required this.selectionController,
    required this.selectionIdNotifier,
    super.key,
  });
  final String floatingWindowId;
  final int? entityId;
  final GlobalKey<NavigatorState> navigatorKey;
  final FocusNode floatingWindowFocus;
  final int drucklayoutPreSelectionId;
  final TextEditingController selectionController;
  final ValueNotifier<int?> selectionIdNotifier;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useFormKey();
    final entityIdNotifier = useState<int>(entityId ?? 0);
    final sessionId = useUuid();
    final l10n = context.l10n;
    final isSavingNotifier = useValueNotifier<bool>(false);
    final codeErrorNotifier = useValueNotifier<String?>(null);

    final onSave = useCallback<Future<DrucklayoutSelection?> Function()>(
      () async {
        final entity = ref
            .read(
              drucklayoutSelectionStateProvider(
                entityIdNotifier.value,
                sessionId,
              ),
            )
            .requireValue;

        if (entityIdNotifier.value == 0) {
          final newEntity = await ref
              .read(drucklayoutSelectionRepositoryProvider)
              .createAndReturnEntity(
                entity: entity,
                release: true,
                sessionId: sessionId,
              );
          entityIdNotifier.value = newEntity.id ?? 0;
          selectionIdNotifier.value = newEntity.id;
          selectionController.text = newEntity.description;
          return newEntity;
        } else {
          final updatedEntity =
              await ref.read(drucklayoutSelectionRepositoryProvider).update(
                    entity: entity,
                    release: false,
                    sessionId: sessionId,
                  );
          selectionIdNotifier.value = updatedEntity.id;
          selectionController.text = updatedEntity.description;
          return updatedEntity;
        }
      },
      [],
    );

    void onSaveError(ElbException? exception) {
      if (exception == null) {
        codeErrorNotifier.value = null;
        return;
      }
      exception.onFieldException(
        context: context,
        navigatorKey: navigatorKey,
        showErrorOverlayOnGeneralError: true,
        showErrorOverlayOnFieldError: true,
        fn: () {
          final field = Parser.enumFromString(
            DrucklayoutSelectionField.values,
            exception.field,
          );

          if (field == null) return;

          if (field == DrucklayoutSelectionField.description) {
            codeErrorNotifier.value = l10n.exception_record_already_exists;
          }
        },
      );
    }

    final nullaValueNotifier = useValueNotifier<DrucklayoutSelection?>(null);

    return EntityInWindowCard<DrucklayoutSelection>(
      onSave: onSave,
      onSaveError: onSaveError,
      isSavingNotifier: isSavingNotifier,
      sessionId: sessionId,
      floatingWindowFocus: floatingWindowFocus,
      cardBody: _CardBody(
        savedOrInitialEntity: nullaValueNotifier,
        onSaveError: onSaveError,
        drucklayoutPreSelectionId: drucklayoutPreSelectionId,
        onSave: onSave,
        isSavingNotifier: isSavingNotifier,
        codeErrorNotifier: codeErrorNotifier,
        navigatorKey: navigatorKey,
        formKey: formKey,
        entityIdNotifier: entityIdNotifier,
        readOnly: false,
        entityId: entityIdNotifier.value,
        sessionId: sessionId,
        initialEntity: DrucklayoutSelection.initial().copyWith(
          drucklayoutPreSelectionId: drucklayoutPreSelectionId,
        ),
      ),
      parentNavigatorKey: navigatorKey,
      floatingWindowId: floatingWindowId,
      invalidateEntityState: (id, sessionId) async {
        ref.invalidate(
          drucklayoutSelectionStateProvider(id, sessionId),
        );
      },
      formKey: formKey,
      stateProvider: drucklayoutSelectionStateProvider.call,
      streamDataProvider: ({
        required sessionId,
        required dataId,
      }) =>
          watchDrucklayoutSelectionProvider(
        sessionId: sessionId,
        id: dataId,
      ),
      entityId: entityIdNotifier.value,
      stateRefetchWithLock: (entityId, sessionId) async {
        await ref
            .read(
              drucklayoutSelectionStateProvider(
                entityId,
                sessionId,
              ).notifier,
            )
            .refetchWithLock();
      },
      stateSaveUnlockRefetch: (editingSessionId, entityId, navigatorKey) async {
        await ref
            .read(
              drucklayoutSelectionStateProvider(
                entityId,
                editingSessionId,
              ).notifier,
            )
            .saveAndUnlockAndRefetch();
      },
      stateRefetchWithoutLock: (id, sessionId) => ref
          .read(
            drucklayoutSelectionStateProvider(
              id,
              sessionId,
            ).notifier,
          )
          .refetchWithoutLock(),
      tableType: TableType.drucklayoutSelection.name,
      childBuilder: ({
        required int entityId,
        required String sessionId,
        required ValueNotifier<int> selectedNavigationIndexNotifier,
        required GlobalKey<NavigatorState> navigatorKey,
        required bool readOnly,
        required DataMeta meta,
        required DrucklayoutSelection initialEntity,
        required ValueNotifier<DrucklayoutSelection?> savedOrInitialEntity,
      }) {
        useValueListenable(savedOrInitialEntity);
        return _CardBody(
          onSaveError: onSaveError,
          sessionId: sessionId,
          navigatorKey: navigatorKey,
          formKey: formKey,
          savedOrInitialEntity: savedOrInitialEntity,
          readOnly: readOnly,
          entityId: entityId,
          drucklayoutPreSelectionId: drucklayoutPreSelectionId,
          entityIdNotifier: entityIdNotifier,
          initialEntity: initialEntity,
          onSave: onSave,
          isSavingNotifier: isSavingNotifier,
          codeErrorNotifier: codeErrorNotifier,
        );
      },
    );
  }
}

class _CardBody extends HookConsumerWidget {
  const _CardBody({
    required this.navigatorKey,
    required this.sessionId,
    required this.formKey,
    required this.readOnly,
    required this.entityId,
    required this.entityIdNotifier,
    required this.initialEntity,
    required this.onSave,
    required this.isSavingNotifier,
    required this.codeErrorNotifier,
    required this.drucklayoutPreSelectionId,
    required this.onSaveError,
    required this.savedOrInitialEntity,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final String sessionId;
  final GlobalKey<FormState> formKey;
  final bool readOnly;
  final int entityId;
  final ValueNotifier<int?> entityIdNotifier;
  final DrucklayoutSelection initialEntity;
  final Future<DrucklayoutSelection?> Function() onSave;
  final ValueNotifier<bool> isSavingNotifier;
  final ValueNotifier<String?> codeErrorNotifier;
  final int drucklayoutPreSelectionId;
  final void Function(ElbException?) onSaveError;
  final ValueNotifier<DrucklayoutSelection?> savedOrInitialEntity;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ppL10n = context.prepressL10n;

    final stateNotifier = ref.watch(
      drucklayoutSelectionStateProvider(
        entityId,
        sessionId,
      ).notifier,
    );

    final descriptionFocus = useFocusNode();
    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          stateNotifier.updateDrucklayoutPreSelectionId(
            drucklayoutPreSelectionId,
          );
        });
        return null;
      },
      [],
    );

    useEffect(
      () {
        Future<void>.delayed(
          const Duration(
            milliseconds: FocusUtils.autofocusDelayMilliseconds,
          ),
        ).then((_) {
          if (context.mounted) {
            descriptionFocus.requestFocus();
          }
        });
        return null;
      },
      [],
    );

    useValueListenable(codeErrorNotifier);

    return Form(
      key: formKey,
      child: ScrollableCardItem.constrained(
        builder: (context, constraints) {
          return Column(
            children: [
              ElbTwoColumnWrap(
                width: constraints.maxWidth,
                readOnly: readOnly,
                validationGroupId: null,
                customL10n: ppL10n,
                columnLeft: [
                  // Description
                  ElbTwoColumnItem.text(
                    field: DrucklayoutFields.fromEnum(
                      DrucklayoutField.description,
                    ),
                    initialValue: initialEntity.description,
                    readOnly: readOnly,
                    onChanged: stateNotifier.updateDescription,
                  ),
                ],
                columnRight: const [],
              ),
              EntityInWindowCardFooter<DrucklayoutSelection>(
                stateProvider: drucklayoutSelectionStateProvider(
                  entityId,
                  sessionId,
                ),
                savedOrInitialEntity: savedOrInitialEntity,
                onSaveError: onSaveError,
                navigatorKey: navigatorKey,
                formKey: formKey,
                onSave: onSave,
                readOnly: readOnly,
                isSavingNotifier: isSavingNotifier,
              ),
            ],
          );
        },
      ),
    );
  }
}
