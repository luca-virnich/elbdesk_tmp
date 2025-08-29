import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/country_code/config/country_code_fields.dart';
import 'package:elbdesk_crm/src/country_code/logic/country_code_provider.dart';
import 'package:elbdesk_crm/src/country_code/logic/country_code_state.dart';
import 'package:elbdesk_crm/src/country_code/models/country_code.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CountryCodeCard extends HookConsumerWidget {
  const CountryCodeCard({
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
    final nameErrorNotifier = useValueNotifier<String?>(null);

    final onSave = useCallback<Future<CountryCode?> Function()>(
      () async {
        final entity = ref
            .read(countryCodeStateProvider(entityIdNotifier.value, sessionId));

        if (entityIdNotifier.value == 0) {
          final newEntity = await ref
              .read(countryCodeRepositoryProvider)
              .createAndReturnEntity(
                entity: entity.requireValue,
                release: true,
                sessionId: sessionId,
              );
          entityIdNotifier.value = newEntity.id ?? 0;
        } else {
          await ref.read(countryCodeRepositoryProvider).update(
                entity: entity.requireValue,
                release: false,
                sessionId: sessionId,
              );

          ref
              .read(
                countryCodeStateProvider(entityIdNotifier.value, sessionId)
                    .notifier,
              )
              .updateMetaAfterSave();
        }

        ref.invalidate(findCountryCodesProvider);
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
            CountryCodeField.values,
            exception.field,
          );

          if (field == null) return;

          if (field == CountryCodeField.code) {
            codeErrorNotifier.value = l10n.exception_record_already_exists;
          } else {
            nameErrorNotifier.value = l10n.exception_record_already_exists;
          }
        },
        showErrorOverlayOnGeneralError: true,
      );
    }

    final nullaValueNotifier = useValueNotifier<CountryCode?>(null);
    return EntityInWindowCard<CountryCode>(
      floatingWindowFocus: floatingWindowFocus,
      isSavingNotifier: isSavingNotifier,
      onSave: onSave,
      onSaveError: onSaveError,
      cardBody: _CardBody(
        savedOrInitialEntity: nullaValueNotifier,
        nameErrorNotifier: nameErrorNotifier,
        codeErrorNotifier: codeErrorNotifier,
        isSavingNotifier: isSavingNotifier,
        navigatorKey: navigatorKey,
        onSaveError: onSaveError,
        formKey: formKey,
        entityIdNotifier: entityIdNotifier,
        readOnly: false,
        onSave: onSave,
        entityId: entityIdNotifier.value,
        sessionId: sessionId,
        initialEntity: CountryCode.initial(),
      ),
      sessionId: sessionId,
      parentNavigatorKey: navigatorKey,
      floatingWindowId: floatingWindowId,
      invalidateEntityState: (id, sessionId) async {
        ref.invalidate(countryCodeStateProvider(id, sessionId));
      },
      formKey: formKey,
      stateProvider: countryCodeStateProvider.call,
      streamDataProvider: ({
        required sessionId,
        required dataId,
      }) =>
          watchCountryCodeProvider(
        sessionId: sessionId,
        countryCodeId: dataId,
      ),
      entityId: entityIdNotifier.value,
      stateRefetchWithLock: (entityId, sessionId) async {
        await ref
            .read(countryCodeStateProvider(entityId, sessionId).notifier)
            .refetchWithLock();
      },
      stateSaveUnlockRefetch: (editingSessionId, entityId, navigatorKey) async {
        await ref
            .read(
              countryCodeStateProvider(entityId, editingSessionId).notifier,
            )
            .saveAndUnlockAndRefetch();
      },
      stateRefetchWithoutLock: (id, sessionId) => ref
          .read(countryCodeStateProvider(id, sessionId).notifier)
          .refetchWithoutLock(),
      tableType: TableType.countryCode.name,
      childBuilder: ({
        required int entityId,
        required String sessionId,
        required ValueNotifier<int> selectedNavigationIndexNotifier,
        required GlobalKey<NavigatorState> navigatorKey,
        required bool readOnly,
        required CountryCode initialEntity,
        required DataMeta meta,
        required ValueNotifier<CountryCode?> savedOrInitialEntity,
      }) {
        return _CardBody(
          sessionId: sessionId,
          savedOrInitialEntity: savedOrInitialEntity,
          isSavingNotifier: isSavingNotifier,
          onSaveError: onSaveError,
          navigatorKey: navigatorKey,
          formKey: formKey,
          entityIdNotifier: entityIdNotifier,
          readOnly: readOnly,
          entityId: entityId,
          initialEntity: initialEntity,
          onSave: onSave,
          codeErrorNotifier: codeErrorNotifier,
          nameErrorNotifier: nameErrorNotifier,
        );
      },
    );
  }
}

/// @nodoc
class _CardBody extends HookConsumerWidget {
  /// @nodoc
  const _CardBody({
    required this.navigatorKey,
    required this.sessionId,
    required this.formKey,
    required this.readOnly,
    required this.entityIdNotifier,
    required this.isSavingNotifier,
    required this.entityId,
    required this.initialEntity,
    required this.onSave,
    required this.codeErrorNotifier,
    required this.nameErrorNotifier,
    required this.onSaveError,
    required this.savedOrInitialEntity,
  });
  final int entityId;
  final GlobalKey<NavigatorState> navigatorKey;
  final String sessionId;
  final GlobalKey<FormState> formKey;
  final bool readOnly;
  final ValueNotifier<int?> entityIdNotifier;
  final ValueNotifier<bool> isSavingNotifier;
  final CountryCode initialEntity;
  final Future<CountryCode?> Function() onSave;
  final ValueNotifier<String?> codeErrorNotifier;
  final ValueNotifier<String?> nameErrorNotifier;
  final void Function(ElbException?) onSaveError;
  final ValueNotifier<CountryCode?> savedOrInitialEntity;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taxSchemeFocusNode = useFocusNode();

    final stateNotifier =
        ref.watch(countryCodeStateProvider(entityId, sessionId).notifier);
    useValueListenable(isSavingNotifier);

    return InWindowBody(
      footer: _Footer(
        savedOrInitialEntity: savedOrInitialEntity,
        sessionId: sessionId,
        formKey: formKey,
        onSave: onSave,
        readOnly: readOnly,
        isSavingNotifier: isSavingNotifier,
        onSaveError: onSaveError,
        navigatorKey: navigatorKey,
        entityId: entityId,
      ),
      child: Form(
        key: formKey,
        child: ScrollableCardItem.constrained(
          builder: (context, constraints) {
            return Column(
              children: [
                _Content(
                  nameErrorNotifier: nameErrorNotifier,
                  codeErrorNotifier: codeErrorNotifier,
                  stateNotifier: stateNotifier,
                  initialEntity: initialEntity,
                  sessionId: sessionId,
                  entityId: entityId,
                  width: constraints.maxWidth,
                  readOnly: readOnly,
                  taxSchemeFocusNode: taxSchemeFocusNode,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _Footer extends ConsumerWidget {
  const _Footer({
    required this.formKey,
    required this.onSave,
    required this.readOnly,
    required this.isSavingNotifier,
    required this.onSaveError,
    required this.navigatorKey,
    required this.entityId,
    required this.sessionId,
    required this.savedOrInitialEntity,
  });

  final GlobalKey<FormState> formKey;
  final Future<CountryCode?> Function() onSave;
  final bool readOnly;
  final ValueNotifier<bool> isSavingNotifier;
  final void Function(ElbException? p1) onSaveError;
  final GlobalKey<NavigatorState> navigatorKey;
  final int entityId;
  final String sessionId;
  final ValueNotifier<CountryCode?> savedOrInitialEntity;
  @override
  Widget build(BuildContext contex, WidgetRef ref) {
    final meta = ref.watch(
      countryCodeStateProvider(entityId, sessionId)
          .select((value) => value.requireValue.meta),
    );
    return EntityInWindowCardFooter<CountryCode>(
      stateProvider: countryCodeStateProvider(entityId, sessionId),
      savedOrInitialEntity: savedOrInitialEntity,
      formKey: formKey,
      onSave: onSave,
      readOnly: readOnly,
      isSavingNotifier: isSavingNotifier,
      onSaveError: onSaveError,
      navigatorKey: navigatorKey,
      meta: entityId == 0 ? null : meta,
    );
  }
}

class _Content extends HookConsumerWidget {
  const _Content({
    required this.readOnly,
    required this.nameErrorNotifier,
    required this.width,
    required this.taxSchemeFocusNode,
    required this.sessionId,
    required this.entityId,
    required this.initialEntity,
    required this.stateNotifier,
    required this.codeErrorNotifier,
  });
  final String sessionId;
  final int entityId;

  final bool readOnly;

  final FocusNode taxSchemeFocusNode;

  final double width;
  final CountryCode initialEntity;
  final CountryCodeState stateNotifier;
  final ValueNotifier<String?> codeErrorNotifier;
  final ValueNotifier<String?> nameErrorNotifier;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final codeController = useTextEditingController(text: initialEntity.code);
    final nameController = useTextEditingController(text: initialEntity.name);

    final crmL10n = context.crmL10n;
    return ElbTwoColumnWrap(
      width: width,
      customL10n: crmL10n,
      validationGroupId: null,
      readOnly: readOnly,
      columnLeft: [
        ElbTwoColumnWrapTextItem(
          field: CountryCodeFields.fromEnum(CountryCodeField.code),
          controller: codeController,
          customErrorMessageNotifier: codeErrorNotifier,
          onChanged: (v) {
            final trimmedUpperCase = v.toUpperCase().trim();
            stateNotifier.updateCode(trimmedUpperCase);
            codeController.value = TextEditingValue(
              text: trimmedUpperCase,
              selection: TextSelection.collapsed(
                offset: trimmedUpperCase.length,
              ),
            );
          },
        ),
        ElbTwoColumnWrapTextItem(
          field: CountryCodeFields.fromEnum(CountryCodeField.countryRegionName),
          controller: nameController,
          customErrorMessageNotifier: nameErrorNotifier,
          onChanged: stateNotifier.updateCountryRegionName,
        ),
        ElbTwoColumnWrapTextItem(
          field: CountryCodeFields.fromEnum(CountryCodeField.isoCode),
          initialText: initialEntity.isoCode,
          onChanged: stateNotifier.updateIsoCode,
        ),
        ElbTwoColumnWrapIntItem(
          field: CountryCodeFields.fromEnum(CountryCodeField.numericCode),
          value: initialEntity.numericIsoCode,
          onChanged: stateNotifier.updateNumericCode,
          onClear: (v) {
            stateNotifier.updateNumericCode(null);
          },
        ),
        ElbTwoColumnWrapTextItem(
          field: CountryCodeFields.fromEnum(CountryCodeField.federalRegion),
          initialText: initialEntity.federalRegion ?? '',
          onChanged: stateNotifier.updateFederalRegion,
        ),
        ElbTwoColumnWrapTextItem(
          field: CountryCodeFields.fromEnum(CountryCodeField.euCode),
          initialText: initialEntity.euCode ?? '',
          onChanged: stateNotifier.updateEuCode,
        ),
      ],
      columnRight: [
        ElbTwoColumnWrapTextItem(
          field: CountryCodeFields.fromEnum(CountryCodeField.intrastatCode),
          initialText: initialEntity.intrastatCode ?? '',
          onChanged: stateNotifier.updateIntrastatCode,
        ),
        ElbTwoColumnWrapTextDropdownItem(
          field: CountryCodeFields.fromEnum(CountryCodeField.addressFormat),
          initialValue: initialEntity.addressFormat?.readable(crmL10n),
          dropdownMenuEntries: CountryCodeAddressFormat.values
              .map(
                (e) => NextDropdownMenuEntry<CountryCodeAddressFormat>(
                  value: e,
                  label: e.readable(crmL10n),
                ),
              )
              .toList(),
          onSelected: stateNotifier.updateAddressFormat,
        ),
        ElbTwoColumnWrapTextDropdownItem(
          field:
              CountryCodeFields.fromEnum(CountryCodeField.contactAddressFormat),
          initialValue: initialEntity.contactAddressFormat?.readable(crmL10n),
          dropdownMenuEntries: CountryCodeContactAddressFormat.values
              .map(
                (e) => NextDropdownMenuEntry<CountryCodeContactAddressFormat>(
                  value: e,
                  label: e.readable(crmL10n),
                ),
              )
              .toList(),
          onSelected: stateNotifier.updateContactAddressFormat,
        ),
        ElbTwoColumnWrapTextItem(
          field: CountryCodeFields.fromEnum(CountryCodeField.taxScheme),
          initialText: initialEntity.taxScheme ?? '',
          onChanged: stateNotifier.updateTaxScheme,
        ),
        ElbTwoColumnWrapCustomItem<ElbCrmLocalizations>(
          label: crmL10n.country_code_show_state,
          childBuilder: (labelPosition) => Consumer(
            builder: (context, ref, child) {
              final showState = ref
                  .watch(countryCodeStateProvider(entityId, sessionId))
                  .requireValue
                  .showState;
              return AppCardCheckbox(
                label: crmL10n.country_code_show_state,
                value: showState,
                onChanged: stateNotifier.updateShowState,
              );
            },
          ),
        ),
        ElbTwoColumnWrapCustomItem<ElbCrmLocalizations>(
          label: crmL10n.country_code_primary,
          childBuilder: (labelPosition) => Consumer(
            builder: (context, ref, child) {
              final isPrimary = ref
                  .watch(countryCodeStateProvider(entityId, sessionId))
                  .requireValue
                  .isPrimary;
              return AppCardCheckbox(
                label: crmL10n.country_code_primary,
                value: isPrimary,
                onChanged: stateNotifier.updateIsPrimary,
              );
            },
          ),
        ),
      ],
    );
  }
}
