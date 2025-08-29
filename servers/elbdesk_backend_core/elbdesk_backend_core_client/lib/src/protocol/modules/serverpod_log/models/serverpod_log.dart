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

abstract class ServerpodLogDTO implements _i1.SerializableModel {
  ServerpodLogDTO._({
    this.id,
    this.sessionLogId,
    this.messageId,
    this.reference,
    this.serverId,
    required this.time,
    required this.logLevel,
    required this.message,
    this.error,
    this.stackTrace,
    this.serverity,
  });

  factory ServerpodLogDTO({
    int? id,
    int? sessionLogId,
    int? messageId,
    String? reference,
    String? serverId,
    required DateTime time,
    required int logLevel,
    required String message,
    String? error,
    String? stackTrace,
    String? serverity,
  }) = _ServerpodLogDTOImpl;

  factory ServerpodLogDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return ServerpodLogDTO(
      id: jsonSerialization['id'] as int?,
      sessionLogId: jsonSerialization['sessionLogId'] as int?,
      messageId: jsonSerialization['messageId'] as int?,
      reference: jsonSerialization['reference'] as String?,
      serverId: jsonSerialization['serverId'] as String?,
      time: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['time']),
      logLevel: jsonSerialization['logLevel'] as int,
      message: jsonSerialization['message'] as String,
      error: jsonSerialization['error'] as String?,
      stackTrace: jsonSerialization['stackTrace'] as String?,
      serverity: jsonSerialization['serverity'] as String?,
    );
  }

  int? id;

  int? sessionLogId;

  int? messageId;

  String? reference;

  String? serverId;

  DateTime time;

  int logLevel;

  String message;

  String? error;

  String? stackTrace;

  String? serverity;

  /// Returns a shallow copy of this [ServerpodLogDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ServerpodLogDTO copyWith({
    int? id,
    int? sessionLogId,
    int? messageId,
    String? reference,
    String? serverId,
    DateTime? time,
    int? logLevel,
    String? message,
    String? error,
    String? stackTrace,
    String? serverity,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (sessionLogId != null) 'sessionLogId': sessionLogId,
      if (messageId != null) 'messageId': messageId,
      if (reference != null) 'reference': reference,
      if (serverId != null) 'serverId': serverId,
      'time': time.toJson(),
      'logLevel': logLevel,
      'message': message,
      if (error != null) 'error': error,
      if (stackTrace != null) 'stackTrace': stackTrace,
      if (serverity != null) 'serverity': serverity,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ServerpodLogDTOImpl extends ServerpodLogDTO {
  _ServerpodLogDTOImpl({
    int? id,
    int? sessionLogId,
    int? messageId,
    String? reference,
    String? serverId,
    required DateTime time,
    required int logLevel,
    required String message,
    String? error,
    String? stackTrace,
    String? serverity,
  }) : super._(
          id: id,
          sessionLogId: sessionLogId,
          messageId: messageId,
          reference: reference,
          serverId: serverId,
          time: time,
          logLevel: logLevel,
          message: message,
          error: error,
          stackTrace: stackTrace,
          serverity: serverity,
        );

  /// Returns a shallow copy of this [ServerpodLogDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ServerpodLogDTO copyWith({
    Object? id = _Undefined,
    Object? sessionLogId = _Undefined,
    Object? messageId = _Undefined,
    Object? reference = _Undefined,
    Object? serverId = _Undefined,
    DateTime? time,
    int? logLevel,
    String? message,
    Object? error = _Undefined,
    Object? stackTrace = _Undefined,
    Object? serverity = _Undefined,
  }) {
    return ServerpodLogDTO(
      id: id is int? ? id : this.id,
      sessionLogId: sessionLogId is int? ? sessionLogId : this.sessionLogId,
      messageId: messageId is int? ? messageId : this.messageId,
      reference: reference is String? ? reference : this.reference,
      serverId: serverId is String? ? serverId : this.serverId,
      time: time ?? this.time,
      logLevel: logLevel ?? this.logLevel,
      message: message ?? this.message,
      error: error is String? ? error : this.error,
      stackTrace: stackTrace is String? ? stackTrace : this.stackTrace,
      serverity: serverity is String? ? serverity : this.serverity,
    );
  }
}
