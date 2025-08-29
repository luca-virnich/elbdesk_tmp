import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/src/payment_code/models/payment_code.dart';
import 'package:elbdesk_crm/src/payment_code/repositories/payment_code_repository.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_code_provider.g.dart';

@riverpod
Future<PaymentCode> fetchPaymentCode(Ref ref, int id) async {
  return ref.watch(paymentCodeRepositoryProvider).fetchById(id);
}

@riverpod
Future<List<PaymentCode>> findPaymentCodes(
  Ref ref,
  String sessionId,
) async {
  final (sorting, filtering) = ref.watch(
    tableSortAndFilterProvider(sessionId, TableType.paymentCode.name),
  );

  return ref
      .watch(paymentCodeRepositoryProvider)
      .find(sort: sorting, filter: filtering);
}

@riverpod
PaymentCodeRepository paymentCodeRepository(
  Ref ref,
) {
  final endpoint = serverpodClient.paymentCode;
  return PaymentCodeRepository(endpoint: endpoint);
}

@riverpod
Stream<PaymentCode> watchPaymentCode(
  Ref ref, {
  required String sessionId,
  required int paymentCodeId,
}) async* {
  final streamHelper = ServerpodStreamManager<PaymentCode, PaymentCodeDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.paymentCode.watch(
      sessionId: sessionId,
      entityId: paymentCodeId,
    ),
    convertDtoToModel: PaymentCode.fromDTO,
    onError: (error) {
      dlog('Error occurred in watchPaymentCode: $error');
    },
  );
}

@riverpod
Stream<PaymentCode> watchAllPaymentCodes(
  Ref ref,
) async* {
  final streamHelper = ServerpodStreamManager<PaymentCode, PaymentCodeDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.paymentCode.watchAll(),
    convertDtoToModel: PaymentCode.fromDTO,
  );
}

@riverpod
class FetchAndWatchAllPaymentCodes extends _$FetchAndWatchAllPaymentCodes {
  @override
  Future<List<PaymentCode>> build() async {
    ref.cacheFor(const Duration(minutes: 5));
    ref.listen(watchAllPaymentCodesProvider, (previous, next) {
      if (next is AsyncData<PaymentCode>) {
        handleEvent(next.value);
      }
    });
    final initial = await ref.watch(paymentCodeRepositoryProvider).fetchAll();
    return initial;
  }

  Future<void> handleEvent(PaymentCode paymentCode) async {
    final current = await future;

    final index = current.indexWhere((element) => element.id == paymentCode.id);
    if (index != -1) {
      final updatedList = List<PaymentCode>.from(current);
      updatedList[index] = paymentCode;
      state = AsyncData(updatedList);
    } else {
      state = AsyncData([...current, paymentCode]);
    }
  }
}
