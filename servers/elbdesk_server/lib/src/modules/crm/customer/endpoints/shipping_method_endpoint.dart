import 'dart:async';

import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/modules/core/table/table_type.dart';
import 'package:elbdesk_server/src/generated/modules/crm/customer/models/shipping_method.dart';
import 'package:elbdesk_server/src/generated/modules/crm/customer/models/shipping_method_field.dart';
import 'package:elbdesk_server/src/modules/crm/customer/shipping_method_handler.dart';
import 'package:elbdesk_server/src/modules/crm/customer/shipping_method_utils.dart';
import 'package:serverpod/serverpod.dart';

final shippingMethodStreamController =
    StreamController<ShippingMethodDTO>.broadcast();

class ShippingMethodEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  final _tableType = TableType.shippingMethod;

  Stream<ShippingMethodDTO> watch(
    Session session, {
    required String sessionId,
    required int entityId,
  }) async* {
    session.addWillCloseListener(
      (session) {
        ShippingMethodHandler.release(
          session,
          entityId: entityId,
          sessionId: sessionId,
        );
      },
    );

    yield* shippingMethodStreamController.stream
        .where((event) => event.id == entityId)
        .map((event) {
      return event;
    });
  }

  Stream<ShippingMethodDTO> watchAll(
    Session session,
  ) {
    return shippingMethodStreamController.stream;
  }

  Future<ShippingMethodDTO?> fetchById(Session session, int id) async {
    return ShippingMethodDTO.db.findById(
      session,
      id,
    );
  }

  Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await ShippingMethodHandler.release(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  Future<ShippingMethodDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return ShippingMethodHandler.fetchAndLock(
      session,
      id: id,
      editingSessionId: editingSessionId,
    );
  }

  Future<ShippingMethodDTO> create(
    Session session, {
    required ShippingMethodDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return ShippingMethodHandler.create(
      session,
      entity: entity,
      sessionId: sessionId,
      release: release,
    );
  }

  Future<List<ShippingMethodDTO>> fetchAll(Session session) async {
    return ShippingMethodDTO.db.find(
      session,
    );
  }

  Future<List<ShippingMethodDTO>> find(
    Session session, {
    Sort? sort,
    Filter? filter,
    int? id,
  }) async {
    final sortByField = ShippingMethodField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    final expression = ShippingMethodUtils.buildExpression(filter);
    return ShippingMethodDTO.db.find(
      session,
      where: expression == null ? null : (t) => expression,
      orderBy: ShippingMethodUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
    );
  }

  Future<ShippingMethodDTO> update(
    Session session, {
    required ShippingMethodDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return ShippingMethodHandler.update(
      session,
      entity: entity,
      sessionId: sessionId,
      release: release,
    );
  }

  Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    final entities = await ShippingMethodDTO.db.find(
      session,
      where: (t) =>
          t.editingSession.notEquals(null as String?) &
          t.editingSession.notEquals(''),
    );

    return entities
        .map(
          (e) => EntityLockDTO(
            tableType: _tableType.name,
            entityId: e.id!,
            editingSessionId: e.editingSession!,
            lockedAt: e.editingSince!,
            userId: e.editingById,
          ),
        )
        .toList();
  }
}
