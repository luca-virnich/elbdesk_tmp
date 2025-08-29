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

abstract class RejectEditRequestDTO implements _i1.SerializableModel {
  RejectEditRequestDTO._({
    required this.tableType,
    required this.tablePrimaryKey,
    required this.createdByName,
    required this.createdAt,
    required this.message,
    required this.floatingWindowId,
  });

  factory RejectEditRequestDTO({
    required String tableType,
    required int tablePrimaryKey,
    required String createdByName,
    required DateTime createdAt,
    required String message,
    required String floatingWindowId,
  }) = _RejectEditRequestDTOImpl;

  factory RejectEditRequestDTO.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return RejectEditRequestDTO(
      tableType: jsonSerialization['tableType'] as String,
      tablePrimaryKey: jsonSerialization['tablePrimaryKey'] as int,
      createdByName: jsonSerialization['createdByName'] as String,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      message: jsonSerialization['message'] as String,
      floatingWindowId: jsonSerialization['floatingWindowId'] as String,
    );
  }

  String tableType;

  int tablePrimaryKey;

  String createdByName;

  DateTime createdAt;

  String message;

  String floatingWindowId;

  /// Returns a shallow copy of this [RejectEditRequestDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RejectEditRequestDTO copyWith({
    String? tableType,
    int? tablePrimaryKey,
    String? createdByName,
    DateTime? createdAt,
    String? message,
    String? floatingWindowId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'tableType': tableType,
      'tablePrimaryKey': tablePrimaryKey,
      'createdByName': createdByName,
      'createdAt': createdAt.toJson(),
      'message': message,
      'floatingWindowId': floatingWindowId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _RejectEditRequestDTOImpl extends RejectEditRequestDTO {
  _RejectEditRequestDTOImpl({
    required String tableType,
    required int tablePrimaryKey,
    required String createdByName,
    required DateTime createdAt,
    required String message,
    required String floatingWindowId,
  }) : super._(
          tableType: tableType,
          tablePrimaryKey: tablePrimaryKey,
          createdByName: createdByName,
          createdAt: createdAt,
          message: message,
          floatingWindowId: floatingWindowId,
        );

  /// Returns a shallow copy of this [RejectEditRequestDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RejectEditRequestDTO copyWith({
    String? tableType,
    int? tablePrimaryKey,
    String? createdByName,
    DateTime? createdAt,
    String? message,
    String? floatingWindowId,
  }) {
    return RejectEditRequestDTO(
      tableType: tableType ?? this.tableType,
      tablePrimaryKey: tablePrimaryKey ?? this.tablePrimaryKey,
      createdByName: createdByName ?? this.createdByName,
      createdAt: createdAt ?? this.createdAt,
      message: message ?? this.message,
      floatingWindowId: floatingWindowId ?? this.floatingWindowId,
    );
  }
}
