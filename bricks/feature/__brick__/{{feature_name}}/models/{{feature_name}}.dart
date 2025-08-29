import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '{{#snakeCase}}{{feature_name}}{{/snakeCase}}.freezed.dart';
part '{{#snakeCase}}{{feature_name}}{{/snakeCase}}.g.dart';

// TODO(mason): after Mason generation
//
// 1) Add translations
// module_{{#snakeCase}}{{feature_name}}{{/snakeCase}}_singular
// module_{{#snakeCase}}{{feature_name}}{{/snakeCase}}_plural
// module_{{#snakeCase}}{{feature_name}}{{/snakeCase}}_name
// module_{{#snakeCase}}{{feature_name}}{{/snakeCase}}_description
//
// 2) Add tableType at: table_type.spy.yaml
//
// 3) Add AppIcons at: app_icons.dart
// AppIcons.{{#camelCase}}{{feature_name}}{{/camelCase}}
//
// 4) Add CollapsibleIdentifier at: collapsible_identifier.dart
// {{#camelCase}}{{feature_name}}{{/camelCase}}MainPageGeneral
//
// 5) Add FloatingWindowType at: floating_window_type.dart
// {{#camelCase}}{{feature_name}}{{/camelCase}}(
//   minSize: Size(650, 400),
//   preferredSize: Size(650, 400),
//   isTableWindow: false,
// ),
//
// 6) Add Deeplink at: deeplink_repository.dart
// case FloatingWindowType.{{#camelCase}}{{feature_name}}{{/camelCase}}:
//   break;

/// {{#pascalCase}}{{feature_name}}{{/pascalCase}}
/// 
/// This is the frontend {{#pascalCase}}{{feature_name}}{{/pascalCase}} model
/// 
@freezed
class {{#pascalCase}}{{feature_name}}{{/pascalCase}} with _${{#pascalCase}}{{feature_name}}{{/pascalCase}}, HasMetaData {
  const factory {{#pascalCase}}{{feature_name}}{{/pascalCase}}({
    required String name,
    required String description,
    required DataMeta meta,
    int? id,
  }) = _{{#pascalCase}}{{feature_name}}{{/pascalCase}};

  factory {{#pascalCase}}{{feature_name}}{{/pascalCase}}.fromJson(Map<String, Object?> json) =>
      _${{#pascalCase}}{{feature_name}}{{/pascalCase}}FromJson(json);

  factory {{#pascalCase}}{{feature_name}}{{/pascalCase}}.fromDTO({{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO dto) {
    final dataMeta = DataMeta.fromDTO(dto);

    return {{#pascalCase}}{{feature_name}}{{/pascalCase}}(
      id: dto.id,
      name: dto.name,
      description: dto.description ?? '',
      meta: dataMeta,
    );
  }

  const {{#pascalCase}}{{feature_name}}{{/pascalCase}}._();

  {{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO toDTO() {
    return {{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO(
      isDraft: meta.isDraft,
      id: id,
      name: name,
      description: description,
      createdAt: meta.createdAt!,
      createdById: meta.createdById,
    );
  }
}

class {{#pascalCase}}{{feature_name}}{{/pascalCase}}AdditionalData implements AdditionalEntityData {
  const {{#pascalCase}}{{feature_name}}{{/pascalCase}}AdditionalData({
    required this.name,
    this.description,
  });

  factory {{#pascalCase}}{{feature_name}}{{/pascalCase}}AdditionalData.fromJson(Map<String, dynamic> json) {
    return {{#pascalCase}}{{feature_name}}{{/pascalCase}}AdditionalData(
      name: json['name'] as String,
      description: json['description'] as String?,
    );
  }

  final String name;
  final String? description;

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
    };
  }
} 
