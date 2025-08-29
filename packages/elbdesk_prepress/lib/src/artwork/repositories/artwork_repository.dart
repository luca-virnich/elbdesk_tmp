import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork/models/artwork.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArtworkRepository extends EntityRepository<Artwork> {
  ArtworkRepository({
    required this.ref,
    required this.endpoint,
    required this.logEndpoint,
  });

  final Ref ref;
  final EndpointArtwork endpoint;

  final EndpointArtworkLog logEndpoint;

  @override
  Future<Artwork> createAndReturnEntity({
    required String sessionId,
    required Artwork entity,
    required bool release,
  }) async {
    throw UnimplementedError();
  }

  Future<int> create({
    required String sessionId,
    required int customerId,
    required int preSelectionId,
    required int selectionId,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<List<Artwork>> fetchAll() async {
    throw UnimplementedError();
  }

  @override
  Future<List<Artwork>> find({Sort? sort, Filter? filter}) async {
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(int entityId, String sessionId) async {
    throw UnimplementedError();
  }

  @override
  Future<Artwork?> fetchAndLock(int entityId, String sessionId) async {
    final artwork = await endpoint.fetchAndLock(
      id: entityId,
      editingSessionId: sessionId,
    );
    return artwork != null ? Artwork.fromDTO(artwork) : null;
  }

  @override
  Future<Artwork?> fetchById(int entityId) async {
    final artwork = await endpoint.fetchById(entityId);
    return artwork != null ? Artwork.fromDTO(artwork) : null;
  }

  @override
  Future<Artwork> update({
    required Artwork entity,
    required bool release,
    required String sessionId,
  }) async {
    final newArtwork = await endpoint.update(
      entity: entity.toDTO(),
      sessionId: sessionId,
      release: release,
    );
    return Artwork.fromDTO(newArtwork);
  }

  @override
  Future<void> release(int entityId, String sessionId) async {
    await endpoint.release(
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  Future<List<Artwork>> fetchHistory(int artworkMasterId) async {
    final artworks = await endpoint.fetchHistory(artworkMasterId);
    return artworks.map(Artwork.fromDTO).toList();
  }

  Future<List<Artwork>> fetchBySalesOrderId(int salesOrderId) async {
    final artworks = await endpoint.fetchBySalesOrderId(salesOrderId);
    return artworks.map(Artwork.fromDTO).toList();
  }

  Future<int> fetchCustomerId(int id) async {
    final artwork = await endpoint.fetchCustomerId(id);
    return artwork;
  }

  Future<Artwork?> fetchReadOnly(int id) async {
    final artwork = await endpoint.fetchReadOnly(id);
    return artwork != null ? Artwork.fromDTO(artwork) : null;
  }

  Future<List<ArtworkLogDTO>> fetchArtworkLogs(
    int artworkMasterId,
    TableType tableType,
  ) async {
    final logs = await logEndpoint.fetchArtworkLogs(
      entityId: artworkMasterId,
      tableType: tableType,
    );
    return logs;
  }
}
