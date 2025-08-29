import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork_template/models/artwork_template_pre_selection.dart';

/// @nodoc
class ArtworkTemplatePreSelectionRepository
    implements EntityRepository<ArtworkTemplatePreSelection> {
  /// @nodoc
  ArtworkTemplatePreSelectionRepository({required this.endpoint});

  final EndpointArtworkTemplatePreSelection endpoint;

  @override
  Future<List<ArtworkTemplatePreSelection>> find({
    Sort? sort,
    Filter? filter,
  }) async {
    final response = await endpoint.find(sort: sort, filter: filter);
    return response.map(ArtworkTemplatePreSelection.fromDTO).toList();
  }

  @override
  Future<ArtworkTemplatePreSelection> fetchById(int id) async {
    final response = await endpoint.fetchById(id);
    return ArtworkTemplatePreSelection.fromDTO(response!);
  }

  @override
  Future<List<ArtworkTemplatePreSelection>> fetchAll() async {
    final response = await endpoint.fetchAll();
    return response.map(ArtworkTemplatePreSelection.fromDTO).toList();
  }

  @override
  Future<ArtworkTemplatePreSelection?> fetchAndLock(
    int id,
    String sessionId,
  ) async {
    final response =
        await endpoint.fetchAndLock(id: id, editingSessionId: sessionId);
    return response != null
        ? ArtworkTemplatePreSelection.fromDTO(response)
        : null;
  }

  @override
  Future<void> release(int id, String sessionId) async {
    await endpoint.release(entityId: id, sessionId: sessionId);
  }

  @override
  Future<ArtworkTemplatePreSelection> update({
    required ArtworkTemplatePreSelection entity,
    required bool release,
    required String sessionId,
  }) async {
    final response = await endpoint.update(
      sessionId: sessionId,
      entity: entity.toDTO(),
      release: release,
    );
    return ArtworkTemplatePreSelection.fromDTO(response);
  }

  @override
  Future<ArtworkTemplatePreSelection> createAndReturnEntity({
    required ArtworkTemplatePreSelection entity,
    required bool release,
    required String sessionId,
  }) async {
    final response = await endpoint.create(
      sessionId: sessionId,
      entity: entity.toDTO(),
      release: release,
    );
    return ArtworkTemplatePreSelection.fromDTO(response);
  }

  @override
  Future<bool> delete(int entityId, String sessionId) async {
    // final response = await endpoint.delete(entityId, sessionId);
    // return response;
    throw UnimplementedError('delete is not implemented');
  }

  Future<List<ArtworkTemplatePreSelection>> fetchByCustomerId(
    int customerId,
  ) async {
    final response = await endpoint.fetchByCustomerId(customerId);
    return response.map(ArtworkTemplatePreSelection.fromDTO).toList();
  }

  Future<List<ArtworkTemplatePreSelection>> fetchGlobal() async {
    final response = await endpoint.fetchGlobal();
    return response.map(ArtworkTemplatePreSelection.fromDTO).toList();
  }
}
