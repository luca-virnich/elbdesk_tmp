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

enum SoiRequestArtworkApprovalField implements _i1.SerializableModel {
  artworkId,
  salesOrderItemId,
  salesOrderId,
  description,
  billableTime,
  assignedUser,
  approvalType,
  createdAt,
  createdBy,
  lastModifiedAt,
  lastModifiedBy,
  deletedAt,
  isDraft;

  static SoiRequestArtworkApprovalField fromJson(String name) {
    switch (name) {
      case 'artworkId':
        return SoiRequestArtworkApprovalField.artworkId;
      case 'salesOrderItemId':
        return SoiRequestArtworkApprovalField.salesOrderItemId;
      case 'salesOrderId':
        return SoiRequestArtworkApprovalField.salesOrderId;
      case 'description':
        return SoiRequestArtworkApprovalField.description;
      case 'billableTime':
        return SoiRequestArtworkApprovalField.billableTime;
      case 'assignedUser':
        return SoiRequestArtworkApprovalField.assignedUser;
      case 'approvalType':
        return SoiRequestArtworkApprovalField.approvalType;
      case 'createdAt':
        return SoiRequestArtworkApprovalField.createdAt;
      case 'createdBy':
        return SoiRequestArtworkApprovalField.createdBy;
      case 'lastModifiedAt':
        return SoiRequestArtworkApprovalField.lastModifiedAt;
      case 'lastModifiedBy':
        return SoiRequestArtworkApprovalField.lastModifiedBy;
      case 'deletedAt':
        return SoiRequestArtworkApprovalField.deletedAt;
      case 'isDraft':
        return SoiRequestArtworkApprovalField.isDraft;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "SoiRequestArtworkApprovalField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
