part of '../contact_master_data.dart';

class ContactCommunication extends ConsumerWidget {
  const ContactCommunication({
    required this.validationGroupId,
    required this.contactId,
    required this.sessionId,
    required this.readOnly,
    required this.width,
    required this.initialEntity,
    required this.stateNotifier,
    super.key,
  });

  final String validationGroupId;
  final int contactId;
  final String sessionId;
  final bool readOnly;
  final double width;
  final Contact initialEntity;
  final ContactState? stateNotifier;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CardSectionTitle(
          title: crmL10n.communication,
        ),
        ElbTwoColumnWrap(
          customL10n: crmL10n,
          tableType: TableType.contact.name,
          width: width,
          readOnly: readOnly,
          validationGroupId: validationGroupId,
          columnLeft: [
            ElbTwoColumnWrapPhoneItem(
              field: ContactFields.fromEnum(ContactField.phone),
              initialPhone: initialEntity.communication.phone,
              onChanged: (v) {
                stateNotifier?.updatePhone(v);
              },
            ),
            ElbTwoColumnWrapPhoneItem(
              field: ContactFields.fromEnum(ContactField.mobile),
              initialPhone: initialEntity.communication.mobile,
              onChanged: (v) {
                stateNotifier?.updateMobile(v);
              },
            ),
          ],
          columnRight: [
            ElbTwoColumnWrapWebsiteItem(
              field: ContactFields.fromEnum(ContactField.website),
              initialWebsite: initialEntity.communication.website,
              onChanged: (v) {
                stateNotifier?.updateWebsite(v);
              },
            ),
            ElbTwoColumnWrapEmailItem(
              field: ContactFields.fromEnum(ContactField.email),
              initialEmail: initialEntity.communication.email,
              onChanged: (v) {
                stateNotifier?.updateEmail(v);
              },
            ),
          ],
        ),
      ],
    );
  }
}
