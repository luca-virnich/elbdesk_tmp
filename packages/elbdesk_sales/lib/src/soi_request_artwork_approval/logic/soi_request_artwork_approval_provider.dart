import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/src/soi_request_artwork_approval/repositories/soi_request_artwork_approval_repository.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'soi_request_artwork_approval_provider.g.dart';

@riverpod
SoiRequestArtworkApprovalRepository soiRequestArtworkApprovalRepository(
  Ref ref,
) {
  return SoiRequestArtworkApprovalRepository(
    endpoint: serverpodClient.soiRequestArtworkApproval,
  );
}

@riverpod
Future<List<SoiRequestArtworkApproval>>
    fetchSoiRequestArtworkApprovalsBySalesOrder(
  Ref ref,
  int salesOrderId,
) async {
  return ref
      .watch(soiRequestArtworkApprovalRepositoryProvider)
      .fetchForSalesOrder(salesOrderId);
}

@riverpod
Stream<int> watchSoiRequestArtworkApprovalDeletionsBySalesOrder(
  Ref ref,
  int salesOrderId,
) async* {
  final streamHelper = ServerpodStreamManager<int, int>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () =>
        serverpodClient.soiRequestArtworkApproval.watchDeletionsForSalesOrder(
      salesOrderId: salesOrderId,
    ),
    convertDtoToModel: (dto) => dto,
    onError: (error) {
      dlog(
        'Error occurred in streamSoiRequestArtworkApprovalDeletionsBySalesOrder: '
        '$error',
      );
    },
  );
}

@riverpod
Stream<SoiRequestArtworkApproval> watchSoiRequestArtworkApproval(
  Ref ref, {
  required String sessionId,
  required int id,
}) async* {
  final streamHelper = ServerpodStreamManager<SoiRequestArtworkApproval,
      SoiRequestArtworkApprovalDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.soiRequestArtworkApproval.watchEntity(
      sessionId: sessionId,
      entityId: id,
    ),
    convertDtoToModel: SoiRequestArtworkApproval.fromDTO,
    onError: (error) {
      dlog('Error occurred in watchSoiRequestArtworkApproval: $error');
    },
  );
}
