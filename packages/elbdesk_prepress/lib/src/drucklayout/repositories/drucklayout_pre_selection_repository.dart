import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';

/// @nodoc
class DrucklayoutPreSelectionRepository
    implements EntityRepository<DrucklayoutPreSelection> {
  /// @nodoc
  DrucklayoutPreSelectionRepository({required this.endpoint});

  final EndpointDrucklayoutPreSelection endpoint;

  @override
  Future<List<DrucklayoutPreSelection>> find({
    Sort? sort,
    Filter? filter,
  }) async {
    final response = await endpoint.find(sort: sort, filter: filter);
    return response.map(DrucklayoutPreSelection.fromDTO).toList();
  }

  @override
  Future<DrucklayoutPreSelection> fetchById(int id) async {
    final response = await endpoint.fetchById(id);
    return DrucklayoutPreSelection.fromDTO(response!);
  }

  @override
  Future<List<DrucklayoutPreSelection>> fetchAll() async {
    final response = await endpoint.fetchAll();
    return response.map(DrucklayoutPreSelection.fromDTO).toList();
  }

  @override
  Future<DrucklayoutPreSelection?> fetchAndLock(
    int id,
    String sessionId,
  ) async {
    final response =
        await endpoint.fetchAndLock(id: id, editingSessionId: sessionId);
    return response != null ? DrucklayoutPreSelection.fromDTO(response) : null;
  }

  @override
  Future<void> release(int id, String sessionId) async {
    await endpoint.release(entityId: id, sessionId: sessionId);
  }

  @override
  Future<DrucklayoutPreSelection> update({
    required DrucklayoutPreSelection entity,
    required bool release,
    required String sessionId,
  }) async {
    final response = await endpoint.update(
      sessionId: sessionId,
      entity: entity.toDTO(),
      release: release,
    );
    return DrucklayoutPreSelection.fromDTO(response);
  }

  @override
  Future<DrucklayoutPreSelection> createAndReturnEntity({
    required DrucklayoutPreSelection entity,
    required bool release,
    required String sessionId,
  }) async {
    final response = await endpoint.create(
      sessionId: sessionId,
      entity: entity.toDTO(),
      release: release,
    );
    return DrucklayoutPreSelection.fromDTO(response);
  }

  @override
  Future<bool> delete(int entityId, String sessionId) async {
    // final response = await endpoint.delete(entityId, sessionId);
    // return response;
    throw UnimplementedError('delete is not implemented');
  }

  Future<List<DrucklayoutPreSelection>> fetchByCustomerId(
    int customerId,
  ) async {
    final response = await endpoint.fetchByCustomerId(customerId);
    return response.map(DrucklayoutPreSelection.fromDTO).toList();
  }

  Future<List<DrucklayoutPreSelection>> fetchGlobal() async {
    final response = await endpoint.fetchGlobal();
    return response.map(DrucklayoutPreSelection.fromDTO).toList();
  }
}
