import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations.dart';

/// Contact Type Wrapper
///
// Extension for providing readable field names, filter types, and validators
// for ContactField
extension ContactTypeExtension on ContactType {
  /// Returns the readable name of the field
  String readable(ElbCrmLocalizations l10n) {
    return switch (this) {
      ContactType.person => l10n.contact_type_person,
      ContactType.company => l10n.contact_type_company,
    };
  }
}

class ContactTypeHelper {
  const ContactTypeHelper._();
  static ContactType fromString(String type) {
    return ContactType.values.firstWhere(
      (e) => e.name == type,
      orElse: () => throw StateError('Invalid ContactType: type'),
    );
  }
}
