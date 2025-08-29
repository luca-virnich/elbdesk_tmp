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
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i2;
import '../../../../modules/crm/country_code/models/country_code.dart' as _i3;
import '../../../../modules/crm/department_code/models/department_code.dart'
    as _i4;

abstract class AppUserDTO implements _i1.SerializableModel {
  AppUserDTO._({
    this.id,
    this.userInfoId,
    this.userInfo,
    this.firstName,
    this.lastName,
    this.initials,
    this.birthDate,
    required this.address,
    required this.address2,
    required this.postCode,
    required this.city,
    required this.state,
    this.countryCodeId,
    this.countryCode,
    required this.phone,
    required this.mobile,
    required this.privateEmail,
    required this.employeeNumber,
    this.entryDate,
    this.terminationDate,
    this.departmentId,
    this.department,
    required this.position,
    required this.costCenter,
    required this.isActive,
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

  factory AppUserDTO({
    int? id,
    int? userInfoId,
    _i2.UserInfo? userInfo,
    String? firstName,
    String? lastName,
    String? initials,
    DateTime? birthDate,
    required String address,
    required String address2,
    required String postCode,
    required String city,
    required String state,
    int? countryCodeId,
    _i3.CountryCodeDTO? countryCode,
    required String phone,
    required String mobile,
    required String privateEmail,
    required String employeeNumber,
    DateTime? entryDate,
    DateTime? terminationDate,
    int? departmentId,
    _i4.DepartmentCodeDTO? department,
    required String position,
    required String costCenter,
    required bool isActive,
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
  }) = _AppUserDTOImpl;

  factory AppUserDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return AppUserDTO(
      id: jsonSerialization['id'] as int?,
      userInfoId: jsonSerialization['userInfoId'] as int?,
      userInfo: jsonSerialization['userInfo'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['userInfo'] as Map<String, dynamic>)),
      firstName: jsonSerialization['firstName'] as String?,
      lastName: jsonSerialization['lastName'] as String?,
      initials: jsonSerialization['initials'] as String?,
      birthDate: jsonSerialization['birthDate'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['birthDate']),
      address: jsonSerialization['address'] as String,
      address2: jsonSerialization['address2'] as String,
      postCode: jsonSerialization['postCode'] as String,
      city: jsonSerialization['city'] as String,
      state: jsonSerialization['state'] as String,
      countryCodeId: jsonSerialization['countryCodeId'] as int?,
      countryCode: jsonSerialization['countryCode'] == null
          ? null
          : _i3.CountryCodeDTO.fromJson(
              (jsonSerialization['countryCode'] as Map<String, dynamic>)),
      phone: jsonSerialization['phone'] as String,
      mobile: jsonSerialization['mobile'] as String,
      privateEmail: jsonSerialization['privateEmail'] as String,
      employeeNumber: jsonSerialization['employeeNumber'] as String,
      entryDate: jsonSerialization['entryDate'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['entryDate']),
      terminationDate: jsonSerialization['terminationDate'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['terminationDate']),
      departmentId: jsonSerialization['departmentId'] as int?,
      department: jsonSerialization['department'] == null
          ? null
          : _i4.DepartmentCodeDTO.fromJson(
              (jsonSerialization['department'] as Map<String, dynamic>)),
      position: jsonSerialization['position'] as String,
      costCenter: jsonSerialization['costCenter'] as String,
      isActive: jsonSerialization['isActive'] as bool,
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

  int? userInfoId;

  _i2.UserInfo? userInfo;

  String? firstName;

  String? lastName;

  String? initials;

  DateTime? birthDate;

  String address;

  String address2;

  String postCode;

  String city;

  String state;

  int? countryCodeId;

  _i3.CountryCodeDTO? countryCode;

  String phone;

  String mobile;

  String privateEmail;

  String employeeNumber;

  DateTime? entryDate;

  DateTime? terminationDate;

  int? departmentId;

  _i4.DepartmentCodeDTO? department;

  String position;

  String costCenter;

  bool isActive;

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

  /// Returns a shallow copy of this [AppUserDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AppUserDTO copyWith({
    int? id,
    int? userInfoId,
    _i2.UserInfo? userInfo,
    String? firstName,
    String? lastName,
    String? initials,
    DateTime? birthDate,
    String? address,
    String? address2,
    String? postCode,
    String? city,
    String? state,
    int? countryCodeId,
    _i3.CountryCodeDTO? countryCode,
    String? phone,
    String? mobile,
    String? privateEmail,
    String? employeeNumber,
    DateTime? entryDate,
    DateTime? terminationDate,
    int? departmentId,
    _i4.DepartmentCodeDTO? department,
    String? position,
    String? costCenter,
    bool? isActive,
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
      if (userInfoId != null) 'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
      if (firstName != null) 'firstName': firstName,
      if (lastName != null) 'lastName': lastName,
      if (initials != null) 'initials': initials,
      if (birthDate != null) 'birthDate': birthDate?.toJson(),
      'address': address,
      'address2': address2,
      'postCode': postCode,
      'city': city,
      'state': state,
      if (countryCodeId != null) 'countryCodeId': countryCodeId,
      if (countryCode != null) 'countryCode': countryCode?.toJson(),
      'phone': phone,
      'mobile': mobile,
      'privateEmail': privateEmail,
      'employeeNumber': employeeNumber,
      if (entryDate != null) 'entryDate': entryDate?.toJson(),
      if (terminationDate != null) 'terminationDate': terminationDate?.toJson(),
      if (departmentId != null) 'departmentId': departmentId,
      if (department != null) 'department': department?.toJson(),
      'position': position,
      'costCenter': costCenter,
      'isActive': isActive,
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

class _AppUserDTOImpl extends AppUserDTO {
  _AppUserDTOImpl({
    int? id,
    int? userInfoId,
    _i2.UserInfo? userInfo,
    String? firstName,
    String? lastName,
    String? initials,
    DateTime? birthDate,
    required String address,
    required String address2,
    required String postCode,
    required String city,
    required String state,
    int? countryCodeId,
    _i3.CountryCodeDTO? countryCode,
    required String phone,
    required String mobile,
    required String privateEmail,
    required String employeeNumber,
    DateTime? entryDate,
    DateTime? terminationDate,
    int? departmentId,
    _i4.DepartmentCodeDTO? department,
    required String position,
    required String costCenter,
    required bool isActive,
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
          userInfoId: userInfoId,
          userInfo: userInfo,
          firstName: firstName,
          lastName: lastName,
          initials: initials,
          birthDate: birthDate,
          address: address,
          address2: address2,
          postCode: postCode,
          city: city,
          state: state,
          countryCodeId: countryCodeId,
          countryCode: countryCode,
          phone: phone,
          mobile: mobile,
          privateEmail: privateEmail,
          employeeNumber: employeeNumber,
          entryDate: entryDate,
          terminationDate: terminationDate,
          departmentId: departmentId,
          department: department,
          position: position,
          costCenter: costCenter,
          isActive: isActive,
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

  /// Returns a shallow copy of this [AppUserDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AppUserDTO copyWith({
    Object? id = _Undefined,
    Object? userInfoId = _Undefined,
    Object? userInfo = _Undefined,
    Object? firstName = _Undefined,
    Object? lastName = _Undefined,
    Object? initials = _Undefined,
    Object? birthDate = _Undefined,
    String? address,
    String? address2,
    String? postCode,
    String? city,
    String? state,
    Object? countryCodeId = _Undefined,
    Object? countryCode = _Undefined,
    String? phone,
    String? mobile,
    String? privateEmail,
    String? employeeNumber,
    Object? entryDate = _Undefined,
    Object? terminationDate = _Undefined,
    Object? departmentId = _Undefined,
    Object? department = _Undefined,
    String? position,
    String? costCenter,
    bool? isActive,
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
    return AppUserDTO(
      id: id is int? ? id : this.id,
      userInfoId: userInfoId is int? ? userInfoId : this.userInfoId,
      userInfo:
          userInfo is _i2.UserInfo? ? userInfo : this.userInfo?.copyWith(),
      firstName: firstName is String? ? firstName : this.firstName,
      lastName: lastName is String? ? lastName : this.lastName,
      initials: initials is String? ? initials : this.initials,
      birthDate: birthDate is DateTime? ? birthDate : this.birthDate,
      address: address ?? this.address,
      address2: address2 ?? this.address2,
      postCode: postCode ?? this.postCode,
      city: city ?? this.city,
      state: state ?? this.state,
      countryCodeId: countryCodeId is int? ? countryCodeId : this.countryCodeId,
      countryCode: countryCode is _i3.CountryCodeDTO?
          ? countryCode
          : this.countryCode?.copyWith(),
      phone: phone ?? this.phone,
      mobile: mobile ?? this.mobile,
      privateEmail: privateEmail ?? this.privateEmail,
      employeeNumber: employeeNumber ?? this.employeeNumber,
      entryDate: entryDate is DateTime? ? entryDate : this.entryDate,
      terminationDate:
          terminationDate is DateTime? ? terminationDate : this.terminationDate,
      departmentId: departmentId is int? ? departmentId : this.departmentId,
      department: department is _i4.DepartmentCodeDTO?
          ? department
          : this.department?.copyWith(),
      position: position ?? this.position,
      costCenter: costCenter ?? this.costCenter,
      isActive: isActive ?? this.isActive,
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
