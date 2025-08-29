import 'package:collection/collection.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/entity_log/entity_log_endpoint.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

class ProductMasterUtils {
  const ProductMasterUtils._();

  static Expression<dynamic>? buildExpression(
    Filter? filter,
  ) {
    final expression =
        buildFilterExpression<ProductMasterDTOTable, ProductField>(
      table: ProductMasterDTOTable(),
      filter: filter,
      enumFromString: (String fieldKey) =>
          ProductField.values.firstWhereOrNull((e) => e.name == fieldKey),
      getDbField: (table, field) => _dbFieldFromEnum(field)(table),
    );

    return expression;
  }

  static Column<dynamic> Function(ProductMasterDTOTable) orderBy(
    ProductField? sortField,
  ) {
    if (sortField == null) {
      return _dbFieldFromEnum(ProductField.serienId);
    }
    return _dbFieldFromEnum(sortField);
  }

  static Column<dynamic> Function(ProductMasterDTOTable) _dbFieldFromEnum(
    ProductField sortFieldEnum,
  ) {
    switch (sortFieldEnum) {
      case ProductField.productType:
        return (ProductMasterDTOTable t) => t.productType;
      case ProductField.description:
        return (ProductMasterDTOTable t) => t.description;
      case ProductField.keywords:
        return (ProductMasterDTOTable t) => t.keywords;
      case ProductField.serienIdString:
        return (ProductMasterDTOTable t) => t.serienIdString;
      case ProductField.customer:
        return (ProductMasterDTOTable t) => t.customerId;
      case ProductField.serienIndex:
        return (ProductMasterDTOTable t) => t.serienIndex;
      case ProductField.createdAt:
        return (ProductMasterDTOTable t) => t.createdAt;
      case ProductField.isDraft:
        return (ProductMasterDTOTable t) => t.isDraft;
      case ProductField.id:
        return (ProductMasterDTOTable t) => t.serienId;
      case ProductField.serienId:
        return (ProductMasterDTOTable t) => t.serienId;
      case ProductField.artworks:
        return (ProductMasterDTOTable t) => t.id;
      case ProductField.salesOrder:
        return (ProductMasterDTOTable t) => t.id;

      case ProductField.createdBy:
        return (ProductMasterDTOTable t) => t.createdById;
      case ProductField.lastModifiedAt:
        return (ProductMasterDTOTable t) => t.lastModifiedAt;
      case ProductField.lastModifiedBy:
        return (ProductMasterDTOTable t) => t.lastModifiedById;
      case ProductField.deletedAt:
        return (ProductMasterDTOTable t) => t.deletedAt;
      case ProductField.productMaster:
        return (ProductMasterDTOTable t) => t.deletedById;
      case ProductField.customerReference:
        return (ProductMasterDTOTable t) => t.customerReference;
      case ProductField.printProcessType:
        return (ProductMasterDTOTable t) => t.printProcessType;
      case ProductField.productId:
        return (ProductMasterDTOTable t) => t.id;
      case ProductField.productPartId:
        return (ProductMasterDTOTable t) => t.id;
    }
  }

  static List<LogField<ProductMasterDTO>> getLogFields() {
    return ProductField.values
        .map((field) {
          switch (field) {
            case ProductField.productType:
              return LogField<ProductMasterDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.productType,
              );
            case ProductField.description:
              return LogField<ProductMasterDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.description,
              );

            case ProductField.keywords:
              return LogField<ProductMasterDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.keywords,
              );
            case ProductField.customerReference:
              return LogField<ProductMasterDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.customerReference,
              );
            case ProductField.printProcessType:
              return LogField<ProductMasterDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.printProcessType,
              );

            // Fields we don't want to log
            case ProductField.id:
            case ProductField.createdAt:
            case ProductField.createdBy:
            case ProductField.lastModifiedAt:
            case ProductField.lastModifiedBy:
            case ProductField.isDraft:
            case ProductField.deletedAt:
            case ProductField.customer:
            case ProductField.salesOrder:
            case ProductField.artworks:
            case ProductField.serienId:
            case ProductField.serienIndex:
            case ProductField.serienIdString:
            case ProductField.productMaster:
            case ProductField.productId:
            case ProductField.productPartId:
              return null;
          }
        })
        .whereType<LogField<ProductMasterDTO>>()
        .toList();
  }
}
