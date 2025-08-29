import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/src/soi_einzelformaufbau/models/soi_einzelformaufbau.dart';

class SoiEinzelformaufbauRepository
    implements EntityRepository<SoiEinzelformaufbau> {
  SoiEinzelformaufbauRepository({
    required this.endpoint,
  });

  final EndpointSoiEinzelformaufbau endpoint;

  /// Create a new sales order with basic initialization
  Future<void> create({
    required int artworkId,
    required int salesOrderId,
    required int artworkMasterId,
    required int customerId,
  }) async {
    await endpoint.createFromSalesOrderArtwork(
      artworkId: artworkId,
      salesOrderId: salesOrderId,
      artworkMasterId: artworkMasterId,
      customerId: customerId,
    );
  }

  @override
  Future<SoiEinzelformaufbau> createAndReturnEntity({
    required String sessionId,
    required SoiEinzelformaufbau entity,
    required bool release,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(int entityId, String sessionId) async {
    throw UnimplementedError();
    // return endpoint.delete(
    //   entityId: entityId,
    //   sessionId: sessionId,
    // );
  }

  @override
  Future<List<SoiEinzelformaufbau>> fetchAll() async {
    final soiEinzelformaufbaus = await endpoint.find();
    return soiEinzelformaufbaus.map(SoiEinzelformaufbau.fromDTO).toList();
  }

  @override
  Future<SoiEinzelformaufbau?> fetchById(int id) async {
    final soiEinzelformaufbau = await endpoint.fetchById(id);
    return SoiEinzelformaufbau.fromDTO(soiEinzelformaufbau!);
  }

  @override
  Future<List<SoiEinzelformaufbau>> find({
    Sort? sort,
    Filter? filter,
  }) async {
    final soiEinzelformaufbaus = await endpoint.find(
      sort: sort,
      filter: filter,
    );
    return soiEinzelformaufbaus.map(SoiEinzelformaufbau.fromDTO).toList();
  }

  @override
  Future<SoiEinzelformaufbau?> fetchAndLock(
    int entityId,
    String sessionId,
  ) async {
    final soiEinzelformaufbau = await endpoint.fetchAndLock(
      id: entityId,
      editingSessionId: sessionId,
    );
    return soiEinzelformaufbau != null
        ? SoiEinzelformaufbau.fromDTO(soiEinzelformaufbau)
        : null;
  }

  @override
  Future<void> release(int entityId, String sessionId) async {
    await endpoint.release(
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  @override
  Future<SoiEinzelformaufbau> update({
    required SoiEinzelformaufbau entity,
    required bool release,
    required String sessionId,
  }) async {
    final updatedSoiEinzelformaufbau = await endpoint.update(
      entity: entity.toDTO(),
      sessionId: sessionId,
      release: release,
    );
    return SoiEinzelformaufbau.fromDTO(updatedSoiEinzelformaufbau);
  }

  Future<List<SoiEinzelformaufbau>> fetchForSalesOrder(
    int salesOrderId,
  ) async {
    final soiEinzelformaufbaus =
        await endpoint.fetchForSalesOrder(salesOrderId);
    return soiEinzelformaufbaus.map(SoiEinzelformaufbau.forSalesOrder).toList();
  }
}
