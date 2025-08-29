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

enum ArtworkQuarantineGroupField implements _i1.SerializableModel {
  id,
  customer,
  status,
  artworkType,
  type,
  productType,
  printProcessType,
  width,
  height,
  cornerRadius,
  description,
  selectedProductSeriesId,
  outputPath,
  attachments,
  assignedUser,
  artworkQuarantines,
  sendToAeAt,
  sendToAeBy,
  createdAt,
  createdBy,
  lastModifiedAt,
  lastModifiedBy,
  deletedAt;

  static ArtworkQuarantineGroupField fromJson(String name) {
    switch (name) {
      case 'id':
        return ArtworkQuarantineGroupField.id;
      case 'customer':
        return ArtworkQuarantineGroupField.customer;
      case 'status':
        return ArtworkQuarantineGroupField.status;
      case 'artworkType':
        return ArtworkQuarantineGroupField.artworkType;
      case 'type':
        return ArtworkQuarantineGroupField.type;
      case 'productType':
        return ArtworkQuarantineGroupField.productType;
      case 'printProcessType':
        return ArtworkQuarantineGroupField.printProcessType;
      case 'width':
        return ArtworkQuarantineGroupField.width;
      case 'height':
        return ArtworkQuarantineGroupField.height;
      case 'cornerRadius':
        return ArtworkQuarantineGroupField.cornerRadius;
      case 'description':
        return ArtworkQuarantineGroupField.description;
      case 'selectedProductSeriesId':
        return ArtworkQuarantineGroupField.selectedProductSeriesId;
      case 'outputPath':
        return ArtworkQuarantineGroupField.outputPath;
      case 'attachments':
        return ArtworkQuarantineGroupField.attachments;
      case 'assignedUser':
        return ArtworkQuarantineGroupField.assignedUser;
      case 'artworkQuarantines':
        return ArtworkQuarantineGroupField.artworkQuarantines;
      case 'sendToAeAt':
        return ArtworkQuarantineGroupField.sendToAeAt;
      case 'sendToAeBy':
        return ArtworkQuarantineGroupField.sendToAeBy;
      case 'createdAt':
        return ArtworkQuarantineGroupField.createdAt;
      case 'createdBy':
        return ArtworkQuarantineGroupField.createdBy;
      case 'lastModifiedAt':
        return ArtworkQuarantineGroupField.lastModifiedAt;
      case 'lastModifiedBy':
        return ArtworkQuarantineGroupField.lastModifiedBy;
      case 'deletedAt':
        return ArtworkQuarantineGroupField.deletedAt;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "ArtworkQuarantineGroupField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
