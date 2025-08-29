import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/payment_code/config/payment_code_fields.dart';
import 'package:elbdesk_crm/src/payment_code/logic/payment_code_provider.dart';
import 'package:elbdesk_crm/src/payment_code/logic/payment_code_state.dart';
import 'package:elbdesk_crm/src/payment_code/models/payment_code.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PaymentCodeCard extends HookConsumerWidget {
  const PaymentCodeCard({
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

    final onSave = useCallback<Future<PaymentCode?> Function()>(
      () async {
        final entity = ref
            .read(paymentCodeStateProvider(entityIdNotifier.value, sessionId))
            .requireValue;

        if (entityIdNotifier.value == 0) {
          final newEntity = await ref
              .read(paymentCodeRepositoryProvider)
              .createAndReturnEntity(
                entity: entity,
                release: true,
                sessionId: sessionId,
              );
          entityIdNotifier.value = newEntity.id ?? 0;
        } else {
          await ref.read(paymentCodeRepositoryProvider).update(
                entity: entity,
                release: false,
                sessionId: sessionId,
              );

          ref
              .read(
                paymentCodeStateProvider(entityIdNotifier.value, sessionId)
                    .notifier,
              )
              .updateMetaAfterSave();
        }

        ref.invalidate(findPaymentCodesProvider);
        return null;
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
            PaymentCodeField.values,
            exception.field,
          );

          if (field == null) return;

          if (field == PaymentCodeField.code) {
            codeErrorNotifier.value = l10n.exception_record_already_exists;
          }
        },
        showErrorOverlayOnGeneralError: true,
      );
    }

    final nullaValueNotifier = useValueNotifier<PaymentCode?>(null);
    return EntityInWindowCard<PaymentCode>(
      onSave: onSave,
      isSavingNotifier: isSavingNotifier,
      onSaveError: onSaveError,
      floatingWindowFocus: floatingWindowFocus,
      sessionId: sessionId,
      cardBody: _CardBody(
        onSaveError: onSaveError,
        savedOrInitialEntity: nullaValueNotifier,
        onSave: onSave,
        isSavingNotifier: isSavingNotifier,
        codeErrorNotifier: codeErrorNotifier,
        navigatorKey: navigatorKey,
        formKey: formKey,
        entityIdNotifier: entityIdNotifier,
        readOnly: false,
        entityId: entityIdNotifier.value,
        sessionId: sessionId,
        initialEntity: PaymentCode.initial(),
      ),
      parentNavigatorKey: navigatorKey,
      floatingWindowId: floatingWindowId,
      invalidateEntityState: (id, sessionId) async {
        ref.invalidate(paymentCodeStateProvider(id, sessionId));
      },
      formKey: formKey,
      stateProvider: paymentCodeStateProvider.call,
      streamDataProvider: ({
        required sessionId,
        required dataId,
      }) =>
          watchPaymentCodeProvider(
        sessionId: sessionId,
        paymentCodeId: dataId,
      ),
      entityId: entityIdNotifier.value,
      stateRefetchWithLock: (entityId, sessionId) async {
        await ref
            .read(paymentCodeStateProvider(entityId, sessionId).notifier)
            .refetchWithLock();
      },
      stateSaveUnlockRefetch: (editingSessionId, entityId, navigatorKey) async {
        await ref
            .read(paymentCodeStateProvider(entityId, editingSessionId).notifier)
            .saveAndUnlockAndRefetch();
      },
      stateRefetchWithoutLock: (id, sessionId) => ref
          .read(paymentCodeStateProvider(id, sessionId).notifier)
          .refetchWithoutLock(),
      tableType: TableType.paymentCode.name,
      childBuilder: ({
        required int entityId,
        required String sessionId,
        required ValueNotifier<int> selectedNavigationIndexNotifier,
        required GlobalKey<NavigatorState> navigatorKey,
        required bool readOnly,
        required PaymentCode initialEntity,
        required DataMeta meta,
        required ValueNotifier<PaymentCode?> savedOrInitialEntity,
      }) {
        return _CardBody(
          savedOrInitialEntity: savedOrInitialEntity,
          sessionId: sessionId,
          onSave: onSave,
          onSaveError: onSaveError,
          isSavingNotifier: isSavingNotifier,
          codeErrorNotifier: codeErrorNotifier,
          navigatorKey: navigatorKey,
          formKey: formKey,
          readOnly: readOnly,
          entityId: entityId,
          entityIdNotifier: entityIdNotifier,
          initialEntity: initialEntity,
        );
      },
    );
  }
}

class _CardBody extends HookConsumerWidget {
  const _CardBody({
    required this.sessionId,
    required this.formKey,
    required this.readOnly,
    required this.entityId,
    required this.entityIdNotifier,
    required this.navigatorKey,
    required this.initialEntity,
    required this.onSave,
    required this.isSavingNotifier,
    required this.codeErrorNotifier,
    required this.onSaveError,
    required this.savedOrInitialEntity,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final String sessionId;
  final GlobalKey<FormState> formKey;
  final bool readOnly;
  final int entityId;
  final ValueNotifier<int?> entityIdNotifier;
  final PaymentCode initialEntity;
  final Future<PaymentCode?> Function() onSave;
  final ValueNotifier<bool> isSavingNotifier;
  final ValueNotifier<String?> codeErrorNotifier;
  final void Function(ElbException?)? onSaveError;
  final ValueNotifier<PaymentCode?> savedOrInitialEntity;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final crmL10n = context.crmL10n;

    final stateNotifier = ref.watch(
      paymentCodeStateProvider(entityId, sessionId).notifier,
    );

    return InWindowBody(
      footer: Consumer(
        builder: (context, ref, child) {
          final meta = ref.watch(
            paymentCodeStateProvider(entityId, sessionId)
                .select((state) => state.value?.meta),
          );
          return EntityInWindowCardFooter<PaymentCode>(
            stateProvider: paymentCodeStateProvider(entityId, sessionId),
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
                      field: PaymentCodeFields.fromEnum(PaymentCodeField.code),
                      initialText: initialEntity.code,
                      customErrorMessageNotifier: codeErrorNotifier,
                      onChanged: (v) {
                        stateNotifier.updateCode(v.toUpperCase());
                      },
                    ),
                    ElbTwoColumnWrapTextItem(
                      field: PaymentCodeFields.fromEnum(
                        PaymentCodeField.description,
                      ),
                      initialText: initialEntity.description,
                      onChanged: stateNotifier.updateDescription,
                    ),
                    ElbTwoColumnWrapTextItem(
                      field: PaymentCodeFields.fromEnum(
                        PaymentCodeField.dueDateCalculation,
                      ),
                      initialText: initialEntity.dueDateCalculation,
                      onChanged: stateNotifier.updateDueDateCalculation,
                    ),
                    ElbTwoColumnWrapDoubleItem(
                      field: PaymentCodeFields.fromEnum(
                        PaymentCodeField.discountPercentage,
                      ),
                      value: initialEntity.discountPercentage,
                      returnEmptyAs0: true,
                      onChanged: (v) {
                        if (v != null) {
                          stateNotifier.updateDiscountPercentage(v);
                        }
                      },
                      onClear: (v) {
                        stateNotifier.updateDiscountPercentage(0);
                      },
                    ),
                  ],
                  columnRight: [
                    ElbTwoColumnWrapTextItem(
                      field: PaymentCodeFields.fromEnum(
                        PaymentCodeField.discountDateCalculation,
                      ),
                      initialText: initialEntity.discountDateCalculation,
                      onChanged: stateNotifier.updateDiscountDateCalculation,
                    ),
                    ElbTwoColumnWrapCustomItem<ElbCrmLocalizations>(
                      label: crmL10n
                          .payment_code_calculate_discount_on_credit_note,
                      childBuilder: (labelPosition) => Consumer(
                        builder: (context, ref, child) {
                          final discountOnCreditNote = ref.watch(
                            paymentCodeStateProvider(
                              entityId,
                              sessionId,
                            ).select(
                              (v) =>
                                  v.requireValue.calculateDiscountOnCreditNote,
                            ),
                          );
                          return AppCardCheckbox(
                            value: discountOnCreditNote,
                            onChanged: stateNotifier
                                .updateCalculateDiscountOnCreditNote,
                            label: crmL10n
                                .payment_code_calculate_discount_on_credit_note,
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
