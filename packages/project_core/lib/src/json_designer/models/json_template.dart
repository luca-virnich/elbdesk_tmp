import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_core/src/json_designer/models/json.dart';

part 'json_template.freezed.dart';
part 'json_template.g.dart';

@freezed
class JsonTemplate with _$JsonTemplate, HasMetaData {
  factory JsonTemplate({
    required int? id,
    required String name,
    required JsonTemplateType type,
    required Json jsonTree,
    required DataMeta meta,
  }) = _JsonTemplate;

  const JsonTemplate._();

  factory JsonTemplate.fromJson(Map<String, dynamic> json) =>
      _$JsonTemplateFromJson(json);

  factory JsonTemplate.fromDTO(JsonTemplateDTO dto) {
    final dataMeta = DataMeta(
      isDraft: dto.isDraft,
      lastModifiedAt: dto.lastModifiedAt?.toLocal(),
      id: dto.id,
      createdAt: dto.createdAt.toLocal(),
      lastModifiedById: dto.lastModifiedById,
      createdById: dto.createdById,
      editingSessionId: dto.editingSession,
      editingById: dto.editingById,
      editingSince: dto.editingSince?.toLocal(),
      deletedAt: dto.deletedAt,
      deletedById: dto.deletedById,
    );
    return JsonTemplate(
      id: dto.id,
      name: dto.name,
      type: dto.type,
      jsonTree: Json.fromDTO(dto.json),
      meta: dataMeta,
    );
  }

  JsonTemplateDTO toDTO() {
    return JsonTemplateDTO(
      name: name,
      id: id,
      type: JsonTemplateType.speedy,
      json: jsonTree.toDTO(),
      isDraft: true,
      createdAt: DateTime.now(),
    );
  }
}
