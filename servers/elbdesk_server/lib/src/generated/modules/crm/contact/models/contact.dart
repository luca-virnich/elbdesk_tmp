/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
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

abstract class ContactDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = ContactDTOTable();

  static const db = ContactDTORepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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
      if (countryCode != null) 'countryCode': countryCode?.toJsonForProtocol(),
      if (languageCodeId != null) 'languageCodeId': languageCodeId,
      if (languageCode != null)
        'languageCode': languageCode?.toJsonForProtocol(),
      if (salutationCodeId != null) 'salutationCodeId': salutationCodeId,
      if (salutationCode != null)
        'salutationCode': salutationCode?.toJsonForProtocol(),
      'phone': phone,
      if (phone2 != null) 'phone2': phone2,
      'mobile': mobile,
      'email': email,
      'website': website,
      if (fax != null) 'fax': fax,
      if (migrationMatsPersonId != null)
        'migrationMatsPersonId': migrationMatsPersonId,
      if (migrationMatsPerson != null)
        'migrationMatsPerson': migrationMatsPerson?.toJsonForProtocol(),
      if (matsContactId != null) 'matsContactId': matsContactId,
      if (migrationMatsCompanyId != null)
        'migrationMatsCompanyId': migrationMatsCompanyId,
      if (migrationMatsCompany != null)
        'migrationMatsCompany': migrationMatsCompany?.toJsonForProtocol(),
      if (matsCompanyId != null) 'matsCompanyId': matsCompanyId,
      if (customer != null) 'customer': customer?.toJsonForProtocol(),
      if (events != null)
        'events': events?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
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

  static ContactDTOInclude include({
    _i2.CountryCodeDTOInclude? countryCode,
    _i3.LanguageCodeDTOInclude? languageCode,
    _i4.SalutationCodeDTOInclude? salutationCode,
    _i5.MigrationMatsPersonDTOInclude? migrationMatsPerson,
    _i6.MigrationMatsCompanyDTOInclude? migrationMatsCompany,
    _i7.CustomerDTOInclude? customer,
    _i8.CrmEventContactJTIncludeList? events,
  }) {
    return ContactDTOInclude._(
      countryCode: countryCode,
      languageCode: languageCode,
      salutationCode: salutationCode,
      migrationMatsPerson: migrationMatsPerson,
      migrationMatsCompany: migrationMatsCompany,
      customer: customer,
      events: events,
    );
  }

  static ContactDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<ContactDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ContactDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ContactDTOTable>? orderByList,
    ContactDTOInclude? include,
  }) {
    return ContactDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ContactDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ContactDTO.t),
      include: include,
    );
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

class ContactDTOTable extends _i1.Table<int?> {
  ContactDTOTable({super.tableRelation}) : super(tableName: 'ed_crm_contact') {
    type = _i1.ColumnString(
      'type',
      this,
    );
    firstName = _i1.ColumnString(
      'firstName',
      this,
    );
    title = _i1.ColumnString(
      'title',
      this,
    );
    lastName = _i1.ColumnString(
      'lastName',
      this,
    );
    initials = _i1.ColumnString(
      'initials',
      this,
    );
    fullName = _i1.ColumnString(
      'fullName',
      this,
    );
    birthDate = _i1.ColumnDateTime(
      'birthDate',
      this,
    );
    customId = _i1.ColumnInt(
      'customId',
      this,
    );
    customIdString = _i1.ColumnString(
      'customIdString',
      this,
    );
    individualGreeting = _i1.ColumnString(
      'individualGreeting',
      this,
    );
    importantNote = _i1.ColumnString(
      'importantNote',
      this,
    );
    address = _i1.ColumnString(
      'address',
      this,
    );
    address2 = _i1.ColumnString(
      'address2',
      this,
    );
    address3 = _i1.ColumnString(
      'address3',
      this,
    );
    postCode = _i1.ColumnString(
      'postCode',
      this,
    );
    city = _i1.ColumnString(
      'city',
      this,
    );
    state = _i1.ColumnString(
      'state',
      this,
    );
    countryCodeId = _i1.ColumnInt(
      'countryCodeId',
      this,
    );
    languageCodeId = _i1.ColumnInt(
      'languageCodeId',
      this,
    );
    salutationCodeId = _i1.ColumnInt(
      'salutationCodeId',
      this,
    );
    phone = _i1.ColumnString(
      'phone',
      this,
    );
    phone2 = _i1.ColumnString(
      'phone2',
      this,
    );
    mobile = _i1.ColumnString(
      'mobile',
      this,
    );
    email = _i1.ColumnString(
      'email',
      this,
    );
    website = _i1.ColumnString(
      'website',
      this,
    );
    fax = _i1.ColumnString(
      'fax',
      this,
    );
    migrationMatsPersonId = _i1.ColumnInt(
      'migrationMatsPersonId',
      this,
    );
    matsContactId = _i1.ColumnString(
      'matsContactId',
      this,
    );
    migrationMatsCompanyId = _i1.ColumnInt(
      'migrationMatsCompanyId',
      this,
    );
    matsCompanyId = _i1.ColumnString(
      'matsCompanyId',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    createdById = _i1.ColumnInt(
      'createdById',
      this,
    );
    lastModifiedAt = _i1.ColumnDateTime(
      'lastModifiedAt',
      this,
    );
    lastModifiedById = _i1.ColumnInt(
      'lastModifiedById',
      this,
    );
    deletedAt = _i1.ColumnDateTime(
      'deletedAt',
      this,
    );
    deletedById = _i1.ColumnInt(
      'deletedById',
      this,
    );
    editingById = _i1.ColumnInt(
      'editingById',
      this,
    );
    editingSince = _i1.ColumnDateTime(
      'editingSince',
      this,
    );
    isDraft = _i1.ColumnBool(
      'isDraft',
      this,
    );
    editingSession = _i1.ColumnString(
      'editingSession',
      this,
    );
  }

  late final _i1.ColumnString type;

  late final _i1.ColumnString firstName;

  late final _i1.ColumnString title;

  late final _i1.ColumnString lastName;

  late final _i1.ColumnString initials;

  late final _i1.ColumnString fullName;

  late final _i1.ColumnDateTime birthDate;

  late final _i1.ColumnInt customId;

  late final _i1.ColumnString customIdString;

  late final _i1.ColumnString individualGreeting;

  late final _i1.ColumnString importantNote;

  late final _i1.ColumnString address;

  late final _i1.ColumnString address2;

  late final _i1.ColumnString address3;

  late final _i1.ColumnString postCode;

  late final _i1.ColumnString city;

  late final _i1.ColumnString state;

  late final _i1.ColumnInt countryCodeId;

  _i2.CountryCodeDTOTable? _countryCode;

  late final _i1.ColumnInt languageCodeId;

  _i3.LanguageCodeDTOTable? _languageCode;

  late final _i1.ColumnInt salutationCodeId;

  _i4.SalutationCodeDTOTable? _salutationCode;

  late final _i1.ColumnString phone;

  late final _i1.ColumnString phone2;

  late final _i1.ColumnString mobile;

  late final _i1.ColumnString email;

  late final _i1.ColumnString website;

  late final _i1.ColumnString fax;

  late final _i1.ColumnInt migrationMatsPersonId;

  _i5.MigrationMatsPersonDTOTable? _migrationMatsPerson;

  late final _i1.ColumnString matsContactId;

  late final _i1.ColumnInt migrationMatsCompanyId;

  _i6.MigrationMatsCompanyDTOTable? _migrationMatsCompany;

  late final _i1.ColumnString matsCompanyId;

  _i7.CustomerDTOTable? _customer;

  _i8.CrmEventContactJTTable? ___events;

  _i1.ManyRelation<_i8.CrmEventContactJTTable>? _events;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnInt createdById;

  late final _i1.ColumnDateTime lastModifiedAt;

  late final _i1.ColumnInt lastModifiedById;

  late final _i1.ColumnDateTime deletedAt;

  late final _i1.ColumnInt deletedById;

  late final _i1.ColumnInt editingById;

  late final _i1.ColumnDateTime editingSince;

  late final _i1.ColumnBool isDraft;

  late final _i1.ColumnString editingSession;

  _i2.CountryCodeDTOTable get countryCode {
    if (_countryCode != null) return _countryCode!;
    _countryCode = _i1.createRelationTable(
      relationFieldName: 'countryCode',
      field: ContactDTO.t.countryCodeId,
      foreignField: _i2.CountryCodeDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.CountryCodeDTOTable(tableRelation: foreignTableRelation),
    );
    return _countryCode!;
  }

  _i3.LanguageCodeDTOTable get languageCode {
    if (_languageCode != null) return _languageCode!;
    _languageCode = _i1.createRelationTable(
      relationFieldName: 'languageCode',
      field: ContactDTO.t.languageCodeId,
      foreignField: _i3.LanguageCodeDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.LanguageCodeDTOTable(tableRelation: foreignTableRelation),
    );
    return _languageCode!;
  }

  _i4.SalutationCodeDTOTable get salutationCode {
    if (_salutationCode != null) return _salutationCode!;
    _salutationCode = _i1.createRelationTable(
      relationFieldName: 'salutationCode',
      field: ContactDTO.t.salutationCodeId,
      foreignField: _i4.SalutationCodeDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.SalutationCodeDTOTable(tableRelation: foreignTableRelation),
    );
    return _salutationCode!;
  }

  _i5.MigrationMatsPersonDTOTable get migrationMatsPerson {
    if (_migrationMatsPerson != null) return _migrationMatsPerson!;
    _migrationMatsPerson = _i1.createRelationTable(
      relationFieldName: 'migrationMatsPerson',
      field: ContactDTO.t.migrationMatsPersonId,
      foreignField: _i5.MigrationMatsPersonDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.MigrationMatsPersonDTOTable(tableRelation: foreignTableRelation),
    );
    return _migrationMatsPerson!;
  }

  _i6.MigrationMatsCompanyDTOTable get migrationMatsCompany {
    if (_migrationMatsCompany != null) return _migrationMatsCompany!;
    _migrationMatsCompany = _i1.createRelationTable(
      relationFieldName: 'migrationMatsCompany',
      field: ContactDTO.t.migrationMatsCompanyId,
      foreignField: _i6.MigrationMatsCompanyDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i6.MigrationMatsCompanyDTOTable(tableRelation: foreignTableRelation),
    );
    return _migrationMatsCompany!;
  }

  _i7.CustomerDTOTable get customer {
    if (_customer != null) return _customer!;
    _customer = _i1.createRelationTable(
      relationFieldName: 'customer',
      field: ContactDTO.t.id,
      foreignField: _i7.CustomerDTO.t.contactId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i7.CustomerDTOTable(tableRelation: foreignTableRelation),
    );
    return _customer!;
  }

  _i8.CrmEventContactJTTable get __events {
    if (___events != null) return ___events!;
    ___events = _i1.createRelationTable(
      relationFieldName: '__events',
      field: ContactDTO.t.id,
      foreignField: _i8.CrmEventContactJT.t.contactId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i8.CrmEventContactJTTable(tableRelation: foreignTableRelation),
    );
    return ___events!;
  }

  _i1.ManyRelation<_i8.CrmEventContactJTTable> get events {
    if (_events != null) return _events!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'events',
      field: ContactDTO.t.id,
      foreignField: _i8.CrmEventContactJT.t.contactId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i8.CrmEventContactJTTable(tableRelation: foreignTableRelation),
    );
    _events = _i1.ManyRelation<_i8.CrmEventContactJTTable>(
      tableWithRelations: relationTable,
      table: _i8.CrmEventContactJTTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _events!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        type,
        firstName,
        title,
        lastName,
        initials,
        fullName,
        birthDate,
        customId,
        customIdString,
        individualGreeting,
        importantNote,
        address,
        address2,
        address3,
        postCode,
        city,
        state,
        countryCodeId,
        languageCodeId,
        salutationCodeId,
        phone,
        phone2,
        mobile,
        email,
        website,
        fax,
        migrationMatsPersonId,
        matsContactId,
        migrationMatsCompanyId,
        matsCompanyId,
        createdAt,
        createdById,
        lastModifiedAt,
        lastModifiedById,
        deletedAt,
        deletedById,
        editingById,
        editingSince,
        isDraft,
        editingSession,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'countryCode') {
      return countryCode;
    }
    if (relationField == 'languageCode') {
      return languageCode;
    }
    if (relationField == 'salutationCode') {
      return salutationCode;
    }
    if (relationField == 'migrationMatsPerson') {
      return migrationMatsPerson;
    }
    if (relationField == 'migrationMatsCompany') {
      return migrationMatsCompany;
    }
    if (relationField == 'customer') {
      return customer;
    }
    if (relationField == 'events') {
      return __events;
    }
    return null;
  }
}

class ContactDTOInclude extends _i1.IncludeObject {
  ContactDTOInclude._({
    _i2.CountryCodeDTOInclude? countryCode,
    _i3.LanguageCodeDTOInclude? languageCode,
    _i4.SalutationCodeDTOInclude? salutationCode,
    _i5.MigrationMatsPersonDTOInclude? migrationMatsPerson,
    _i6.MigrationMatsCompanyDTOInclude? migrationMatsCompany,
    _i7.CustomerDTOInclude? customer,
    _i8.CrmEventContactJTIncludeList? events,
  }) {
    _countryCode = countryCode;
    _languageCode = languageCode;
    _salutationCode = salutationCode;
    _migrationMatsPerson = migrationMatsPerson;
    _migrationMatsCompany = migrationMatsCompany;
    _customer = customer;
    _events = events;
  }

  _i2.CountryCodeDTOInclude? _countryCode;

  _i3.LanguageCodeDTOInclude? _languageCode;

  _i4.SalutationCodeDTOInclude? _salutationCode;

  _i5.MigrationMatsPersonDTOInclude? _migrationMatsPerson;

  _i6.MigrationMatsCompanyDTOInclude? _migrationMatsCompany;

  _i7.CustomerDTOInclude? _customer;

  _i8.CrmEventContactJTIncludeList? _events;

  @override
  Map<String, _i1.Include?> get includes => {
        'countryCode': _countryCode,
        'languageCode': _languageCode,
        'salutationCode': _salutationCode,
        'migrationMatsPerson': _migrationMatsPerson,
        'migrationMatsCompany': _migrationMatsCompany,
        'customer': _customer,
        'events': _events,
      };

  @override
  _i1.Table<int?> get table => ContactDTO.t;
}

class ContactDTOIncludeList extends _i1.IncludeList {
  ContactDTOIncludeList._({
    _i1.WhereExpressionBuilder<ContactDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ContactDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ContactDTO.t;
}

class ContactDTORepository {
  const ContactDTORepository._();

  final attach = const ContactDTOAttachRepository._();

  final attachRow = const ContactDTOAttachRowRepository._();

  final detach = const ContactDTODetachRepository._();

  final detachRow = const ContactDTODetachRowRepository._();

  /// Returns a list of [ContactDTO]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<ContactDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ContactDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ContactDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ContactDTOTable>? orderByList,
    _i1.Transaction? transaction,
    ContactDTOInclude? include,
  }) async {
    return session.db.find<ContactDTO>(
      where: where?.call(ContactDTO.t),
      orderBy: orderBy?.call(ContactDTO.t),
      orderByList: orderByList?.call(ContactDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ContactDTO] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<ContactDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ContactDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<ContactDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ContactDTOTable>? orderByList,
    _i1.Transaction? transaction,
    ContactDTOInclude? include,
  }) async {
    return session.db.findFirstRow<ContactDTO>(
      where: where?.call(ContactDTO.t),
      orderBy: orderBy?.call(ContactDTO.t),
      orderByList: orderByList?.call(ContactDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ContactDTO] by its [id] or null if no such row exists.
  Future<ContactDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ContactDTOInclude? include,
  }) async {
    return session.db.findById<ContactDTO>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ContactDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [ContactDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ContactDTO>> insert(
    _i1.Session session,
    List<ContactDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ContactDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ContactDTO] and returns the inserted row.
  ///
  /// The returned [ContactDTO] will have its `id` field set.
  Future<ContactDTO> insertRow(
    _i1.Session session,
    ContactDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ContactDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ContactDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ContactDTO>> update(
    _i1.Session session,
    List<ContactDTO> rows, {
    _i1.ColumnSelections<ContactDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ContactDTO>(
      rows,
      columns: columns?.call(ContactDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ContactDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ContactDTO> updateRow(
    _i1.Session session,
    ContactDTO row, {
    _i1.ColumnSelections<ContactDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ContactDTO>(
      row,
      columns: columns?.call(ContactDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [ContactDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ContactDTO>> delete(
    _i1.Session session,
    List<ContactDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ContactDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ContactDTO].
  Future<ContactDTO> deleteRow(
    _i1.Session session,
    ContactDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ContactDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ContactDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ContactDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ContactDTO>(
      where: where(ContactDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ContactDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ContactDTO>(
      where: where?.call(ContactDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ContactDTOAttachRepository {
  const ContactDTOAttachRepository._();

  /// Creates a relation between this [ContactDTO] and the given [CrmEventContactJT]s
  /// by setting each [CrmEventContactJT]'s foreign key `contactId` to refer to this [ContactDTO].
  Future<void> events(
    _i1.Session session,
    ContactDTO contactDTO,
    List<_i8.CrmEventContactJT> crmEventContactJT, {
    _i1.Transaction? transaction,
  }) async {
    if (crmEventContactJT.any((e) => e.id == null)) {
      throw ArgumentError.notNull('crmEventContactJT.id');
    }
    if (contactDTO.id == null) {
      throw ArgumentError.notNull('contactDTO.id');
    }

    var $crmEventContactJT = crmEventContactJT
        .map((e) => e.copyWith(contactId: contactDTO.id))
        .toList();
    await session.db.update<_i8.CrmEventContactJT>(
      $crmEventContactJT,
      columns: [_i8.CrmEventContactJT.t.contactId],
      transaction: transaction,
    );
  }
}

class ContactDTOAttachRowRepository {
  const ContactDTOAttachRowRepository._();

  /// Creates a relation between the given [ContactDTO] and [CountryCodeDTO]
  /// by setting the [ContactDTO]'s foreign key `countryCodeId` to refer to the [CountryCodeDTO].
  Future<void> countryCode(
    _i1.Session session,
    ContactDTO contactDTO,
    _i2.CountryCodeDTO countryCode, {
    _i1.Transaction? transaction,
  }) async {
    if (contactDTO.id == null) {
      throw ArgumentError.notNull('contactDTO.id');
    }
    if (countryCode.id == null) {
      throw ArgumentError.notNull('countryCode.id');
    }

    var $contactDTO = contactDTO.copyWith(countryCodeId: countryCode.id);
    await session.db.updateRow<ContactDTO>(
      $contactDTO,
      columns: [ContactDTO.t.countryCodeId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ContactDTO] and [LanguageCodeDTO]
  /// by setting the [ContactDTO]'s foreign key `languageCodeId` to refer to the [LanguageCodeDTO].
  Future<void> languageCode(
    _i1.Session session,
    ContactDTO contactDTO,
    _i3.LanguageCodeDTO languageCode, {
    _i1.Transaction? transaction,
  }) async {
    if (contactDTO.id == null) {
      throw ArgumentError.notNull('contactDTO.id');
    }
    if (languageCode.id == null) {
      throw ArgumentError.notNull('languageCode.id');
    }

    var $contactDTO = contactDTO.copyWith(languageCodeId: languageCode.id);
    await session.db.updateRow<ContactDTO>(
      $contactDTO,
      columns: [ContactDTO.t.languageCodeId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ContactDTO] and [SalutationCodeDTO]
  /// by setting the [ContactDTO]'s foreign key `salutationCodeId` to refer to the [SalutationCodeDTO].
  Future<void> salutationCode(
    _i1.Session session,
    ContactDTO contactDTO,
    _i4.SalutationCodeDTO salutationCode, {
    _i1.Transaction? transaction,
  }) async {
    if (contactDTO.id == null) {
      throw ArgumentError.notNull('contactDTO.id');
    }
    if (salutationCode.id == null) {
      throw ArgumentError.notNull('salutationCode.id');
    }

    var $contactDTO = contactDTO.copyWith(salutationCodeId: salutationCode.id);
    await session.db.updateRow<ContactDTO>(
      $contactDTO,
      columns: [ContactDTO.t.salutationCodeId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ContactDTO] and [MigrationMatsPersonDTO]
  /// by setting the [ContactDTO]'s foreign key `migrationMatsPersonId` to refer to the [MigrationMatsPersonDTO].
  Future<void> migrationMatsPerson(
    _i1.Session session,
    ContactDTO contactDTO,
    _i5.MigrationMatsPersonDTO migrationMatsPerson, {
    _i1.Transaction? transaction,
  }) async {
    if (contactDTO.id == null) {
      throw ArgumentError.notNull('contactDTO.id');
    }
    if (migrationMatsPerson.id == null) {
      throw ArgumentError.notNull('migrationMatsPerson.id');
    }

    var $contactDTO =
        contactDTO.copyWith(migrationMatsPersonId: migrationMatsPerson.id);
    await session.db.updateRow<ContactDTO>(
      $contactDTO,
      columns: [ContactDTO.t.migrationMatsPersonId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ContactDTO] and [MigrationMatsCompanyDTO]
  /// by setting the [ContactDTO]'s foreign key `migrationMatsCompanyId` to refer to the [MigrationMatsCompanyDTO].
  Future<void> migrationMatsCompany(
    _i1.Session session,
    ContactDTO contactDTO,
    _i6.MigrationMatsCompanyDTO migrationMatsCompany, {
    _i1.Transaction? transaction,
  }) async {
    if (contactDTO.id == null) {
      throw ArgumentError.notNull('contactDTO.id');
    }
    if (migrationMatsCompany.id == null) {
      throw ArgumentError.notNull('migrationMatsCompany.id');
    }

    var $contactDTO =
        contactDTO.copyWith(migrationMatsCompanyId: migrationMatsCompany.id);
    await session.db.updateRow<ContactDTO>(
      $contactDTO,
      columns: [ContactDTO.t.migrationMatsCompanyId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ContactDTO] and [CustomerDTO]
  /// by setting the [ContactDTO]'s foreign key `id` to refer to the [CustomerDTO].
  Future<void> customer(
    _i1.Session session,
    ContactDTO contactDTO,
    _i7.CustomerDTO customer, {
    _i1.Transaction? transaction,
  }) async {
    if (customer.id == null) {
      throw ArgumentError.notNull('customer.id');
    }
    if (contactDTO.id == null) {
      throw ArgumentError.notNull('contactDTO.id');
    }

    var $customer = customer.copyWith(contactId: contactDTO.id);
    await session.db.updateRow<_i7.CustomerDTO>(
      $customer,
      columns: [_i7.CustomerDTO.t.contactId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [ContactDTO] and the given [CrmEventContactJT]
  /// by setting the [CrmEventContactJT]'s foreign key `contactId` to refer to this [ContactDTO].
  Future<void> events(
    _i1.Session session,
    ContactDTO contactDTO,
    _i8.CrmEventContactJT crmEventContactJT, {
    _i1.Transaction? transaction,
  }) async {
    if (crmEventContactJT.id == null) {
      throw ArgumentError.notNull('crmEventContactJT.id');
    }
    if (contactDTO.id == null) {
      throw ArgumentError.notNull('contactDTO.id');
    }

    var $crmEventContactJT =
        crmEventContactJT.copyWith(contactId: contactDTO.id);
    await session.db.updateRow<_i8.CrmEventContactJT>(
      $crmEventContactJT,
      columns: [_i8.CrmEventContactJT.t.contactId],
      transaction: transaction,
    );
  }
}

class ContactDTODetachRepository {
  const ContactDTODetachRepository._();

  /// Detaches the relation between this [ContactDTO] and the given [CrmEventContactJT]
  /// by setting the [CrmEventContactJT]'s foreign key `contactId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> events(
    _i1.Session session,
    List<_i8.CrmEventContactJT> crmEventContactJT, {
    _i1.Transaction? transaction,
  }) async {
    if (crmEventContactJT.any((e) => e.id == null)) {
      throw ArgumentError.notNull('crmEventContactJT.id');
    }

    var $crmEventContactJT =
        crmEventContactJT.map((e) => e.copyWith(contactId: null)).toList();
    await session.db.update<_i8.CrmEventContactJT>(
      $crmEventContactJT,
      columns: [_i8.CrmEventContactJT.t.contactId],
      transaction: transaction,
    );
  }
}

class ContactDTODetachRowRepository {
  const ContactDTODetachRowRepository._();

  /// Detaches the relation between this [ContactDTO] and the [CountryCodeDTO] set in `countryCode`
  /// by setting the [ContactDTO]'s foreign key `countryCodeId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> countryCode(
    _i1.Session session,
    ContactDTO contactdto, {
    _i1.Transaction? transaction,
  }) async {
    if (contactdto.id == null) {
      throw ArgumentError.notNull('contactdto.id');
    }

    var $contactdto = contactdto.copyWith(countryCodeId: null);
    await session.db.updateRow<ContactDTO>(
      $contactdto,
      columns: [ContactDTO.t.countryCodeId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [ContactDTO] and the [LanguageCodeDTO] set in `languageCode`
  /// by setting the [ContactDTO]'s foreign key `languageCodeId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> languageCode(
    _i1.Session session,
    ContactDTO contactdto, {
    _i1.Transaction? transaction,
  }) async {
    if (contactdto.id == null) {
      throw ArgumentError.notNull('contactdto.id');
    }

    var $contactdto = contactdto.copyWith(languageCodeId: null);
    await session.db.updateRow<ContactDTO>(
      $contactdto,
      columns: [ContactDTO.t.languageCodeId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [ContactDTO] and the [SalutationCodeDTO] set in `salutationCode`
  /// by setting the [ContactDTO]'s foreign key `salutationCodeId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> salutationCode(
    _i1.Session session,
    ContactDTO contactdto, {
    _i1.Transaction? transaction,
  }) async {
    if (contactdto.id == null) {
      throw ArgumentError.notNull('contactdto.id');
    }

    var $contactdto = contactdto.copyWith(salutationCodeId: null);
    await session.db.updateRow<ContactDTO>(
      $contactdto,
      columns: [ContactDTO.t.salutationCodeId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [ContactDTO] and the [MigrationMatsPersonDTO] set in `migrationMatsPerson`
  /// by setting the [ContactDTO]'s foreign key `migrationMatsPersonId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> migrationMatsPerson(
    _i1.Session session,
    ContactDTO contactdto, {
    _i1.Transaction? transaction,
  }) async {
    if (contactdto.id == null) {
      throw ArgumentError.notNull('contactdto.id');
    }

    var $contactdto = contactdto.copyWith(migrationMatsPersonId: null);
    await session.db.updateRow<ContactDTO>(
      $contactdto,
      columns: [ContactDTO.t.migrationMatsPersonId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [ContactDTO] and the [MigrationMatsCompanyDTO] set in `migrationMatsCompany`
  /// by setting the [ContactDTO]'s foreign key `migrationMatsCompanyId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> migrationMatsCompany(
    _i1.Session session,
    ContactDTO contactdto, {
    _i1.Transaction? transaction,
  }) async {
    if (contactdto.id == null) {
      throw ArgumentError.notNull('contactdto.id');
    }

    var $contactdto = contactdto.copyWith(migrationMatsCompanyId: null);
    await session.db.updateRow<ContactDTO>(
      $contactdto,
      columns: [ContactDTO.t.migrationMatsCompanyId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [ContactDTO] and the [CustomerDTO] set in `customer`
  /// by setting the [ContactDTO]'s foreign key `id` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> customer(
    _i1.Session session,
    ContactDTO contactdto, {
    _i1.Transaction? transaction,
  }) async {
    var $customer = contactdto.customer;

    if ($customer == null) {
      throw ArgumentError.notNull('contactdto.customer');
    }
    if ($customer.id == null) {
      throw ArgumentError.notNull('contactdto.customer.id');
    }
    if (contactdto.id == null) {
      throw ArgumentError.notNull('contactdto.id');
    }

    var $$customer = $customer.copyWith(contactId: null);
    await session.db.updateRow<_i7.CustomerDTO>(
      $$customer,
      columns: [_i7.CustomerDTO.t.contactId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [ContactDTO] and the given [CrmEventContactJT]
  /// by setting the [CrmEventContactJT]'s foreign key `contactId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> events(
    _i1.Session session,
    _i8.CrmEventContactJT crmEventContactJT, {
    _i1.Transaction? transaction,
  }) async {
    if (crmEventContactJT.id == null) {
      throw ArgumentError.notNull('crmEventContactJT.id');
    }

    var $crmEventContactJT = crmEventContactJT.copyWith(contactId: null);
    await session.db.updateRow<_i8.CrmEventContactJT>(
      $crmEventContactJT,
      columns: [_i8.CrmEventContactJT.t.contactId],
      transaction: transaction,
    );
  }
}
