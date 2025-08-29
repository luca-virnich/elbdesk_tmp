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
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i2;
import '../../../../modules/crm/country_code/models/country_code.dart' as _i3;
import '../../../../modules/crm/department_code/models/department_code.dart'
    as _i4;

abstract class AppUserDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = AppUserDTOTable();

  static const db = AppUserDTORepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      if (userInfoId != null) 'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJsonForProtocol(),
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
      if (countryCode != null) 'countryCode': countryCode?.toJsonForProtocol(),
      'phone': phone,
      'mobile': mobile,
      'privateEmail': privateEmail,
      'employeeNumber': employeeNumber,
      if (entryDate != null) 'entryDate': entryDate?.toJson(),
      if (terminationDate != null) 'terminationDate': terminationDate?.toJson(),
      if (departmentId != null) 'departmentId': departmentId,
      if (department != null) 'department': department?.toJsonForProtocol(),
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

  static AppUserDTOInclude include({
    _i2.UserInfoInclude? userInfo,
    _i3.CountryCodeDTOInclude? countryCode,
    _i4.DepartmentCodeDTOInclude? department,
  }) {
    return AppUserDTOInclude._(
      userInfo: userInfo,
      countryCode: countryCode,
      department: department,
    );
  }

  static AppUserDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<AppUserDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AppUserDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppUserDTOTable>? orderByList,
    AppUserDTOInclude? include,
  }) {
    return AppUserDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AppUserDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(AppUserDTO.t),
      include: include,
    );
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

class AppUserDTOTable extends _i1.Table<int?> {
  AppUserDTOTable({super.tableRelation})
      : super(tableName: 'ed_user_app_user') {
    userInfoId = _i1.ColumnInt(
      'userInfoId',
      this,
    );
    firstName = _i1.ColumnString(
      'firstName',
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
    birthDate = _i1.ColumnDateTime(
      'birthDate',
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
    phone = _i1.ColumnString(
      'phone',
      this,
    );
    mobile = _i1.ColumnString(
      'mobile',
      this,
    );
    privateEmail = _i1.ColumnString(
      'privateEmail',
      this,
    );
    employeeNumber = _i1.ColumnString(
      'employeeNumber',
      this,
    );
    entryDate = _i1.ColumnDateTime(
      'entryDate',
      this,
    );
    terminationDate = _i1.ColumnDateTime(
      'terminationDate',
      this,
    );
    departmentId = _i1.ColumnInt(
      'departmentId',
      this,
    );
    position = _i1.ColumnString(
      'position',
      this,
    );
    costCenter = _i1.ColumnString(
      'costCenter',
      this,
    );
    isActive = _i1.ColumnBool(
      'isActive',
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

  late final _i1.ColumnInt userInfoId;

  _i2.UserInfoTable? _userInfo;

  late final _i1.ColumnString firstName;

  late final _i1.ColumnString lastName;

  late final _i1.ColumnString initials;

  late final _i1.ColumnDateTime birthDate;

  late final _i1.ColumnString address;

  late final _i1.ColumnString address2;

  late final _i1.ColumnString postCode;

  late final _i1.ColumnString city;

  late final _i1.ColumnString state;

  late final _i1.ColumnInt countryCodeId;

  _i3.CountryCodeDTOTable? _countryCode;

  late final _i1.ColumnString phone;

  late final _i1.ColumnString mobile;

  late final _i1.ColumnString privateEmail;

  late final _i1.ColumnString employeeNumber;

  late final _i1.ColumnDateTime entryDate;

  late final _i1.ColumnDateTime terminationDate;

  late final _i1.ColumnInt departmentId;

  _i4.DepartmentCodeDTOTable? _department;

  late final _i1.ColumnString position;

  late final _i1.ColumnString costCenter;

  late final _i1.ColumnBool isActive;

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

  _i2.UserInfoTable get userInfo {
    if (_userInfo != null) return _userInfo!;
    _userInfo = _i1.createRelationTable(
      relationFieldName: 'userInfo',
      field: AppUserDTO.t.userInfoId,
      foreignField: _i2.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _userInfo!;
  }

  _i3.CountryCodeDTOTable get countryCode {
    if (_countryCode != null) return _countryCode!;
    _countryCode = _i1.createRelationTable(
      relationFieldName: 'countryCode',
      field: AppUserDTO.t.countryCodeId,
      foreignField: _i3.CountryCodeDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.CountryCodeDTOTable(tableRelation: foreignTableRelation),
    );
    return _countryCode!;
  }

  _i4.DepartmentCodeDTOTable get department {
    if (_department != null) return _department!;
    _department = _i1.createRelationTable(
      relationFieldName: 'department',
      field: AppUserDTO.t.departmentId,
      foreignField: _i4.DepartmentCodeDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.DepartmentCodeDTOTable(tableRelation: foreignTableRelation),
    );
    return _department!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        userInfoId,
        firstName,
        lastName,
        initials,
        birthDate,
        address,
        address2,
        postCode,
        city,
        state,
        countryCodeId,
        phone,
        mobile,
        privateEmail,
        employeeNumber,
        entryDate,
        terminationDate,
        departmentId,
        position,
        costCenter,
        isActive,
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
    if (relationField == 'userInfo') {
      return userInfo;
    }
    if (relationField == 'countryCode') {
      return countryCode;
    }
    if (relationField == 'department') {
      return department;
    }
    return null;
  }
}

class AppUserDTOInclude extends _i1.IncludeObject {
  AppUserDTOInclude._({
    _i2.UserInfoInclude? userInfo,
    _i3.CountryCodeDTOInclude? countryCode,
    _i4.DepartmentCodeDTOInclude? department,
  }) {
    _userInfo = userInfo;
    _countryCode = countryCode;
    _department = department;
  }

  _i2.UserInfoInclude? _userInfo;

  _i3.CountryCodeDTOInclude? _countryCode;

  _i4.DepartmentCodeDTOInclude? _department;

  @override
  Map<String, _i1.Include?> get includes => {
        'userInfo': _userInfo,
        'countryCode': _countryCode,
        'department': _department,
      };

  @override
  _i1.Table<int?> get table => AppUserDTO.t;
}

class AppUserDTOIncludeList extends _i1.IncludeList {
  AppUserDTOIncludeList._({
    _i1.WhereExpressionBuilder<AppUserDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(AppUserDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => AppUserDTO.t;
}

class AppUserDTORepository {
  const AppUserDTORepository._();

  final attachRow = const AppUserDTOAttachRowRepository._();

  final detachRow = const AppUserDTODetachRowRepository._();

  /// Returns a list of [AppUserDTO]s matching the given query parameters.
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
  Future<List<AppUserDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AppUserDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AppUserDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppUserDTOTable>? orderByList,
    _i1.Transaction? transaction,
    AppUserDTOInclude? include,
  }) async {
    return session.db.find<AppUserDTO>(
      where: where?.call(AppUserDTO.t),
      orderBy: orderBy?.call(AppUserDTO.t),
      orderByList: orderByList?.call(AppUserDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [AppUserDTO] matching the given query parameters.
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
  Future<AppUserDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AppUserDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<AppUserDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppUserDTOTable>? orderByList,
    _i1.Transaction? transaction,
    AppUserDTOInclude? include,
  }) async {
    return session.db.findFirstRow<AppUserDTO>(
      where: where?.call(AppUserDTO.t),
      orderBy: orderBy?.call(AppUserDTO.t),
      orderByList: orderByList?.call(AppUserDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [AppUserDTO] by its [id] or null if no such row exists.
  Future<AppUserDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    AppUserDTOInclude? include,
  }) async {
    return session.db.findById<AppUserDTO>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [AppUserDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [AppUserDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<AppUserDTO>> insert(
    _i1.Session session,
    List<AppUserDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<AppUserDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [AppUserDTO] and returns the inserted row.
  ///
  /// The returned [AppUserDTO] will have its `id` field set.
  Future<AppUserDTO> insertRow(
    _i1.Session session,
    AppUserDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<AppUserDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [AppUserDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<AppUserDTO>> update(
    _i1.Session session,
    List<AppUserDTO> rows, {
    _i1.ColumnSelections<AppUserDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<AppUserDTO>(
      rows,
      columns: columns?.call(AppUserDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [AppUserDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<AppUserDTO> updateRow(
    _i1.Session session,
    AppUserDTO row, {
    _i1.ColumnSelections<AppUserDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<AppUserDTO>(
      row,
      columns: columns?.call(AppUserDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [AppUserDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<AppUserDTO>> delete(
    _i1.Session session,
    List<AppUserDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<AppUserDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [AppUserDTO].
  Future<AppUserDTO> deleteRow(
    _i1.Session session,
    AppUserDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<AppUserDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<AppUserDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AppUserDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<AppUserDTO>(
      where: where(AppUserDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AppUserDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<AppUserDTO>(
      where: where?.call(AppUserDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class AppUserDTOAttachRowRepository {
  const AppUserDTOAttachRowRepository._();

  /// Creates a relation between the given [AppUserDTO] and [UserInfo]
  /// by setting the [AppUserDTO]'s foreign key `userInfoId` to refer to the [UserInfo].
  Future<void> userInfo(
    _i1.Session session,
    AppUserDTO appUserDTO,
    _i2.UserInfo userInfo, {
    _i1.Transaction? transaction,
  }) async {
    if (appUserDTO.id == null) {
      throw ArgumentError.notNull('appUserDTO.id');
    }
    if (userInfo.id == null) {
      throw ArgumentError.notNull('userInfo.id');
    }

    var $appUserDTO = appUserDTO.copyWith(userInfoId: userInfo.id);
    await session.db.updateRow<AppUserDTO>(
      $appUserDTO,
      columns: [AppUserDTO.t.userInfoId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [AppUserDTO] and [CountryCodeDTO]
  /// by setting the [AppUserDTO]'s foreign key `countryCodeId` to refer to the [CountryCodeDTO].
  Future<void> countryCode(
    _i1.Session session,
    AppUserDTO appUserDTO,
    _i3.CountryCodeDTO countryCode, {
    _i1.Transaction? transaction,
  }) async {
    if (appUserDTO.id == null) {
      throw ArgumentError.notNull('appUserDTO.id');
    }
    if (countryCode.id == null) {
      throw ArgumentError.notNull('countryCode.id');
    }

    var $appUserDTO = appUserDTO.copyWith(countryCodeId: countryCode.id);
    await session.db.updateRow<AppUserDTO>(
      $appUserDTO,
      columns: [AppUserDTO.t.countryCodeId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [AppUserDTO] and [DepartmentCodeDTO]
  /// by setting the [AppUserDTO]'s foreign key `departmentId` to refer to the [DepartmentCodeDTO].
  Future<void> department(
    _i1.Session session,
    AppUserDTO appUserDTO,
    _i4.DepartmentCodeDTO department, {
    _i1.Transaction? transaction,
  }) async {
    if (appUserDTO.id == null) {
      throw ArgumentError.notNull('appUserDTO.id');
    }
    if (department.id == null) {
      throw ArgumentError.notNull('department.id');
    }

    var $appUserDTO = appUserDTO.copyWith(departmentId: department.id);
    await session.db.updateRow<AppUserDTO>(
      $appUserDTO,
      columns: [AppUserDTO.t.departmentId],
      transaction: transaction,
    );
  }
}

class AppUserDTODetachRowRepository {
  const AppUserDTODetachRowRepository._();

  /// Detaches the relation between this [AppUserDTO] and the [UserInfo] set in `userInfo`
  /// by setting the [AppUserDTO]'s foreign key `userInfoId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> userInfo(
    _i1.Session session,
    AppUserDTO appuserdto, {
    _i1.Transaction? transaction,
  }) async {
    if (appuserdto.id == null) {
      throw ArgumentError.notNull('appuserdto.id');
    }

    var $appuserdto = appuserdto.copyWith(userInfoId: null);
    await session.db.updateRow<AppUserDTO>(
      $appuserdto,
      columns: [AppUserDTO.t.userInfoId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [AppUserDTO] and the [CountryCodeDTO] set in `countryCode`
  /// by setting the [AppUserDTO]'s foreign key `countryCodeId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> countryCode(
    _i1.Session session,
    AppUserDTO appuserdto, {
    _i1.Transaction? transaction,
  }) async {
    if (appuserdto.id == null) {
      throw ArgumentError.notNull('appuserdto.id');
    }

    var $appuserdto = appuserdto.copyWith(countryCodeId: null);
    await session.db.updateRow<AppUserDTO>(
      $appuserdto,
      columns: [AppUserDTO.t.countryCodeId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [AppUserDTO] and the [DepartmentCodeDTO] set in `department`
  /// by setting the [AppUserDTO]'s foreign key `departmentId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> department(
    _i1.Session session,
    AppUserDTO appuserdto, {
    _i1.Transaction? transaction,
  }) async {
    if (appuserdto.id == null) {
      throw ArgumentError.notNull('appuserdto.id');
    }

    var $appuserdto = appuserdto.copyWith(departmentId: null);
    await session.db.updateRow<AppUserDTO>(
      $appuserdto,
      columns: [AppUserDTO.t.departmentId],
      transaction: transaction,
    );
  }
}
