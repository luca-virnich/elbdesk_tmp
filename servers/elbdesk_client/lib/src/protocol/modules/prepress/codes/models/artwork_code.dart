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
import '../../../../modules/prepress/codes/models/codes/twoOf5_code.dart'
    as _i2;
import '../../../../modules/prepress/codes/models/codes/aztec_code.dart' as _i3;
import '../../../../modules/prepress/codes/models/codes/template_code.dart'
    as _i4;

abstract class ArtworkCodeDTO implements _i1.SerializableModel {
  ArtworkCodeDTO._({
    required this.value,
    this.description,
    required this.artworkCodeType,
    this.code2of5,
    this.codeAztec,
    this.codeTemplate,
  });

  factory ArtworkCodeDTO({
    required String value,
    String? description,
    required String artworkCodeType,
    _i2.TwoOf5CodeDTO? code2of5,
    _i3.AztecCodeDTO? codeAztec,
    _i4.TemplateCodeDTO? codeTemplate,
  }) = _ArtworkCodeDTOImpl;

  factory ArtworkCodeDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return ArtworkCodeDTO(
      value: jsonSerialization['value'] as String,
      description: jsonSerialization['description'] as String?,
      artworkCodeType: jsonSerialization['artworkCodeType'] as String,
      code2of5: jsonSerialization['code2of5'] == null
          ? null
          : _i2.TwoOf5CodeDTO.fromJson(
              (jsonSerialization['code2of5'] as Map<String, dynamic>)),
      codeAztec: jsonSerialization['codeAztec'] == null
          ? null
          : _i3.AztecCodeDTO.fromJson(
              (jsonSerialization['codeAztec'] as Map<String, dynamic>)),
      codeTemplate: jsonSerialization['codeTemplate'] == null
          ? null
          : _i4.TemplateCodeDTO.fromJson(
              (jsonSerialization['codeTemplate'] as Map<String, dynamic>)),
    );
  }

  String value;

  String? description;

  String artworkCodeType;

  _i2.TwoOf5CodeDTO? code2of5;

  _i3.AztecCodeDTO? codeAztec;

  _i4.TemplateCodeDTO? codeTemplate;

  /// Returns a shallow copy of this [ArtworkCodeDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArtworkCodeDTO copyWith({
    String? value,
    String? description,
    String? artworkCodeType,
    _i2.TwoOf5CodeDTO? code2of5,
    _i3.AztecCodeDTO? codeAztec,
    _i4.TemplateCodeDTO? codeTemplate,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'value': value,
      if (description != null) 'description': description,
      'artworkCodeType': artworkCodeType,
      if (code2of5 != null) 'code2of5': code2of5?.toJson(),
      if (codeAztec != null) 'codeAztec': codeAztec?.toJson(),
      if (codeTemplate != null) 'codeTemplate': codeTemplate?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArtworkCodeDTOImpl extends ArtworkCodeDTO {
  _ArtworkCodeDTOImpl({
    required String value,
    String? description,
    required String artworkCodeType,
    _i2.TwoOf5CodeDTO? code2of5,
    _i3.AztecCodeDTO? codeAztec,
    _i4.TemplateCodeDTO? codeTemplate,
  }) : super._(
          value: value,
          description: description,
          artworkCodeType: artworkCodeType,
          code2of5: code2of5,
          codeAztec: codeAztec,
          codeTemplate: codeTemplate,
        );

  /// Returns a shallow copy of this [ArtworkCodeDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArtworkCodeDTO copyWith({
    String? value,
    Object? description = _Undefined,
    String? artworkCodeType,
    Object? code2of5 = _Undefined,
    Object? codeAztec = _Undefined,
    Object? codeTemplate = _Undefined,
  }) {
    return ArtworkCodeDTO(
      value: value ?? this.value,
      description: description is String? ? description : this.description,
      artworkCodeType: artworkCodeType ?? this.artworkCodeType,
      code2of5:
          code2of5 is _i2.TwoOf5CodeDTO? ? code2of5 : this.code2of5?.copyWith(),
      codeAztec: codeAztec is _i3.AztecCodeDTO?
          ? codeAztec
          : this.codeAztec?.copyWith(),
      codeTemplate: codeTemplate is _i4.TemplateCodeDTO?
          ? codeTemplate
          : this.codeTemplate?.copyWith(),
    );
  }
}
