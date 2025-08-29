/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

enum SoiStepAndRepeatField implements _i1.SerializableModel {
  artworks,
  salesOrder,
  status,
  description,
  soiId,
  createdAt,
  createdBy,
  lastModifiedAt,
  lastModifiedBy,
  deletedAt,
  isDraft;

  static SoiStepAndRepeatField fromJson(String name) {
    switch (name) {
      case 'artworks':
        return SoiStepAndRepeatField.artworks;
      case 'salesOrder':
        return SoiStepAndRepeatField.salesOrder;
      case 'status':
        return SoiStepAndRepeatField.status;
      case 'description':
        return SoiStepAndRepeatField.description;
      case 'soiId':
        return SoiStepAndRepeatField.soiId;
      case 'createdAt':
        return SoiStepAndRepeatField.createdAt;
      case 'createdBy':
        return SoiStepAndRepeatField.createdBy;
      case 'lastModifiedAt':
        return SoiStepAndRepeatField.lastModifiedAt;
      case 'lastModifiedBy':
        return SoiStepAndRepeatField.lastModifiedBy;
      case 'deletedAt':
        return SoiStepAndRepeatField.deletedAt;
      case 'isDraft':
        return SoiStepAndRepeatField.isDraft;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "SoiStepAndRepeatField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
