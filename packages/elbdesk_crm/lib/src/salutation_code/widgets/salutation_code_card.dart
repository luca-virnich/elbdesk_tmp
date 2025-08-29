import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/salutation_code/config/salutation_code_fields.dart';
import 'package:elbdesk_crm/src/salutation_code/logic/salutation_code_provider.dart';
import 'package:elbdesk_crm/src/salutation_code/logic/salutation_code_state.dart';
import 'package:elbdesk_crm/src/salutation_code/models/salutation_code.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SalutationCodeCard extends HookConsumerWidget {
  const SalutationCodeCard({
    required this.floatingWindowId,
    required this.entityId,
    required this.navigatorKey,
    required this.floatingWindowFocus,
    super.key,
  });
  final String floatingWindowId;
  final int? entityId;
  final GlobalKey<NavigatorState> navigatorKey;
  final FocusNode floatingWindowFocus;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useFormKey();
    final entityIdNotifier = useState<int>(entityId ?? 0);

    final sessionId = useUuid();
    final isSavingNotifier = useValueNotifier<bool>(false);
    final codeErrorNotifier = useValueNotifier<String?>(null);
    final descriptionErrorNotifier = useValueNotifier<String?>(null);
    final l10n = context.l10n;

    final onSave = useCallback<Future<SalutationCode?> Function()>(
      () async {
        final entity = ref
            .read(
              salutationCodeStateProvider(entityIdNotifier.value, sessionId),
            )
            .requireValue;

        if (entityIdNotifier.value == 0) {
          final newEntity = await ref
              .read(salutationCodeRepositoryProvider)
              .createAndReturnEntity(
                entity: entity,
                release: true,
                sessionId: sessionId,
              );
          entityIdNotifier.value = newEntity.id ?? 0;
        } else {
          await ref.read(salutationCodeRepositoryProvider).update(
                entity: entity,
                release: false,
                sessionId: sessionId,
              );

          ref
              .read(
                salutationCodeStateProvider(entityIdNotifier.value, sessionId)
                    .notifier,
              )
              .updateMetaAfterSave();
        }

        ref
          ..invalidate(findSalutationCodesProvider)
          ..invalidate(fetchAllSalutationCodesProvider);
        return null;
      },
      [],
    );
    void onSaveError(ElbException? exception) {
      if (exception == null) {
        codeErrorNotifier.value = null;
        descriptionErrorNotifier.value = null;
        return;
      }
      exception.onFieldException(
        context: context,
        navigatorKey: navigatorKey,
        showErrorOverlayOnFieldError: true,
        fn: () {
          final field = Parser.enumFromString(
            SalutationCodeField.values,
            exception.field,
          );

          if (field == null) return;

          if (field == SalutationCodeField.code) {
            codeErrorNotifier.value = l10n.exception_record_already_exists;
          } else if (field == SalutationCodeField.description) {
            descriptionErrorNotifier.value =
                l10n.exception_record_already_exists;
          }
        },
        showErrorOverlayOnGeneralError: true,
      );
    }

    final nullaValueNotifier = useValueNotifier<SalutationCode?>(null);
    return EntityInWindowCard<SalutationCode>(
      onSave: onSave,
      isSavingNotifier: isSavingNotifier,
      onSaveError: onSaveError,
      floatingWindowFocus: floatingWindowFocus,
      sessionId: sessionId,
      cardBody: _CardBody(
        savedOrInitialEntity: nullaValueNotifier,
        entityId: entityIdNotifier.value,
        onSaveError: onSaveError,
        descriptionErrorNotifier: descriptionErrorNotifier,
        navigatorKey: navigatorKey,
        formKey: formKey,
        sessionId: sessionId,
        readOnly: false,
        entityIdNotifier: entityIdNotifier,
        isSavingNotifier: isSavingNotifier,
        codeErrorNotifier: codeErrorNotifier,
        onSave: onSave,
      ),
      parentNavigatorKey: navigatorKey,
      floatingWindowId: floatingWindowId,
      invalidateEntityState: (id, sessionId) async {
        ref.invalidate(salutationCodeStateProvider(id, sessionId));
      },
      formKey: formKey,
      stateProvider: salutationCodeStateProvider.call,
      streamDataProvider: ({
        required sessionId,
        required dataId,
      }) =>
          watchSalutationCodeProvider(
        sessionId: sessionId,
        salutationCodeId: dataId,
      ),
      entityId: entityIdNotifier.value,
      stateRefetchWithLock: (entityId, sessionId) async {
        await ref
            .read(salutationCodeStateProvider(entityId, sessionId).notifier)
            .refetchWithLock();
      },
      stateSaveUnlockRefetch: (editingSessionId, entityId, navigatorKey) async {
        await ref
            .read(
              salutationCodeStateProvider(entityId, editingSessionId).notifier,
            )
            .saveAndUnlockAndRefetch();
      },
      stateRefetchWithoutLock: (id, sessionId) => ref
          .read(salutationCodeStateProvider(id, sessionId).notifier)
          .refetchWithoutLock(),
      tableType: TableType.salutationCode.name,
      childBuilder: ({
        required int entityId,
        required String sessionId,
        required ValueNotifier<int> selectedNavigationIndexNotifier,
        required GlobalKey<NavigatorState> navigatorKey,
        required bool readOnly,
        required SalutationCode initialEntity,
        required DataMeta meta,
        required ValueNotifier<SalutationCode?> savedOrInitialEntity,
      }) {
        return _CardBody(
          savedOrInitialEntity: savedOrInitialEntity,
          entityId: entityId,
          sessionId: sessionId,
          onSaveError: onSaveError,
          navigatorKey: navigatorKey,
          formKey: formKey,
          readOnly: readOnly,
          entityIdNotifier: entityIdNotifier,
          isSavingNotifier: isSavingNotifier,
          codeErrorNotifier: codeErrorNotifier,
          descriptionErrorNotifier: descriptionErrorNotifier,
          onSave: onSave,
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
    required this.entityIdNotifier,
    required this.isSavingNotifier,
    required this.codeErrorNotifier,
    required this.descriptionErrorNotifier,
    required this.onSave,
    required this.onSaveError,
    required this.entityId,
    required this.savedOrInitialEntity,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final String sessionId;
  final GlobalKey<FormState> formKey;
  final bool readOnly;

  final ValueNotifier<int> entityIdNotifier;
  final ValueNotifier<bool> isSavingNotifier;
  final ValueNotifier<String?> codeErrorNotifier;
  final ValueNotifier<String?> descriptionErrorNotifier;
  final Future<SalutationCode?> Function() onSave;
  final void Function(ElbException?)? onSaveError;
  final ValueNotifier<SalutationCode?> savedOrInitialEntity;
  final int entityId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final crmL10n = context.crmL10n;
    final stateNotifier = ref.watch(
      salutationCodeStateProvider(entityIdNotifier.value, sessionId).notifier,
    );

    final initialState = useMemoized(
      () => ref
          .read(salutationCodeStateProvider(entityIdNotifier.value, sessionId))
          .requireValue,
      [entityIdNotifier.value, sessionId],
    );

    final codeController = useTextEditingController(
      text: initialState.code,
    );
    final codeFocus = useFocusNode();
    final descriptionController = useTextEditingController(
      text: initialState.description,
    );

    useEffect(
      () {
        Future<void>.delayed(
          const Duration(
            milliseconds: FocusUtils.autofocusDelayMilliseconds,
          ),
        ).then((_) {
          if (context.mounted) {
            codeFocus.requestFocus();
          }
        });
        return null;
      },
      [],
    );
    useValueListenable(codeErrorNotifier);
    useValueListenable(descriptionErrorNotifier);
    useValueListenable(isSavingNotifier);
    return InWindowBody(
      footer: Consumer(
        builder: (context, ref, child) {
          final meta = ref.watch(
            salutationCodeStateProvider(entityIdNotifier.value, sessionId)
                .select(
              (state) => state.value?.meta,
            ),
          );
          return EntityInWindowCardFooter<SalutationCode>(
            stateProvider: salutationCodeStateProvider(entityId, sessionId),
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
                      field: SalutationCodeFields.fromEnum(
                        SalutationCodeField.code,
                      ),
                      controller: codeController,
                      customErrorMessageNotifier: codeErrorNotifier,
                      onChanged: (v) {
                        stateNotifier.updateCode(v.toUpperCase());
                        codeController.value = TextEditingValue(
                          text: v.toUpperCase(),
                          selection: TextSelection.collapsed(
                            offset: v.toUpperCase().length,
                          ),
                        );
                      },
                    ),
                    ElbTwoColumnWrapTextItem(
                      field: SalutationCodeFields.fromEnum(
                        SalutationCodeField.description,
                      ),
                      controller: descriptionController,
                      customErrorMessageNotifier: descriptionErrorNotifier,
                      onChanged: stateNotifier.updateDescription,
                    ),
                  ],
                  columnRight: [
                    ElbTwoColumnWrapCustomItem<ElbCrmLocalizations>(
                      label: crmL10n.salutation_code_primary_person,
                      childBuilder: (labelPosition) => Consumer(
                        builder: (context, ref, child) {
                          final isPrimaryPerson = ref.watch(
                            salutationCodeStateProvider(
                              entityId,
                              sessionId,
                            ).select(
                              (v) => v.requireValue.isPrimaryPerson,
                            ),
                          );
                          return AppCardCheckbox(
                            value: isPrimaryPerson,
                            onChanged: stateNotifier.updateIsPrimaryPerson,
                            label: crmL10n.salutation_code_primary_person,
                          );
                        },
                      ),
                    ),
                    ElbTwoColumnWrapCustomItem<ElbCrmLocalizations>(
                      label: crmL10n.salutation_code_primary_company,
                      childBuilder: (labelPosition) => Consumer(
                        builder: (context, ref, child) {
                          final isPrimaryCompany = ref.watch(
                            salutationCodeStateProvider(
                              entityId,
                              sessionId,
                            ).select(
                              (v) => v.requireValue.isPrimaryCompany,
                            ),
                          );
                          return AppCardCheckbox(
                            value: isPrimaryCompany,
                            onChanged: stateNotifier.updateIsPrimaryCompany,
                            label: crmL10n.salutation_code_primary_company,
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
