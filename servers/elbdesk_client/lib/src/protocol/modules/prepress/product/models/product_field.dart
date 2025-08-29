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

enum ProductField implements _i1.SerializableModel {
  id,
  serienId,
  serienIdString,
  serienIndex,
  customer,
  salesOrder,
  productMaster,
  artworks,
  productId,
  productPartId,
  description,
  keywords,
  customerReference,
  printProcessType,
  productType,
  createdAt,
  createdBy,
  lastModifiedAt,
  lastModifiedBy,
  deletedAt,
  isDraft;

  static ProductField fromJson(String name) {
    switch (name) {
      case 'id':
        return ProductField.id;
      case 'serienId':
        return ProductField.serienId;
      case 'serienIdString':
        return ProductField.serienIdString;
      case 'serienIndex':
        return ProductField.serienIndex;
      case 'customer':
        return ProductField.customer;
      case 'salesOrder':
        return ProductField.salesOrder;
      case 'productMaster':
        return ProductField.productMaster;
      case 'artworks':
        return ProductField.artworks;
      case 'productId':
        return ProductField.productId;
      case 'productPartId':
        return ProductField.productPartId;
      case 'description':
        return ProductField.description;
      case 'keywords':
        return ProductField.keywords;
      case 'customerReference':
        return ProductField.customerReference;
      case 'printProcessType':
        return ProductField.printProcessType;
      case 'productType':
        return ProductField.productType;
      case 'createdAt':
        return ProductField.createdAt;
      case 'createdBy':
        return ProductField.createdBy;
      case 'lastModifiedAt':
        return ProductField.lastModifiedAt;
      case 'lastModifiedBy':
        return ProductField.lastModifiedBy;
      case 'deletedAt':
        return ProductField.deletedAt;
      case 'isDraft':
        return ProductField.isDraft;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "ProductField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
