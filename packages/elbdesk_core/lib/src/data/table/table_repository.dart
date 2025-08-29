import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'table_repository.g.dart';

/// Fetch Table Configs Provider
///
/// This provider is used to fetch a list of TableConfigs from the server.
///
/// Each TableConfig holds a possible view for a table
/// Can be empty, but not null
@riverpod
Future<List<TableConfig>> fetchTableConfigs(
  Ref ref, {
  required String componentIdentifier,
  required String sessionId,
}) async {
  final repo = ref.watch(tableRepositoryProvider);
  final configs = await repo.fetchTableConfigs(
    componentIdentifier: componentIdentifier,
  );

  return configs;
}

/// Table Repository Provider
@riverpod
TableRepository tableRepository(Ref ref) {
  final endpoint = EndpointTable(ElbDeskCore.client);
  return TableRepository(endpoint: endpoint);
}

/// Table Repository
class TableRepository {
  /// Table Repository constructor
  TableRepository({required this.endpoint});

  /// Serverpod Client
  final EndpointTable endpoint;

  /// Fetch Table Configs
  Future<List<TableConfig>> fetchTableConfigs({
    required String componentIdentifier,
  }) async {
    final configs = await endpoint.findTableConfigs(componentIdentifier);

    if (configs == null || configs.isEmpty) {
      return [];
    }
    return [...configs];
  }

  /// Add Table Config
  Future<TableConfig> addTableConfig(TableConfig config) async {
    return endpoint.addTableConfig(config);
  }

  /// Update Table Config
  Future<TableConfig> deleteTableConfig(int id) async {
    return endpoint.deleteTableConfig(id);
  }

  /// Update Table Config
  Future<TableConfig> updateTableConfig(TableConfig config) async {
    return endpoint.updateTableConfig(config);
  }

  /// Update Config to primary
  Future<void> togglePrimaryConfig(TableConfig config) async {
    return endpoint.togglePrimaryConfig(config);
  }
}
