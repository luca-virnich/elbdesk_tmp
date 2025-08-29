import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/src/soi_prepare_artwork/models/soi_prepare_artwork.dart';

class SoiPrepareArtworkRepository
    implements EntityRepository<SoiPrepareArtwork> {
  SoiPrepareArtworkRepository({
    required this.endpoint,
  });

  final EndpointSoiPrepareArtwork endpoint;

  /// Create a new sales order with basic initialization
  Future<void> create({
    required int customerId,
    required int salesOrderId,
    required int artworkId,
    required int artworkMasterId,
  }) async {
    await endpoint.createFromSalesOrderArtwork(
      salesOrderId: salesOrderId,
      artworkId: artworkId,
      artworkMasterId: artworkMasterId,
      customerId: customerId,
    );
  }

  @override
  Future<SoiPrepareArtwork> createAndReturnEntity({
    required String sessionId,
    required SoiPrepareArtwork entity,
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
  Future<List<SoiPrepareArtwork>> fetchAll() async {
    final soiPrepareArtworks = await endpoint.find();
    return soiPrepareArtworks.map(SoiPrepareArtwork.fromDTO).toList();
  }

  @override
  Future<SoiPrepareArtwork> fetchById(int id) async {
    final soiPrepareArtwork = await endpoint.fetchById(id);
    return SoiPrepareArtwork.fromDTO(soiPrepareArtwork!);
  }

  @override
  Future<List<SoiPrepareArtwork>> find({Sort? sort, Filter? filter}) async {
    final soiPrepareArtworks = await endpoint.find(
      sort: sort,
      filter: filter,
    );
    return soiPrepareArtworks.map(SoiPrepareArtwork.fromDTO).toList();
  }

  @override
  Future<SoiPrepareArtwork?> fetchAndLock(
    int entityId,
    String sessionId,
  ) async {
    final soiPrepareArtwork = await endpoint.fetchAndLock(
      id: entityId,
      editingSessionId: sessionId,
    );
    return soiPrepareArtwork != null
        ? SoiPrepareArtwork.fromDTO(soiPrepareArtwork)
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
  Future<SoiPrepareArtwork> update({
    required SoiPrepareArtwork entity,
    required bool release,
    required String sessionId,
  }) async {
    final updatedSoiPrepareArtwork = await endpoint.update(
      entity: entity.toDTO(),
      sessionId: sessionId,
      release: release,
    );
    return SoiPrepareArtwork.fromDTO(updatedSoiPrepareArtwork);
  }

  Future<List<SoiPrepareArtwork>> fetchForSalesOrder(int salesOrderId) async {
    final soiPrepareArtworks = await endpoint.fetchForSalesOrder(salesOrderId);
    return soiPrepareArtworks.map(SoiPrepareArtwork.forSalesOrder).toList();
  }
}
