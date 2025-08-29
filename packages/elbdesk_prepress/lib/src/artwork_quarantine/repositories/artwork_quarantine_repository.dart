import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine/models/artwork_quarantine.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArtworkQuarantineRepository extends EntityRepository<ArtworkQuarantine> {
  ArtworkQuarantineRepository({
    required this.ref,
    required this.endpoint,
  });

  final Ref ref;
  final EndpointArtworkQuarantine endpoint;

  // Future<ArtworkQuarantine> create({
  //   required String sessionId,
  //   required ArtworkQuarantine entity,
  //   required bool release,
  // }) async {
  //   final dto = await endpoint.create(
  //     sessionId: sessionId,
  //     description: entity.general.description,
  //     customerId: entity.customer!.meta.id!,
  //     groupId: entity.group!.meta.id!,
  //   );
  //   return ArtworkQuarantine.fromDTO(dto);
  // }

  @override
  Future<ArtworkQuarantine> createAndReturnEntity({
    required String sessionId,
    required ArtworkQuarantine entity,
    required bool release,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<List<ArtworkQuarantine>> fetchAll() async {
    final quarantines = await endpoint.find();
    return quarantines.map(ArtworkQuarantine.fromDTO).toList();
  }

  @override
  Future<List<ArtworkQuarantine>> find({Sort? sort, Filter? filter}) async {
    final artworks = (await endpoint.find(sort: sort, filter: filter))
        .map(ArtworkQuarantine.fromDTO)
        .toList();
    return artworks;
  }

  @override
  Future<bool> delete(int entityId, String sessionId) async {
    await endpoint.delete(
      entityId: entityId,
      sessionId: sessionId,
    );
    return true;
  }

  @override
  Future<ArtworkQuarantine?> fetchAndLock(
    int entityId,
    String sessionId,
  ) async {
    final dto = await endpoint.fetchAndLock(
      id: entityId,
      editingSessionId: sessionId,
    );
    return dto != null ? ArtworkQuarantine.fromDTO(dto) : null;
  }

  @override
  Future<ArtworkQuarantine?> fetchById(int entityId) async {
    final artworkQuarantine = await endpoint.fetchById(entityId);
    return artworkQuarantine != null
        ? ArtworkQuarantine.fromDTO(artworkQuarantine)
        : null;
  }

  @override
  Future<ArtworkQuarantine> update({
    required ArtworkQuarantine entity,
    required bool release,
    required String sessionId,
  }) async {
    final dto = await endpoint.update(
      entity: entity.toDTO(),
      sessionId: sessionId,
      release: release,
    );
    return ArtworkQuarantine.fromDTO(dto);
  }

  @override
  Future<void> release(int entityId, String sessionId) async {
    await endpoint.release(
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  Future<List<ArtworkQuarantine>> fetchByCustomerId(int customerId) async {
    final artworks = (await endpoint.fetchByCustomerId(customerId))
        .map(ArtworkQuarantine.fromDTO)
        .toList();
    return artworks;
  }

  /// Fetch by group id
  Future<List<ArtworkQuarantine>> fetchByGroupId(int groupId) async {
    final artworks = (await endpoint.fetchByGroupId(groupId))
        .map(ArtworkQuarantine.fromDTO)
        .toList();
    return artworks;
  }

  /// Fetch by group id and status
  Future<List<ArtworkQuarantine>> fetchByGroupIdAndStatus(
    int groupId,
    ArtworkQuarantineGroupStatus status,
  ) async {
    final artworks = (await endpoint.fetchByGroupIdAndStatus(groupId, status))
        .map(ArtworkQuarantine.fromDTO)
        .toList();
    return artworks;
  }
}
