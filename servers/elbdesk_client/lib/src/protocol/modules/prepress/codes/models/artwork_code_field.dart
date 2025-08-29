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

enum ArtworkCodeField implements _i1.SerializableModel {
  id,
  artwork,
  value,
  description,
  code2of5,
  codeAztec,
  codeTemplate,
  barWidthReduction,
  deviceCompensation,
  narrowBarWidth,
  aspectRatio,
  createdAt,
  createdBy,
  lastModifiedAt,
  lastModifiedBy,
  deletedAt;

  static ArtworkCodeField fromJson(String name) {
    switch (name) {
      case 'id':
        return ArtworkCodeField.id;
      case 'artwork':
        return ArtworkCodeField.artwork;
      case 'value':
        return ArtworkCodeField.value;
      case 'description':
        return ArtworkCodeField.description;
      case 'code2of5':
        return ArtworkCodeField.code2of5;
      case 'codeAztec':
        return ArtworkCodeField.codeAztec;
      case 'codeTemplate':
        return ArtworkCodeField.codeTemplate;
      case 'barWidthReduction':
        return ArtworkCodeField.barWidthReduction;
      case 'deviceCompensation':
        return ArtworkCodeField.deviceCompensation;
      case 'narrowBarWidth':
        return ArtworkCodeField.narrowBarWidth;
      case 'aspectRatio':
        return ArtworkCodeField.aspectRatio;
      case 'createdAt':
        return ArtworkCodeField.createdAt;
      case 'createdBy':
        return ArtworkCodeField.createdBy;
      case 'lastModifiedAt':
        return ArtworkCodeField.lastModifiedAt;
      case 'lastModifiedBy':
        return ArtworkCodeField.lastModifiedBy;
      case 'deletedAt':
        return ArtworkCodeField.deletedAt;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "ArtworkCodeField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
