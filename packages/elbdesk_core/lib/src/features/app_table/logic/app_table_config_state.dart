import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_client/elbdesk_backend_core_client.dart';
import 'package:elbdesk_core/src/data/table/table_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_table_config_state.g.dart';

/// Provides the current view for a table.
@riverpod
class AppTableConfigState extends _$AppTableConfigState {
  @override
  Future<TableConfig?> build(
    String componentIdentifier,
    String sessionId,
  ) async {
    final tableRepo = ref.watch(tableRepositoryProvider);
    final configs = await tableRepo.fetchTableConfigs(
      componentIdentifier: componentIdentifier,
    );

    // try to find the primary config
    final primary = configs.firstWhereOrNull((element) => element.isPrimary);
    if (primary != null) {
      return primary;
    }

    return null;
  }

  /// Update the table config with a new config
  void updateTableConfig(TableConfig newConfig) {
    // update the cells

    state = AsyncData(newConfig);
  }

  /// Update current name
  void updateName(String newName) {
    final updatedConfig = state.requireValue!.copyWith(name: newName);

    state = AsyncData(updatedConfig);
  }

  /// Reorder the table field config
  void reOrderConfig(int oldIndex, int newIndex) {
    final currentFieldConfig = [...state.requireValue!.tableFieldConfig];

    var targetIndex = newIndex;

    if (targetIndex > oldIndex) {
      targetIndex -= 1;
    }

    final item = currentFieldConfig.removeAt(oldIndex);

    currentFieldConfig.insert(targetIndex, item);

    final updatedConfig = state.requireValue!.copyWith(
      tableFieldConfig: currentFieldConfig,
    );

    state = AsyncData(updatedConfig);
  }

  /// Remove a field config from the table
  void removeFieldConfig(int index) {
    final currentFieldConfig = [...state.requireValue!.tableFieldConfig]
      ..removeAt(index);

    final updatedConfig = state.requireValue!.copyWith(
      tableFieldConfig: currentFieldConfig,
    );

    state = AsyncData(updatedConfig);
  }

  /// Add a field config to the table
  void addFieldConfig(TableFieldConfig newFieldConfig) {
    final currentFieldConfig = [
      ...state.requireValue!.tableFieldConfig,
      newFieldConfig,
    ];

    final updatedConfig = state.requireValue!.copyWith(
      tableFieldConfig: currentFieldConfig,
    );

    state = AsyncData(updatedConfig);
  }
}

/// Holds the current table configs for a table type.
@riverpod
class AppTableConfigs extends _$AppTableConfigs {
  @override
  Future<List<TableConfig>> build({
    required String componentIdentifier,
  }) async {
    final tableRepo = ref.watch(tableRepositoryProvider);
    final configs = await tableRepo.fetchTableConfigs(
      componentIdentifier: componentIdentifier,
    );

    return configs;
  }
}
