/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../exceptions/elb_exception/elb_exception_type.dart' as _i2;

abstract class ElbException
    implements
        _i1.SerializableException,
        _i1.SerializableModel,
        _i1.ProtocolSerialization {
  ElbException._({
    required this.exceptionType,
    required this.message,
    this.code,
    this.columnName,
    this.constraintName,
    this.tableName,
    this.artifacts,
    this.field,
    this.databaseExceptionMessage,
  });

  factory ElbException({
    required _i2.ElbExceptionType exceptionType,
    required String message,
    String? code,
    String? columnName,
    String? constraintName,
    String? tableName,
    List<String>? artifacts,
    String? field,
    String? databaseExceptionMessage,
  }) = _ElbExceptionImpl;

  factory ElbException.fromJson(Map<String, dynamic> jsonSerialization) {
    return ElbException(
      exceptionType: _i2.ElbExceptionType.fromJson(
          (jsonSerialization['exceptionType'] as String)),
      message: jsonSerialization['message'] as String,
      code: jsonSerialization['code'] as String?,
      columnName: jsonSerialization['columnName'] as String?,
      constraintName: jsonSerialization['constraintName'] as String?,
      tableName: jsonSerialization['tableName'] as String?,
      artifacts: (jsonSerialization['artifacts'] as List?)
          ?.map((e) => e as String)
          .toList(),
      field: jsonSerialization['field'] as String?,
      databaseExceptionMessage:
          jsonSerialization['databaseExceptionMessage'] as String?,
    );
  }

  _i2.ElbExceptionType exceptionType;

  String message;

  String? code;

  String? columnName;

  String? constraintName;

  String? tableName;

  List<String>? artifacts;

  String? field;

  String? databaseExceptionMessage;

  /// Returns a shallow copy of this [ElbException]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ElbException copyWith({
    _i2.ElbExceptionType? exceptionType,
    String? message,
    String? code,
    String? columnName,
    String? constraintName,
    String? tableName,
    List<String>? artifacts,
    String? field,
    String? databaseExceptionMessage,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'exceptionType': exceptionType.toJson(),
      'message': message,
      if (code != null) 'code': code,
      if (columnName != null) 'columnName': columnName,
      if (constraintName != null) 'constraintName': constraintName,
      if (tableName != null) 'tableName': tableName,
      if (artifacts != null) 'artifacts': artifacts?.toJson(),
      if (field != null) 'field': field,
      if (databaseExceptionMessage != null)
        'databaseExceptionMessage': databaseExceptionMessage,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'exceptionType': exceptionType.toJson(),
      'message': message,
      if (code != null) 'code': code,
      if (columnName != null) 'columnName': columnName,
      if (constraintName != null) 'constraintName': constraintName,
      if (tableName != null) 'tableName': tableName,
      if (artifacts != null) 'artifacts': artifacts?.toJson(),
      if (field != null) 'field': field,
      if (databaseExceptionMessage != null)
        'databaseExceptionMessage': databaseExceptionMessage,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ElbExceptionImpl extends ElbException {
  _ElbExceptionImpl({
    required _i2.ElbExceptionType exceptionType,
    required String message,
    String? code,
    String? columnName,
    String? constraintName,
    String? tableName,
    List<String>? artifacts,
    String? field,
    String? databaseExceptionMessage,
  }) : super._(
          exceptionType: exceptionType,
          message: message,
          code: code,
          columnName: columnName,
          constraintName: constraintName,
          tableName: tableName,
          artifacts: artifacts,
          field: field,
          databaseExceptionMessage: databaseExceptionMessage,
        );

  /// Returns a shallow copy of this [ElbException]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ElbException copyWith({
    _i2.ElbExceptionType? exceptionType,
    String? message,
    Object? code = _Undefined,
    Object? columnName = _Undefined,
    Object? constraintName = _Undefined,
    Object? tableName = _Undefined,
    Object? artifacts = _Undefined,
    Object? field = _Undefined,
    Object? databaseExceptionMessage = _Undefined,
  }) {
    return ElbException(
      exceptionType: exceptionType ?? this.exceptionType,
      message: message ?? this.message,
      code: code is String? ? code : this.code,
      columnName: columnName is String? ? columnName : this.columnName,
      constraintName:
          constraintName is String? ? constraintName : this.constraintName,
      tableName: tableName is String? ? tableName : this.tableName,
      artifacts: artifacts is List<String>?
          ? artifacts
          : this.artifacts?.map((e0) => e0).toList(),
      field: field is String? ? field : this.field,
      databaseExceptionMessage: databaseExceptionMessage is String?
          ? databaseExceptionMessage
          : this.databaseExceptionMessage,
    );
  }
}
