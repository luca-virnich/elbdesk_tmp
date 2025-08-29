part of '../contact_master_data.dart';

class _ContactGeneralView extends HookConsumerWidget {
  /// @nodoc
  const _ContactGeneralView({
    required this.initialEntity,
    required this.contactId,
    required this.readOnly,
    required this.sessionId,
    required this.validationGroupId,
    required this.width,
    required this.stateNotifier,
    required this.floatingWindowId,
  });

  final int contactId;

  final bool readOnly;

  final String sessionId;
  final String validationGroupId;

  final double width;
  final Contact initialEntity;
  final ContactState? stateNotifier;
  final String floatingWindowId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactType = ref.watch(
      contactStateProvider(contactId, sessionId).select(
        (value) => value.requireValue.general.type,
      ),
    );

    final isCompany = contactType == ContactType.company;

    final crmL10n = context.crmL10n;
    final isDraft = ref.watch(
      contactStateProvider(contactId, sessionId).select(
        (value) => value.requireValue.meta.isDraft,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CardSectionTitle(
          title: crmL10n.general,
        ),
        ElbTwoColumnWrap(
          customL10n: crmL10n,
          width: width,
          validationGroupId: validationGroupId,
          readOnly: readOnly,
          tableType: TableType.contact.name,
          columnLeft: [
            ElbTwoColumnDropdown.text(
              field: ContactFields.fromEnum(ContactField.type),
              readOnly: readOnly || !isDraft,
              initialValue: initialEntity.general.type,
              onChanged: (value) {
                stateNotifier?.updateType(value);
                ref
                    .read(validationGroupProvider(validationGroupId).notifier)
                    .clear();
              },
            ),
            if (isCompany)
              ElbTwoColumnItem.text(
                field: ContactFields.fromEnum(ContactField.fullName),
                initialValue: initialEntity.general.name,
                onChanged: (value) {
                  stateNotifier?.updateName(value);
                },
              ),
            if (!isCompany) ...[
              ElbTwoColumnItem.text(
                field: ContactFields.fromEnum(ContactField.firstName),
                initialValue: initialEntity.general.firstName,
                onChanged: (value) {
                  stateNotifier?.updateFirstName(value);
                },
              ),
              ElbTwoColumnItem.text(
                field: ContactFields.fromEnum(ContactField.lastName),
                initialValue: initialEntity.general.lastName,
                onChanged: (value) {
                  stateNotifier?.updateLastName(value);
                },
              ),
            ],
          ],
          columnRight: [
            ElbTwoColumnDropdown.lazyText(
              field: ContactFields.fromEnum(ContactField.salutationCode),
              initialValueText:
                  initialEntity.general.salutationCode?.description,
              lazyDataProvider: fetchAndWatchAllSalutationCodesProvider,
              lazyItemLabelBuilder: (SalutationCode value) => value.description,
              onChanged: (value) {
                stateNotifier?.updateSalutationCode(value);
              },
            ),
            ElbTwoColumnDropdown.lazyText(
              field: ContactFields.fromEnum(ContactField.languageCode),
              initialValueText: initialEntity.general.languageCode?.name,
              lazyDataProvider: fetchAndWatchAllLanguageCodesProvider,
              lazyItemLabelBuilder: (LanguageCode value) => value.name,
              onChanged: (value) {
                stateNotifier?.updateLanguageCode(value);
              },
            ),
            if (!isCompany)
              ElbTwoColumnItem.date(
                field: ContactFields.fromEnum(ContactField.birthDate),
                initialValue: initialEntity.general.birthDate,
                onChanged: (value) {
                  stateNotifier?.updateBirthDate(value);
                },
              ),
          ],
        ),
        _ImportantNoteField(
          contactId: contactId,
          width: width,
          sessionId: sessionId,
          readOnly: readOnly,
          validationGroupId: validationGroupId,
        ),
      ],
    );
  }
}

class _ImportantNoteField extends ConsumerWidget {
  const _ImportantNoteField({
    required this.contactId,
    required this.sessionId,
    required this.readOnly,
    required this.validationGroupId,
    required this.width,
  });
  final int contactId;
  final String sessionId;
  final bool readOnly;
  final String validationGroupId;
  final double width;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    return OneColumnWrap(
      width: width,
      builder: (labelPosition, childWidth) {
        return NextCardFormField.text(
          fieldSuggestion: FieldSuggestion(
            tableType: TableType.contact.name,
            fieldType: FilterFieldType.text,
            fieldKey:
                ContactFields.fromEnum(ContactField.importantNote).value.name,
          ),
          validationGroup: validationGroupId,
          onClear: (p0) {
            ref
                .read(contactStateProvider(contactId, sessionId).notifier)
                .updateImportantNote('');
          },
          readOnly: readOnly,
          maxLines: null,
          labelPosition: labelPosition,
          validator: ContactFields.fromEnum(ContactField.importantNote)
              .validator(l10n, crmL10n),
          onChanged: (v) {
            ref
                .read(contactStateProvider(contactId, sessionId).notifier)
                .updateImportantNote(v);
          },
          label: l10n.gen_important_note,
          initialText: ref
              .read(contactStateProvider(contactId, sessionId))
              .requireValue
              .general
              .importantNote,
        );
      },
    );
  }
}
