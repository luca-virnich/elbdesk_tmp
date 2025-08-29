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
import '../../../../modules/core/table/table_type.dart' as _i2;

abstract class ArtworkLogDTO implements _i1.SerializableModel {
  ArtworkLogDTO._({
    this.id,
    required this.entityId,
    required this.salesOrderId,
    required this.salesOrderCustomId,
    required this.oldValue,
    required this.newValue,
    required this.field,
    required this.tableType,
    required this.updatedAt,
    this.updatedById,
  });

  factory ArtworkLogDTO({
    int? id,
    required int entityId,
    required int salesOrderId,
    required int salesOrderCustomId,
    required String oldValue,
    required String newValue,
    required String field,
    required _i2.TableType tableType,
    required DateTime updatedAt,
    int? updatedById,
  }) = _ArtworkLogDTOImpl;

  factory ArtworkLogDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return ArtworkLogDTO(
      id: jsonSerialization['id'] as int?,
      entityId: jsonSerialization['entityId'] as int,
      salesOrderId: jsonSerialization['salesOrderId'] as int,
      salesOrderCustomId: jsonSerialization['salesOrderCustomId'] as int,
      oldValue: jsonSerialization['oldValue'] as String,
      newValue: jsonSerialization['newValue'] as String,
      field: jsonSerialization['field'] as String,
      tableType:
          _i2.TableType.fromJson((jsonSerialization['tableType'] as String)),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      updatedById: jsonSerialization['updatedById'] as int?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int entityId;

  int salesOrderId;

  int salesOrderCustomId;

  String oldValue;

  String newValue;

  String field;

  _i2.TableType tableType;

  DateTime updatedAt;

  int? updatedById;

  /// Returns a shallow copy of this [ArtworkLogDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArtworkLogDTO copyWith({
    int? id,
    int? entityId,
    int? salesOrderId,
    int? salesOrderCustomId,
    String? oldValue,
    String? newValue,
    String? field,
    _i2.TableType? tableType,
    DateTime? updatedAt,
    int? updatedById,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'entityId': entityId,
      'salesOrderId': salesOrderId,
      'salesOrderCustomId': salesOrderCustomId,
      'oldValue': oldValue,
      'newValue': newValue,
      'field': field,
      'tableType': tableType.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (updatedById != null) 'updatedById': updatedById,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArtworkLogDTOImpl extends ArtworkLogDTO {
  _ArtworkLogDTOImpl({
    int? id,
    required int entityId,
    required int salesOrderId,
    required int salesOrderCustomId,
    required String oldValue,
    required String newValue,
    required String field,
    required _i2.TableType tableType,
    required DateTime updatedAt,
    int? updatedById,
  }) : super._(
          id: id,
          entityId: entityId,
          salesOrderId: salesOrderId,
          salesOrderCustomId: salesOrderCustomId,
          oldValue: oldValue,
          newValue: newValue,
          field: field,
          tableType: tableType,
          updatedAt: updatedAt,
          updatedById: updatedById,
        );

  /// Returns a shallow copy of this [ArtworkLogDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArtworkLogDTO copyWith({
    Object? id = _Undefined,
    int? entityId,
    int? salesOrderId,
    int? salesOrderCustomId,
    String? oldValue,
    String? newValue,
    String? field,
    _i2.TableType? tableType,
    DateTime? updatedAt,
    Object? updatedById = _Undefined,
  }) {
    return ArtworkLogDTO(
      id: id is int? ? id : this.id,
      entityId: entityId ?? this.entityId,
      salesOrderId: salesOrderId ?? this.salesOrderId,
      salesOrderCustomId: salesOrderCustomId ?? this.salesOrderCustomId,
      oldValue: oldValue ?? this.oldValue,
      newValue: newValue ?? this.newValue,
      field: field ?? this.field,
      tableType: tableType ?? this.tableType,
      updatedAt: updatedAt ?? this.updatedAt,
      updatedById: updatedById is int? ? updatedById : this.updatedById,
    );
  }
}
