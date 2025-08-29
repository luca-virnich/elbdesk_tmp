part of '../contact_master_data.dart';

class ContactAddress extends HookConsumerWidget {
  const ContactAddress({
    required this.validationGroupId,
    required this.contactId,
    required this.sessionId,
    required this.readOnly,
    required this.width,
    required this.initialEntity,
    required this.stateNotifier,
    required this.floatingWindowId,
    required this.navigatorKey,
    super.key,
  });

  final String validationGroupId;
  final int contactId;
  final String sessionId;
  final bool readOnly;
  final double width;
  final Contact initialEntity;
  final ContactState? stateNotifier;
  final String? floatingWindowId;
  final GlobalKey<NavigatorState>? navigatorKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final crmL10n = context.crmL10n;
    final stateFocus = useFocusNode();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CardSectionTitle(
          title: crmL10n.contact_address_singular,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElbTwoColumnWrap(
              customL10n: crmL10n,
              readOnly: readOnly,
              tableType: TableType.contact.name,
              width: width,
              validationGroupId: validationGroupId,
              columnLeft: [
                ElbTwoColumnWrapTextItem(
                  field: ContactFields.fromEnum(ContactField.address),
                  initialText: initialEntity.address.address,
                  onChanged: (value) {
                    stateNotifier?.updateAddress1(value);
                  },
                ),
                ElbTwoColumnWrapTextItem(
                  field: ContactFields.fromEnum(ContactField.address2),
                  initialText: initialEntity.address.address2,
                  onChanged: (value) {
                    stateNotifier?.updateAddress2(value);
                  },
                ),
                ElbTwoColumnWrapTextItem(
                  field: ContactFields.fromEnum(ContactField.postCode),
                  initialText: initialEntity.address.postCode,
                  onChanged: (value) {
                    stateNotifier?.updatePostCode(value);
                  },
                ),
              ],
              columnRight: [
                ElbTwoColumnWrapTextItem(
                  field: ContactFields.fromEnum(ContactField.city),
                  initialText: initialEntity.address.city,
                  onChanged: (value) {
                    stateNotifier?.updateCity(value);
                  },
                ),
                ElbTwoColumnWrapCustomItem<ElbCrmLocalizations>(
                  label: crmL10n.contact_state,
                  childBuilder: (labelPosition) => _StateField(
                    labelPosition: labelPosition,
                    stateFocus: stateFocus,
                    readOnly: readOnly,
                    validationGroupId: validationGroupId,
                    contactId: contactId,
                    sessionId: sessionId,
                    stateNotifier: stateNotifier,
                    initialState: initialEntity.address.state,
                  ),
                ),
                ElbTwoColumnDropdown.lazyText(
                  field: ContactFields.fromEnum(ContactField.countryCode),
                  initialValueText: initialEntity.address.countryCode?.name,
                  lazyDataProvider: fetchAndWatchAllCountryCodesProvider,
                  lazyItemLabelBuilder: (CountryCode value) => value.name,
                  onChanged: (value) => stateNotifier?.updateCountryCode(value),
                ),
                // ElbTwoColumnWrapLazyTextDropdownItem(
                //   field: ContactFields.fromEnum(ContactField.countryCode),
                //   initialValue: initialEntity.address.countryCode?.name ?? '',
                //   dataProvider: fetchAndWatchAllCountryCodesProvider,
                //   onSelected: (value) {
                //     stateNotifier?.updateCountryCode(value);
                //   },
                //   itemLabelBuilder: (value) => value.name,
                // ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _StateField extends HookConsumerWidget {
  const _StateField({
    required this.labelPosition,
    required this.stateFocus,
    required this.readOnly,
    required this.validationGroupId,
    required this.contactId,
    required this.sessionId,
    required this.stateNotifier,
    required this.initialState,
  });

  final NextCardFormFieldLabelPosition labelPosition;
  final FocusNode stateFocus;
  final bool readOnly;
  final String validationGroupId;
  final int contactId;
  final String sessionId;
  final ContactState? stateNotifier;
  final String? initialState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCountry = ref
        .watch(contactStateProvider(contactId, sessionId))
        .requireValue
        .address
        .countryCode;

    ref.listen(
      contactStateProvider(contactId, sessionId).select(
        (value) => value.requireValue.address.countryCode,
      ),
      (previous, next) {
        final prevShowState = previous?.showState ?? false;
        final nextShowState = next?.showState ?? false;
        if (!prevShowState && nextShowState) {
          stateFocus.requestFocus();
        }
      },
    );

    final showState = selectedCountry?.showState ?? false;

    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    if (!showState) {
      return const SizedBox.shrink();
    }

    return NextCardFormField.text(
      labelPosition: labelPosition,
      focusNode: stateFocus,
      label: ContactFields.fromEnum(ContactField.state).readable(l10n, crmL10n),
      readOnly: readOnly,
      validator:
          ContactFields.fromEnum(ContactField.state).validator(l10n, crmL10n),
      validationGroup: validationGroupId,
      initialText: initialState,
      onChanged: (v) {
        stateNotifier?.updateState(v);
      },
      onClear: (v) {
        stateNotifier?.updateState('');
      },
    );
  }
}
