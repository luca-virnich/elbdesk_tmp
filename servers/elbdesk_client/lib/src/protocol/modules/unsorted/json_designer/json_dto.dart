/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../../../modules/unsorted/json_designer/json_field_type.dart' as _i2;
import '../../../modules/unsorted/json_designer/json_dto.dart' as _i3;

abstract class JsonDTO implements _i1.SerializableModel {
  JsonDTO._({
    required this.name,
    required this.type,
    required this.jsonKey,
    required this.jsonValue,
    required this.uuid,
    this.children,
  });

  factory JsonDTO({
    required String name,
    required _i2.JsonFieldType type,
    required String jsonKey,
    required String jsonValue,
    required String uuid,
    Map<String, _i3.JsonDTO>? children,
  }) = _JsonDTOImpl;

  factory JsonDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return JsonDTO(
      name: jsonSerialization['name'] as String,
      type: _i2.JsonFieldType.fromJson((jsonSerialization['type'] as String)),
      jsonKey: jsonSerialization['jsonKey'] as String,
      jsonValue: jsonSerialization['jsonValue'] as String,
      uuid: jsonSerialization['uuid'] as String,
      children: (jsonSerialization['children'] as Map?)?.map((k, v) => MapEntry(
            k as String,
            _i3.JsonDTO.fromJson((v as Map<String, dynamic>)),
          )),
    );
  }

  String name;

  _i2.JsonFieldType type;

  String jsonKey;

  String jsonValue;

  String uuid;

  Map<String, _i3.JsonDTO>? children;

  /// Returns a shallow copy of this [JsonDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  JsonDTO copyWith({
    String? name,
    _i2.JsonFieldType? type,
    String? jsonKey,
    String? jsonValue,
    String? uuid,
    Map<String, _i3.JsonDTO>? children,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type.toJson(),
      'jsonKey': jsonKey,
      'jsonValue': jsonValue,
      'uuid': uuid,
      if (children != null)
        'children': children?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _JsonDTOImpl extends JsonDTO {
  _JsonDTOImpl({
    required String name,
    required _i2.JsonFieldType type,
    required String jsonKey,
    required String jsonValue,
    required String uuid,
    Map<String, _i3.JsonDTO>? children,
  }) : super._(
          name: name,
          type: type,
          jsonKey: jsonKey,
          jsonValue: jsonValue,
          uuid: uuid,
          children: children,
        );

  /// Returns a shallow copy of this [JsonDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  JsonDTO copyWith({
    String? name,
    _i2.JsonFieldType? type,
    String? jsonKey,
    String? jsonValue,
    String? uuid,
    Object? children = _Undefined,
  }) {
    return JsonDTO(
      name: name ?? this.name,
      type: type ?? this.type,
      jsonKey: jsonKey ?? this.jsonKey,
      jsonValue: jsonValue ?? this.jsonValue,
      uuid: uuid ?? this.uuid,
      children: children is Map<String, _i3.JsonDTO>?
          ? children
          : this.children?.map((
                key0,
                value0,
              ) =>
                  MapEntry(
                    key0,
                    value0.copyWith(),
                  )),
    );
  }
}
