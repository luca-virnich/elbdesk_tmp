import 'package:collection/collection.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/entity_log/entity_log_endpoint.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class SalesOrderUtils {
  const SalesOrderUtils._();

  static const tableType = TableType.salesOrder;

  static SalesOrderDTOInclude get includeAll => SalesOrderDTO.include(
        assignedUser: LightUserDTO.include(
          userInfo: UserInfo.include(),
        ),
        customerContactPerson: ContactDTO.include(),
        customerCustomerContactPerson: ContactDTO.include(),
        customerCustomer: CustomerCustomerDTO.include(
          customerCustomerContact: ContactDTO.include(),
        ),
        customer: CustomerDTO.include(
          contact: ContactDTO.include(
            countryCode: CountryCodeDTO.include(),
          ),
        ),
        billingAddress: CustomerDTO.include(
          contact: ContactDTO.include(
            countryCode: CountryCodeDTO.include(),
          ),
        ),
        shippingAddress: ContactDTO.include(
          countryCode: CountryCodeDTO.include(),
        ),
      );

  static Expression<dynamic>? buildExpression(Filter? filter) {
    final transformedFilter = transformFilter(filter);

    final expression =
        buildFilterExpression<SalesOrderDTOTable, SalesOrderField>(
      table: SalesOrderDTOTable(),
      filter: transformedFilter,
      enumFromString: (String fieldKey) =>
          SalesOrderField.values.firstWhereOrNull((e) => e.name == fieldKey),
      getDbField: (table, field) => dbFieldFromEnum(field)(table),
    );

    return expression;
  }

  static Filter transformFilter(Filter? filter) {
    return Filter(
      filterGroups: filter?.filterGroups.map((group) {
            return FilterGroup(
              filters: group.filters.map((field) {
                if (field.fieldKey == SalesOrderField.customId.name ||
                    field.fieldKey == SalesOrderField.customIdString.name) {
                  final value = field.value.replaceAll(RegExp('[^0-9]'), '');
                  final parsedValue = int.tryParse(value);
                  if (parsedValue != null) {
                    return FilterField(
                      fieldKey: SalesOrderField.customIdString.name,
                      filterOperator: field.filterOperator,
                      type: FilterType.iLike,
                      value: value,
                      uuid: const Uuid().v4(),
                      fieldType: FilterFieldType.number,
                    );
                  }
                }
                return field;
              }).toList(),
              nextOperator: group.nextOperator,
            );
          }).toList() ??
          [],
    );
  }

  static Column<dynamic> Function(SalesOrderDTOTable) orderBy(
    SalesOrderField? sortByField,
  ) {
    if (sortByField == null) {
      return dbFieldFromEnum(SalesOrderField.customId);
    }
    return dbFieldFromEnum(sortByField);
  }

  static Column<dynamic> Function(SalesOrderDTOTable) dbFieldFromEnum(
    SalesOrderField sortFieldEnum,
  ) {
    switch (sortFieldEnum) {
      case SalesOrderField.customIdString:
        return (SalesOrderDTOTable t) => t.customIdString;
      case SalesOrderField.customerFirstReference:
        return (SalesOrderDTOTable t) => t.customerFirstReference;
      case SalesOrderField.customerSecondReference:
        return (SalesOrderDTOTable t) => t.customerSecondReference;
      case SalesOrderField.customerCustomerReference:
        return (SalesOrderDTOTable t) => t.customerCustomerReference;
      case SalesOrderField.customerId:
        return (SalesOrderDTOTable t) => t.customerId;
      case SalesOrderField.orderDate:
        return (SalesOrderDTOTable t) => t.orderDate;
      case SalesOrderField.description:
        return (SalesOrderDTOTable t) => t.description;
      case SalesOrderField.status:
        return (SalesOrderDTOTable t) => t.status;
      case SalesOrderField.customerName:
        return (SalesOrderDTOTable t) => t.customer.contact.fullName;

      case SalesOrderField.createdAt:
        return (SalesOrderDTOTable t) => t.createdAt;
      case SalesOrderField.createdBy:
        return (SalesOrderDTOTable t) => t.createdById;
      case SalesOrderField.lastModifiedAt:
        return (SalesOrderDTOTable t) => t.lastModifiedAt;

      case SalesOrderField.lastModifiedBy:
        return (SalesOrderDTOTable t) => t.lastModifiedById;
      case SalesOrderField.keywords:
        return (SalesOrderDTOTable t) => t.keywords;

      case SalesOrderField.orderNumber:
        return (SalesOrderDTOTable t) => t.orderNumber;

      case SalesOrderField.billingAddress:
        return (SalesOrderDTOTable t) => t.billingAddress.id;
      case SalesOrderField.shippingAddress:
        return (SalesOrderDTOTable t) => t.shippingAddress.id;

      case SalesOrderField.assignedUser:
        return (SalesOrderDTOTable t) => t.assignedUser.userInfoId;
      case SalesOrderField.deletedAt:
        return (SalesOrderDTOTable t) => t.deletedAt;
      case SalesOrderField.isDraft:
        return (SalesOrderDTOTable t) => t.isDraft;
      case SalesOrderField.customId:
        return (SalesOrderDTOTable t) => t.customId;
      case SalesOrderField.customerContactPerson:
        return (SalesOrderDTOTable t) => t.customerContactPerson.fullName;
      case SalesOrderField.customerCustomerContactPerson:
        return (SalesOrderDTOTable t) =>
            t.customerCustomerContactPerson.fullName;
      case SalesOrderField.customerCustomer:
        return (SalesOrderDTOTable t) =>
            t.customerCustomer.customerCustomerContact.fullName;
      case SalesOrderField.filterByIdOrName:
        return (SalesOrderDTOTable t) => t.id;
    }
  }

  /// Initial Sales Order
  ///
  /// Used when creating a new sales order
  ///
  /// [customer] The customer to create the sales order for
  /// [userId] The ID of the user creating the sales order
  static SalesOrderDTO initialSalesOrder({
    required CustomerDTO customer,
    required int userId,
    required int assignedLightUserId,
    required DateTime now,
    required int shippingAddressId,
    required int billingAddressCustomerId,
    required int customId,
    String? sessionId,
  }) {
    return SalesOrderDTO(
      customId: customId,
      customIdString: customId.toString(),
      description: '',
      orderDate: now,
      keywords: '',
      customerFirstReference: '',
      customerSecondReference: '',
      customerCustomerReference: '',
      status: SalesOrderStatus.preperation.name,
      orderNumber: '',
      assignedUserId: assignedLightUserId,

      customerId: customer.id!,
      // items: [],
      lastModifiedAt: null,
      createdAt: now,
      createdById: userId,
      isDraft: false,
      editingSince: sessionId == null ? null : now,
      editingById: sessionId == null ? null : userId,
      editingSession: sessionId,
      billingAddressId: billingAddressCustomerId,
      shippingAddressId: shippingAddressId,
    );
  }

  static List<LogField<SalesOrderDTO>> getLogFields() {
    return SalesOrderField.values
        .map((field) {
          switch (field) {
            case SalesOrderField.shippingAddress:
              return LogField<SalesOrderDTO>(
                fieldName: field.name,
                getValue: (entity) =>
                    entity.shippingAddress?.id.toString() ?? '',
              );
            case SalesOrderField.billingAddress:
              return LogField<SalesOrderDTO>(
                fieldName: field.name,
                getValue: (entity) =>
                    entity.billingAddress?.id.toString() ?? '',
              );
            case SalesOrderField.customerFirstReference:
              return LogField<SalesOrderDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.customerFirstReference,
              );
            case SalesOrderField.customerSecondReference:
              return LogField<SalesOrderDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.customerSecondReference,
              );
            case SalesOrderField.customerCustomerReference:
              return LogField<SalesOrderDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.customerCustomerReference,
              );

            case SalesOrderField.description:
              return LogField<SalesOrderDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.description,
              );
            case SalesOrderField.orderDate:
              return LogField<SalesOrderDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.orderDate.toString(),
              );
            case SalesOrderField.keywords:
              return LogField<SalesOrderDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.keywords,
              );

            case SalesOrderField.orderNumber:
              return LogField<SalesOrderDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.orderNumber,
              );
            case SalesOrderField.status:
              return LogField<SalesOrderDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.status,
              );
            case SalesOrderField.customerId:
              return LogField<SalesOrderDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.customer?.id.toString() ?? '',
              );
            case SalesOrderField.customerName:
              return LogField<SalesOrderDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.customer?.contact?.fullName ?? '',
              );
            case SalesOrderField.customerContactPerson:
              return LogField<SalesOrderDTO>(
                fieldName: field.name,
                getValue: (entity) =>
                    entity.customerContactPerson?.fullName ?? '',
              );
            case SalesOrderField.customerCustomerContactPerson:
              return LogField<SalesOrderDTO>(
                fieldName: field.name,
                getValue: (entity) =>
                    entity.customerCustomerContactPerson?.fullName ?? '',
              );
            case SalesOrderField.customerCustomer:
              return LogField<SalesOrderDTO>(
                fieldName: field.name,
                getValue: (entity) =>
                    entity
                        .customerCustomer?.customerCustomerContact?.fullName ??
                    '',
              );
            case SalesOrderField.assignedUser:
              return LogField<SalesOrderDTO>(
                fieldName: field.name,
                getValue: (entity) =>
                    entity.assignedUser?.userInfo?.fullName ?? '',
              );
            // Skip metadata fields as they are typically not logged
            case SalesOrderField.createdAt:
            case SalesOrderField.createdBy:
            case SalesOrderField.lastModifiedAt:
            case SalesOrderField.lastModifiedBy:
            case SalesOrderField.deletedAt:
            case SalesOrderField.isDraft:
            case SalesOrderField.customId:
            case SalesOrderField.customIdString:
            case SalesOrderField.filterByIdOrName:
              return null;
          }
        })
        .whereType<LogField<SalesOrderDTO>>()
        .toList();
  }
}
