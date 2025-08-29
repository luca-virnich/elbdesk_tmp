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

enum SoiPrepareArtworkField implements _i1.SerializableModel {
  artworkId,
  salesOrderItemId,
  salesOrderId,
  description,
  billableTime,
  assignedUser,
  createdAt,
  createdBy,
  lastModifiedAt,
  lastModifiedBy,
  deletedAt,
  isDraft;

  static SoiPrepareArtworkField fromJson(String name) {
    switch (name) {
      case 'artworkId':
        return SoiPrepareArtworkField.artworkId;
      case 'salesOrderItemId':
        return SoiPrepareArtworkField.salesOrderItemId;
      case 'salesOrderId':
        return SoiPrepareArtworkField.salesOrderId;
      case 'description':
        return SoiPrepareArtworkField.description;
      case 'billableTime':
        return SoiPrepareArtworkField.billableTime;
      case 'assignedUser':
        return SoiPrepareArtworkField.assignedUser;
      case 'createdAt':
        return SoiPrepareArtworkField.createdAt;
      case 'createdBy':
        return SoiPrepareArtworkField.createdBy;
      case 'lastModifiedAt':
        return SoiPrepareArtworkField.lastModifiedAt;
      case 'lastModifiedBy':
        return SoiPrepareArtworkField.lastModifiedBy;
      case 'deletedAt':
        return SoiPrepareArtworkField.deletedAt;
      case 'isDraft':
        return SoiPrepareArtworkField.isDraft;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "SoiPrepareArtworkField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
