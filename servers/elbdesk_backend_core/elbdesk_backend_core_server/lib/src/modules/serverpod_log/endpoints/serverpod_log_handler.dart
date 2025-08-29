import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/protocol.dart';
import 'package:serverpod/serverpod.dart';

/// Handler class for Serverpod Log Entry business logic
class ServerpodLogHandler {
  const ServerpodLogHandler._();

  /// Fetches server logs with optional pagination and filtering
  static Future<List<ServerpodLogDTO>> fetchLogs(
    Session session, {
    int? limit,
    int? offset,
    String? searchTerm,
  }) async {
    try {
      final logs = await LogEntry.db.find(
        session,
        orderBy: (p0) => p0.time,
        where: searchTerm != null && searchTerm.isNotEmpty
            ? (p0) => p0.message.like('%$searchTerm%')
            : null,
        orderDescending: true,
        limit: limit,
        offset: offset,
      );

      return logs
          .map(
            (log) => ServerpodLogDTO(
              id: log.id,
              sessionLogId: log.sessionLogId,
              messageId: log.messageId,
              reference: log.reference,
              serverId: log.serverId,
              time: log.time,
              logLevel: log.logLevel.index,
              message: log.message,
              error: log.error,
              stackTrace: log.stackTrace,
            ),
          )
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch server logs: $e');
    }
  }

  /// Fetches a single log entry by its id
  static Future<ServerpodLogDTO?> fetchById(
    Session session,
    int id,
  ) async {
    try {
      final log = await LogEntry.db.findById(session, id);
      if (log == null) return null;

      return ServerpodLogDTO(
        id: log.id,
        sessionLogId: log.sessionLogId,
        messageId: log.messageId,
        reference: log.reference,
        serverId: log.serverId,
        time: log.time,
        logLevel: log.logLevel.index,
        message: log.message,
        error: log.error,
        stackTrace: log.stackTrace,
      );
    } catch (e) {
      throw Exception('Failed to fetch log entry: $e');
    }
  }
}
