import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/src/payment_code/config/payment_code_setup.dart';
import 'package:elbdesk_crm/src/payment_code/models/payment_code.dart';

class PaymentCodeRepository implements EntityRepository<PaymentCode> {
  /// @nodoc
  PaymentCodeRepository({required this.endpoint});

  final EndpointPaymentCode endpoint;

  @override
  Future<List<PaymentCode>> find({Sort? sort, Filter? filter}) async {
    final response = await endpoint.find(sort: sort, filter: filter);
    return response.map(PaymentCode.fromDTO).toList();
  }

  @override
  Future<PaymentCode> fetchById(int id) async {
    final response = await endpoint.fetchById(id);
    return PaymentCode.fromDTO(response!);
  }

  @override
  Future<List<PaymentCode>> fetchAll() async {
    final response = await endpoint.fetchAll();
    return response.map(PaymentCode.fromDTO).toList();
  }

  @override
  Future<PaymentCode?> fetchAndLock(int id, String sessionId) async {
    final response =
        await endpoint.fetchAndLock(id: id, editingSessionId: sessionId);
    return response != null ? PaymentCode.fromDTO(response) : null;
  }

  @override
  Future<void> release(int id, String sessionId) async {
    await endpoint.release(entityId: id, sessionId: sessionId);
  }

  @override
  Future<PaymentCode> update({
    required PaymentCode entity,
    required bool release,
    required String sessionId,
  }) async {
    final response = await endpoint.update(
      sessionId: sessionId,
      entity: entity.toDTO(),
      release: release,
    );
    return PaymentCode.fromDTO(response);
  }

  @override
  Future<PaymentCode> createAndReturnEntity({
    required PaymentCode entity,
    required bool release,
    required String sessionId,
  }) async {
    final response = await endpoint.create(
      sessionId: sessionId,
      entity: entity.toDTO(),
      release: release,
    );
    return PaymentCode.fromDTO(response);
  }

  @override
  Future<bool> delete(int entityId, String sessionId) async {
    // final response = await endpoint.delete(entityId, sessionId);
    // return response;
    throw UnimplementedError('delete is not implemented');
  }

  Future<void> initialSetup() async {
    for (final paymentCode in allPaymentCodesForSetup) {
      await createAndReturnEntity(
        entity: paymentCode,
        release: false,
        sessionId: '',
      );
    }
  }
}
