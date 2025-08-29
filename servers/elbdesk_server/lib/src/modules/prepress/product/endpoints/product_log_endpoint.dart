import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/entity_log/entity_log_endpoint.dart';
import 'package:serverpod/serverpod.dart';

/// Product Log Endpoint
///
/// An endpoint for the Product Log entity
class ProductLogEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Creates a Product Log
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
    final logs = <ProductLogDTO>[];
    final entityId = (oldEntity as dynamic).id as int;

    for (final field in fields) {
      final oldValue = field.getValue(oldEntity);
      final newValue = field.getValue(newEntity);
      if (oldValue != newValue) {
        logs.add(
          ProductLogDTO(
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

    await ProductLogDTO.db.insert(session, logs);
    await session.close();
  }

  /// Fetch Product Logs
  Future<List<ProductLogDTO>> fetchProductLogs(
    Session session, {
    required int entityId,
    required TableType tableType,
  }) async {
    final logs = await ProductLogDTO.db.find(
      session,
      where: (t) => t.entityId.equals(entityId) & t.tableType.equals(tableType),
      orderBy: (t) => t.updatedAt,
      orderDescending: true,
    );

    return logs;
  }
}
