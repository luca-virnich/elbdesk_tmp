import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/src/shipping_method/config/shipping_method_setup.dart';
import 'package:project_core/project_core.dart';

/// Shipping Method Repository
///
/// This repository handles all shipping method related operations.
class ShippingMethodRepository implements EntityRepository<ShippingMethod> {
  /// @nodoc
  ShippingMethodRepository({required this.endpoint});

  final EndpointShippingMethod endpoint;

  @override
  Future<List<ShippingMethod>> find({Sort? sort, Filter? filter}) async {
    final response = await endpoint.find(sort: sort, filter: filter);
    return response.map(ShippingMethod.fromDTO).toList();
  }

  @override
  Future<ShippingMethod> fetchById(int id) async {
    final response = await endpoint.fetchById(id);
    return ShippingMethod.fromDTO(response!);
  }

  @override
  Future<List<ShippingMethod>> fetchAll() async {
    final response = await endpoint.fetchAll();
    return response.map(ShippingMethod.fromDTO).toList();
  }

  @override
  Future<ShippingMethod?> fetchAndLock(int id, String sessionId) async {
    final response = await endpoint.fetchAndLock(
      id: id,
      editingSessionId: sessionId,
    );
    return response != null ? ShippingMethod.fromDTO(response) : null;
  }

  @override
  Future<void> release(int id, String sessionId) async {
    await endpoint.release(entityId: id, sessionId: sessionId);
  }

  @override
  Future<ShippingMethod> update({
    required ShippingMethod entity,
    required bool release,
    required String sessionId,
  }) async {
    final response = await endpoint.update(
      sessionId: sessionId,
      entity: entity.toDTO(),
      release: release,
    );
    return ShippingMethod.fromDTO(response);
  }

  @override
  Future<ShippingMethod> createAndReturnEntity({
    required ShippingMethod entity,
    required bool release,
    required String sessionId,
  }) async {
    final response = await endpoint.create(
      sessionId: sessionId,
      entity: entity.toDTO(),
      release: release,
    );
    return ShippingMethod.fromDTO(response);
  }

  @override
  Future<bool> delete(int entityId, String sessionId) async {
    throw UnimplementedError('delete is not implemented');
  }

  /// Initializes the default shipping methods in the database
  Future<void> initialSetup() async {
    for (final shippingMethod in allShippingMethodsForSetup) {
      await createAndReturnEntity(
        entity: shippingMethod,
        release: false,
        sessionId: '',
      );
    }
  }
}

/// Provider for the shipping method repository
final shippingMethodRepositoryProvider = Provider<ShippingMethodRepository>(
  (ref) => ShippingMethodRepository(
    endpoint: serverpodClient.shippingMethod,
  ),
);
