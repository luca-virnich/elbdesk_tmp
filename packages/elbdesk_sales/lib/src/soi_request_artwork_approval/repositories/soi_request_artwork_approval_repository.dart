import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/src/soi_request_artwork_approval/_export_soi_request_artwork_approval.dart';

class SoiRequestArtworkApprovalRepository
    implements EntityRepository<SoiRequestArtworkApproval> {
  SoiRequestArtworkApprovalRepository({
    required this.endpoint,
  });

  final EndpointSoiRequestArtworkApproval endpoint;

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
  Future<SoiRequestArtworkApproval> createAndReturnEntity({
    required String sessionId,
    required SoiRequestArtworkApproval entity,
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
  Future<List<SoiRequestArtworkApproval>> fetchAll() async {
    final soiRequestArtworkApprovals = await endpoint.find();
    return soiRequestArtworkApprovals
        .map(SoiRequestArtworkApproval.fromDTO)
        .toList();
  }

  @override
  Future<SoiRequestArtworkApproval?> fetchById(int id) async {
    final soiRequestArtworkApproval = await endpoint.fetchById(id);
    return SoiRequestArtworkApproval.fromDTO(soiRequestArtworkApproval!);
  }

  @override
  Future<List<SoiRequestArtworkApproval>> find({
    Sort? sort,
    Filter? filter,
  }) async {
    final soiRequestArtworkApprovals = await endpoint.find(
      sort: sort,
      filter: filter,
    );
    return soiRequestArtworkApprovals
        .map(SoiRequestArtworkApproval.fromDTO)
        .toList();
  }

  @override
  Future<SoiRequestArtworkApproval?> fetchAndLock(
    int entityId,
    String sessionId,
  ) async {
    final soiRequestArtworkApproval = await endpoint.fetchAndLock(
      id: entityId,
      editingSessionId: sessionId,
    );
    return soiRequestArtworkApproval != null
        ? SoiRequestArtworkApproval.fromDTO(soiRequestArtworkApproval)
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
  Future<SoiRequestArtworkApproval> update({
    required SoiRequestArtworkApproval entity,
    required bool release,
    required String sessionId,
  }) async {
    final updatedSoiRequestArtworkApproval = await endpoint.update(
      entity: entity.toDTO(),
      sessionId: sessionId,
      release: release,
    );
    return SoiRequestArtworkApproval.fromDTO(updatedSoiRequestArtworkApproval);
  }

  Future<List<SoiRequestArtworkApproval>> fetchForSalesOrder(
    int salesOrderId,
  ) async {
    final soiRequestArtworkApprovals =
        await endpoint.fetchForSalesOrder(salesOrderId);
    return soiRequestArtworkApprovals
        .map(SoiRequestArtworkApproval.forSalesOrder)
        .toList();
  }
}
