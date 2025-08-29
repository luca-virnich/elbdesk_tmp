import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

/// Handler class for Flutter Log Entry business logic
class FlutterLogHandler {
  const FlutterLogHandler._();

  /// Creates a new Flutter log entry
  static Future<FlutterLogDTO> create(
    Session session,
    FlutterLogDTO log,
  ) async {
    return FlutterLogDTO.db.insertRow(
      session,
      log.copyWith(
        time: DateTime.now(),
      ),
    );
  }

  /// Fetches Flutter log entry by ID
  static Future<FlutterLogDTO?> fetchById(
    Session session,
    int id,
  ) async {
    return FlutterLogDTO.db.findById(
      session,
      id,
    );
  }

  /// Fetches Flutter error logs with pagination and filtering
  static Future<List<FlutterLogDTO>> fetch(
    Session session, {
    int? limit,
    int? offset,
    String? searchTerm,
  }) async {
    return FlutterLogDTO.db.find(
      session,
      where: searchTerm != null && searchTerm.isNotEmpty
          ? (t) =>
              t.exception.like('%$searchTerm%') |
              t.context.like('%$searchTerm%')
          : null,
      orderBy: (t) => t.time,
      orderDescending: true,
      limit: limit,
      offset: offset,
    );
  }
}
