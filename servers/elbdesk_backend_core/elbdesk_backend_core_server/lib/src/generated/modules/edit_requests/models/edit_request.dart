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

abstract class EditRequestDTO
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  EditRequestDTO._({
    required this.tableType,
    required this.tablePrimaryKey,
    required this.createdByName,
    required this.createdAt,
    required this.message,
    required this.requestingFloatingWindowId,
  });

  factory EditRequestDTO({
    required String tableType,
    required int tablePrimaryKey,
    required String createdByName,
    required DateTime createdAt,
    required String message,
    required String requestingFloatingWindowId,
  }) = _EditRequestDTOImpl;

  factory EditRequestDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return EditRequestDTO(
      tableType: jsonSerialization['tableType'] as String,
      tablePrimaryKey: jsonSerialization['tablePrimaryKey'] as int,
      createdByName: jsonSerialization['createdByName'] as String,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      message: jsonSerialization['message'] as String,
      requestingFloatingWindowId:
          jsonSerialization['requestingFloatingWindowId'] as String,
    );
  }

  String tableType;

  int tablePrimaryKey;

  String createdByName;

  DateTime createdAt;

  String message;

  String requestingFloatingWindowId;

  /// Returns a shallow copy of this [EditRequestDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  EditRequestDTO copyWith({
    String? tableType,
    int? tablePrimaryKey,
    String? createdByName,
    DateTime? createdAt,
    String? message,
    String? requestingFloatingWindowId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'tableType': tableType,
      'tablePrimaryKey': tablePrimaryKey,
      'createdByName': createdByName,
      'createdAt': createdAt.toJson(),
      'message': message,
      'requestingFloatingWindowId': requestingFloatingWindowId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'tableType': tableType,
      'tablePrimaryKey': tablePrimaryKey,
      'createdByName': createdByName,
      'createdAt': createdAt.toJson(),
      'message': message,
      'requestingFloatingWindowId': requestingFloatingWindowId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _EditRequestDTOImpl extends EditRequestDTO {
  _EditRequestDTOImpl({
    required String tableType,
    required int tablePrimaryKey,
    required String createdByName,
    required DateTime createdAt,
    required String message,
    required String requestingFloatingWindowId,
  }) : super._(
          tableType: tableType,
          tablePrimaryKey: tablePrimaryKey,
          createdByName: createdByName,
          createdAt: createdAt,
          message: message,
          requestingFloatingWindowId: requestingFloatingWindowId,
        );

  /// Returns a shallow copy of this [EditRequestDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  EditRequestDTO copyWith({
    String? tableType,
    int? tablePrimaryKey,
    String? createdByName,
    DateTime? createdAt,
    String? message,
    String? requestingFloatingWindowId,
  }) {
    return EditRequestDTO(
      tableType: tableType ?? this.tableType,
      tablePrimaryKey: tablePrimaryKey ?? this.tablePrimaryKey,
      createdByName: createdByName ?? this.createdByName,
      createdAt: createdAt ?? this.createdAt,
      message: message ?? this.message,
      requestingFloatingWindowId:
          requestingFloatingWindowId ?? this.requestingFloatingWindowId,
    );
  }
}
