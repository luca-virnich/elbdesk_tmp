import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/src/language_code/config/language_code_setup.dart';
import 'package:elbdesk_crm/src/language_code/models/language_code.dart';

/// @nodoc
class LanguageCodeRepository implements EntityRepository<LanguageCode> {
  /// @nodoc
  LanguageCodeRepository({required this.endpoint});

  final EndpointLanguageCode endpoint;

  @override
  Future<List<LanguageCode>> find({Sort? sort, Filter? filter}) async {
    final response = await endpoint.find(sort: sort, filter: filter);
    return response.map(LanguageCode.fromDTO).toList();
  }

  @override
  Future<LanguageCode> fetchById(int id) async {
    final response = await endpoint.fetchById(id);
    return LanguageCode.fromDTO(response!);
  }

  @override
  Future<List<LanguageCode>> fetchAll() async {
    final response = await endpoint.fetchAll();
    return response.map(LanguageCode.fromDTO).toList();
  }

  @override
  Future<LanguageCode?> fetchAndLock(int id, String sessionId) async {
    final response =
        await endpoint.fetchAndLock(id: id, editingSessionId: sessionId);
    return response != null ? LanguageCode.fromDTO(response) : null;
  }

  @override
  Future<void> release(int id, String sessionId) async {
    await endpoint.release(entityId: id, sessionId: sessionId);
  }

  @override
  Future<LanguageCode> update({
    required LanguageCode entity,
    required bool release,
    required String sessionId,
  }) async {
    final response = await endpoint.update(
      sessionId: sessionId,
      entity: entity.toDTO(),
      release: release,
    );
    return LanguageCode.fromDTO(response);
  }

  @override
  Future<LanguageCode> createAndReturnEntity({
    required LanguageCode entity,
    required bool release,
    required String sessionId,
  }) async {
    final response = await endpoint.create(
      sessionId: sessionId,
      entity: entity.toDTO(),
      release: release,
    );
    return LanguageCode.fromDTO(response);
  }

  @override
  Future<bool> delete(int entityId, String sessionId) async {
    // final response = await endpoint.delete(entityId, sessionId);
    // return response;
    throw UnimplementedError('delete is not implemented');
  }

  Future<void> initialSetup() async {
    for (final languageCode in allLanguageCodesForSetup) {
      await createAndReturnEntity(
        entity: languageCode,
        release: false,
        sessionId: '',
      );
    }
  }
}
