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

enum SoiConsultingField implements _i1.SerializableModel {
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

  static SoiConsultingField fromJson(String name) {
    switch (name) {
      case 'salesOrderItemId':
        return SoiConsultingField.salesOrderItemId;
      case 'salesOrderId':
        return SoiConsultingField.salesOrderId;
      case 'description':
        return SoiConsultingField.description;
      case 'billableTime':
        return SoiConsultingField.billableTime;
      case 'assignedUser':
        return SoiConsultingField.assignedUser;
      case 'createdAt':
        return SoiConsultingField.createdAt;
      case 'createdBy':
        return SoiConsultingField.createdBy;
      case 'lastModifiedAt':
        return SoiConsultingField.lastModifiedAt;
      case 'lastModifiedBy':
        return SoiConsultingField.lastModifiedBy;
      case 'deletedAt':
        return SoiConsultingField.deletedAt;
      case 'isDraft':
        return SoiConsultingField.isDraft;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "SoiConsultingField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
