import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reject_edit_request.freezed.dart';

@freezed
class RejectEditRequest with _$RejectEditRequest {
  const factory RejectEditRequest({
    required String tableType,
    required int tablePrimaryKey,
    required String createdByName,
    required DateTime createdAt,
    required String reason,
    required String requestingFloatingWindowId,
  }) = _RejectEditRequest;
  const RejectEditRequest._();

  factory RejectEditRequest.fromDTO(RejectEditRequestDTO dto) =>
      RejectEditRequest(
        requestingFloatingWindowId: dto.floatingWindowId,
        tableType: dto.tableType,
        tablePrimaryKey: dto.tablePrimaryKey,
        createdByName: dto.createdByName,
        createdAt: dto.createdAt.toLocal(),
        reason: dto.message,
      );

  RejectEditRequestDTO toDTO() => RejectEditRequestDTO(
        tableType: tableType,
        tablePrimaryKey: tablePrimaryKey,
        createdByName: createdByName,
        createdAt: createdAt,
        message: reason,
        floatingWindowId: requestingFloatingWindowId,
      );
}
