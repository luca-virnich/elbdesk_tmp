import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/src/country_code/config/country_code_setup.dart';
import 'package:elbdesk_crm/src/country_code/models/country_code.dart';

/// Repository for [CountryCode]
class CountryCodeRepository implements EntityRepository<CountryCode> {
  CountryCodeRepository({required this.endpoint});

  final EndpointCountryCode endpoint;

  @override
  Future<List<CountryCode>> fetchAll() async {
    final response = await endpoint.fetchAll();
    return response.map(CountryCode.fromDTO).toList();
  }

  @override
  Future<CountryCode> fetchById(int id) async {
    final response = await endpoint.fetchById(id);
    return CountryCode.fromDTO(response!);
  }

  @override
  Future<List<CountryCode>> find({Sort? sort, Filter? filter}) async {
    final response = await endpoint.find(sort: sort, filter: filter);
    return response.map(CountryCode.fromDTO).toList();
  }

  @override
  Future<CountryCode> update({
    required bool release,
    required CountryCode entity,
    required String sessionId,
  }) async {
    final response = await endpoint.update(
      sessionId: sessionId,
      countryCode: entity.toDTO(),
      release: release,
    );
    return CountryCode.fromDTO(response);
  }

  @override
  Future<CountryCode> createAndReturnEntity({
    required String sessionId,
    required CountryCode entity,
    required bool release,
  }) async {
    final response = await endpoint.create(
      sessionId: sessionId,
      countryCode: entity.toDTO(),
      release: release,
    );
    return CountryCode.fromDTO(response);
  }

  @override
  Future<bool> delete(int entityId, String sessionId) async {
    // final response = await endpoint.delete(entityId, sessionId);
    // return response;
    throw UnimplementedError('delete is not implemented');
  }

  @override
  Future<CountryCode?> fetchAndLock(int id, String sessionId) async {
    final response =
        await endpoint.fetchAndLock(id: id, editingSessionId: sessionId);
    return response != null ? CountryCode.fromDTO(response) : null;
  }

  @override
  Future<void> release(int id, String sessionId) async {
    await endpoint.release(entityId: id, sessionId: sessionId);
  }

  Future<void> initialSetup() async {
    for (final countryCode in allCountryCodesForSetup) {
      await createAndReturnEntity(
        sessionId: '',
        entity: countryCode,
        release: true,
      );
    }
  }
}
