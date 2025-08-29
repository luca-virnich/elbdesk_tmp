import 'dart:async';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_core/src/data/edit_request/reject_edit_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_request_repository.g.dart';

@riverpod
Stream<EditRequest> watchEditRequests(
  Ref ref, {
  required String tableType,
  required int primaryKey,
}) async* {
  final endpoint = EndpointEditRequestEndoint(ElbDeskCore.client);
  final streamHelper = ServerpodStreamManager<EditRequest, EditRequestDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => endpoint.streamEditRequests(
      primaryKey: primaryKey,
      tableType: tableType,
    ),
    convertDtoToModel: EditRequest.fromDTO,
  );
}

@riverpod
Stream<RejectEditRequest> watchRejectEditRequests(
  Ref ref, {
  required String tableType,
  required int primaryKey,
}) async* {
  final endpoint = EndpointEditRequestEndoint(ElbDeskCore.client);
  final streamHelper =
      ServerpodStreamManager<RejectEditRequest, RejectEditRequestDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => endpoint.watchRejectEditRequests(
      primaryKey: primaryKey,
      tableType: tableType,
    ),
    convertDtoToModel: RejectEditRequest.fromDTO,
  );
}

@riverpod
Stream<RejectEditRequest> watchRejectEditRequestsByWindowId(
  Ref ref, {
  required String tableType,
  required int primaryKey,
  required String requestingFloatingWindowId,
}) {
  // Get the stream directly from the upstream provider
  final upstreamStream = watchRejectEditRequests(
    ref,
    tableType: tableType,
    primaryKey: primaryKey,
  );

  // Filter the stream by windowId
  return upstreamStream.where(
    (request) =>
        request.requestingFloatingWindowId == requestingFloatingWindowId,
  );
}

@riverpod
EditRequestRepository editRequestRepository(Ref ref) {
  return EditRequestRepository(
    endpoint: EndpointEditRequestEndoint(ElbDeskCore.client),
  );
}

class EditRequestRepository {
  EditRequestRepository({required this.endpoint});
  final EndpointEditRequestEndoint endpoint;

  Future<void> createRequest({
    required int primaryKey,
    required String tableType,
    required String requestingFloatingWindowId,
    String? message,
  }) async {
    final request = EditRequestDTO(
      // will be overwritten by server
      createdByName: '',
      createdAt: DateTime.now(),
      tablePrimaryKey: primaryKey,
      tableType: tableType,
      message: message ?? '',
      requestingFloatingWindowId: requestingFloatingWindowId,
    );

    await endpoint.sendRequest(request);
  }

  Future<void> rejectRequest({
    required RejectEditRequest request,
  }) async {
    await endpoint.rejectRequest(request.toDTO());
  }
}
