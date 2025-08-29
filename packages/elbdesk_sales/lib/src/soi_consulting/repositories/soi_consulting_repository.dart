import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/src/soi_consulting/_export_soi_consulting.dart';

class SoiConsultingRepository implements EntityRepository<SoiConsulting> {
  SoiConsultingRepository({
    required this.endpoint,
  });

  final EndpointSoiConsulting endpoint;

  /// Create a new sales order with basic initialization
  Future<int> create({
    required String sessionId,
    required int salesOrderId,
    required int customerId,
  }) async {
    return endpoint.createFromSalesOrder(
      salesOrderId: salesOrderId,
      customerId: customerId,
    );
  }

  @override
  Future<SoiConsulting> createAndReturnEntity({
    required String sessionId,
    required SoiConsulting entity,
    required bool release,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(int entityId, String sessionId) async {
    return endpoint.delete(
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  @override
  Future<List<SoiConsulting>> fetchAll() async {
    final soiConsultings = await endpoint.find();
    return soiConsultings.map(SoiConsulting.fromDTO).toList();
  }

  @override
  Future<SoiConsulting?> fetchById(int id) async {
    final soiConsulting = await endpoint.fetchById(id);
    return soiConsulting != null ? SoiConsulting.fromDTO(soiConsulting) : null;
  }

  @override
  Future<List<SoiConsulting>> find({Sort? sort, Filter? filter}) async {
    final soiConsultings = await endpoint.find(
      sort: sort,
      filter: filter,
    );
    return soiConsultings.map(SoiConsulting.fromDTO).toList();
  }

  @override
  Future<SoiConsulting?> fetchAndLock(
    int entityId,
    String sessionId,
  ) async {
    final soiConsulting = await endpoint.fetchAndLock(
      id: entityId,
      editingSessionId: sessionId,
    );
    return soiConsulting != null ? SoiConsulting.fromDTO(soiConsulting) : null;
  }

  @override
  Future<void> release(int entityId, String sessionId) async {
    await endpoint.release(
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  @override
  Future<SoiConsulting> update({
    required SoiConsulting entity,
    required bool release,
    required String sessionId,
  }) async {
    final updatedSoiConsulting = await endpoint.update(
      entity: entity.toDTO(),
      sessionId: sessionId,
      release: release,
    );
    return SoiConsulting.fromDTO(updatedSoiConsulting);
  }

  Future<List<SoiConsulting>> fetchForSalesOrder(int salesOrderId) async {
    final soiConsultings = await endpoint.fetchForSalesOrder(salesOrderId);
    return soiConsultings.map(SoiConsulting.forSalesOrder).toList();
  }
}
