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

abstract class FontInfoDTO implements _i1.SerializableModel {
  FontInfoDTO._({
    required this.name,
    required this.type,
    required this.location,
    this.fontFile,
    required this.protection,
  });

  factory FontInfoDTO({
    required String name,
    required String type,
    required String location,
    String? fontFile,
    required bool protection,
  }) = _FontInfoDTOImpl;

  factory FontInfoDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return FontInfoDTO(
      name: jsonSerialization['name'] as String,
      type: jsonSerialization['type'] as String,
      location: jsonSerialization['location'] as String,
      fontFile: jsonSerialization['fontFile'] as String?,
      protection: jsonSerialization['protection'] as bool,
    );
  }

  String name;

  String type;

  String location;

  String? fontFile;

  bool protection;

  /// Returns a shallow copy of this [FontInfoDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  FontInfoDTO copyWith({
    String? name,
    String? type,
    String? location,
    String? fontFile,
    bool? protection,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
      'location': location,
      if (fontFile != null) 'fontFile': fontFile,
      'protection': protection,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _FontInfoDTOImpl extends FontInfoDTO {
  _FontInfoDTOImpl({
    required String name,
    required String type,
    required String location,
    String? fontFile,
    required bool protection,
  }) : super._(
          name: name,
          type: type,
          location: location,
          fontFile: fontFile,
          protection: protection,
        );

  /// Returns a shallow copy of this [FontInfoDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  FontInfoDTO copyWith({
    String? name,
    String? type,
    String? location,
    Object? fontFile = _Undefined,
    bool? protection,
  }) {
    return FontInfoDTO(
      name: name ?? this.name,
      type: type ?? this.type,
      location: location ?? this.location,
      fontFile: fontFile is String? ? fontFile : this.fontFile,
      protection: protection ?? this.protection,
    );
  }
}
