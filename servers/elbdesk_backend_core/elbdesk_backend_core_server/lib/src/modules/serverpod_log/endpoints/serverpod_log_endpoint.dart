import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_backend_core_server/src/modules/serverpod_log/endpoints/serverpod_log_handler.dart';
import 'package:serverpod/serverpod.dart';

class ServerpodLogEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Fetches server logs with optional pagination and filtering
  Future<List<ServerpodLogDTO>> fetchLogs(
    Session session, {
    int? limit,
    int? offset,
    String? searchTerm,
  }) async {
    return ServerpodLogHandler.fetchLogs(
      session,
      limit: limit,
      offset: offset,
      searchTerm: searchTerm,
    );
  }

  /// Fetches a single log entry by its id
  Future<ServerpodLogDTO?> fetchById(
    Session session,
    int id,
  ) async {
    return ServerpodLogHandler.fetchById(session, id);
  }
}
