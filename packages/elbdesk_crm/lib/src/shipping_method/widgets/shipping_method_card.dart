import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/shipping_method/_export_shipping_method.dart';
import 'package:elbdesk_crm/src/shipping_method/config/shipping_method_fields.dart';
import 'package:elbdesk_crm/src/shipping_method/logic/shipping_method_state.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Card for shipping method settings
class ShippingMethodCard extends HookConsumerWidget {
  /// Default constructor
  const ShippingMethodCard({
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

    final onSave = useCallback<Future<ShippingMethod?> Function()>(
      () async {
        final entity = ref
            .read(
              shippingMethodStateProvider(entityIdNotifier.value, sessionId),
            )
            .requireValue;

        if (entityIdNotifier.value == 0) {
          final newEntity = await ref
              .read(shippingMethodRepositoryProvider)
              .createAndReturnEntity(
                entity: entity,
                release: true,
                sessionId: sessionId,
              );
          entityIdNotifier.value = newEntity.id ?? 0;
        } else {
          await ref.read(shippingMethodRepositoryProvider).update(
                entity: entity,
                release: false,
                sessionId: sessionId,
              );
          // savedOrInitialEntity.value = updated;
          ref
              .read(
                shippingMethodStateProvider(entityIdNotifier.value, sessionId)
                    .notifier,
              )
              .updateMetaAfterSave();
        }

        ref.invalidate(findShippingMethodsProvider);
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
            ShippingMethodField.values,
            exception.field,
          );

          if (field == null) return;

          if (field == ShippingMethodField.code) {
            codeErrorNotifier.value = l10n.exception_record_already_exists;
          }
        },
        showErrorOverlayOnGeneralError: true,
      );
    }

    final nullaValueNotifier = useValueNotifier<ShippingMethod?>(null);
    return EntityInWindowCard<ShippingMethod>(
      // savedOrInitialEntity: savedOrInitialEntity,

      onSave: onSave,
      isSavingNotifier: isSavingNotifier,
      onSaveError: onSaveError,
      floatingWindowFocus: floatingWindowFocus,
      sessionId: sessionId,
      cardBody: _CardBody(
        savedOrInitialEntity: nullaValueNotifier,
        onSaveError: onSaveError,
        onSave: onSave,
        isSavingNotifier: isSavingNotifier,
        codeErrorNotifier: codeErrorNotifier,
        navigatorKey: navigatorKey,
        formKey: formKey,
        entityIdNotifier: entityIdNotifier,
        readOnly: false,
        entityId: entityIdNotifier.value,
        sessionId: sessionId,
        initialEntity: ShippingMethod.initial(),
      ),
      parentNavigatorKey: navigatorKey,
      floatingWindowId: floatingWindowId,
      invalidateEntityState: (id, sessionId) async {
        ref.invalidate(shippingMethodStateProvider(id, sessionId));
      },
      formKey: formKey,
      stateProvider: shippingMethodStateProvider.call,
      streamDataProvider: ({
        required sessionId,
        required dataId,
      }) =>
          watchShippingMethodProvider(
        sessionId: sessionId,
        shippingMethodId: dataId,
      ),
      entityId: entityIdNotifier.value,
      stateRefetchWithLock: (entityId, sessionId) async {
        await ref
            .read(shippingMethodStateProvider(entityId, sessionId).notifier)
            .refetchWithLock();
      },
      stateSaveUnlockRefetch: (editingSessionId, entityId, navigatorKey) async {
        await ref
            .read(
              shippingMethodStateProvider(entityId, editingSessionId).notifier,
            )
            .saveAndUnlockAndRefetch();
      },
      stateRefetchWithoutLock: (id, sessionId) => ref
          .read(shippingMethodStateProvider(id, sessionId).notifier)
          .refetchWithoutLock(),
      tableType: TableType.shippingMethod.name,
      childBuilder: ({
        required int entityId,
        required String sessionId,
        required ValueNotifier<int> selectedNavigationIndexNotifier,
        required GlobalKey<NavigatorState> navigatorKey,
        required bool readOnly,
        required ShippingMethod initialEntity,
        required DataMeta meta,
        required ValueNotifier<ShippingMethod?> savedOrInitialEntity,
      }) {
        return _CardBody(
          savedOrInitialEntity: savedOrInitialEntity,
          initialEntity: initialEntity,
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
  final ShippingMethod initialEntity;
  final Future<ShippingMethod?> Function() onSave;
  final ValueNotifier<bool> isSavingNotifier;
  final ValueNotifier<String?> codeErrorNotifier;
  final void Function(ElbException?)? onSaveError;
  final ValueNotifier<ShippingMethod?> savedOrInitialEntity;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    final stateNotifier = ref.watch(
      shippingMethodStateProvider(entityId, sessionId).notifier,
    );

    return InWindowBody(
      footer: Consumer(
        builder: (context, ref, child) {
          final meta = ref.watch(
            shippingMethodStateProvider(entityId, sessionId)
                .select((state) => state.value?.meta),
          );
          return EntityInWindowCardFooter<ShippingMethod>(
            onSaveError: onSaveError,
            navigatorKey: navigatorKey,
            stateProvider: shippingMethodStateProvider(entityId, sessionId),
            savedOrInitialEntity: savedOrInitialEntity,
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
                      field: ShippingMethodFields.fromEnum(
                        ShippingMethodField.code,
                      ),
                      initialText: initialEntity.code,
                      customErrorMessageNotifier: codeErrorNotifier,
                      onChanged: (v) {
                        stateNotifier.updateCode(v.toUpperCase());
                      },
                    ),
                    ElbTwoColumnWrapTextItem(
                      field: ShippingMethodFields.fromEnum(
                        ShippingMethodField.description,
                      ),
                      initialText: initialEntity.description,
                      onChanged: stateNotifier.updateDescription,
                    ),
                  ],
                  columnRight: [
                    ElbTwoColumnWrapCustomItem<ElbCrmLocalizations>(
                      label: crmL10n.shipping_method_is_activated,
                      childBuilder: (labelPosition) => Consumer(
                        builder: (context, ref, child) {
                          final isActive = ref.watch(
                            shippingMethodStateProvider(
                              entityId,
                              sessionId,
                            ).select(
                              (v) => v.requireValue.isActive,
                            ),
                          );
                          return AppCardCheckbox(
                            value: isActive,
                            onChanged: stateNotifier.updateIsActive,
                            label: crmL10n.shipping_method_is_activated,
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
