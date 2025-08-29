// import 'package:elbdesk_client/elbdesk_client.dart';
// import 'package:elbdesk_core/elbdesk_core.dart';
// import 'package:elbdesk_core/src/features/json_designer/models/json_template.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'json_template_repository.g.dart';

// @riverpod
// Future<List<JsonTemplate>> fetchAllJsonTemplates(
//   Ref ref,
//   String sessionId,
// ) async {
//   final endpoint = serverpodClient.jsonTemplate;
//   final response = await endpoint.fetchAll();
//   return response.map(JsonTemplate.fromDTO).toList();
// }

// @riverpod
// Future<JsonTemplate?> fetchJsonTemplateById(
//   Ref ref, {
//   required int id,
//   required String sessionId,
// }) async {
//   final endpoint = serverpodClient.jsonTemplate;
//   final response = await endpoint.fetchById(id);
//   return response != null ? JsonTemplate.fromDTO(response) : null;
// }

// @riverpod
// JsonTemplateRepository jsonTemplateRepository(
//   Ref ref,
// ) {
//   final endpoint = serverpodClient.jsonTemplate;
//   return JsonTemplateRepository(endpoint: endpoint);
// }

// class JsonTemplateRepository implements EntityRepository<JsonTemplate> {
//   const JsonTemplateRepository({required this.endpoint});

//   final EndpointJsonTemplate endpoint;

//   @override
//   Future<JsonTemplate> createAndReturnEntity({
//     required String sessionId,
//     required JsonTemplate entity,
//     required bool release,
//   }) async {
//     final response = await endpoint.create(sessionId);
//     return JsonTemplate.fromDTO(response);
//   }

//   Future<int> create(String sessionId) async {
//     final response = await endpoint.create(sessionId);
//     return response.id!;
//   }

//   @override
//   Future<JsonTemplate?> fetchById(int id) async {
//     final response = await endpoint.fetchById(id);
//     return response != null ? JsonTemplate.fromDTO(response) : null;
//   }

//   @override
//   Future<List<JsonTemplate>> fetchAll() async {
//     final response = await endpoint.fetchAll();
//     return response.map(JsonTemplate.fromDTO).toList();
//   }

//   @override
//   Future<JsonTemplate?> fetchAndLock(
//     int id,
//     String sessionId,
//   ) async {
//     final response = await endpoint.fetchAndLock(
//       id: id,
//       editingSessionId: sessionId,
//     );

//     return response != null ? JsonTemplate.fromDTO(response) : null;
//   }

//   @override
//   Future<void> release(int id, String sessionId) async {
//     await endpoint.release(
//       entityId: id,
//       sessionId: sessionId,
//     );
//   }

//   @override
//   Future<List<JsonTemplate>> find({Sort? sort, Filter? filter}) async {
//     throw UnimplementedError('find is not implemented');
//   }

//   @override
//   Future<JsonTemplate> update({
//     required String sessionId,
//     required JsonTemplate entity,
//     required bool release,
//   }) async {
//     final response = await endpoint.update(
//       sessionId: sessionId,
//       entityDto: entity.toDTO(),
//       release: release,
//     );
//     return JsonTemplate.fromDTO(response);
//   }

//   @override
//   Future<bool> delete(int id, String sessionId) async {
//     return endpoint.delete(sessionId: sessionId, id: id);
//   }
// }
