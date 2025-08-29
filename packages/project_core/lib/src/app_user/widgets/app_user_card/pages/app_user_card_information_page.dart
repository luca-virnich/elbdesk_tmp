part of '../app_user_card.dart';

class _AppUserCardInformationPage extends HookWidget {
  const _AppUserCardInformationPage({
    required this.stateNotifier,
    required this.initialEntity,
    required this.fullNameErrorNotifier,
    required this.initialsErrorNotifier,
    required this.workEmailErrorNotifier,
    required this.readOnly,
    required this.validationGroupId,
    required this.appUserId,
    required this.sessionId,
  });

  final AppUserState stateNotifier;
  final AppUser initialEntity;

  final ValueNotifier<String?> fullNameErrorNotifier;
  final ValueNotifier<String?> initialsErrorNotifier;
  final ValueNotifier<String?> workEmailErrorNotifier;
  final bool readOnly;
  final String validationGroupId;
  final int appUserId;
  final String sessionId;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    final initialsController = useTextEditingController(
      text: initialEntity.general.initials,
    );

    return ScrollableCardItem.constrained(
      builder: (context, constraints) {
        final pageWidth = constraints.maxWidth;
        return Column(
          children: [
            CollapsibleCardSection(
              title: l10n.admin_user_info,
              identifier:
                  ComponentIdentifier.appUserCardGeneralInformation.name,
              child: ElbTwoColumnWrap(
                readOnly: readOnly,
                customL10n: crmL10n,
                width: pageWidth,
                tableType: TableType.appUser.name,
                validationGroupId: validationGroupId,
                columnLeft: [
                  ElbTwoColumnWrapTextItem(
                    field: AppUserFields.fromEnum(AppUserField.firstName),
                    initialText: initialEntity.general.firstName,
                    onChanged: stateNotifier.updateFirstName,
                    customErrorMessageNotifier: fullNameErrorNotifier,
                  ),
                  ElbTwoColumnWrapTextItem(
                    field: AppUserFields.fromEnum(AppUserField.lastName),
                    initialText: initialEntity.general.lastName,
                    onChanged: stateNotifier.updateSurname,
                    customErrorMessageNotifier: fullNameErrorNotifier,
                  ),
                ],
                columnRight: [
                  ElbTwoColumnWrapTextItem(
                    field: AppUserFields.fromEnum(AppUserField.initials),
                    maxLength: 4,
                    customErrorMessageNotifier: initialsErrorNotifier,
                    controller: initialsController,
                    onChanged: (v) {
                      final trimmedUpperCase = v.trim().toUpperCase();
                      initialsController.value = TextEditingValue(
                        text: trimmedUpperCase,
                        selection: TextSelection.collapsed(
                          offset: trimmedUpperCase.length,
                        ),
                      );
                      stateNotifier.updateInitials(trimmedUpperCase);
                    },
                    onClear: (value) {
                      initialsController.clear();
                      stateNotifier.updateInitials('');
                    },
                  ),
                  ElbTwoColumnWrapCustomItem<ElbCrmLocalizations>(
                    label: l10n.admin_user_email_work,
                    childBuilder: (labelPosition) => _EmailField(
                      stateNotifier: stateNotifier,
                      initialState: initialEntity,
                      validationGroupId: validationGroupId,
                      workEmailErrorNotifier: workEmailErrorNotifier,
                      readOnly: readOnly,
                      labelPosition: labelPosition,
                      appUserId: appUserId,
                      sessionId: sessionId,
                    ),
                  ),
                ],
              ),
            ),
            const CardSectionDivider(),
            CollapsibleCardSection(
              title: l10n.app_user_employee_information,
              identifier:
                  ComponentIdentifier.appUserCardEmployeeInformation.name,
              child: ElbTwoColumnWrap(
                customL10n: crmL10n,
                validationGroupId: validationGroupId,
                width: pageWidth,
                readOnly: readOnly,
                columnLeft: [
                  ElbTwoColumnWrapTextItem(
                    field: AppUserFields.fromEnum(AppUserField.employeeNumber),
                    initialText: initialEntity.employee.employeeNumber,
                    onChanged: stateNotifier.updateEmployeeNumber,
                  ),
                  ElbTwoColumnWrapDateItem(
                    field: AppUserFields.fromEnum(AppUserField.terminationDate),
                    initialDate: initialEntity.employee.terminationDate,
                    onChanged: stateNotifier.updateTerminationDate,
                    onClear: (value) {
                      stateNotifier.updateTerminationDate(null);
                    },
                  ),
                  ElbTwoColumnWrapTextItem(
                    field: AppUserFields.fromEnum(AppUserField.position),
                    initialText: initialEntity.employee.position,
                    onChanged: stateNotifier.updatePosition,
                  ),
                  ElbTwoColumnWrapCustomItem<ElbCrmLocalizations>(
                    label: l10n.app_user_is_active,
                    childBuilder: (labelPosition) => Consumer(
                      builder: (context, ref, child) {
                        final isActive = ref.watch(
                          appUserStateProvider(appUserId, sessionId).select(
                            (value) => value.requireValue.employee.isActive,
                          ),
                        );
                        return AppCardCheckbox(
                          readOnly: readOnly,
                          value: isActive,
                          onChanged: stateNotifier.updateIsActive,
                          label: l10n.app_user_is_active,
                        );
                      },
                    ),
                  ),
                ],
                columnRight: [
                  ElbTwoColumnWrapTextItem(
                    field: AppUserFields.fromEnum(AppUserField.costCenter),
                    initialText: initialEntity.employee.costCenter,
                    onChanged: stateNotifier.updateCostCenter,
                  ),
                  ElbTwoColumnWrapDateItem(
                    field: AppUserFields.fromEnum(AppUserField.entryDate),
                    initialDate: initialEntity.employee.entryDate,
                    onChanged: stateNotifier.updateEntryDate,
                    onClear: (value) {
                      stateNotifier.updateEntryDate(null);
                    },
                    validator: (value) =>
                        AppUserFields.fromEnum(AppUserField.entryDate)
                            .validator(l10n, crmL10n)
                            ?.call(value?.toIso8601String()),
                  ),
                  ElbTwoColumnWrapLazyTextDropdownItem(
                    field: AppUserFields.fromEnum(AppUserField.department),
                    dataProvider: fetchAllDepartmentCodesProvider,
                    itemLabelBuilder: (value) => value.description,
                    initialValue:
                        initialEntity.employee.department?.description ?? '',
                    onSelected: stateNotifier.updateDepartment,
                  ),
                ],
              ),
            ),
            const CardSectionDivider(),
            CollapsibleCardSection(
              title: crmL10n.contact_address_singular,
              identifier:
                  ComponentIdentifier.appUserCardAddressInformation.name,
              child: ElbTwoColumnWrap(
                customL10n: crmL10n,
                width: constraints.maxWidth,
                readOnly: readOnly,
                validationGroupId: validationGroupId,
                columnLeft: [
                  ElbTwoColumnWrapTextItem(
                    field: AppUserFields.fromEnum(AppUserField.address),
                    initialText: initialEntity.address.address,
                    onChanged: stateNotifier.updateAddress1,
                  ),
                  ElbTwoColumnWrapTextItem(
                    field: AppUserFields.fromEnum(AppUserField.address2),
                    initialText: initialEntity.address.address2,
                    onChanged: stateNotifier.updateAddress2,
                  ),
                ],
                columnRight: [
                  ElbTwoColumnWrapTextItem(
                    field: AppUserFields.fromEnum(AppUserField.postCode),
                    initialText: initialEntity.address.postCode,
                    onChanged: stateNotifier.updatePostCode,
                  ),
                  ElbTwoColumnWrapTextItem(
                    initialText: initialEntity.address.city,
                    onChanged: stateNotifier.updateCity,
                    field: AppUserFields.fromEnum(AppUserField.city),
                  ),
                  ElbTwoColumnWrapLazyTextDropdownItem(
                    field: AppUserFields.fromEnum(AppUserField.country),
                    dataProvider: fetchAllCountryCodesProvider(sessionId),
                    itemLabelBuilder: (value) => value.name,
                    initialValue: initialEntity.address.countryCode?.name ?? '',
                    onSelected: (value) {
                      if (value != null) {
                        stateNotifier.updateCountry(value);
                      }
                    },
                  ),
                ],
              ),
            ),
            const CardSectionDivider(),
            CollapsibleCardSection(
              title: l10n.app_user_communication,
              identifier:
                  ComponentIdentifier.appUserCardCommunicationInformation.name,
              child: ElbTwoColumnWrap(
                customL10n: crmL10n,
                readOnly: readOnly,
                validationGroupId: validationGroupId,
                width: constraints.maxWidth,
                columnLeft: [
                  ElbTwoColumnWrapPhoneItem(
                    field: AppUserFields.fromEnum(AppUserField.phone),
                    initialPhone: initialEntity.communication.phone,
                    onChanged: stateNotifier.updatePhone,
                  ),
                  ElbTwoColumnWrapPhoneItem(
                    field: AppUserFields.fromEnum(AppUserField.mobile),
                    initialPhone: initialEntity.communication.mobile,
                    onChanged: stateNotifier.updateMobile,
                    validator: (value) =>
                        AppUserFields.fromEnum(AppUserField.mobile)
                            .validator(l10n, crmL10n)
                            ?.call(value),
                  ),
                ],
                columnRight: [
                  ElbTwoColumnWrapEmailItem(
                    field: AppUserFields.fromEnum(AppUserField.privateEmail),
                    initialEmail: initialEntity.communication.privateEmail,
                    onChanged: stateNotifier.updatePrivateEmail,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _EmailField extends HookConsumerWidget {
  const _EmailField({
    required this.stateNotifier,
    required this.initialState,
    required this.validationGroupId,
    required this.workEmailErrorNotifier,
    required this.readOnly,
    required this.labelPosition,
    required this.appUserId,
    required this.sessionId,
  });

  final bool readOnly;
  final AppUserState stateNotifier;
  final AppUser initialState;
  final NextCardFormFieldLabelPosition labelPosition;
  final String validationGroupId;
  final ValueNotifier<String?> workEmailErrorNotifier;
  final int appUserId;
  final String sessionId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    final isDraft = ref.watch(
      appUserStateProvider(appUserId, sessionId).select(
        (value) => value.requireValue.meta.isDraft,
      ),
    );
    return ExcludeFocus(
      excluding: readOnly || !isDraft,
      child: NextCardFormField.email(
        customErrorMessageNotifier: workEmailErrorNotifier,
        focusOrder: 4,
        labelPosition: labelPosition,
        validationGroup: validationGroupId,
        validator: (value) => AppUserFields.fromEnum(AppUserField.email)
            .validator(l10n, crmL10n)
            ?.call(value),
        readOnly: readOnly || !isDraft,
        initialText: initialState.userInfo.email,
        onClear: (_) {
          stateNotifier.updateEmail('');
        },
        label: l10n.admin_user_email_work,
        onChanged: stateNotifier.updateEmail,
      ),
    );
  }
}
