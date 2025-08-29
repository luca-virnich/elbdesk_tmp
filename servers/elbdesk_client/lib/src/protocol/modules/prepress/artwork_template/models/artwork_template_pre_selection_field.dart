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

enum ArtworkTemplatePreSelectionField implements _i1.SerializableModel {
  id,
  description,
  customer,
  createdAt,
  createdBy,
  lastModifiedAt,
  lastModifiedBy,
  deletedAt,
  isDraft;

  static ArtworkTemplatePreSelectionField fromJson(String name) {
    switch (name) {
      case 'id':
        return ArtworkTemplatePreSelectionField.id;
      case 'description':
        return ArtworkTemplatePreSelectionField.description;
      case 'customer':
        return ArtworkTemplatePreSelectionField.customer;
      case 'createdAt':
        return ArtworkTemplatePreSelectionField.createdAt;
      case 'createdBy':
        return ArtworkTemplatePreSelectionField.createdBy;
      case 'lastModifiedAt':
        return ArtworkTemplatePreSelectionField.lastModifiedAt;
      case 'lastModifiedBy':
        return ArtworkTemplatePreSelectionField.lastModifiedBy;
      case 'deletedAt':
        return ArtworkTemplatePreSelectionField.deletedAt;
      case 'isDraft':
        return ArtworkTemplatePreSelectionField.isDraft;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "ArtworkTemplatePreSelectionField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
