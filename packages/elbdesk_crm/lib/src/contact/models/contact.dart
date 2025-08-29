import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:elbdesk_crm/src/contact/extensions/contact_type_extension.dart';
import 'package:elbdesk_crm/src/salutation_code/models/salutation_code.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact.freezed.dart';
part 'contact.g.dart';

/// Contact
/// This is the app side Contact model. It is used to store contact information
/// for a contact during runtime. The ContactDTO is fetched from the server and
/// converted to a Contact object.
///
/// To parse the ContactDTO to and from a Contact object, the fromDTO and toDTO
/// methods are used.
///
@freezed
class Contact with _$Contact, HasMetaData {
  /// Contact constructor
  const factory Contact({
    required ContactGeneral general,
    required ContactAddress address,
    required ContactCommunication communication,
    required Customer? customer,
    required DataMeta meta,
    required int? customId,
    required int? migrationMatsPersonId,
    required int? migrationMatsCompanyId,
  }) = _Contact;

  factory Contact.fromJson(Map<String, Object?> json) =>
      _$ContactFromJson(json);

  /// Contact from DTO
  factory Contact.fromDTO(ContactDTO dto) {
    final contactGeneral = ContactGeneral(
      firstName: dto.firstName,
      initials: dto.initials,
      lastName: dto.lastName,
      name: dto.fullName,
      birthDate: dto.birthDate?.toLocal(),
      type: ContactTypeHelper.fromString(dto.type),
      importantNote: dto.importantNote,
      salutationCode: dto.salutationCode != null
          ? SalutationCode.fromDTO(dto.salutationCode!)
          : null,
      languageCode: dto.languageCode != null
          ? LanguageCode.fromDTO(dto.languageCode!)
          : null,
    );

    final address = ContactAddress(
      address: dto.address,
      address2: dto.address2,
      postCode: dto.postCode,
      city: dto.city,
      state: dto.state,
      countryCode: dto.countryCode != null
          ? CountryCode.fromDTO(dto.countryCode!)
          : null,
      address3: dto.address3,
    );

    final communication = ContactCommunication(
      phone: dto.phone,
      email: dto.email,
      mobile: dto.mobile,
      website: dto.website,
    );

    final customer =
        dto.customer != null ? Customer.fromDTO(dto.customer!) : null;

    final dataMeta = DataMeta.fromDTO(dto);

    return Contact(
      customId: dto.customId,
      meta: dataMeta,
      address: address,
      communication: communication,
      customer: customer,
      general: contactGeneral,
      migrationMatsPersonId: dto.migrationMatsPersonId,
      migrationMatsCompanyId: dto.migrationMatsCompanyId,
    );
  }

  const Contact._();

  bool get isCompany => general.type == ContactType.company;
  bool get isDebtor => customer != null;

  String get fullContactId {
    return 'K-$customId';
  }

  /// Contact to DTO
  ContactDTO toDTO() {
    if (general.type == null) {
      throw ElbException(
        message: 'Contact Type is required',
        exceptionType: ElbExceptionType.validationFormError,
      );
    }
    return ContactDTO(
      customId: customId,
      customIdString: customId?.toString(),
      importantNote: general.importantNote,
      id: meta.id,
      lastModifiedAt: meta.lastModifiedAt,
      createdAt: meta.createdAt!,
      isDraft: false,
      type: general.type!.name,
      address: address.address,
      address2: address.address2,
      address3: address.address3,
      postCode: address.postCode,
      city: address.city,
      state: address.state,
      countryCode: address.countryCode?.toDTO(),
      countryCodeId: address.countryCode?.toDTO().id,
      phone: communication.phone,
      email: communication.email,
      mobile: communication.mobile,
      website: communication.website,
      birthDate: general.birthDate,
      firstName: general.firstName,
      lastName: general.lastName,
      fullName: general.name,
      languageCodeId: general.languageCode?.toDTO().id,
      languageCode: general.languageCode?.toDTO(),
      salutationCodeId: general.salutationCode?.toDTO().id,
      salutationCode: general.salutationCode?.toDTO(),
      initials: general.initials,
      customer: customer?.toDTO(),
    );
  }
}

/// ContactGeneral
///
/// The ContactGeneral model is used to store general information about a
/// contact.z
/// This is just a subclass to structure the contact information
@freezed
class ContactGeneral with _$ContactGeneral {
  /// ContactGeneral constructor
  const factory ContactGeneral({
    required String firstName,
    required String lastName,
    required String initials,
    required String name,
    required LanguageCode? languageCode,
    required ContactType? type,
    required SalutationCode? salutationCode,
    required String importantNote,
    DateTime? birthDate,
  }) = _ContactGeneral;

  const ContactGeneral._();

  factory ContactGeneral.fromJson(Map<String, Object?> json) =>
      _$ContactGeneralFromJson(json);
}

@freezed
class ContactCommunication with _$ContactCommunication {
  /// Communication constructor
  const factory ContactCommunication({
    required String phone,
    required String mobile,
    required String email,
    required String website,
  }) = _ContactCommunication;

  const ContactCommunication._();

  factory ContactCommunication.fromJson(Map<String, Object?> json) =>
      _$ContactCommunicationFromJson(json);
}

@freezed
class ContactAddress with _$ContactAddress {
  /// Address constructor
  const factory ContactAddress({
    required String address,
    required String address2,
    required String address3,
    required String postCode,
    required String city,
    required String state,
    required CountryCode? countryCode,
  }) = _ContactAddress;

  const ContactAddress._();

  factory ContactAddress.fromJson(Map<String, Object?> json) =>
      _$ContactAddressFromJson(json);

  /// Address initial
  factory ContactAddress.initial() => const ContactAddress(
        address: '',
        address2: '',
        address3: '',
        postCode: '',
        city: '',
        state: '',
        countryCode: null,
      );
}

class ContactAdditionalData implements AdditionalEntityData {
  const ContactAdditionalData({
    required this.contactType,
  });

  factory ContactAdditionalData.fromJson(Map<String, dynamic> json) {
    return ContactAdditionalData(
      contactType: Parser.enumFromString(
            ContactType.values,
            json['contactType'] as String?,
          ) ??
          ContactType.person,
    );
  }

  final ContactType contactType;

  @override
  Map<String, String> toJson() {
    return {
      'contactType': contactType.name,
    };
  }
}
