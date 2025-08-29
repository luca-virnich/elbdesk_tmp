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
import '../../../modules/core/table/table_type.dart' as _i2;

abstract class EntityLogDTO implements _i1.SerializableModel {
  EntityLogDTO._({
    this.id,
    required this.entityId,
    required this.oldValue,
    required this.newValue,
    required this.field,
    required this.tableType,
    required this.editedAt,
    this.editedById,
  });

  factory EntityLogDTO({
    int? id,
    required int entityId,
    required String oldValue,
    required String newValue,
    required String field,
    required _i2.TableType tableType,
    required DateTime editedAt,
    int? editedById,
  }) = _EntityLogDTOImpl;

  factory EntityLogDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return EntityLogDTO(
      id: jsonSerialization['id'] as int?,
      entityId: jsonSerialization['entityId'] as int,
      oldValue: jsonSerialization['oldValue'] as String,
      newValue: jsonSerialization['newValue'] as String,
      field: jsonSerialization['field'] as String,
      tableType:
          _i2.TableType.fromJson((jsonSerialization['tableType'] as String)),
      editedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['editedAt']),
      editedById: jsonSerialization['editedById'] as int?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int entityId;

  String oldValue;

  String newValue;

  String field;

  _i2.TableType tableType;

  DateTime editedAt;

  int? editedById;

  /// Returns a shallow copy of this [EntityLogDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  EntityLogDTO copyWith({
    int? id,
    int? entityId,
    String? oldValue,
    String? newValue,
    String? field,
    _i2.TableType? tableType,
    DateTime? editedAt,
    int? editedById,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'entityId': entityId,
      'oldValue': oldValue,
      'newValue': newValue,
      'field': field,
      'tableType': tableType.toJson(),
      'editedAt': editedAt.toJson(),
      if (editedById != null) 'editedById': editedById,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EntityLogDTOImpl extends EntityLogDTO {
  _EntityLogDTOImpl({
    int? id,
    required int entityId,
    required String oldValue,
    required String newValue,
    required String field,
    required _i2.TableType tableType,
    required DateTime editedAt,
    int? editedById,
  }) : super._(
          id: id,
          entityId: entityId,
          oldValue: oldValue,
          newValue: newValue,
          field: field,
          tableType: tableType,
          editedAt: editedAt,
          editedById: editedById,
        );

  /// Returns a shallow copy of this [EntityLogDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  EntityLogDTO copyWith({
    Object? id = _Undefined,
    int? entityId,
    String? oldValue,
    String? newValue,
    String? field,
    _i2.TableType? tableType,
    DateTime? editedAt,
    Object? editedById = _Undefined,
  }) {
    return EntityLogDTO(
      id: id is int? ? id : this.id,
      entityId: entityId ?? this.entityId,
      oldValue: oldValue ?? this.oldValue,
      newValue: newValue ?? this.newValue,
      field: field ?? this.field,
      tableType: tableType ?? this.tableType,
      editedAt: editedAt ?? this.editedAt,
      editedById: editedById is int? ? editedById : this.editedById,
    );
  }
}
