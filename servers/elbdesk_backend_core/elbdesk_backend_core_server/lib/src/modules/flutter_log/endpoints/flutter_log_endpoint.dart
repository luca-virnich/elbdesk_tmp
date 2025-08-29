import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_backend_core_server/src/modules/flutter_log/endpoints/flutter_log_handler.dart';
import 'package:serverpod/serverpod.dart';

/// Endpoint for managing Flutter error logs
class FlutterLogEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Creates a new Flutter log entry
  Future<FlutterLogDTO> create(
    Session session,
    FlutterLogDTO log,
  ) async {
    return FlutterLogHandler.create(
      session,
      log,
    );
  }

  /// Fetches Flutter error logs with pagination and filtering
  Future<List<FlutterLogDTO>> fetch(
    Session session, {
    int? limit,
    int? offset,
    String? searchTerm,
  }) async {
    return FlutterLogHandler.fetch(
      session,
      limit: limit,
      offset: offset,
      searchTerm: searchTerm,
    );
  }

  /// Fetches a single log entry by its id
  Future<FlutterLogDTO?> fetchById(
    Session session,
    int id,
  ) async {
    return FlutterLogHandler.fetchById(
      session,
      id,
    );
  }
}
