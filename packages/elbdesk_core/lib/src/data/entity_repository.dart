import 'package:elbdesk_backend_core_client/elbdesk_backend_core_client.dart';

abstract class EntityRepository<T> {
  Future<T> createAndReturnEntity({
    required String sessionId,
    required T entity,
    required bool release,
  });
  Future<T> update({
    required String sessionId,
    required T entity,
    required bool release,
  });
  Future<T?> fetchById(int entityId);
  Future<List<T>> find({Sort? sort, Filter? filter});
  Future<List<T>> fetchAll();
  Future<bool> delete(
    int entityId,
    String sessionId,
  );
  Future<void> release(int entityId, String sessionId);
  Future<T?> fetchAndLock(int entityId, String sessionId);
}
