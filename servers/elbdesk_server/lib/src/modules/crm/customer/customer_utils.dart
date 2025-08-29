import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/entity_log/entity_log_endpoint.dart';
import 'package:serverpod/serverpod.dart';

class CustomerUtils {
  const CustomerUtils._();

  static const tableType = TableType.customer;

  static CustomerDTOInclude get includeAll => CustomerDTO.include(
        contact: ContactDTO.include(
          countryCode: CountryCodeDTO.include(),
        ),
        paymentCode: PaymentCodeDTO.include(),
        prepressColorPalettes: PrepressColorPaletteDTO.includeList(),
        contractSovereignty: AppClientDTO.include(),
        assignedUser: LightUserDTO.include(),
        shippingMethod: ShippingMethodDTO.include(),
      );

  static Expression<dynamic>? buildExpression(Filter? filter) {
    final transformedFilter = _transformedIdOrNameFilter(filter);

    final expression = buildFilterExpression<CustomerDTOTable, CustomerField>(
      table: CustomerDTOTable(),
      filter: transformedFilter,
      enumFromString: (String fieldKey) =>
          CustomerField.values.firstWhereOrNull((e) => e.name == fieldKey),
      getDbField: (table, field) => dbFieldFromEnum(field)(table),
    );

    return expression;
  }

  static Filter _transformedIdOrNameFilter(Filter? filter) {
    final transformedFilter = Filter(
      filterGroups: filter?.filterGroups.map((group) {
            return FilterGroup(
              filters: group.filters.map((field) {
                // Parse the customIdString if it is a number
                if (field.fieldKey == CustomerField.customId.name ||
                    field.fieldKey == CustomerField.customIdString.name) {
                  final value = field.value.replaceAll(RegExp('[^0-9]'), '');
                  final parsedValue = int.tryParse(value);
                  if (parsedValue != null) {
                    return FilterField(
                      fieldKey: CustomerField.customIdString.name,
                      filterOperator: field.filterOperator,
                      type: FilterType.iLike,
                      value: value,
                      uuid: const Uuid().v4(),
                      fieldType: FilterFieldType.number,
                    );
                  }
                }
                if (field.fieldKey == CustomerField.filterByIdOrName.name) {
                  final value = field.value;
                  if (RegExp(r'^\d+$').hasMatch(value)) {
                    return FilterField(
                      fieldKey: CustomerField.customIdString.name,
                      filterOperator: field.filterOperator,
                      type: FilterType.iLike,
                      value: value,
                      uuid: const Uuid().v4(),
                      fieldType: FilterFieldType.number,
                    );
                  } else {
                    return FilterField(
                      fieldKey: CustomerField.customerName.name,
                      filterOperator: field.filterOperator,
                      type: FilterType.iLike,
                      value: value,
                      uuid: const Uuid().v4(),
                      fieldType: FilterFieldType.text,
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
    return transformedFilter;
  }

  static Column<dynamic> Function(CustomerDTOTable) orderBy(
    CustomerField? sortField,
  ) {
    if (sortField == null) {
      return dbFieldFromEnum(CustomerField.customerName);
    }
    return dbFieldFromEnum(sortField);
  }

  static Column<dynamic> Function(CustomerDTOTable) dbFieldFromEnum(
    CustomerField sortFieldEnum,
  ) {
    switch (sortFieldEnum) {
      case CustomerField.contractSovereignty:
        return (CustomerDTOTable t) => t.contractSovereignty.description;
      case CustomerField.paymentCode:
        return (CustomerDTOTable t) => t.paymentCode.code;
      case CustomerField.invoiceEmail:
        return (CustomerDTOTable t) => t.invoiceEmail;
      case CustomerField.invoiceDeliveryMethod:
        return (CustomerDTOTable t) => t.invoiceDeliveryMethod;
      case CustomerField.shippingMethod:
        return (CustomerDTOTable t) => t.shippingMethod.code;
      case CustomerField.customerName:
        return (CustomerDTOTable t) => t.contact.fullName;
      case CustomerField.customIdString:
        return (CustomerDTOTable t) => t.customIdString;
      case CustomerField.id:
        return (CustomerDTOTable t) => t.id;
      case CustomerField.filterByIdOrName:
        return (CustomerDTOTable t) => t.id;
      case CustomerField.vatId:
        return (CustomerDTOTable t) => t.vatId;
      case CustomerField.type:
        return (CustomerDTOTable t) => t.contact.type;
      case CustomerField.address:
        return (CustomerDTOTable t) => t.contact.address;
      case CustomerField.city:
        return (CustomerDTOTable t) => t.contact.city;
      case CustomerField.postCode:
        return (CustomerDTOTable t) => t.contact.postCode;
      case CustomerField.state:
        return (CustomerDTOTable t) => t.contact.state;
      case CustomerField.country:
        return (CustomerDTOTable t) => t.contact.countryCode.countryRegionName;
      case CustomerField.address2:
        return (CustomerDTOTable t) => t.contact.address2;
      case CustomerField.address3:
        return (CustomerDTOTable t) => t.contact.address3;
      case CustomerField.mobile:
        return (CustomerDTOTable t) => t.contact.mobile;
      case CustomerField.website:
        return (CustomerDTOTable t) => t.contact.website;
      case CustomerField.phone:
        return (CustomerDTOTable t) => t.contact.phone;
      case CustomerField.email:
        return (CustomerDTOTable t) => t.contact.email;
      case CustomerField.assignedUser:
        return (CustomerDTOTable t) => t.assignedUser.fullName;
      case CustomerField.createdAt:
        return (CustomerDTOTable t) => t.createdAt;
      case CustomerField.createdBy:
        return (CustomerDTOTable t) => t.createdById;
      case CustomerField.lastModifiedAt:
        return (CustomerDTOTable t) => t.lastModifiedAt;
      case CustomerField.lastModifiedBy:
        return (CustomerDTOTable t) => t.lastModifiedById;
      case CustomerField.selectCustomer:
        return (CustomerDTOTable t) => t.id;
      case CustomerField.deletedAt:
        return (CustomerDTOTable t) => t.deletedAt;
      case CustomerField.isDraft:
        return (CustomerDTOTable t) => t.isDraft;
      case CustomerField.customId:
        return (CustomerDTOTable t) => t.customId;
    }
  }

  static CustomerDTO initialCustomer({
    required int userId,
    required ContactDTO contact,
    required int customId,
  }) {
    return CustomerDTO(
      vatId: '',
      invoiceEmail: '',
      invoiceDeliveryMethod: null,
      shippingMethod: null,
      isDraft: false,
      lastModifiedAt: null,
      createdAt: DateTime.now(),
      createdById: userId,
      editingSince: DateTime.now(),
      contact: contact,
      contactId: contact.id,
      customId: customId,
      customIdString: customId.toString(),
    );
  }

  static List<LogField<CustomerDTO>> getLogFields() {
    return CustomerField.values
        .map((field) {
          switch (field) {
            case CustomerField.paymentCode:
              return LogField<CustomerDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.paymentCode?.code ?? '',
              );
            case CustomerField.vatId:
              return LogField<CustomerDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.vatId,
              );
            case CustomerField.invoiceEmail:
              return LogField<CustomerDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.invoiceEmail,
              );
            case CustomerField.invoiceDeliveryMethod:
              return LogField<CustomerDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.invoiceDeliveryMethod,
              );
            case CustomerField.shippingMethod:
              return LogField<CustomerDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.shippingMethod?.description ?? '',
              );
            case CustomerField.contractSovereignty:
              return LogField<CustomerDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.contractSovereignty?.description,
              );
            case CustomerField.assignedUser:
              return LogField<CustomerDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.assignedUser?.fullName,
              );

            case CustomerField.id:
            case CustomerField.customId:
            case CustomerField.customIdString:
            case CustomerField.type:
            case CustomerField.address:
            case CustomerField.city:
            case CustomerField.postCode:
            case CustomerField.state:
            case CustomerField.country:
            case CustomerField.address2:
            case CustomerField.address3:
            case CustomerField.mobile:
            case CustomerField.website:
            case CustomerField.phone:
            case CustomerField.email:
            case CustomerField.createdAt:
            case CustomerField.createdBy:
            case CustomerField.lastModifiedAt:
            case CustomerField.lastModifiedBy:
            case CustomerField.selectCustomer:
            case CustomerField.deletedAt:
            case CustomerField.isDraft:
            case CustomerField.customerName:
            case CustomerField.filterByIdOrName:
              return null;
          }
        })
        .whereType<LogField<CustomerDTO>>()
        .toList();
  }
}

/// Creates a new customer with the given sessionId
