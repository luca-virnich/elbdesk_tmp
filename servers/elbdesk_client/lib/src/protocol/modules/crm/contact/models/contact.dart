/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../../../../modules/crm/country_code/models/country_code.dart' as _i2;
import '../../../../modules/crm/language_code/models/language_code.dart' as _i3;
import '../../../../modules/crm/salutation_code/models/salutation_code.dart'
    as _i4;
import '../../../../modules/core/admin_migration/models/migration_mats_person.dart'
    as _i5;
import '../../../../modules/core/admin_migration/models/migration_mats_company.dart'
    as _i6;
import '../../../../modules/crm/customer/models/customer.dart' as _i7;
import '../../../../modules/crm/crm_event/models/crm_event_contact_jt.dart'
    as _i8;

abstract class ContactDTO implements _i1.SerializableModel {
  ContactDTO._({
    this.id,
    required this.type,
    required this.firstName,
    this.title,
    required this.lastName,
    required this.initials,
    required this.fullName,
    this.birthDate,
    this.customId,
    this.customIdString,
    this.individualGreeting,
    required this.importantNote,
    required this.address,
    required this.address2,
    required this.address3,
    required this.postCode,
    required this.city,
    required this.state,
    this.countryCodeId,
    this.countryCode,
    this.languageCodeId,
    this.languageCode,
    this.salutationCodeId,
    this.salutationCode,
    required this.phone,
    this.phone2,
    required this.mobile,
    required this.email,
    required this.website,
    this.fax,
    this.migrationMatsPersonId,
    this.migrationMatsPerson,
    this.matsContactId,
    this.migrationMatsCompanyId,
    this.migrationMatsCompany,
    this.matsCompanyId,
    this.customer,
    this.events,
    required this.createdAt,
    this.createdById,
    this.lastModifiedAt,
    this.lastModifiedById,
    this.deletedAt,
    this.deletedById,
    this.editingById,
    this.editingSince,
    required this.isDraft,
    this.editingSession,
  });

  factory ContactDTO({
    int? id,
    required String type,
    required String firstName,
    String? title,
    required String lastName,
    required String initials,
    required String fullName,
    DateTime? birthDate,
    int? customId,
    String? customIdString,
    String? individualGreeting,
    required String importantNote,
    required String address,
    required String address2,
    required String address3,
    required String postCode,
    required String city,
    required String state,
    int? countryCodeId,
    _i2.CountryCodeDTO? countryCode,
    int? languageCodeId,
    _i3.LanguageCodeDTO? languageCode,
    int? salutationCodeId,
    _i4.SalutationCodeDTO? salutationCode,
    required String phone,
    String? phone2,
    required String mobile,
    required String email,
    required String website,
    String? fax,
    int? migrationMatsPersonId,
    _i5.MigrationMatsPersonDTO? migrationMatsPerson,
    String? matsContactId,
    int? migrationMatsCompanyId,
    _i6.MigrationMatsCompanyDTO? migrationMatsCompany,
    String? matsCompanyId,
    _i7.CustomerDTO? customer,
    List<_i8.CrmEventContactJT>? events,
    required DateTime createdAt,
    int? createdById,
    DateTime? lastModifiedAt,
    int? lastModifiedById,
    DateTime? deletedAt,
    int? deletedById,
    int? editingById,
    DateTime? editingSince,
    required bool isDraft,
    String? editingSession,
  }) = _ContactDTOImpl;

  factory ContactDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return ContactDTO(
      id: jsonSerialization['id'] as int?,
      type: jsonSerialization['type'] as String,
      firstName: jsonSerialization['firstName'] as String,
      title: jsonSerialization['title'] as String?,
      lastName: jsonSerialization['lastName'] as String,
      initials: jsonSerialization['initials'] as String,
      fullName: jsonSerialization['fullName'] as String,
      birthDate: jsonSerialization['birthDate'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['birthDate']),
      customId: jsonSerialization['customId'] as int?,
      customIdString: jsonSerialization['customIdString'] as String?,
      individualGreeting: jsonSerialization['individualGreeting'] as String?,
      importantNote: jsonSerialization['importantNote'] as String,
      address: jsonSerialization['address'] as String,
      address2: jsonSerialization['address2'] as String,
      address3: jsonSerialization['address3'] as String,
      postCode: jsonSerialization['postCode'] as String,
      city: jsonSerialization['city'] as String,
      state: jsonSerialization['state'] as String,
      countryCodeId: jsonSerialization['countryCodeId'] as int?,
      countryCode: jsonSerialization['countryCode'] == null
          ? null
          : _i2.CountryCodeDTO.fromJson(
              (jsonSerialization['countryCode'] as Map<String, dynamic>)),
      languageCodeId: jsonSerialization['languageCodeId'] as int?,
      languageCode: jsonSerialization['languageCode'] == null
          ? null
          : _i3.LanguageCodeDTO.fromJson(
              (jsonSerialization['languageCode'] as Map<String, dynamic>)),
      salutationCodeId: jsonSerialization['salutationCodeId'] as int?,
      salutationCode: jsonSerialization['salutationCode'] == null
          ? null
          : _i4.SalutationCodeDTO.fromJson(
              (jsonSerialization['salutationCode'] as Map<String, dynamic>)),
      phone: jsonSerialization['phone'] as String,
      phone2: jsonSerialization['phone2'] as String?,
      mobile: jsonSerialization['mobile'] as String,
      email: jsonSerialization['email'] as String,
      website: jsonSerialization['website'] as String,
      fax: jsonSerialization['fax'] as String?,
      migrationMatsPersonId: jsonSerialization['migrationMatsPersonId'] as int?,
      migrationMatsPerson: jsonSerialization['migrationMatsPerson'] == null
          ? null
          : _i5.MigrationMatsPersonDTO.fromJson(
              (jsonSerialization['migrationMatsPerson']
                  as Map<String, dynamic>)),
      matsContactId: jsonSerialization['matsContactId'] as String?,
      migrationMatsCompanyId:
          jsonSerialization['migrationMatsCompanyId'] as int?,
      migrationMatsCompany: jsonSerialization['migrationMatsCompany'] == null
          ? null
          : _i6.MigrationMatsCompanyDTO.fromJson(
              (jsonSerialization['migrationMatsCompany']
                  as Map<String, dynamic>)),
      matsCompanyId: jsonSerialization['matsCompanyId'] as String?,
      customer: jsonSerialization['customer'] == null
          ? null
          : _i7.CustomerDTO.fromJson(
              (jsonSerialization['customer'] as Map<String, dynamic>)),
      events: (jsonSerialization['events'] as List?)
          ?.map((e) =>
              _i8.CrmEventContactJT.fromJson((e as Map<String, dynamic>)))
          .toList(),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      createdById: jsonSerialization['createdById'] as int?,
      lastModifiedAt: jsonSerialization['lastModifiedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastModifiedAt']),
      lastModifiedById: jsonSerialization['lastModifiedById'] as int?,
      deletedAt: jsonSerialization['deletedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['deletedAt']),
      deletedById: jsonSerialization['deletedById'] as int?,
      editingById: jsonSerialization['editingById'] as int?,
      editingSince: jsonSerialization['editingSince'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['editingSince']),
      isDraft: jsonSerialization['isDraft'] as bool,
      editingSession: jsonSerialization['editingSession'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String type;

  String firstName;

  String? title;

  String lastName;

  String initials;

  String fullName;

  DateTime? birthDate;

  int? customId;

  String? customIdString;

  String? individualGreeting;

  String importantNote;

  String address;

  String address2;

  String address3;

  String postCode;

  String city;

  String state;

  int? countryCodeId;

  _i2.CountryCodeDTO? countryCode;

  int? languageCodeId;

  _i3.LanguageCodeDTO? languageCode;

  int? salutationCodeId;

  _i4.SalutationCodeDTO? salutationCode;

  String phone;

  String? phone2;

  String mobile;

  String email;

  String website;

  String? fax;

  int? migrationMatsPersonId;

  _i5.MigrationMatsPersonDTO? migrationMatsPerson;

  String? matsContactId;

  int? migrationMatsCompanyId;

  _i6.MigrationMatsCompanyDTO? migrationMatsCompany;

  String? matsCompanyId;

  _i7.CustomerDTO? customer;

  List<_i8.CrmEventContactJT>? events;

  DateTime createdAt;

  int? createdById;

  DateTime? lastModifiedAt;

  int? lastModifiedById;

  DateTime? deletedAt;

  int? deletedById;

  int? editingById;

  DateTime? editingSince;

  bool isDraft;

  String? editingSession;

  /// Returns a shallow copy of this [ContactDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ContactDTO copyWith({
    int? id,
    String? type,
    String? firstName,
    String? title,
    String? lastName,
    String? initials,
    String? fullName,
    DateTime? birthDate,
    int? customId,
    String? customIdString,
    String? individualGreeting,
    String? importantNote,
    String? address,
    String? address2,
    String? address3,
    String? postCode,
    String? city,
    String? state,
    int? countryCodeId,
    _i2.CountryCodeDTO? countryCode,
    int? languageCodeId,
    _i3.LanguageCodeDTO? languageCode,
    int? salutationCodeId,
    _i4.SalutationCodeDTO? salutationCode,
    String? phone,
    String? phone2,
    String? mobile,
    String? email,
    String? website,
    String? fax,
    int? migrationMatsPersonId,
    _i5.MigrationMatsPersonDTO? migrationMatsPerson,
    String? matsContactId,
    int? migrationMatsCompanyId,
    _i6.MigrationMatsCompanyDTO? migrationMatsCompany,
    String? matsCompanyId,
    _i7.CustomerDTO? customer,
    List<_i8.CrmEventContactJT>? events,
    DateTime? createdAt,
    int? createdById,
    DateTime? lastModifiedAt,
    int? lastModifiedById,
    DateTime? deletedAt,
    int? deletedById,
    int? editingById,
    DateTime? editingSince,
    bool? isDraft,
    String? editingSession,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'type': type,
      'firstName': firstName,
      if (title != null) 'title': title,
      'lastName': lastName,
      'initials': initials,
      'fullName': fullName,
      if (birthDate != null) 'birthDate': birthDate?.toJson(),
      if (customId != null) 'customId': customId,
      if (customIdString != null) 'customIdString': customIdString,
      if (individualGreeting != null) 'individualGreeting': individualGreeting,
      'importantNote': importantNote,
      'address': address,
      'address2': address2,
      'address3': address3,
      'postCode': postCode,
      'city': city,
      'state': state,
      if (countryCodeId != null) 'countryCodeId': countryCodeId,
      if (countryCode != null) 'countryCode': countryCode?.toJson(),
      if (languageCodeId != null) 'languageCodeId': languageCodeId,
      if (languageCode != null) 'languageCode': languageCode?.toJson(),
      if (salutationCodeId != null) 'salutationCodeId': salutationCodeId,
      if (salutationCode != null) 'salutationCode': salutationCode?.toJson(),
      'phone': phone,
      if (phone2 != null) 'phone2': phone2,
      'mobile': mobile,
      'email': email,
      'website': website,
      if (fax != null) 'fax': fax,
      if (migrationMatsPersonId != null)
        'migrationMatsPersonId': migrationMatsPersonId,
      if (migrationMatsPerson != null)
        'migrationMatsPerson': migrationMatsPerson?.toJson(),
      if (matsContactId != null) 'matsContactId': matsContactId,
      if (migrationMatsCompanyId != null)
        'migrationMatsCompanyId': migrationMatsCompanyId,
      if (migrationMatsCompany != null)
        'migrationMatsCompany': migrationMatsCompany?.toJson(),
      if (matsCompanyId != null) 'matsCompanyId': matsCompanyId,
      if (customer != null) 'customer': customer?.toJson(),
      if (events != null)
        'events': events?.toJson(valueToJson: (v) => v.toJson()),
      'createdAt': createdAt.toJson(),
      if (createdById != null) 'createdById': createdById,
      if (lastModifiedAt != null) 'lastModifiedAt': lastModifiedAt?.toJson(),
      if (lastModifiedById != null) 'lastModifiedById': lastModifiedById,
      if (deletedAt != null) 'deletedAt': deletedAt?.toJson(),
      if (deletedById != null) 'deletedById': deletedById,
      if (editingById != null) 'editingById': editingById,
      if (editingSince != null) 'editingSince': editingSince?.toJson(),
      'isDraft': isDraft,
      if (editingSession != null) 'editingSession': editingSession,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ContactDTOImpl extends ContactDTO {
  _ContactDTOImpl({
    int? id,
    required String type,
    required String firstName,
    String? title,
    required String lastName,
    required String initials,
    required String fullName,
    DateTime? birthDate,
    int? customId,
    String? customIdString,
    String? individualGreeting,
    required String importantNote,
    required String address,
    required String address2,
    required String address3,
    required String postCode,
    required String city,
    required String state,
    int? countryCodeId,
    _i2.CountryCodeDTO? countryCode,
    int? languageCodeId,
    _i3.LanguageCodeDTO? languageCode,
    int? salutationCodeId,
    _i4.SalutationCodeDTO? salutationCode,
    required String phone,
    String? phone2,
    required String mobile,
    required String email,
    required String website,
    String? fax,
    int? migrationMatsPersonId,
    _i5.MigrationMatsPersonDTO? migrationMatsPerson,
    String? matsContactId,
    int? migrationMatsCompanyId,
    _i6.MigrationMatsCompanyDTO? migrationMatsCompany,
    String? matsCompanyId,
    _i7.CustomerDTO? customer,
    List<_i8.CrmEventContactJT>? events,
    required DateTime createdAt,
    int? createdById,
    DateTime? lastModifiedAt,
    int? lastModifiedById,
    DateTime? deletedAt,
    int? deletedById,
    int? editingById,
    DateTime? editingSince,
    required bool isDraft,
    String? editingSession,
  }) : super._(
          id: id,
          type: type,
          firstName: firstName,
          title: title,
          lastName: lastName,
          initials: initials,
          fullName: fullName,
          birthDate: birthDate,
          customId: customId,
          customIdString: customIdString,
          individualGreeting: individualGreeting,
          importantNote: importantNote,
          address: address,
          address2: address2,
          address3: address3,
          postCode: postCode,
          city: city,
          state: state,
          countryCodeId: countryCodeId,
          countryCode: countryCode,
          languageCodeId: languageCodeId,
          languageCode: languageCode,
          salutationCodeId: salutationCodeId,
          salutationCode: salutationCode,
          phone: phone,
          phone2: phone2,
          mobile: mobile,
          email: email,
          website: website,
          fax: fax,
          migrationMatsPersonId: migrationMatsPersonId,
          migrationMatsPerson: migrationMatsPerson,
          matsContactId: matsContactId,
          migrationMatsCompanyId: migrationMatsCompanyId,
          migrationMatsCompany: migrationMatsCompany,
          matsCompanyId: matsCompanyId,
          customer: customer,
          events: events,
          createdAt: createdAt,
          createdById: createdById,
          lastModifiedAt: lastModifiedAt,
          lastModifiedById: lastModifiedById,
          deletedAt: deletedAt,
          deletedById: deletedById,
          editingById: editingById,
          editingSince: editingSince,
          isDraft: isDraft,
          editingSession: editingSession,
        );

  /// Returns a shallow copy of this [ContactDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ContactDTO copyWith({
    Object? id = _Undefined,
    String? type,
    String? firstName,
    Object? title = _Undefined,
    String? lastName,
    String? initials,
    String? fullName,
    Object? birthDate = _Undefined,
    Object? customId = _Undefined,
    Object? customIdString = _Undefined,
    Object? individualGreeting = _Undefined,
    String? importantNote,
    String? address,
    String? address2,
    String? address3,
    String? postCode,
    String? city,
    String? state,
    Object? countryCodeId = _Undefined,
    Object? countryCode = _Undefined,
    Object? languageCodeId = _Undefined,
    Object? languageCode = _Undefined,
    Object? salutationCodeId = _Undefined,
    Object? salutationCode = _Undefined,
    String? phone,
    Object? phone2 = _Undefined,
    String? mobile,
    String? email,
    String? website,
    Object? fax = _Undefined,
    Object? migrationMatsPersonId = _Undefined,
    Object? migrationMatsPerson = _Undefined,
    Object? matsContactId = _Undefined,
    Object? migrationMatsCompanyId = _Undefined,
    Object? migrationMatsCompany = _Undefined,
    Object? matsCompanyId = _Undefined,
    Object? customer = _Undefined,
    Object? events = _Undefined,
    DateTime? createdAt,
    Object? createdById = _Undefined,
    Object? lastModifiedAt = _Undefined,
    Object? lastModifiedById = _Undefined,
    Object? deletedAt = _Undefined,
    Object? deletedById = _Undefined,
    Object? editingById = _Undefined,
    Object? editingSince = _Undefined,
    bool? isDraft,
    Object? editingSession = _Undefined,
  }) {
    return ContactDTO(
      id: id is int? ? id : this.id,
      type: type ?? this.type,
      firstName: firstName ?? this.firstName,
      title: title is String? ? title : this.title,
      lastName: lastName ?? this.lastName,
      initials: initials ?? this.initials,
      fullName: fullName ?? this.fullName,
      birthDate: birthDate is DateTime? ? birthDate : this.birthDate,
      customId: customId is int? ? customId : this.customId,
      customIdString:
          customIdString is String? ? customIdString : this.customIdString,
      individualGreeting: individualGreeting is String?
          ? individualGreeting
          : this.individualGreeting,
      importantNote: importantNote ?? this.importantNote,
      address: address ?? this.address,
      address2: address2 ?? this.address2,
      address3: address3 ?? this.address3,
      postCode: postCode ?? this.postCode,
      city: city ?? this.city,
      state: state ?? this.state,
      countryCodeId: countryCodeId is int? ? countryCodeId : this.countryCodeId,
      countryCode: countryCode is _i2.CountryCodeDTO?
          ? countryCode
          : this.countryCode?.copyWith(),
      languageCodeId:
          languageCodeId is int? ? languageCodeId : this.languageCodeId,
      languageCode: languageCode is _i3.LanguageCodeDTO?
          ? languageCode
          : this.languageCode?.copyWith(),
      salutationCodeId:
          salutationCodeId is int? ? salutationCodeId : this.salutationCodeId,
      salutationCode: salutationCode is _i4.SalutationCodeDTO?
          ? salutationCode
          : this.salutationCode?.copyWith(),
      phone: phone ?? this.phone,
      phone2: phone2 is String? ? phone2 : this.phone2,
      mobile: mobile ?? this.mobile,
      email: email ?? this.email,
      website: website ?? this.website,
      fax: fax is String? ? fax : this.fax,
      migrationMatsPersonId: migrationMatsPersonId is int?
          ? migrationMatsPersonId
          : this.migrationMatsPersonId,
      migrationMatsPerson: migrationMatsPerson is _i5.MigrationMatsPersonDTO?
          ? migrationMatsPerson
          : this.migrationMatsPerson?.copyWith(),
      matsContactId:
          matsContactId is String? ? matsContactId : this.matsContactId,
      migrationMatsCompanyId: migrationMatsCompanyId is int?
          ? migrationMatsCompanyId
          : this.migrationMatsCompanyId,
      migrationMatsCompany: migrationMatsCompany is _i6.MigrationMatsCompanyDTO?
          ? migrationMatsCompany
          : this.migrationMatsCompany?.copyWith(),
      matsCompanyId:
          matsCompanyId is String? ? matsCompanyId : this.matsCompanyId,
      customer:
          customer is _i7.CustomerDTO? ? customer : this.customer?.copyWith(),
      events: events is List<_i8.CrmEventContactJT>?
          ? events
          : this.events?.map((e0) => e0.copyWith()).toList(),
      createdAt: createdAt ?? this.createdAt,
      createdById: createdById is int? ? createdById : this.createdById,
      lastModifiedAt:
          lastModifiedAt is DateTime? ? lastModifiedAt : this.lastModifiedAt,
      lastModifiedById:
          lastModifiedById is int? ? lastModifiedById : this.lastModifiedById,
      deletedAt: deletedAt is DateTime? ? deletedAt : this.deletedAt,
      deletedById: deletedById is int? ? deletedById : this.deletedById,
      editingById: editingById is int? ? editingById : this.editingById,
      editingSince:
          editingSince is DateTime? ? editingSince : this.editingSince,
      isDraft: isDraft ?? this.isDraft,
      editingSession:
          editingSession is String? ? editingSession : this.editingSession,
    );
  }
}
