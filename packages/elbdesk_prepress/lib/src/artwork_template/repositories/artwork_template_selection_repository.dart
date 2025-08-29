import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork_template/models/artwork_template_selection.dart';

class ArtworkTemplateSelectionRepository
    implements EntityRepository<ArtworkTemplateSelection> {
  ArtworkTemplateSelectionRepository({required this.endpoint});

  final EndpointArtworkTemplateSelection endpoint;

  @override
  Future<List<ArtworkTemplateSelection>> find({
    Sort? sort,
    Filter? filter,
  }) async {
    final response = await endpoint.find(sort: sort, filter: filter);
    return response.map(ArtworkTemplateSelection.fromDTO).toList();
  }

  @override
  Future<ArtworkTemplateSelection> fetchById(int id) async {
    final response = await endpoint.fetchById(id);
    return ArtworkTemplateSelection.fromDTO(response!);
  }

  @override
  Future<List<ArtworkTemplateSelection>> fetchAll() async {
    final response = await endpoint.fetchAll();
    return response.map(ArtworkTemplateSelection.fromDTO).toList();
  }

  @override
  Future<ArtworkTemplateSelection?> fetchAndLock(
    int id,
    String sessionId,
  ) async {
    final response =
        await endpoint.fetchAndLock(id: id, editingSessionId: sessionId);
    return response != null ? ArtworkTemplateSelection.fromDTO(response) : null;
  }

  @override
  Future<void> release(int id, String sessionId) async {
    await endpoint.release(entityId: id, sessionId: sessionId);
  }

  @override
  Future<ArtworkTemplateSelection> update({
    required ArtworkTemplateSelection entity,
    required bool release,
    required String sessionId,
  }) async {
    final response = await endpoint.update(
      sessionId: sessionId,
      entity: entity.toDTO(),
      release: release,
    );
    return ArtworkTemplateSelection.fromDTO(response);
  }

  @override
  Future<ArtworkTemplateSelection> createAndReturnEntity({
    required ArtworkTemplateSelection entity,
    required bool release,
    required String sessionId,
  }) async {
    final response = await endpoint.create(
      sessionId: sessionId,
      entity: entity.toDTO(),
      release: release,
    );
    return ArtworkTemplateSelection.fromDTO(response);
  }

  @override
  Future<bool> delete(int entityId, String sessionId) async {
    // final response = await endpoint.delete(entityId, sessionId);
    // return response;
    throw UnimplementedError('delete is not implemented');
  }

  Future<List<ArtworkTemplateSelection>> fetchFromPreSelection(
    int preSelectionId,
  ) async {
    final response = await endpoint.fetchFromPreSelection(preSelectionId);
    return response.map(ArtworkTemplateSelection.fromDTO).toList();
  }
}
