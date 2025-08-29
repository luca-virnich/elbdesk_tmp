import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/src/app_client/models/app_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppClientRepository implements EntityRepository<AppClient> {
  AppClientRepository({
    required this.endpoint,
    required this.ref,
  });

  final EndpointAppClient endpoint;
  final Ref ref;

  @override
  Future<List<AppClient>> fetchAll() async {
    final appClients = await endpoint.fetchAll(null);
    return appClients.map(AppClient.fromDTO).toList();
  }

  @override
  Future<AppClient?> fetchById(int id) async {
    final appClient = await endpoint.fetchById(
      id,
    );
    return appClient != null ? AppClient.fromDTO(appClient) : null;
  }

  @override
  Future<List<AppClient>> find({Sort? sort, Filter? filter}) async {
    final appClients = await endpoint.find(sort: sort, filter: filter);
    return appClients.map(AppClient.fromDTO).toList();
  }

  Future<int> create({
    required String sessionId,
  }) async {
    final newAppClient = await endpoint.create(
      sessionId: sessionId,
    );

    return newAppClient.id!;
  }

  @override
  Future<AppClient?> fetchAndLock(
    int appClientId,
    String sessionId,
  ) async {
    final appClient = await endpoint.fetchAndLock(
      id: appClientId,
      editingSessionId: sessionId,
    );

    return appClient != null ? AppClient.fromDTO(appClient) : null;
  }

  @override
  Future<void> release(int entityId, String sessionId) async {
    await endpoint.release(
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  @override
  Future<AppClient> update({
    required AppClient entity,
    required String sessionId,
    required bool release,
  }) async {
    final newAppClient = await endpoint.update(
      entity: entity.toDTO(),
      sessionId: sessionId,
      release: release,
    );
    return AppClient.fromDTO(newAppClient);
  }

  @override
  Future<AppClient> createAndReturnEntity({
    required String sessionId,
    required AppClient entity,
    required bool release,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(int entityId, String sessionId) async {
    throw UnimplementedError();
  }
}
