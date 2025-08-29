import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/src/salutation_code/config/salutation_code_setup.dart';
import 'package:elbdesk_crm/src/salutation_code/models/salutation_code.dart';

/// @nodoc
class SalutationCodeRepository implements EntityRepository<SalutationCode> {
  /// @nodoc
  SalutationCodeRepository({required this.endpoint});

  final EndpointSalutationCode endpoint;

  @override
  Future<List<SalutationCode>> find({Sort? sort, Filter? filter}) async {
    final response = await endpoint.find(sort: sort, filter: filter);
    return response.map(SalutationCode.fromDTO).toList();
  }

  @override
  Future<SalutationCode> fetchById(int id) async {
    final response = await endpoint.fetchById(id);
    return SalutationCode.fromDTO(response!);
  }

  @override
  Future<List<SalutationCode>> fetchAll() async {
    final response = await endpoint.fetchAll();
    return response.map(SalutationCode.fromDTO).toList();
  }

  @override
  Future<SalutationCode?> fetchAndLock(int id, String sessionId) async {
    final response =
        await endpoint.fetchAndLock(id: id, editingSessionId: sessionId);
    return response != null ? SalutationCode.fromDTO(response) : null;
  }

  @override
  Future<void> release(int id, String sessionId) async {
    await endpoint.release(entityId: id, sessionId: sessionId);
  }

  @override
  Future<SalutationCode> update({
    required SalutationCode entity,
    required bool release,
    required String sessionId,
  }) async {
    final response = await endpoint.update(
      sessionId: sessionId,
      entity: entity.toDTO(),
      release: release,
    );
    return SalutationCode.fromDTO(response);
  }

  @override
  Future<SalutationCode> createAndReturnEntity({
    required SalutationCode entity,
    required bool release,
    required String sessionId,
  }) async {
    final response = await endpoint.create(
      sessionId: sessionId,
      entity: entity.toDTO(),
      release: release,
    );
    return SalutationCode.fromDTO(response);
  }

  @override
  Future<bool> delete(int entityId, String sessionId) async {
    // final response = await endpoint.delete(entityId, sessionId);
    // return response;
    throw UnimplementedError('delete is not implemented');
  }

  Future<void> initialSetup() async {
    for (final salutationCode in allSalutationCodesForSetup) {
      await createAndReturnEntity(
        entity: salutationCode,
        release: true,
        sessionId: '',
      );
    }
  }
}
