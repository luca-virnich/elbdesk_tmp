import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_request.freezed.dart';
part 'edit_request.g.dart';

@freezed
class EditRequest with _$EditRequest {
  const factory EditRequest({
    required String createdByName,
    required DateTime createdAt,
    required String message,
    required String requestId,
    required String requestingFloatingWindowId,
  }) = _EditRequest;
  const EditRequest._();

  factory EditRequest.fromJson(Map<String, dynamic> json) =>
      _$EditRequestFromJson(json);

  factory EditRequest.fromDTO(EditRequestDTO dto) => EditRequest(
        createdByName: dto.createdByName,
        createdAt: dto.createdAt.toLocal(),
        message: dto.message,
        requestId: const Uuid().v4(),
        requestingFloatingWindowId: dto.requestingFloatingWindowId,
      );

  String formattedMessage(ElbCoreLocalizations l10n) {
    final time = createdAt.toTimeWithoutSeconds(l10n.localeName);
    final message = l10n.gen_edit_request(createdByName, time);
    return message;
  }
}

enum DataEditType {
  you,
  other,
  same,
  none,
}
