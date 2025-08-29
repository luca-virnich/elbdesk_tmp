import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_core/src/features/admin_log/models/serverpod_log.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'serverpod_log_repository.g.dart';

@riverpod
Future<List<ServerpodLog>> fetchAdminLogs(
  Ref ref,
  String sessionId,
) async {
  final repo = ref.watch(serverpodLogRepositoryProvider);
  final logs = await repo.fetchLogs(
    limit: null,
    offset: null,
    searchTerm: null,
  );

  return logs;
}

@riverpod
Future<ServerpodLog?> fetchAdminLogById(
  Ref ref, {
  required int id,
}) async {
  final repo = ref.watch(serverpodLogRepositoryProvider);
  return repo.fetchById(id);
}

@riverpod
ServerpodLogRepository serverpodLogRepository(Ref ref) {
  return ServerpodLogRepository(
    endpoint: EndpointServerpodLog(ElbDeskCore.client),
  );
}

/// Repository for managing admin logs
class ServerpodLogRepository {
  /// Admin Log Repository constructor
  ServerpodLogRepository({
    required this.endpoint,
  });

  /// Serverpod Log Entry Endpoint
  final EndpointServerpodLog endpoint;

  /// Fetches server logs with optional pagination and filtering
  Future<List<ServerpodLog>> fetchLogs({
    int? limit,
    int? offset,
    String? searchTerm,
  }) async {
    final dto = await endpoint.fetchLogs(
      limit: limit,
      offset: offset,
      searchTerm: searchTerm,
    );
    return dto.map(ServerpodLog.fromDTO).toList();
  }

  /// Fetches a single log entry by its id
  Future<ServerpodLog?> fetchById(int id) async {
    final dto = await endpoint.fetchById(id);
    return dto != null ? ServerpodLog.fromDTO(dto) : null;
  }
}
