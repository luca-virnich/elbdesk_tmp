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
import '../../../../modules/crm/company_employee/models/company_employee.dart'
    as _i2;
import '../../../../modules/crm/company_department/models/company_department.dart'
    as _i3;

abstract class CompanyEmployeeDepartmentJT implements _i1.SerializableModel {
  CompanyEmployeeDepartmentJT._({
    this.id,
    required this.companyEmployeeId,
    this.companyEmployee,
    required this.companyDepartmentId,
    this.companyDepartment,
  });

  factory CompanyEmployeeDepartmentJT({
    int? id,
    required int companyEmployeeId,
    _i2.CompanyEmployeeDTO? companyEmployee,
    required int companyDepartmentId,
    _i3.CompanyDepartmentDTO? companyDepartment,
  }) = _CompanyEmployeeDepartmentJTImpl;

  factory CompanyEmployeeDepartmentJT.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return CompanyEmployeeDepartmentJT(
      id: jsonSerialization['id'] as int?,
      companyEmployeeId: jsonSerialization['companyEmployeeId'] as int,
      companyEmployee: jsonSerialization['companyEmployee'] == null
          ? null
          : _i2.CompanyEmployeeDTO.fromJson(
              (jsonSerialization['companyEmployee'] as Map<String, dynamic>)),
      companyDepartmentId: jsonSerialization['companyDepartmentId'] as int,
      companyDepartment: jsonSerialization['companyDepartment'] == null
          ? null
          : _i3.CompanyDepartmentDTO.fromJson(
              (jsonSerialization['companyDepartment'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int companyEmployeeId;

  _i2.CompanyEmployeeDTO? companyEmployee;

  int companyDepartmentId;

  _i3.CompanyDepartmentDTO? companyDepartment;

  /// Returns a shallow copy of this [CompanyEmployeeDepartmentJT]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CompanyEmployeeDepartmentJT copyWith({
    int? id,
    int? companyEmployeeId,
    _i2.CompanyEmployeeDTO? companyEmployee,
    int? companyDepartmentId,
    _i3.CompanyDepartmentDTO? companyDepartment,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'companyEmployeeId': companyEmployeeId,
      if (companyEmployee != null) 'companyEmployee': companyEmployee?.toJson(),
      'companyDepartmentId': companyDepartmentId,
      if (companyDepartment != null)
        'companyDepartment': companyDepartment?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CompanyEmployeeDepartmentJTImpl extends CompanyEmployeeDepartmentJT {
  _CompanyEmployeeDepartmentJTImpl({
    int? id,
    required int companyEmployeeId,
    _i2.CompanyEmployeeDTO? companyEmployee,
    required int companyDepartmentId,
    _i3.CompanyDepartmentDTO? companyDepartment,
  }) : super._(
          id: id,
          companyEmployeeId: companyEmployeeId,
          companyEmployee: companyEmployee,
          companyDepartmentId: companyDepartmentId,
          companyDepartment: companyDepartment,
        );

  /// Returns a shallow copy of this [CompanyEmployeeDepartmentJT]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CompanyEmployeeDepartmentJT copyWith({
    Object? id = _Undefined,
    int? companyEmployeeId,
    Object? companyEmployee = _Undefined,
    int? companyDepartmentId,
    Object? companyDepartment = _Undefined,
  }) {
    return CompanyEmployeeDepartmentJT(
      id: id is int? ? id : this.id,
      companyEmployeeId: companyEmployeeId ?? this.companyEmployeeId,
      companyEmployee: companyEmployee is _i2.CompanyEmployeeDTO?
          ? companyEmployee
          : this.companyEmployee?.copyWith(),
      companyDepartmentId: companyDepartmentId ?? this.companyDepartmentId,
      companyDepartment: companyDepartment is _i3.CompanyDepartmentDTO?
          ? companyDepartment
          : this.companyDepartment?.copyWith(),
    );
  }
}
