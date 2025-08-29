import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/src/soi_einzelformaufbau/repositories/soi_einzelformaufbau_repository.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'soi_einzelformaufbau_provider.g.dart';

@riverpod
SoiEinzelformaufbauRepository soiEinzelformaufbauRepository(
  Ref ref,
) {
  return SoiEinzelformaufbauRepository(
    endpoint: serverpodClient.soiEinzelformaufbau,
  );
}

@riverpod
Future<List<SoiEinzelformaufbau>> fetchSoiEinzelformaufbausBySalesOrder(
  Ref ref,
  int salesOrderId,
) async {
  return ref
      .watch(soiEinzelformaufbauRepositoryProvider)
      .fetchForSalesOrder(salesOrderId);
}

// @riverpod
// Stream<int> watchSoiRequestArtworkApprovalDeletionsBySalesOrder(
//   Ref ref,
//   int salesOrderId,
// ) async* {
//   final streamHelper = IntStreamManager();
//   yield* streamHelper.setupStream(
//     ref: ref,
//     startListening: () =>
//         serverpodClient.soiRequestArtworkApproval.watchDeletionsForSalesOrder(
//       StreamController<int>.broadcast().stream,
//       salesOrderId: salesOrderId,
//     ),
//     onError: (error) {
//       dlog(
//         'Error occurred in streamSoiRequestArtworkApprovalDeletionsBySalesOrder: '
//         '$error',
//       );
//     },
//   );
// }

@riverpod
Stream<SoiEinzelformaufbau> watchSoiEinzelformaufbau(
  Ref ref, {
  required String sessionId,
  required int id,
}) async* {
  final streamHelper =
      ServerpodStreamManager<SoiEinzelformaufbau, SoiEinzelformaufbauDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.soiEinzelformaufbau.watchEntity(
      sessionId: sessionId,
      entityId: id,
    ),
    convertDtoToModel: SoiEinzelformaufbau.fromDTO,
    onError: (error) {
      dlog('Error occurred in streamSoiEinzelformaufbau: $error');
    },
  );
}
