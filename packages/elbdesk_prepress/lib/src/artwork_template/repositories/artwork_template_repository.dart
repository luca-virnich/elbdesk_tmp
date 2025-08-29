import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork_template/models/artwork_template.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArtworkTemplateRepository extends EntityRepository<ArtworkTemplate> {
  ArtworkTemplateRepository({
    required this.ref,
    required this.endpoint,
  });

  final Ref ref;
  final EndpointArtworkTemplate endpoint;

  @override
  Future<ArtworkTemplate> createAndReturnEntity({
    required String sessionId,
    required ArtworkTemplate entity,
    required bool release,
  }) async {
    throw UnimplementedError();
  }

  Future<int> create({
    required String sessionId,
    required int? customerId,
    required int preSelectionId,
    required int selectionId,
  }) async {
    final artworkTemplate = await endpoint.create(
      customerId: customerId,
      preSelectionId: preSelectionId,
      selectionId: selectionId,
      sessionId: sessionId,
    );
    return artworkTemplate.id!;
  }

  @override
  Future<List<ArtworkTemplate>> fetchAll() async {
    throw UnimplementedError();
  }

  @override
  Future<List<ArtworkTemplate>> find({Sort? sort, Filter? filter}) async {
    final artworks = (await endpoint.find(sort: sort, filter: filter))
        .map(ArtworkTemplate.fromDTO)
        .toList();
    return artworks;
  }

  Future<List<ArtworkTemplate>> findByCustomer(
    int? customerId, {
    Sort? sort,
    Filter? filter,
    bool includeGeneralTemplates = false,
  }) async {
    final artworks = (await endpoint.findByCustomer(
      customerId: customerId,
      sort: sort,
      filter: filter,
      includeGeneralTemplates: includeGeneralTemplates,
    ))
        .map(ArtworkTemplate.fromDTO)
        .toList();
    return artworks;
  }

  @override
  Future<bool> delete(int entityId, String sessionId) async {
    throw UnimplementedError();
  }

  @override
  Future<ArtworkTemplate?> fetchAndLock(int entityId, String sessionId) async {
    final artwork = await endpoint.fetchAndLock(
      id: entityId,
      editingSessionId: sessionId,
    );
    return artwork != null ? ArtworkTemplate.fromDTO(artwork) : null;
  }

  @override
  Future<ArtworkTemplate?> fetchById(int entityId) async {
    final artwork = await endpoint.fetchById(entityId);
    return artwork != null ? ArtworkTemplate.fromDTO(artwork) : null;
  }

  @override
  Future<ArtworkTemplate> update({
    required ArtworkTemplate entity,
    required bool release,
    required String sessionId,
  }) async {
    final newArtwork = await endpoint.update(
      entity: entity.toDTO(),
      sessionId: sessionId,
      release: release,
    );
    return ArtworkTemplate.fromDTO(newArtwork);
  }

  @override
  Future<void> release(int entityId, String sessionId) async {
    await endpoint.release(
      entityId: entityId,
      sessionId: sessionId,
    );
  }
}
