import 'package:elbdesk_server/src/generated/modules/core/custom_entity_keys/custom_entity_int_keys.dart';
import 'package:elbdesk_server/src/generated/modules/core/table/table_type.dart';
import 'package:serverpod/serverpod.dart';

// Future calls are calls that will be invoked at a later time. An example is if
// you want to send a drip-email campaign after a user signs up. You can
// schedule a future call for a day, a week, or a month. The calls are stored in
// the database, so they will persist even if the server is restarted.
//
//  To add a future call to your server, you need to register it in the
//  `server.dart` file. Schedule the call using the
//  `session.serverpod.futureCallWithDelay` or
// `session.serverpod.futureCallAtTime`
//  methods. You can optionally pass a serializable object together with the
//  call.

class SetupCustomEntityKeysFutureCall extends FutureCall {
  @override
  Future<void> invoke(Session session, SerializableModel? object) async {
    await _setup(session, TableType.salesOrder, 500000);
    await _setup(session, TableType.salesOrderItem, 100000);
    await _setup(session, TableType.productMaster, 5500000);
    await _setup(session, TableType.contact, 20000);
    await _setup(session, TableType.customer, 20000);
  }

  Future<void> _setup(
    Session session,
    TableType tableType,
    int startNumber,
  ) async {
    // check if already exists
    final existing = await CustomEntityIntKeys.db.findFirstRow(
      session,
      where: (t) => t.tableType.equals(tableType),
    );
    if (existing != null) {
      return;
    }

    await CustomEntityIntKeys.db.insertRow(
      session,
      CustomEntityIntKeys(
        tableType: tableType,
        latestNumber: startNumber,
      ),
    );
  }
}
