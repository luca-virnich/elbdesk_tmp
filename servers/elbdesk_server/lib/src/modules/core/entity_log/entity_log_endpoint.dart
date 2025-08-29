import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

/// Entity Log Endpoint
///
/// Entity logs are used to track changes to entities
class EntityLogEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Fetch Entity Logs
  ///
  /// Fetches all entity logs for a given entity and table type
  Future<List<EntityLogDTO>> fetchEntityLogs(
    Session session, {
    required int entityId,
    required TableType tableType,
  }) async {
    final logs = await EntityLogDTO.db.find(
      session,
      where: (t) => t.entityId.equals(entityId) & t.tableType.equals(tableType),
      orderBy: (t) => t.editedAt,
      orderDescending: true,
    );

    return logs;
  }
}

class LogField<T> {
  LogField({required this.fieldName, required this.getValue});
  final String fieldName;
  final dynamic Function(T entity) getValue;
}
