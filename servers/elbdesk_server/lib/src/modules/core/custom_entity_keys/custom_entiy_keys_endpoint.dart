import 'package:elbdesk_server/src/generated/modules/core/custom_entity_keys/custom_entity_int_keys.dart';
import 'package:elbdesk_server/src/generated/modules/core/table/table_type.dart';
import 'package:serverpod/serverpod.dart';

/// Custom Entity Keys Endpoint
///
/// Used to create initial keys for custom entities.
///
/// Creates a specific number range for an entity
///
class CustomEntityKeysHandler {
  const CustomEntityKeysHandler._();

  /// Create initial keys

  /// Get the next int key for a specific table type
  static Future<int> getNextIntKeyTransaction(
    TableType tableType,
  ) async {
    var attempts = 0;
    const maxAttempts = 5;
    final session = await Serverpod.instance.createSession();

    try {
      while (attempts < maxAttempts) {
        try {
          final nextInt = await session.db.transaction(
            (
              transaction,
            ) async {
              // Get the current key entry for the table
              final currentKeyEntryForTable =
                  await CustomEntityIntKeys.db.findFirstRow(
                session,
                where: (t) => t.tableType.equals(tableType),
                transaction: transaction,
              );

              // Get the current key, if null set to 0
              final currentKey = currentKeyEntryForTable!.latestNumber;
              session.log('CURRENT KEY: $currentKey');
              final newKey = currentKey + 1;
              session.log('NEW KEY: $newKey');

              // Insert or update the key entry for the table
              await CustomEntityIntKeys.db.updateRow(
                session,
                currentKeyEntryForTable.copyWith(
                  latestNumber: newKey,
                ),
                transaction: transaction,
              );
              return newKey;
            },
            settings: const TransactionSettings(
              isolationLevel: IsolationLevel.repeatableRead,
            ),
          );

          return nextInt;
        } on DatabaseQueryException catch (e) {
          if (e.code == PgErrorCode.serializationFailure) {
            attempts++;
            if (attempts >= maxAttempts) {
              throw Exception(
                'Failed to get next int key after $maxAttempts attempts: $e',
              );
            }
            await Future<void>.delayed(Duration(milliseconds: 50 * attempts));
          } else {
            rethrow;
          }
        }
      }

      throw Exception('Failed to get next int key after $maxAttempts attempts');
    } finally {
      await session.close();
    }
  }

  static Future<int> getNextIntKey(
    Session session,
    TableType tableType,
    Transaction transaction,
  ) async {
    final currentKeyEntryForTable = await CustomEntityIntKeys.db.findFirstRow(
      session,
      where: (t) => t.tableType.equals(tableType),
      transaction: transaction,
    );

    final currentKey = currentKeyEntryForTable!.latestNumber;
    session.log('CURRENT KEY: $currentKey');
    final newKey = currentKey + 1;
    session.log('NEW KEY: $newKey');
    await CustomEntityIntKeys.db.updateRow(
      session,
      currentKeyEntryForTable.copyWith(
        latestNumber: newKey,
      ),
      transaction: transaction,
    );
    return newKey;
  }
}
