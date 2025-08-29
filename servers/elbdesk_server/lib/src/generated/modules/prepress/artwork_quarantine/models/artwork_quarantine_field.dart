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

enum ArtworkQuarantineField implements _i1.SerializableModel {
  id,
  description,
  customer,
  customerId,
  artwork,
  status,
  keywords,
  colors,
  groupStatus,
  width,
  height,
  cornerRadius,
  productSeriesId,
  printProcessType,
  productType,
  artworkType,
  createProduct,
  createProductPart,
  deleteArtworkQuarantine,
  createdAt,
  createdBy,
  lastModifiedAt,
  lastModifiedBy,
  deletedAt,
  isDraft;

  static ArtworkQuarantineField fromJson(String name) {
    switch (name) {
      case 'id':
        return ArtworkQuarantineField.id;
      case 'description':
        return ArtworkQuarantineField.description;
      case 'customer':
        return ArtworkQuarantineField.customer;
      case 'customerId':
        return ArtworkQuarantineField.customerId;
      case 'artwork':
        return ArtworkQuarantineField.artwork;
      case 'status':
        return ArtworkQuarantineField.status;
      case 'keywords':
        return ArtworkQuarantineField.keywords;
      case 'colors':
        return ArtworkQuarantineField.colors;
      case 'groupStatus':
        return ArtworkQuarantineField.groupStatus;
      case 'width':
        return ArtworkQuarantineField.width;
      case 'height':
        return ArtworkQuarantineField.height;
      case 'cornerRadius':
        return ArtworkQuarantineField.cornerRadius;
      case 'productSeriesId':
        return ArtworkQuarantineField.productSeriesId;
      case 'printProcessType':
        return ArtworkQuarantineField.printProcessType;
      case 'productType':
        return ArtworkQuarantineField.productType;
      case 'artworkType':
        return ArtworkQuarantineField.artworkType;
      case 'createProduct':
        return ArtworkQuarantineField.createProduct;
      case 'createProductPart':
        return ArtworkQuarantineField.createProductPart;
      case 'deleteArtworkQuarantine':
        return ArtworkQuarantineField.deleteArtworkQuarantine;
      case 'createdAt':
        return ArtworkQuarantineField.createdAt;
      case 'createdBy':
        return ArtworkQuarantineField.createdBy;
      case 'lastModifiedAt':
        return ArtworkQuarantineField.lastModifiedAt;
      case 'lastModifiedBy':
        return ArtworkQuarantineField.lastModifiedBy;
      case 'deletedAt':
        return ArtworkQuarantineField.deletedAt;
      case 'isDraft':
        return ArtworkQuarantineField.isDraft;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "ArtworkQuarantineField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
