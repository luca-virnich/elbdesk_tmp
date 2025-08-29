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

enum SoiEinzelformaufbauField implements _i1.SerializableModel {
  artworkId,
  salesOrderItemId,
  salesOrderId,
  description,
  billableTime,
  assignedUser,
  version,
  createdAt,
  createdBy,
  lastModifiedAt,
  lastModifiedBy,
  deletedAt,
  isDraft;

  static SoiEinzelformaufbauField fromJson(String name) {
    switch (name) {
      case 'artworkId':
        return SoiEinzelformaufbauField.artworkId;
      case 'salesOrderItemId':
        return SoiEinzelformaufbauField.salesOrderItemId;
      case 'salesOrderId':
        return SoiEinzelformaufbauField.salesOrderId;
      case 'description':
        return SoiEinzelformaufbauField.description;
      case 'billableTime':
        return SoiEinzelformaufbauField.billableTime;
      case 'assignedUser':
        return SoiEinzelformaufbauField.assignedUser;
      case 'version':
        return SoiEinzelformaufbauField.version;
      case 'createdAt':
        return SoiEinzelformaufbauField.createdAt;
      case 'createdBy':
        return SoiEinzelformaufbauField.createdBy;
      case 'lastModifiedAt':
        return SoiEinzelformaufbauField.lastModifiedAt;
      case 'lastModifiedBy':
        return SoiEinzelformaufbauField.lastModifiedBy;
      case 'deletedAt':
        return SoiEinzelformaufbauField.deletedAt;
      case 'isDraft':
        return SoiEinzelformaufbauField.isDraft;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "SoiEinzelformaufbauField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
