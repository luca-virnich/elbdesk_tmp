import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_prepress/src/drucklayout/logic/drucklayout_pre_selection_state.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';

/// Drucklayout Pre Selection Card
///
/// A card that displays the pre selection of a drucklayout
/// The pre selection is a part of the template. It is the first step
/// of selecting a template.
///
class DrucklayoutPreSelectionCard extends HookConsumerWidget {
  const DrucklayoutPreSelectionCard({
    required this.floatingWindowId,
    required this.entityId,
    required this.navigatorKey,
    required this.floatingWindowFocus,
    required this.customerId,
    required this.preSelectionController,
    required this.preSelectionIdNotifier,
    super.key,
  });
  final String floatingWindowId;
  final int? entityId;
  final GlobalKey<NavigatorState> navigatorKey;
  final FocusNode floatingWindowFocus;
  final int? customerId;
  final TextEditingController preSelectionController;
  final ValueNotifier<int?> preSelectionIdNotifier;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useFormKey();
    final entityIdNotifier = useState<int>(entityId ?? 0);
    final sessionId = useUuid();
    final l10n = context.l10n;
    final isSavingNotifier = useValueNotifier<bool>(false);
    final codeErrorNotifier = useValueNotifier<String?>(null);

    // On Save
    final onSave = useCallback<Future<DrucklayoutPreSelection?> Function()>(
      () async {
        final entity = ref
            .read(
              drucklayoutPreSelectionStateProvider(
                entityIdNotifier.value,
                sessionId,
              ),
            )
            .requireValue;

        if (entityIdNotifier.value == 0) {
          final newEntity = await ref
              .read(drucklayoutPreSelectionRepositoryProvider)
              .createAndReturnEntity(
                entity: entity,
                release: true,
                sessionId: sessionId,
              );
          entityIdNotifier.value = newEntity.id ?? 0;
          preSelectionIdNotifier.value = newEntity.id;
          preSelectionController.text = newEntity.description;
          return newEntity;
        } else {
          final updatedEntity =
              await ref.read(drucklayoutPreSelectionRepositoryProvider).update(
                    entity: entity,
                    release: false,
                    sessionId: sessionId,
                  );
          preSelectionIdNotifier.value = updatedEntity.id;
          preSelectionController.text = updatedEntity.description;
          return updatedEntity;
        }
      },
      [],
    );

    // On Save Error
    void onSaveError(ElbException? exception) {
      if (exception == null) {
        codeErrorNotifier.value = null;
        return;
      }
      exception.onFieldException(
        context: context,
        navigatorKey: navigatorKey,
        showErrorOverlayOnFieldError: true,
        fn: () {
          final field = Parser.enumFromString(
            DrucklayoutPreSelectionField.values,
            exception.field,
          );

          if (field == null) return;

          if (field == DrucklayoutPreSelectionField.description) {
            codeErrorNotifier.value = l10n.exception_record_already_exists;
          }
        },
        showErrorOverlayOnGeneralError: true,
      );
    }

    final nullaValueNotifier = useValueNotifier<DrucklayoutPreSelection?>(null);
    return EntityInWindowCard<DrucklayoutPreSelection>(
      onSave: onSave,
      onSaveError: onSaveError,
      isSavingNotifier: isSavingNotifier,
      sessionId: sessionId,
      floatingWindowFocus: floatingWindowFocus,
      cardBody: _CardBody(
        onSaveError: onSaveError,
        savedOrInitialEntity: nullaValueNotifier,
        customerId: customerId,
        onSave: onSave,
        isSavingNotifier: isSavingNotifier,
        codeErrorNotifier: codeErrorNotifier,
        navigatorKey: navigatorKey,
        formKey: formKey,
        entityIdNotifier: entityIdNotifier,
        readOnly: false,
        entityId: entityIdNotifier.value,
        sessionId: sessionId,
        initialEntity: DrucklayoutPreSelection.initial().copyWith(
          customerId: customerId,
        ),
      ),
      parentNavigatorKey: navigatorKey,
      floatingWindowId: floatingWindowId,
      invalidateEntityState: (id, sessionId) async {
        ref.invalidate(
          drucklayoutPreSelectionStateProvider(id, sessionId),
        );
      },
      formKey: formKey,
      stateProvider: drucklayoutPreSelectionStateProvider.call,
      streamDataProvider: ({
        required sessionId,
        required dataId,
      }) =>
          watchDrucklayoutPreSelectionProvider(
        sessionId: sessionId,
        id: dataId,
      ),
      entityId: entityIdNotifier.value,
      stateRefetchWithLock: (entityId, sessionId) async {
        await ref
            .read(
              drucklayoutPreSelectionStateProvider(
                entityId,
                sessionId,
              ).notifier,
            )
            .refetchWithLock();
      },
      stateSaveUnlockRefetch: (editingSessionId, entityId, navigatorKey) async {
        await ref
            .read(
              drucklayoutPreSelectionStateProvider(
                entityId,
                editingSessionId,
              ).notifier,
            )
            .saveAndUnlockAndRefetch();
      },
      stateRefetchWithoutLock: (id, sessionId) => ref
          .read(
            drucklayoutPreSelectionStateProvider(
              id,
              sessionId,
            ).notifier,
          )
          .refetchWithoutLock(),
      tableType: TableType.drucklayoutPreSelection.name,
      childBuilder: ({
        required int entityId,
        required String sessionId,
        required ValueNotifier<int> selectedNavigationIndexNotifier,
        required GlobalKey<NavigatorState> navigatorKey,
        required bool readOnly,
        required DrucklayoutPreSelection initialEntity,
        required DataMeta meta,
        required ValueNotifier<DrucklayoutPreSelection?> savedOrInitialEntity,
      }) {
        return _CardBody(
          onSaveError: onSaveError,
          savedOrInitialEntity: savedOrInitialEntity,
          sessionId: sessionId,
          navigatorKey: navigatorKey,
          formKey: formKey,
          readOnly: readOnly,
          entityId: entityId,
          customerId: customerId,
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
    required this.onSaveError,
    required this.entityId,
    required this.entityIdNotifier,
    required this.initialEntity,
    required this.onSave,
    required this.isSavingNotifier,
    required this.codeErrorNotifier,
    required this.customerId,
    required this.savedOrInitialEntity,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final String sessionId;
  final GlobalKey<FormState> formKey;
  final bool readOnly;
  final int entityId;
  final ValueNotifier<int?> entityIdNotifier;
  final DrucklayoutPreSelection initialEntity;
  final Future<DrucklayoutPreSelection?> Function() onSave;
  final void Function(ElbException?)? onSaveError;
  final ValueNotifier<bool> isSavingNotifier;
  final ValueNotifier<String?> codeErrorNotifier;
  final int? customerId;
  final ValueNotifier<DrucklayoutPreSelection?> savedOrInitialEntity;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ppL10n = context.prepressL10n;

    final stateNotifier = ref.watch(
      drucklayoutPreSelectionStateProvider(
        entityId,
        sessionId,
      ).notifier,
    );

    final descriptionFocus = useFocusNode();

    // customerId can be null if the pre selection is added for a global
    // drucklayout template. (Currently not supported, but technically possible)
    // In case a customerId is provided, the pre selection is added for a
    // customer. This adds the id to the pre selection state.
    useEffect(
      () {
        if (customerId != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            stateNotifier.updateCustomerId(customerId!);
          });
        }
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
                    onChanged: stateNotifier.updateDescription,
                    readOnly: readOnly,
                  ),
                ],
                columnRight: const [],
              ),
              EntityInWindowCardFooter<DrucklayoutPreSelection>(
                stateProvider: drucklayoutPreSelectionStateProvider(
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
