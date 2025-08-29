import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

class TableEndpoint extends Endpoint {
  // * Single Operations
  @override
  bool get requireLogin => true;
  // * Add
  Future<TableConfig> addTableConfig(
    Session session,
    TableConfig config,
  ) async {
    final userId = (await session.authenticated)?.userId;
    if (userId == null) {
      throw Exception('User not authenticated');
    }

    return TableConfig.db.insertRow(session, config.copyWith(userId: userId));
  }

  Future<TableConfig> deleteTableConfig(Session session, int id) async {
    final userId = (await session.authenticated)?.userId;
    if (userId == null) {
      throw Exception('User not authenticated');
    }
    final cfg = await TableConfig.db.findById(session, id);
    if (cfg == null || cfg.userId != userId) {
      throw Exception('TableConfig not found, cfg: $cfg, userId: $userId');
    }

    return TableConfig.db.deleteRow(session, cfg);
  }

  // * Find
  Future<List<TableConfig>?> findTableConfigs(
    Session session,
    String componentIdentifier,
  ) async {
    final userId = (await session.authenticated)?.userId;
    if (userId == null) {
      throw Exception('User not authenticated');
    }

    final configs = await TableConfig.db.find(
      session,
      where: (t) =>
          t.componentIdentifier.equals(componentIdentifier) &
          t.userId.equals(userId),
    );
    if (configs.isEmpty) {
      return null;
    } else {
      return configs;
    }
  }

  /// * Update
  Future<TableConfig> updateTableConfig(
    Session session,
    TableConfig config,
  ) async {
    final userId = (await session.authenticated)?.userId;
    if (userId == null) {
      throw Exception('User not authenticated');
    }
    final cfg = await TableConfig.db.findById(session, config.id!);
    if (cfg == null || cfg.userId != userId) {
      throw Exception('TableConfig not found, cfg: $cfg, userId: $userId');
    }

    final configWithUserId = config.copyWith(userId: userId);

    return TableConfig.db.updateRow(session, configWithUserId);
  }

  /// Update config to primary
  /// The old primary will be set to false
  Future<void> togglePrimaryConfig(Session session, TableConfig config) async {
    final userId = (await session.authenticated)?.userId;
    if (userId == null) {
      throw Exception('User not authenticated');
    }

    final newConfig = await TableConfig.db.findById(session, config.id!);
    if (newConfig == null || newConfig.userId != userId) {
      throw Exception(
        'TableConfig not found, cfg: $newConfig, userId: $userId',
      );
    }

    final oldConfig = await TableConfig.db.findFirstRow(
      session,
      where: (t) =>
          t.userId.equals(userId) &
          t.componentIdentifier.equals(config.componentIdentifier) &
          t.isPrimary.equals(true),
    );

    // Remove old primary
    if (oldConfig != null) {
      await TableConfig.db
          .updateRow(session, oldConfig.copyWith(isPrimary: false));
    }

    // Add new primary
    // if newConfig was primary, do nothing
    // it was already toggled to false in the previous operation
    if (newConfig.isPrimary == false) {
      await TableConfig.db
          .updateRow(session, newConfig.copyWith(isPrimary: true));
    }
  }

  // * Upsert List
  // Future<List<AddressDto>> upsertAddresses(
  //   Session session,
  //   List<AddressDto> addresses,
  // ) async {
  //   final result = <AddressDto>[];
  //   for (final address in addresses) {
  //     if (address.id != null) {
  //       result.add(await updateAddress(session, address));
  //     } else {
  //       result.add(await addAddress(session, address));
  //     }
  //   }
  //   return result;
  // }
}
