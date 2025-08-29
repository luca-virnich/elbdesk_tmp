import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/entity_log/entity_log_endpoint.dart';
import 'package:serverpod/serverpod.dart';

class EntityLogHandler {
  const EntityLogHandler._();

  /// Create Entity Log
  ///
  /// Creates an entity log for a given entity and user
  static Future<void> create<T>(
    Session session, {
    required T oldEntity,
    required T newEntity,
    required int userId,
    required DateTime editedAt,
    required TableType tableType,
    required List<LogField<T>> fields,
    required Transaction transaction,
  }) async {
    final logs = <EntityLogDTO>[];
    final entityId = (oldEntity as dynamic).id as int;

    for (final field in fields) {
      final oldValue = field.getValue(oldEntity);
      final newValue = field.getValue(newEntity);
      if (oldValue != newValue) {
        logs.add(
          EntityLogDTO(
            entityId: entityId,
            oldValue: oldValue?.toString() ?? '',
            newValue: newValue?.toString() ?? '',
            field: field.fieldName,
            tableType: tableType,
            editedAt: editedAt,
            editedById: userId,
          ),
        );
      }
    }

    await EntityLogDTO.db.insert(session, logs, transaction: transaction);
  }
}
