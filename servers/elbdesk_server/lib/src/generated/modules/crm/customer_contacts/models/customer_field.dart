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

enum CustomerContactsField implements _i1.SerializableModel {
  id,
  type,
  isPrimary,
  customer,
  contact,
  createdAt,
  createdBy,
  lastModifiedAt,
  lastModifiedBy,
  deletedAt,
  isDraft;

  static CustomerContactsField fromJson(String name) {
    switch (name) {
      case 'id':
        return CustomerContactsField.id;
      case 'type':
        return CustomerContactsField.type;
      case 'isPrimary':
        return CustomerContactsField.isPrimary;
      case 'customer':
        return CustomerContactsField.customer;
      case 'contact':
        return CustomerContactsField.contact;
      case 'createdAt':
        return CustomerContactsField.createdAt;
      case 'createdBy':
        return CustomerContactsField.createdBy;
      case 'lastModifiedAt':
        return CustomerContactsField.lastModifiedAt;
      case 'lastModifiedBy':
        return CustomerContactsField.lastModifiedBy;
      case 'deletedAt':
        return CustomerContactsField.deletedAt;
      case 'isDraft':
        return CustomerContactsField.isDraft;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "CustomerContactsField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
