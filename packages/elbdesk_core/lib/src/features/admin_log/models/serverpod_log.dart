import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'serverpod_log.freezed.dart';

/// Represents a log entry from Serverpod in the application
@freezed
class ServerpodLog with _$ServerpodLog {
  /// Creates a ServerpodLog
  const factory ServerpodLog({
    required int? id,
    required DateTime time,
    required String message,
    required int level,
    String? error,
    String? stackTrace,
    String? serverity,
    String? reference,
    String? serverId,
    int? sessionLogId,
    int? messageId,
  }) = _ServerpodLog;

  const ServerpodLog._();

  /// Creates a ServerpodLog from a DTO
  factory ServerpodLog.fromDTO(ServerpodLogDTO dto) {
    return ServerpodLog(
      id: dto.id,
      time: dto.time.toLocal(),
      message: dto.message,
      level: dto.logLevel,
      error: dto.error,
      stackTrace: dto.stackTrace,
      serverity: dto.serverity,
      reference: dto.reference,
      serverId: dto.serverId,
      sessionLogId: dto.sessionLogId,
      messageId: dto.messageId,
    );
  }

  /// Converts ServerpodLog to a DTO
  ServerpodLogDTO toDTO() {
    return ServerpodLogDTO(
      id: id,
      time: time,
      message: message,
      logLevel: level,
      error: error,
      stackTrace: stackTrace,
      serverity: serverity,
    );
  }
}
