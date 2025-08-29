import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork_template/logic/artwork_template_pre_selection_state.dart';
import 'package:elbdesk_prepress/src/artwork_template/logic/artwork_template_provider.dart';
import 'package:elbdesk_prepress/src/artwork_template/models/artwork_template_pre_selection.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Artwork Template Pre Selection Card
///
/// A card that displays the pre selection of an artwork template
/// The pre selection is a part of the template. It is the first step
/// of selecting a template.
///
class ArtworkTemplatePreSelectionCard extends HookConsumerWidget {
  const ArtworkTemplatePreSelectionCard({
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

    final onSave = useCallback<Future<ArtworkTemplatePreSelection?> Function()>(
      () async {
        final entity = ref
            .read(
              artworkTemplatePreSelectionStateProvider(
                entityIdNotifier.value,
                sessionId,
              ),
            )
            .requireValue;

        if (entityIdNotifier.value == 0) {
          final newEntity = await ref
              .read(artworkTemplatePreSelectionRepositoryProvider)
              .createAndReturnEntity(
                entity: entity,
                release: true,
                sessionId: sessionId,
              );
          entityIdNotifier.value = newEntity.id ?? 0;
          preSelectionController.text = newEntity.description;
          preSelectionIdNotifier.value = newEntity.id;
          return newEntity;
        } else {
          final updatedEntity = await ref
              .read(artworkTemplatePreSelectionRepositoryProvider)
              .update(
                entity: entity,
                release: false,
                sessionId: sessionId,
              );
          preSelectionController.text = updatedEntity.description;
          preSelectionIdNotifier.value = updatedEntity.id;
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
        showErrorOverlayOnFieldError: true,
        fn: () {
          final field = Parser.enumFromString(
            ArtworkTemplatePreSelectionField.values,
            exception.field,
          );

          if (field == null) return;
          if (field == ArtworkTemplatePreSelectionField.description) {
            codeErrorNotifier.value = l10n.exception_record_already_exists;
          }
        },
        showErrorOverlayOnGeneralError: true,
      );
    }

    final nullaValueNotifier =
        useValueNotifier<ArtworkTemplatePreSelection?>(null);
    return EntityInWindowCard<ArtworkTemplatePreSelection>(
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
        initialEntity: ArtworkTemplatePreSelection.initial().copyWith(
          customerId: customerId,
        ),
      ),
      parentNavigatorKey: navigatorKey,
      floatingWindowId: floatingWindowId,
      invalidateEntityState: (id, sessionId) async {
        ref.invalidate(
          artworkTemplatePreSelectionStateProvider(id, sessionId),
        );
      },
      formKey: formKey,
      stateProvider: artworkTemplatePreSelectionStateProvider.call,
      streamDataProvider: ({
        required sessionId,
        required dataId,
      }) =>
          watchArtworkTemplatePreSelectionProvider(
        sessionId: sessionId,
        id: dataId,
      ),
      entityId: entityIdNotifier.value,
      stateRefetchWithLock: (entityId, sessionId) async {
        await ref
            .read(
              artworkTemplatePreSelectionStateProvider(
                entityId,
                sessionId,
              ).notifier,
            )
            .refetchWithLock();
      },
      stateSaveUnlockRefetch: (editingSessionId, entityId, navigatorKey) async {
        await ref
            .read(
              artworkTemplatePreSelectionStateProvider(
                entityId,
                editingSessionId,
              ).notifier,
            )
            .saveAndUnlockAndRefetch();
      },
      stateRefetchWithoutLock: (id, sessionId) => ref
          .read(
            artworkTemplatePreSelectionStateProvider(
              id,
              sessionId,
            ).notifier,
          )
          .refetchWithoutLock(),
      tableType: TableType.artworkTemplatePreSelection.name,
      childBuilder: ({
        required int entityId,
        required String sessionId,
        required ValueNotifier<int> selectedNavigationIndexNotifier,
        required GlobalKey<NavigatorState> navigatorKey,
        required bool readOnly,
        required ArtworkTemplatePreSelection initialEntity,
        required DataMeta meta,
        required ValueNotifier<ArtworkTemplatePreSelection?>
            savedOrInitialEntity,
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
  final ArtworkTemplatePreSelection initialEntity;
  final Future<ArtworkTemplatePreSelection?> Function() onSave;
  final void Function(ElbException?)? onSaveError;
  final ValueNotifier<bool> isSavingNotifier;
  final ValueNotifier<String?> codeErrorNotifier;
  final int? customerId;
  final ValueNotifier<ArtworkTemplatePreSelection?> savedOrInitialEntity;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    final stateNotifier = ref.watch(
      artworkTemplatePreSelectionStateProvider(
        entityId,
        sessionId,
      ).notifier,
    );

    final descriptionFocus = useFocusNode();
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
              EntityInWindowCardFooter<ArtworkTemplatePreSelection>(
                stateProvider: artworkTemplatePreSelectionStateProvider(
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
