import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'entity_log_repository.g.dart';

@riverpod
Future<List<EntityLogDTO>> fetchEntityLogs(
  Ref ref, {
  required int entityId,
  required TableType tableType,
  required String sessionId,
}) async {
  final repo = ref.watch(entityLogRepositoryProvider);

  return repo.fetchEntityLogs(entityId, tableType);
}

@riverpod
EntityLogRepository entityLogRepository(Ref ref) {
  return EntityLogRepository(endpoint: serverpodClient.entityLog);
}

class EntityLogRepository {
  EntityLogRepository({required this.endpoint});
  final EndpointEntityLog endpoint;

  Future<List<EntityLogDTO>> fetchEntityLogs(
    int entityId,
    TableType tableType,
  ) async {
    final logs = await endpoint.fetchEntityLogs(
      entityId: entityId,
      tableType: tableType,
    );
    return logs;
  }
}
