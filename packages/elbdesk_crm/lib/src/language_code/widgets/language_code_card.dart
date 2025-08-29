import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/language_code/config/language_code_fields.dart';
import 'package:elbdesk_crm/src/language_code/logic/language_code_provider.dart';
import 'package:elbdesk_crm/src/language_code/logic/language_code_state.dart';
import 'package:elbdesk_crm/src/language_code/models/language_code.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LanguageCodeCard extends HookConsumerWidget {
  const LanguageCodeCard({
    required this.floatingWindowId,
    required this.entityId,
    required this.navigatorKey,
    super.key,
  });
  final String floatingWindowId;
  final int? entityId;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useFormKey();
    final entityIdNotifier = useState<int>(entityId ?? 0);
    final sessionId = useUuid();
    final isSavingNotifier = useValueNotifier<bool>(false);
    final codeErrorNotifier = useValueNotifier<String?>(null);
    final nameErrorNotifier = useValueNotifier<String?>(null);

    final l10n = context.l10n;
    final onSave = useCallback<Future<LanguageCode?> Function()>(
      () async {
        final entity = ref
            .read(languageCodeStateProvider(entityIdNotifier.value, sessionId))
            .requireValue;

        if (entityIdNotifier.value == 0) {
          final newEntity = await ref
              .read(languageCodeRepositoryProvider)
              .createAndReturnEntity(
                entity: entity,
                release: true,
                sessionId: sessionId,
              );
          entityIdNotifier.value = newEntity.id ?? 0;
        } else {
          await ref.read(languageCodeRepositoryProvider).update(
                entity: entity,
                release: false,
                sessionId: sessionId,
              );

          ref
              .read(
                languageCodeStateProvider(entityIdNotifier.value, sessionId)
                    .notifier,
              )
              .updateMetaAfterSave();
        }
        ref.invalidate(findLanguageCodesProvider);

        return null;
      },
      [],
    );

    void onSaveError(ElbException? exception) {
      if (exception == null) {
        codeErrorNotifier.value = null;
        nameErrorNotifier.value = null;
        return;
      }
      exception.onFieldException(
        context: context,
        navigatorKey: navigatorKey,
        showErrorOverlayOnFieldError: true,
        fn: () {
          final field = Parser.enumFromString(
            LanguageCodeField.values,
            exception.field,
          );

          if (field == null) return;

          if (field == LanguageCodeField.code) {
            codeErrorNotifier.value = l10n.exception_record_already_exists;
          } else if (field == LanguageCodeField.languageName) {
            nameErrorNotifier.value = l10n.exception_record_already_exists;
          }
        },
        showErrorOverlayOnGeneralError: true,
      );
    }

    final nullaValueNotifier = useValueNotifier<LanguageCode?>(null);

    return EntityInWindowCard<LanguageCode>(
      onSave: onSave,
      isSavingNotifier: isSavingNotifier,
      onSaveError: onSaveError,
      sessionId: sessionId,
      cardBody: _CardBody(
        savedOrInitialEntity: nullaValueNotifier,
        onSaveError: onSaveError,
        nameErrorNotifier: nameErrorNotifier,
        floatingWindowId: floatingWindowId,
        onSave: onSave,
        isSavingNotifier: isSavingNotifier,
        codeErrorNotifier: codeErrorNotifier,
        navigatorKey: navigatorKey,
        formKey: formKey,
        entityIdNotifier: entityIdNotifier,
        readOnly: false,
        entityId: entityIdNotifier.value,
        sessionId: sessionId,
        initialEntity: LanguageCode.initial(),
      ),
      parentNavigatorKey: navigatorKey,
      floatingWindowId: floatingWindowId,
      invalidateEntityState: (id, sessionId) async {
        ref.invalidate(languageCodeStateProvider(id, sessionId));
      },
      formKey: formKey,
      stateProvider: languageCodeStateProvider.call,
      streamDataProvider: ({
        required sessionId,
        required dataId,
      }) =>
          watchLanguageCodeProvider(
        sessionId: sessionId,
        languageCodeId: dataId,
      ),
      entityId: entityIdNotifier.value,
      stateRefetchWithLock: (entityId, sessionId) async {
        await ref
            .read(languageCodeStateProvider(entityId, sessionId).notifier)
            .refetchWithLock();
      },
      stateSaveUnlockRefetch: (editingSessionId, entityId, navigatorKey) async {
        await ref
            .read(
              languageCodeStateProvider(entityId, editingSessionId).notifier,
            )
            .saveAndUnlockAndRefetch();
      },
      stateRefetchWithoutLock: (id, sessionId) => ref
          .read(languageCodeStateProvider(id, sessionId).notifier)
          .refetchWithoutLock(),
      tableType: TableType.languageCode.name,
      childBuilder: ({
        required int entityId,
        required String sessionId,
        required ValueNotifier<int> selectedNavigationIndexNotifier,
        required GlobalKey<NavigatorState> navigatorKey,
        required bool readOnly,
        required LanguageCode initialEntity,
        required DataMeta meta,
        required ValueNotifier<LanguageCode?> savedOrInitialEntity,
      }) {
        return _CardBody(
          onSaveError: onSaveError,
          onSave: onSave,
          isSavingNotifier: isSavingNotifier,
          codeErrorNotifier: codeErrorNotifier,
          sessionId: sessionId,
          navigatorKey: navigatorKey,
          floatingWindowId: floatingWindowId,
          formKey: formKey,
          readOnly: readOnly,
          nameErrorNotifier: nameErrorNotifier,
          entityId: entityId,
          entityIdNotifier: entityIdNotifier,
          initialEntity: initialEntity,
          savedOrInitialEntity: savedOrInitialEntity,
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
    required this.nameErrorNotifier,
    required this.onSaveError,
    required this.savedOrInitialEntity,
    required this.floatingWindowId,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final String sessionId;
  final GlobalKey<FormState> formKey;
  final bool readOnly;
  final int entityId;
  final ValueNotifier<int?> entityIdNotifier;
  final LanguageCode initialEntity;
  final Future<LanguageCode?> Function() onSave;
  final ValueNotifier<bool> isSavingNotifier;
  final ValueNotifier<String?> codeErrorNotifier;
  final ValueNotifier<String?> nameErrorNotifier;
  final void Function(ElbException?)? onSaveError;
  final ValueNotifier<LanguageCode?> savedOrInitialEntity;
  final String floatingWindowId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final crmL10n = context.crmL10n;

    useValueListenable(isSavingNotifier);

    final codeTextController = useTextEditingController(
      text: initialEntity.code,
    );
    final nameTextController = useTextEditingController(
      text: initialEntity.name,
    );
    final stateNotifier = ref.watch(
      languageCodeStateProvider(entityId, sessionId).notifier,
    );

    return InWindowBody(
      footer: Consumer(
        builder: (context, ref, child) {
          final meta = ref.watch(
            languageCodeStateProvider(entityId, sessionId).select(
              (state) => state.value?.meta,
            ),
          );
          return EntityInWindowCardFooter<LanguageCode>(
            stateProvider: languageCodeStateProvider(entityId, sessionId),
            savedOrInitialEntity: savedOrInitialEntity,
            onSaveError: onSaveError,
            navigatorKey: navigatorKey,
            formKey: formKey,
            onSave: onSave,
            readOnly: readOnly,
            isSavingNotifier: isSavingNotifier,
            meta: entityId == 0 ? null : meta,
          );
        },
      ),
      child: Form(
        key: formKey,
        child: ScrollableCardItem.constrained(
          contentPadding: EdgeInsets.zero,
          builder: (context, constraints) {
            return Column(
              children: [
                ElbTwoColumnWrap(
                  customL10n: crmL10n,
                  width: constraints.maxWidth,
                  readOnly: readOnly,
                  validationGroupId: null,
                  columnLeft: [
                    ElbTwoColumnWrapTextItem(
                      field: LanguageCodeFields.fromEnum(
                        LanguageCodeField.code,
                      ),
                      controller: codeTextController,
                      customErrorMessageNotifier: codeErrorNotifier,
                      onChanged: (v) {
                        final trimmedUpperCase = v.toUpperCase().trim();
                        stateNotifier.updateCode(trimmedUpperCase);
                        codeTextController.value = TextEditingValue(
                          text: trimmedUpperCase,
                          selection: TextSelection.collapsed(
                            offset: trimmedUpperCase.length,
                          ),
                        );
                      },
                      onClear: (v) {
                        stateNotifier.updateCode('');
                      },
                    ),
                  ],
                  columnRight: [
                    ElbTwoColumnWrapTextItem(
                      field: LanguageCodeFields.fromEnum(
                        LanguageCodeField.languageName,
                      ),
                      controller: nameTextController,
                      customErrorMessageNotifier: nameErrorNotifier,
                      onChanged: (v) {
                        final trimmed = v.trim();
                        stateNotifier.updateName(trimmed);
                        nameTextController.value = TextEditingValue(
                          text: trimmed,
                          selection: TextSelection.collapsed(
                            offset: trimmed.length,
                          ),
                        );
                      },
                      onClear: (v) {
                        nameTextController.clear();
                        stateNotifier.updateName('');
                      },
                    ),
                    ElbTwoColumnWrapCustomItem<ElbCrmLocalizations>(
                      label: crmL10n.language_code_primary,
                      childBuilder: (labelPosition) => Consumer(
                        builder: (context, ref, child) {
                          final isPrimary = ref.watch(
                            languageCodeStateProvider(
                              entityId,
                              sessionId,
                            ).select(
                              (v) => v.requireValue.isPrimary,
                            ),
                          );
                          return AppCardCheckbox(
                            value: isPrimary,
                            onChanged: stateNotifier.updateIsPrimary,
                            focusOrder: 3,
                            label: crmL10n.language_code_primary,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
