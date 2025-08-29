import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'json.freezed.dart';
part 'json.g.dart';

@freezed
class Json with _$Json {
  factory Json({
    required String name,
    required JsonFieldType type,
    required String jsonKey,
    required dynamic jsonValue,
    required String uuid,
    Map<String, Json>? children,
  }) = _Json;

  const Json._();

  factory Json.fromJson(Map<String, dynamic> json) => _$JsonFromJson(json);

  factory Json.fromDTO(JsonDTO dto) {
    return Json(
      name: dto.name,
      type: dto.type,
      jsonKey: dto.jsonKey,
      jsonValue: dto.jsonValue,
      uuid: dto.uuid,
      children: dto.children?.map(
        (key, value) => MapEntry(
          key,
          Json.fromDTO(value),
        ),
      ),
    );
  }

  JsonDTO toDTO() {
    return JsonDTO(
      name: name,
      type: type,
      jsonKey: jsonKey,
      jsonValue: jsonValue.toString(),
      uuid: uuid,
      children: children?.map((key, value) => MapEntry(key, value.toDTO())),
    );
  }
}
