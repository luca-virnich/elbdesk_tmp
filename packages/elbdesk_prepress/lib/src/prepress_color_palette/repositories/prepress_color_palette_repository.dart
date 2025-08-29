import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/prepress_color_palette/models/prepress_color_palette.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Repository for managing ColorBook entities
class PrepressColorPaletteRepository
    implements EntityRepository<PrepressColorPalette> {
  PrepressColorPaletteRepository({
    required this.ref,
    required this.endpoint,
  });

  final Ref ref;
  final EndpointPrepressColorPalette endpoint;

  @override
  Future<PrepressColorPalette> createAndReturnEntity({
    required String sessionId,
    required PrepressColorPalette entity,
    required bool release,
  }) async {
    throw UnimplementedError();
  }

  Future<int> create({
    required String sessionId,
    required int? customerId,
  }) async {
    final newColorBook = await endpoint.create(
      sessionId: sessionId,
      customerId: customerId,
    );
    return newColorBook.id!;
  }

  @override
  Future<bool> delete(int entityId, String sessionId) async {
    return endpoint.delete(
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  @override
  Future<List<PrepressColorPalette>> fetchAll() async {
    throw UnimplementedError();
  }

  @override
  Future<PrepressColorPalette> fetchById(int id) async {
    final salesOrderItem = await endpoint.fetchById(id);
    return PrepressColorPalette.fromDTO(salesOrderItem!);
  }

  @override
  Future<List<PrepressColorPalette>> find({Sort? sort, Filter? filter}) async {
    final response = await endpoint.find(sort: sort, filter: filter);
    return response.map(PrepressColorPalette.fromDTO).toList();
  }

  @override
  Future<PrepressColorPalette?> fetchAndLock(
    int salesOrderItemId,
    String sessionId,
  ) async {
    final response = await endpoint.fetchAndLock(
      id: salesOrderItemId,
      editingSessionId: sessionId,
    );
    return response != null ? PrepressColorPalette.fromDTO(response) : null;
  }

  @override
  Future<void> release(int entityId, String sessionId) async {
    await endpoint.release(
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  @override
  Future<PrepressColorPalette> update({
    required PrepressColorPalette entity,
    required bool release,
    required String sessionId,
  }) async {
    try {
      final response = await endpoint.update(
        sessionId: sessionId,
        entity: entity.toDTO(),
        release: release,
      );
      return PrepressColorPalette.fromDTO(response);
    } catch (e) {
      dlog(e);
      rethrow;
    }
  }

  // Check whether a color book with the given name exists
  Future<bool> colorBookExists(String name) async {
    final response = await endpoint.colorBookExists(
      paletteName: name,
    );
    return response;
  }

  Future<List<PrepressColorPalette>> fetchGlobalAndCustomerColorBooks(
    int customerId,
  ) async {
    final response = await endpoint.fetchGlobalAndCustomerColorBooks(
      customerId: customerId,
    );
    return response.map(PrepressColorPalette.fromDTO).toList();
  }
}
