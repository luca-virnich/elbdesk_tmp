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

enum CrmEventField implements _i1.SerializableModel {
  id,
  name,
  description,
  startDate,
  endDate,
  executionDate,
  status,
  createdAt,
  createdBy,
  lastModifiedAt,
  lastModifiedBy,
  deletedAt,
  isDraft;

  static CrmEventField fromJson(String name) {
    switch (name) {
      case 'id':
        return CrmEventField.id;
      case 'name':
        return CrmEventField.name;
      case 'description':
        return CrmEventField.description;
      case 'startDate':
        return CrmEventField.startDate;
      case 'endDate':
        return CrmEventField.endDate;
      case 'executionDate':
        return CrmEventField.executionDate;
      case 'status':
        return CrmEventField.status;
      case 'createdAt':
        return CrmEventField.createdAt;
      case 'createdBy':
        return CrmEventField.createdBy;
      case 'lastModifiedAt':
        return CrmEventField.lastModifiedAt;
      case 'lastModifiedBy':
        return CrmEventField.lastModifiedBy;
      case 'deletedAt':
        return CrmEventField.deletedAt;
      case 'isDraft':
        return CrmEventField.isDraft;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "CrmEventField"');
    }
  }

  @override
  String toJson() => this.name;
  @override
  String toString() => this.name;
}
