import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/department_code/config/department_code_fields.dart';
import 'package:elbdesk_crm/src/department_code/logic/department_code_provider.dart';
import 'package:elbdesk_crm/src/department_code/logic/department_code_state.dart';
import 'package:elbdesk_crm/src/department_code/models/department_code.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DepartmentCodeCard extends HookConsumerWidget {
  const DepartmentCodeCard({
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
    final l10n = context.l10n;
    final isSavingNotifier = useValueNotifier<bool>(false);
    final codeErrorNotifier = useValueNotifier<String?>(null);
    final descriptionErrorNotifier = useValueNotifier<String?>(null);

    final onSave = useCallback<Future<DepartmentCode?> Function()>(
      () async {
        final entity = ref
            .read(
              departmentCodeStateProvider(entityIdNotifier.value, sessionId),
            )
            .requireValue;

        if (entityIdNotifier.value == 0) {
          final newEntity = await ref
              .read(departmentCodeRepositoryProvider)
              .createAndReturnEntity(
                entity: entity,
                release: true,
                sessionId: sessionId,
              );
          entityIdNotifier.value = newEntity.id ?? 0;
        } else {
          await ref.read(departmentCodeRepositoryProvider).update(
                entity: entity,
                release: false,
                sessionId: sessionId,
              );

          ref
              .read(
                departmentCodeStateProvider(entityIdNotifier.value, sessionId)
                    .notifier,
              )
              .updateMetaAfterSave();
        }
        ref
          ..invalidate(findDepartmentCodesProvider)
          ..invalidate(fetchAllDepartmentCodesProvider);
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
        showErrorOverlayOnGeneralError: true,
        showErrorOverlayOnFieldError: true,
        fn: () {
          final field = Parser.enumFromString(
            DepartmentCodeField.values,
            exception.field,
          );

          if (field == null) return;

          if (field == DepartmentCodeField.code) {
            codeErrorNotifier.value = l10n.exception_record_already_exists;
          } else if (field == DepartmentCodeField.description) {
            descriptionErrorNotifier.value =
                l10n.exception_record_already_exists;
          }
        },
      );
    }

    final nullaValueNotifier = useValueNotifier<DepartmentCode?>(null);
    return EntityInWindowCard<DepartmentCode>(
      onSave: onSave,
      onSaveError: onSaveError,
      isSavingNotifier: isSavingNotifier,
      sessionId: sessionId,
      floatingWindowFocus: floatingWindowFocus,
      cardBody: _CardBody(
        savedOrInitialEntity: nullaValueNotifier,
        onSaveError: onSaveError,
        onSave: onSave,
        descriptionErrorNotifier: descriptionErrorNotifier,
        isSavingNotifier: isSavingNotifier,
        codeErrorNotifier: codeErrorNotifier,
        navigatorKey: navigatorKey,
        formKey: formKey,
        entityIdNotifier: entityIdNotifier,
        readOnly: false,
        entityId: entityIdNotifier.value,
        sessionId: sessionId,
        initialEntity: DepartmentCode.initial(),
      ),
      parentNavigatorKey: navigatorKey,
      floatingWindowId: floatingWindowId,
      invalidateEntityState: (id, sessionId) async {
        ref.invalidate(departmentCodeStateProvider(id, sessionId));
      },
      formKey: formKey,
      stateProvider: departmentCodeStateProvider.call,
      streamDataProvider: ({
        required sessionId,
        required dataId,
      }) =>
          watchDepartmentCodeProvider(
        sessionId: sessionId,
        id: dataId,
      ),
      entityId: entityIdNotifier.value,
      stateRefetchWithLock: (entityId, sessionId) async {
        await ref
            .read(departmentCodeStateProvider(entityId, sessionId).notifier)
            .refetchWithLock();
      },
      stateSaveUnlockRefetch: (editingSessionId, entityId, navigatorKey) async {
        await ref
            .read(
              departmentCodeStateProvider(entityId, editingSessionId).notifier,
            )
            .saveAndUnlockAndRefetch();
      },
      stateRefetchWithoutLock: (id, sessionId) => ref
          .read(departmentCodeStateProvider(id, sessionId).notifier)
          .refetchWithoutLock(),
      tableType: TableType.departmentCode.name,
      childBuilder: ({
        required int entityId,
        required String sessionId,
        required ValueNotifier<int> selectedNavigationIndexNotifier,
        required GlobalKey<NavigatorState> navigatorKey,
        required bool readOnly,
        required DepartmentCode initialEntity,
        required DataMeta meta,
        required ValueNotifier<DepartmentCode?> savedOrInitialEntity,
      }) {
        return _CardBody(
          savedOrInitialEntity: savedOrInitialEntity,
          onSaveError: onSaveError,
          sessionId: sessionId,
          descriptionErrorNotifier: descriptionErrorNotifier,
          navigatorKey: navigatorKey,
          formKey: formKey,
          readOnly: readOnly,
          entityId: entityId,
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
    required this.onSaveError,
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
    required this.descriptionErrorNotifier,
    required this.savedOrInitialEntity,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final String sessionId;
  final GlobalKey<FormState> formKey;
  final bool readOnly;
  final int entityId;
  final ValueNotifier<int?> entityIdNotifier;
  final DepartmentCode initialEntity;
  final Future<DepartmentCode?> Function() onSave;
  final ValueNotifier<bool> isSavingNotifier;
  final ValueNotifier<String?> codeErrorNotifier;
  final ValueNotifier<String?> descriptionErrorNotifier;
  final void Function(ElbException?)? onSaveError;
  final ValueNotifier<DepartmentCode?> savedOrInitialEntity;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final crmL10n = context.crmL10n;
    final stateNotifier = ref.watch(
      departmentCodeStateProvider(entityId, sessionId).notifier,
    );

    final codeController = useTextEditingController(
      text: initialEntity.code,
    );
    final descriptionController = useTextEditingController(
      text: initialEntity.description,
    );
    final codeFocus = useFocusNode();

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

    useValueListenable(isSavingNotifier);
    return InWindowBody(
      footer: Consumer(
        builder: (context, ref, child) {
          final meta = ref.watch(
            departmentCodeStateProvider(entityId, sessionId).select(
              (state) => state.value?.meta,
            ),
          );
          return EntityInWindowCardFooter<DepartmentCode>(
            stateProvider: departmentCodeStateProvider(entityId, sessionId),
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
                      field: DepartmentCodeFields.fromEnum(
                        DepartmentCodeField.code,
                      ),
                      controller: codeController,
                      customErrorMessageNotifier: codeErrorNotifier,
                      onChanged: (v) {
                        final trimmedUpperCase = v.trim().toUpperCase();
                        stateNotifier.updateCode(trimmedUpperCase);
                        codeController.value = TextEditingValue(
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
                      field: DepartmentCodeFields.fromEnum(
                        DepartmentCodeField.description,
                      ),
                      controller: descriptionController,
                      customErrorMessageNotifier: descriptionErrorNotifier,
                      onChanged: stateNotifier.updateDescription,
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
