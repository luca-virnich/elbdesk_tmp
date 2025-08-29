import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'entity_lock_repository.g.dart';

@riverpod
Future<List<EntityLockDTO>> fetchAllEntityLocks(
  Ref ref,
) async {
  return ref.watch(entityLockRepositoryProvider).findAllEntityLocks();
}

@riverpod
EntityLockRepository entityLockRepository(Ref ref) {
  return EntityLockRepository(client: serverpodClient);
}

class EntityLockRepository {
  EntityLockRepository({required this.client});
  final Client client;

  Future<void> releaseEntityLock(String tableType, int entityId) async {
    return client.entityLock.releaseEntityLock(tableType, entityId);
  }

  Future<List<EntityLockDTO>> findAllEntityLocks() async {
    return client.entityLock.findAllEntityLocks();
  }
}
