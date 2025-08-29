import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';

class DrucklayoutSelectionRepository
    implements EntityRepository<DrucklayoutSelection> {
  DrucklayoutSelectionRepository({required this.endpoint});

  final EndpointDrucklayoutSelection endpoint;

  @override
  Future<List<DrucklayoutSelection>> find({
    Sort? sort,
    Filter? filter,
  }) async {
    final response = await endpoint.find(sort: sort, filter: filter);
    return response.map(DrucklayoutSelection.fromDTO).toList();
  }

  @override
  Future<DrucklayoutSelection> fetchById(int id) async {
    final response = await endpoint.fetchById(id);
    return DrucklayoutSelection.fromDTO(response!);
  }

  @override
  Future<List<DrucklayoutSelection>> fetchAll() async {
    final response = await endpoint.fetchAll();
    return response.map(DrucklayoutSelection.fromDTO).toList();
  }

  @override
  Future<DrucklayoutSelection?> fetchAndLock(
    int id,
    String sessionId,
  ) async {
    final response =
        await endpoint.fetchAndLock(id: id, editingSessionId: sessionId);
    return response != null ? DrucklayoutSelection.fromDTO(response) : null;
  }

  @override
  Future<void> release(int id, String sessionId) async {
    await endpoint.release(entityId: id, sessionId: sessionId);
  }

  @override
  Future<DrucklayoutSelection> update({
    required DrucklayoutSelection entity,
    required bool release,
    required String sessionId,
  }) async {
    final response = await endpoint.update(
      sessionId: sessionId,
      entity: entity.toDTO(),
      release: release,
    );
    return DrucklayoutSelection.fromDTO(response);
  }

  @override
  Future<DrucklayoutSelection> createAndReturnEntity({
    required DrucklayoutSelection entity,
    required bool release,
    required String sessionId,
  }) async {
    final response = await endpoint.create(
      sessionId: sessionId,
      entity: entity.toDTO(),
      release: release,
    );
    return DrucklayoutSelection.fromDTO(response);
  }

  @override
  Future<bool> delete(int entityId, String sessionId) async {
    // final response = await endpoint.delete(entityId, sessionId);
    // return response;
    throw UnimplementedError('delete is not implemented');
  }

  Future<List<DrucklayoutSelection>> fetchFromPreSelection(
    int preSelectionId,
  ) async {
    final response = await endpoint.fetchFromPreSelection(preSelectionId);
    return response.map(DrucklayoutSelection.fromDTO).toList();
  }
}
