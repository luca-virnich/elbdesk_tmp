import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/entity_log/entity_log_endpoint.dart';
import 'package:serverpod/serverpod.dart';

/// Artwork Log Endpoint
///
/// A endpoint for the Artwork Log entity
class ArtworkLogEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Creates a Artwork Log
  Future<void> create<T, E>({
    required T oldEntity,
    required T newEntity,
    required int userId,
    required DateTime updatedAt,
    required int salesOrderId,
    required int salesOrderCustomId,
    required List<LogField<T>> fields,
    required TableType tableType,
  }) async {
    final session = await Serverpod.instance.createSession();
    final logs = <ArtworkLogDTO>[];
    final entityId = (oldEntity as dynamic).id as int;

    for (final field in fields) {
      final oldValue = field.getValue(oldEntity);
      final newValue = field.getValue(newEntity);
      if (oldValue != newValue) {
        logs.add(
          ArtworkLogDTO(
            salesOrderId: salesOrderId,
            salesOrderCustomId: salesOrderCustomId,
            entityId: entityId,
            oldValue: oldValue?.toString() ?? '',
            newValue: newValue?.toString() ?? '',
            field: field.fieldName,
            updatedAt: updatedAt,
            tableType: tableType,
            updatedById: userId,
          ),
        );
      }
    }

    await ArtworkLogDTO.db.insert(session, logs);
    await session.close();
  }

  /// Fetch Artwork Logs
  Future<List<ArtworkLogDTO>> fetchArtworkLogs(
    Session session, {
    required int entityId,
    required TableType tableType,
  }) async {
    final logs = await ArtworkLogDTO.db.find(
      session,
      where: (t) => t.entityId.equals(entityId) & t.tableType.equals(tableType),
      orderBy: (t) => t.updatedAt,
      orderDescending: true,
    );

    return logs;
  }
}
