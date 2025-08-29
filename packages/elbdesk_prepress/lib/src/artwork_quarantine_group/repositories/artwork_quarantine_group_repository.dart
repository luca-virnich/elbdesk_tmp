import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Artwork Quarantine Group Repository
class ArtworkQuarantineGroupRepository
    implements EntityRepository<ArtworkQuarantineGroup> {
  /// Artwork Quarantine Group Repository constructor
  ArtworkQuarantineGroupRepository({
    required this.ref,
    required this.endpoint,
  });

  /// Riverpod Ref
  final Ref ref;

  /// Serverpod Endpoint
  final EndpointArtworkQuarantineGroup endpoint;

  /// Create a new group with basic initialization
  Future<int> create({
    required String sessionId,
    required int? customerId,
  }) async {
    final newGroup = await endpoint.create(
      sessionId: sessionId,
      customerId: customerId,
    );
    return newGroup.id!;
  }

  @override
  Future<ArtworkQuarantineGroup> createAndReturnEntity({
    required String sessionId,
    required ArtworkQuarantineGroup entity,
    required bool release,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(int entityId, String sessionId) async {
    return endpoint.delete(
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  /// Fetch all quarantine groups
  @override
  Future<List<ArtworkQuarantineGroup>> fetchAll() async {
    final quarantineGroups = await endpoint.find();
    return quarantineGroups.map(ArtworkQuarantineGroup.fromDTO).toList();
  }

  /// Fetch a quarantine group by its ID
  @override
  Future<ArtworkQuarantineGroup?> fetchById(int entityId) async {
    final group = await endpoint.fetchById(entityId);
    return group != null ? ArtworkQuarantineGroup.fromDTO(group) : null;
  }

  /// Find quarantine groups by sort and filter
  @override
  Future<List<ArtworkQuarantineGroup>> find({
    Sort? sort,
    Filter? filter,
  }) async {
    final groups = await endpoint.find(sort: sort, filter: filter);
    return groups.map(ArtworkQuarantineGroup.fromDTO).toList();
  }

  /// Fetch a quarantine group by its ID and lock it
  @override
  Future<ArtworkQuarantineGroup?> fetchAndLock(
    int entityId,
    String sessionId,
  ) async {
    final group = await endpoint.fetchAndLock(
      id: entityId,
      editingSessionId: sessionId,
    );
    return group != null ? ArtworkQuarantineGroup.fromDTO(group) : null;
  }

  /// Release a quarantine group
  @override
  Future<void> release(int entityId, String sessionId) async {
    await endpoint.release(entityId: entityId, sessionId: sessionId);
  }

  /// Update a quarantine group
  @override
  Future<ArtworkQuarantineGroup> update({
    required ArtworkQuarantineGroup entity,
    required bool release,
    required String sessionId,
  }) async {
    final updatedGroup = await endpoint.update(
      group: entity.toDTO(),
      sessionId: sessionId,
      release: release,
    );
    return ArtworkQuarantineGroup.fromDTO(updatedGroup);
  }

  /// Fetch groups by customer ID
  Future<List<ArtworkQuarantineGroup>> fetchByCustomerId(int customerId) async {
    final groups = await endpoint.fetchByCustomerId(customerId);
    return groups.map(ArtworkQuarantineGroup.fromDTO).toList();
  }

  /// Fetch groups by status
  Future<List<ArtworkQuarantineGroup>> fetchByStatus(
    ArtworkQuarantineGroupStatus status,
  ) async {
    final groups = await endpoint.fetchByStatus(status);
    return groups.map(ArtworkQuarantineGroup.fromDTO).toList();
  }

  /// Fetch groups by customer ID and status
  Future<List<ArtworkQuarantineGroup>> fetchGroupsByCustomerIdAndStatus({
    required int customerId,
    required ArtworkQuarantineGroupStatus status,
  }) async {
    final groups = await endpoint.fetchGroupsByCustomerIdAndStatus(
      customerId: customerId,
      status: status,
    );
    return groups.map(ArtworkQuarantineGroup.fromDTO).toList();
  }

  /// Fetch artwork quarantines by customer ID and group status
  ///
  /// This is here because we access the group endpoint
  Future<List<ArtworkQuarantine>> fetchQuarantinesByCustomerIdAndStatus({
    required int customerId,
    required ArtworkQuarantineGroupStatus status,
  }) async {
    final quarantines = await endpoint.fetchQuarantinesByCustomerIdAndStatus(
      customerId: customerId,
      status: status,
    );
    return quarantines.map(ArtworkQuarantine.fromDTO).toList();
  }
}
