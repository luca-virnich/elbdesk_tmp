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
import '../../../../modules/crm/contact/models/contact.dart' as _i2;

abstract class CompanyCompanyDTO implements _i1.SerializableModel {
  CompanyCompanyDTO._({
    this.id,
    required this.companyId,
    this.company,
    required this.companyCompanyId,
    this.companyCompany,
    required this.active,
    required this.note,
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

  factory CompanyCompanyDTO({
    int? id,
    required int companyId,
    _i2.ContactDTO? company,
    required int companyCompanyId,
    _i2.ContactDTO? companyCompany,
    required bool active,
    required String note,
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
  }) = _CompanyCompanyDTOImpl;

  factory CompanyCompanyDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return CompanyCompanyDTO(
      id: jsonSerialization['id'] as int?,
      companyId: jsonSerialization['companyId'] as int,
      company: jsonSerialization['company'] == null
          ? null
          : _i2.ContactDTO.fromJson(
              (jsonSerialization['company'] as Map<String, dynamic>)),
      companyCompanyId: jsonSerialization['companyCompanyId'] as int,
      companyCompany: jsonSerialization['companyCompany'] == null
          ? null
          : _i2.ContactDTO.fromJson(
              (jsonSerialization['companyCompany'] as Map<String, dynamic>)),
      active: jsonSerialization['active'] as bool,
      note: jsonSerialization['note'] as String,
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

  int companyId;

  _i2.ContactDTO? company;

  int companyCompanyId;

  _i2.ContactDTO? companyCompany;

  bool active;

  String note;

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

  /// Returns a shallow copy of this [CompanyCompanyDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CompanyCompanyDTO copyWith({
    int? id,
    int? companyId,
    _i2.ContactDTO? company,
    int? companyCompanyId,
    _i2.ContactDTO? companyCompany,
    bool? active,
    String? note,
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
      'companyId': companyId,
      if (company != null) 'company': company?.toJson(),
      'companyCompanyId': companyCompanyId,
      if (companyCompany != null) 'companyCompany': companyCompany?.toJson(),
      'active': active,
      'note': note,
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

class _CompanyCompanyDTOImpl extends CompanyCompanyDTO {
  _CompanyCompanyDTOImpl({
    int? id,
    required int companyId,
    _i2.ContactDTO? company,
    required int companyCompanyId,
    _i2.ContactDTO? companyCompany,
    required bool active,
    required String note,
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
          companyId: companyId,
          company: company,
          companyCompanyId: companyCompanyId,
          companyCompany: companyCompany,
          active: active,
          note: note,
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

  /// Returns a shallow copy of this [CompanyCompanyDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CompanyCompanyDTO copyWith({
    Object? id = _Undefined,
    int? companyId,
    Object? company = _Undefined,
    int? companyCompanyId,
    Object? companyCompany = _Undefined,
    bool? active,
    String? note,
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
    return CompanyCompanyDTO(
      id: id is int? ? id : this.id,
      companyId: companyId ?? this.companyId,
      company: company is _i2.ContactDTO? ? company : this.company?.copyWith(),
      companyCompanyId: companyCompanyId ?? this.companyCompanyId,
      companyCompany: companyCompany is _i2.ContactDTO?
          ? companyCompany
          : this.companyCompany?.copyWith(),
      active: active ?? this.active,
      note: note ?? this.note,
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
