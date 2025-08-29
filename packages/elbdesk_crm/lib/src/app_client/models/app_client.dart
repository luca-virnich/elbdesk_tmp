import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_client.freezed.dart';
part 'app_client.g.dart';

/// @nodoc
@freezed
class AppClient with _$AppClient, HasMetaData {
  /// @nodoc
  const factory AppClient({
    required Contact? contact,
    required String automationEngine,
    required String description,
    required DataMeta meta,
  }) = _AppClient;

  /// @nodoc
  const AppClient._();

  factory AppClient.fromJson(Map<String, Object?> json) =>
      _$AppClientFromJson(json);

  /// @nodoc
  factory AppClient.fromDTO(AppClientDTO dto) {
    final dataMeta = DataMeta.fromDTO(dto);
    return AppClient(
      contact: dto.contact != null ? Contact.fromDTO(dto.contact!) : null,
      automationEngine: dto.automationEngine,
      description: dto.description,
      meta: dataMeta,
    );
  }

  AppClientDTO toDTO() {
    return AppClientDTO(
      id: meta.id,
      isDraft: meta.isDraft,
      contactId: contact?.meta.id,
      contact: contact?.toDTO(),
      automationEngine: automationEngine,
      description: description,
      createdAt: meta.createdAt!,
      createdById: meta.createdById,
      editingSince: meta.editingSince,
      editingById: meta.editingById,
      editingSession: meta.editingSessionId,
      deletedAt: meta.deletedAt,
      deletedById: meta.deletedById,
    );
  }
}
