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
import '../../../../modules/crm/country_code/models/country_code_address_format.dart'
    as _i2;
import '../../../../modules/crm/country_code/models/country_code_contact_address_format.dart'
    as _i3;

abstract class CountryCodeDTO implements _i1.SerializableModel {
  CountryCodeDTO._({
    this.id,
    required this.code,
    required this.countryRegionName,
    required this.isoCode,
    required this.numericCode,
    required this.addressFormat,
    required this.contactAddressFormat,
    this.federalRegion,
    this.euCode,
    this.intrastatCode,
    this.taxScheme,
    required this.showState,
    required this.isPrimary,
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

  factory CountryCodeDTO({
    int? id,
    required String code,
    required String countryRegionName,
    required String isoCode,
    required int numericCode,
    required _i2.CountryCodeAddressFormat addressFormat,
    required _i3.CountryCodeContactAddressFormat contactAddressFormat,
    String? federalRegion,
    String? euCode,
    String? intrastatCode,
    String? taxScheme,
    required bool showState,
    required bool isPrimary,
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
  }) = _CountryCodeDTOImpl;

  factory CountryCodeDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return CountryCodeDTO(
      id: jsonSerialization['id'] as int?,
      code: jsonSerialization['code'] as String,
      countryRegionName: jsonSerialization['countryRegionName'] as String,
      isoCode: jsonSerialization['isoCode'] as String,
      numericCode: jsonSerialization['numericCode'] as int,
      addressFormat: _i2.CountryCodeAddressFormat.fromJson(
          (jsonSerialization['addressFormat'] as String)),
      contactAddressFormat: _i3.CountryCodeContactAddressFormat.fromJson(
          (jsonSerialization['contactAddressFormat'] as String)),
      federalRegion: jsonSerialization['federalRegion'] as String?,
      euCode: jsonSerialization['euCode'] as String?,
      intrastatCode: jsonSerialization['intrastatCode'] as String?,
      taxScheme: jsonSerialization['taxScheme'] as String?,
      showState: jsonSerialization['showState'] as bool,
      isPrimary: jsonSerialization['isPrimary'] as bool,
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

  String code;

  String countryRegionName;

  String isoCode;

  int numericCode;

  _i2.CountryCodeAddressFormat addressFormat;

  _i3.CountryCodeContactAddressFormat contactAddressFormat;

  String? federalRegion;

  String? euCode;

  String? intrastatCode;

  String? taxScheme;

  bool showState;

  bool isPrimary;

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

  /// Returns a shallow copy of this [CountryCodeDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CountryCodeDTO copyWith({
    int? id,
    String? code,
    String? countryRegionName,
    String? isoCode,
    int? numericCode,
    _i2.CountryCodeAddressFormat? addressFormat,
    _i3.CountryCodeContactAddressFormat? contactAddressFormat,
    String? federalRegion,
    String? euCode,
    String? intrastatCode,
    String? taxScheme,
    bool? showState,
    bool? isPrimary,
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
      'code': code,
      'countryRegionName': countryRegionName,
      'isoCode': isoCode,
      'numericCode': numericCode,
      'addressFormat': addressFormat.toJson(),
      'contactAddressFormat': contactAddressFormat.toJson(),
      if (federalRegion != null) 'federalRegion': federalRegion,
      if (euCode != null) 'euCode': euCode,
      if (intrastatCode != null) 'intrastatCode': intrastatCode,
      if (taxScheme != null) 'taxScheme': taxScheme,
      'showState': showState,
      'isPrimary': isPrimary,
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

class _CountryCodeDTOImpl extends CountryCodeDTO {
  _CountryCodeDTOImpl({
    int? id,
    required String code,
    required String countryRegionName,
    required String isoCode,
    required int numericCode,
    required _i2.CountryCodeAddressFormat addressFormat,
    required _i3.CountryCodeContactAddressFormat contactAddressFormat,
    String? federalRegion,
    String? euCode,
    String? intrastatCode,
    String? taxScheme,
    required bool showState,
    required bool isPrimary,
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
          code: code,
          countryRegionName: countryRegionName,
          isoCode: isoCode,
          numericCode: numericCode,
          addressFormat: addressFormat,
          contactAddressFormat: contactAddressFormat,
          federalRegion: federalRegion,
          euCode: euCode,
          intrastatCode: intrastatCode,
          taxScheme: taxScheme,
          showState: showState,
          isPrimary: isPrimary,
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

  /// Returns a shallow copy of this [CountryCodeDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CountryCodeDTO copyWith({
    Object? id = _Undefined,
    String? code,
    String? countryRegionName,
    String? isoCode,
    int? numericCode,
    _i2.CountryCodeAddressFormat? addressFormat,
    _i3.CountryCodeContactAddressFormat? contactAddressFormat,
    Object? federalRegion = _Undefined,
    Object? euCode = _Undefined,
    Object? intrastatCode = _Undefined,
    Object? taxScheme = _Undefined,
    bool? showState,
    bool? isPrimary,
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
    return CountryCodeDTO(
      id: id is int? ? id : this.id,
      code: code ?? this.code,
      countryRegionName: countryRegionName ?? this.countryRegionName,
      isoCode: isoCode ?? this.isoCode,
      numericCode: numericCode ?? this.numericCode,
      addressFormat: addressFormat ?? this.addressFormat,
      contactAddressFormat: contactAddressFormat ?? this.contactAddressFormat,
      federalRegion:
          federalRegion is String? ? federalRegion : this.federalRegion,
      euCode: euCode is String? ? euCode : this.euCode,
      intrastatCode:
          intrastatCode is String? ? intrastatCode : this.intrastatCode,
      taxScheme: taxScheme is String? ? taxScheme : this.taxScheme,
      showState: showState ?? this.showState,
      isPrimary: isPrimary ?? this.isPrimary,
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
