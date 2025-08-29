import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flutter_log_repository.g.dart';

@riverpod
Future<List<FlutterLog>> fetchFlutterLogs(
  Ref ref,
  String sessionId,
) async {
  final repo = ref.watch(flutterLogRepositoryProvider);
  final logs = await repo.fetchLogs(
    limit: null,
    offset: null,
    searchTerm: null,
  );

  return logs;
}

@riverpod
Future<FlutterLog?> fetchFlutterLogById(
  Ref ref, {
  required int id,
}) async {
  final repo = ref.watch(flutterLogRepositoryProvider);
  return repo.fetchById(id);
}

@riverpod
FlutterLogRepository flutterLogRepository(Ref ref) {
  return FlutterLogRepository(
    endpoint: EndpointFlutterLog(ElbDeskCore.client),
  );
}

/// Repository for managing Flutter error logs
class FlutterLogRepository {
  /// Flutter Log Repository constructor
  FlutterLogRepository({
    required this.endpoint,
  });

  /// Flutter Log Endpoint
  final EndpointFlutterLog endpoint;

  /// Creates a Flutter Log
  Future<FlutterLog> create(FlutterLog log) async {
    final dto = log.toDTO();

    final created = await endpoint.create(dto);
    return FlutterLog.fromDTO(created);
  }

  /// Fetches Flutter error logs with optional pagination and filtering
  Future<List<FlutterLog>> fetchLogs({
    int? limit,
    int? offset,
    String? searchTerm,
  }) async {
    final dto = await endpoint.fetch(
      limit: limit,
      offset: offset,
      searchTerm: searchTerm,
    );
    return dto.map(FlutterLog.fromDTO).toList();
  }

  /// Fetches a single log by its id
  Future<FlutterLog?> fetchById(int id) async {
    final dto = await endpoint.fetchById(id);
    return dto != null ? FlutterLog.fromDTO(dto) : null;
  }
}
