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

enum ArtworkLogField implements _i1.SerializableModel {
  id,
  entityId,
  salesOrderId,
  salesOrderCustomId,
  oldValue,
  newValue,
  field,
  tableType,
  updatedAt,
  updatedBy;

  static ArtworkLogField fromJson(String name) {
    switch (name) {
      case 'id':
        return ArtworkLogField.id;
      case 'entityId':
        return ArtworkLogField.entityId;
      case 'salesOrderId':
        return ArtworkLogField.salesOrderId;
      case 'salesOrderCustomId':
        return ArtworkLogField.salesOrderCustomId;
      case 'oldValue':
        return ArtworkLogField.oldValue;
      case 'newValue':
        return ArtworkLogField.newValue;
      case 'field':
        return ArtworkLogField.field;
      case 'tableType':
        return ArtworkLogField.tableType;
      case 'updatedAt':
        return ArtworkLogField.updatedAt;
      case 'updatedBy':
        return ArtworkLogField.updatedBy;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "ArtworkLogField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
