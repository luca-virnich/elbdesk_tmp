// import 'package:elbdesk_client/elbdesk_client.dart';
// import 'package:elbdesk_core/elbdesk_core.dart';
// import 'package:elbdesk_sales/src/soi_step_and_repeat/models/soi_step_and_repeat.dart';

// class SoiStepAndRepeatRepository implements EntityRepository<SoiStepAndRepeat> {
//   SoiStepAndRepeatRepository({
//     required this.endpoint,
//   });

//   final EndpointSoiStepAndRepeat endpoint;

//   /// Create a new sales order with basic initialization
//   Future<int> create({
//     required String sessionId,
//     required int? customerId,
//   }) async {
//     throw UnimplementedError();
//   }

//   @override
//   Future<SoiStepAndRepeat> createAndReturnEntity({
//     required String sessionId,
//     required SoiStepAndRepeat entity,
//     required bool release,
//   }) async {
//     throw UnimplementedError();
//   }

//   @override
//   Future<bool> delete(int entityId, String sessionId) async {
//     return endpoint.delete(
//       entityId: entityId,
//       sessionId: sessionId,
//     );
//   }

//   @override
//   Future<List<SoiStepAndRepeat>> fetchAll() async {
//     final soiStepAndRepeats = await endpoint.find();
//     return soiStepAndRepeats.map(SoiStepAndRepeat.fromDTO).toList();
//   }

//   @override
//   Future<SoiStepAndRepeat> fetchById(int id) async {
//     final soiStepAndRepeat = await endpoint.fetchById(id);
//     return SoiStepAndRepeat.fromDTO(soiStepAndRepeat!);
//   }

//   @override
//   Future<List<SoiStepAndRepeat>> find({Sort? sort, Filter? filter}) async {
//     final soiStepAndRepeats = await endpoint.find(
//       sort: sort,
//       filter: filter,
//     );
//     return soiStepAndRepeats.map(SoiStepAndRepeat.fromDTO).toList();
//   }

//   @override
//   Future<SoiStepAndRepeat?> fetchAndLock(
//     int entityId,
//     String sessionId,
//   ) async {
//     final soiStepAndRepeat = await endpoint.fetchAndLock(
//       id: entityId,
//       editingSessionId: sessionId,
//     );
//     return soiStepAndRepeat != null
//         ? SoiStepAndRepeat.fromDTO(soiStepAndRepeat)
//         : null;
//   }

//   @override
//   Future<void> release(int entityId, String sessionId) async {
//     await endpoint.release(
//       entityId: entityId,
//       sessionId: sessionId,
//     );
//   }

//   @override
//   Future<SoiStepAndRepeat> update({
//     required SoiStepAndRepeat entity,
//     required bool release,
//     required String sessionId,
//   }) async {
//     final updatedSoiStepAndRepeat = await endpoint.update(
//       entity: entity.toDTO(),
//       sessionId: sessionId,
//       release: release,
//     );
//     return SoiStepAndRepeat.fromDTO(updatedSoiStepAndRepeat);
//   }

//   Future<List<SoiStepAndRepeat>> fetchForSalesOrder(int salesOrderId) async {
//     final soiStepAndRepeats = await endpoint.fetchForSalesOrder(salesOrderId);
//     return soiStepAndRepeats.map(SoiStepAndRepeat.forSalesOrder).toList();
//   }
// }
