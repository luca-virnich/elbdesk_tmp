import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_core/src/data/table/table_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'table_controller.g.dart';

/// Table Controller Provider
@riverpod
TableController tableController(Ref ref) {
  return TableController(ref: ref);
}

/// Table Controller
class TableController {
  /// Table Controller constructor
  TableController({required this.ref});

  /// Table ref
  final Ref ref;

  /// Delete Table Config
  Future<TableConfig> deleteTableConfig({
    required int tableId,
    required String componentIdentifier,
  }) async {
    final deleted =
        await ref.read(tableRepositoryProvider).deleteTableConfig(tableId);
    ref.invalidate(
      appTableConfigsProvider(
        componentIdentifier: componentIdentifier,
      ),
    );
    return deleted;
  }

  /// Update Table Config
  Future<TableConfig> updateTableConfig({
    required TableConfig tableConfig,
  }) async {
    final updated =
        await ref.read(tableRepositoryProvider).updateTableConfig(tableConfig);
    ref.invalidate(
      appTableConfigsProvider(
        componentIdentifier: tableConfig.componentIdentifier,
      ),
    );
    return updated;
  }

  /// Toggle primary Config
  Future<void> togglePrimaryConfig({
    required TableConfig tableConfig,
  }) async {
    final updated = await ref
        .read(tableRepositoryProvider)
        .togglePrimaryConfig(tableConfig);
    ref.invalidate(
      appTableConfigsProvider(
        componentIdentifier: tableConfig.componentIdentifier,
      ),
    );
    return updated;
  }
}
