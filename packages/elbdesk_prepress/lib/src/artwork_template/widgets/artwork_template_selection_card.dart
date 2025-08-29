import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork_template/logic/artwork_template_provider.dart';
import 'package:elbdesk_prepress/src/artwork_template/logic/artwork_template_selection_state.dart';
import 'package:elbdesk_prepress/src/artwork_template/models/artwork_template_selection.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Artwork Template Selection Card
///
/// A card that displays the selection of an artwork template
///
/// The Selection is the second step of selecting a template
///
class ArtworkTemplateSelectionCard extends HookConsumerWidget {
  const ArtworkTemplateSelectionCard({
    required this.floatingWindowId,
    required this.entityId,
    required this.navigatorKey,
    required this.floatingWindowFocus,
    required this.artworkTemplatePreSelectionId,
    required this.selectionController,
    required this.selectionIdNotifier,
    super.key,
  });
  final String floatingWindowId;
  final int? entityId;
  final GlobalKey<NavigatorState> navigatorKey;
  final FocusNode floatingWindowFocus;
  final TextEditingController selectionController;
  final ValueNotifier<int?> selectionIdNotifier;

  final int artworkTemplatePreSelectionId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useFormKey();
    final entityIdNotifier = useState<int>(entityId ?? 0);
    final sessionId = useUuid();
    final l10n = context.l10n;
    final isSavingNotifier = useValueNotifier<bool>(false);
    final codeErrorNotifier = useValueNotifier<String?>(null);

    final onSave = useCallback<Future<ArtworkTemplateSelection?> Function()>(
      () async {
        final entity = ref
            .read(
              artworkTemplateSelectionStateProvider(
                entityIdNotifier.value,
                sessionId,
              ),
            )
            .requireValue;

        if (entityIdNotifier.value == 0) {
          final newEntity = await ref
              .read(artworkTemplateSelectionRepositoryProvider)
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
              await ref.read(artworkTemplateSelectionRepositoryProvider).update(
                    entity: entity,
                    release: false,
                    sessionId: sessionId,
                  );

          selectionIdNotifier.value = updatedEntity.id;
          selectionController.text = updatedEntity.description;

          return updatedEntity;
        }
        // ref.invalidate(fetchArtworkPreSelectionsProvider(customerId));
        // return null;
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
            ArtworkTemplateSelectionField.values,
            exception.field,
          );

          if (field == null) return;

          if (field == ArtworkTemplateSelectionField.description) {
            codeErrorNotifier.value = l10n.exception_record_already_exists;
          }
        },
      );
    }

    final nullaValueNotifier =
        useValueNotifier<ArtworkTemplateSelection?>(null);
    return EntityInWindowCard<ArtworkTemplateSelection>(
      onSave: onSave,
      onSaveError: onSaveError,
      isSavingNotifier: isSavingNotifier,
      sessionId: sessionId,
      floatingWindowFocus: floatingWindowFocus,
      cardBody: _CardBody(
        savedOrInitialEntity: nullaValueNotifier,
        onSaveError: onSaveError,
        artworkTemplatePreSelectionId: artworkTemplatePreSelectionId,
        onSave: onSave,
        isSavingNotifier: isSavingNotifier,
        codeErrorNotifier: codeErrorNotifier,
        navigatorKey: navigatorKey,
        formKey: formKey,
        entityIdNotifier: entityIdNotifier,
        readOnly: false,
        entityId: entityIdNotifier.value,
        sessionId: sessionId,
        initialEntity: ArtworkTemplateSelection.initial().copyWith(
          artworkTemplatePreSelectionId: artworkTemplatePreSelectionId,
        ),
      ),
      parentNavigatorKey: navigatorKey,
      floatingWindowId: floatingWindowId,
      invalidateEntityState: (id, sessionId) async {
        ref.invalidate(
          artworkTemplateSelectionStateProvider(id, sessionId),
        );
      },
      formKey: formKey,
      stateProvider: artworkTemplateSelectionStateProvider.call,
      streamDataProvider: ({
        required sessionId,
        required dataId,
      }) =>
          watchArtworkTemplateSelectionProvider(
        sessionId: sessionId,
        id: dataId,
      ),
      entityId: entityIdNotifier.value,
      stateRefetchWithLock: (entityId, sessionId) async {
        await ref
            .read(
              artworkTemplateSelectionStateProvider(
                entityId,
                sessionId,
              ).notifier,
            )
            .refetchWithLock();
      },
      stateSaveUnlockRefetch: (editingSessionId, entityId, navigatorKey) async {
        await ref
            .read(
              artworkTemplateSelectionStateProvider(
                entityId,
                editingSessionId,
              ).notifier,
            )
            .saveAndUnlockAndRefetch();
      },
      stateRefetchWithoutLock: (id, sessionId) => ref
          .read(
            artworkTemplateSelectionStateProvider(
              id,
              sessionId,
            ).notifier,
          )
          .refetchWithoutLock(),
      tableType: TableType.artworkTemplateSelection.name,
      childBuilder: ({
        required int entityId,
        required String sessionId,
        required ValueNotifier<int> selectedNavigationIndexNotifier,
        required GlobalKey<NavigatorState> navigatorKey,
        required bool readOnly,
        required DataMeta meta,
        required ArtworkTemplateSelection initialEntity,
        required ValueNotifier<ArtworkTemplateSelection?> savedOrInitialEntity,
      }) {
        return _CardBody(
          onSaveError: onSaveError,
          sessionId: sessionId,
          navigatorKey: navigatorKey,
          formKey: formKey,
          savedOrInitialEntity: savedOrInitialEntity,
          readOnly: readOnly,
          entityId: entityId,
          artworkTemplatePreSelectionId: artworkTemplatePreSelectionId,
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
    required this.artworkTemplatePreSelectionId,
    required this.onSaveError,
    required this.savedOrInitialEntity,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final String sessionId;
  final GlobalKey<FormState> formKey;
  final bool readOnly;
  final int entityId;
  final ValueNotifier<int?> entityIdNotifier;
  final ArtworkTemplateSelection initialEntity;
  final Future<ArtworkTemplateSelection?> Function() onSave;
  final ValueNotifier<bool> isSavingNotifier;
  final ValueNotifier<String?> codeErrorNotifier;
  final int artworkTemplatePreSelectionId;
  final void Function(ElbException?) onSaveError;
  final ValueNotifier<ArtworkTemplateSelection?> savedOrInitialEntity;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    final stateNotifier = ref.watch(
      artworkTemplateSelectionStateProvider(
        entityId,
        sessionId,
      ).notifier,
    );

    final descriptionFocus = useFocusNode();
    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          stateNotifier.updateArtworkTemplatePreSelectionId(
            artworkTemplatePreSelectionId,
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
              TwoColumnWrap(
                width: constraints.maxWidth,
                builder: (labelPosition, childWidth) {
                  return [
                    NextCardFormField.text(
                      label: l10n.gen_description,
                      validationGroup: null,
                      readOnly: readOnly,
                      focusNode: descriptionFocus,
                      initialText: initialEntity.description,
                      labelPosition: labelPosition,
                      onClear: (p0) {
                        stateNotifier.updateDescription('');
                      },
                      onChanged: stateNotifier.updateDescription,
                      focusOrder: 1,
                      validator: (v) => null,
                    ),
                    const SizedBox.shrink(),
                  ];
                },
              ),
              EntityInWindowCardFooter<ArtworkTemplateSelection>(
                stateProvider: artworkTemplateSelectionStateProvider(
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
