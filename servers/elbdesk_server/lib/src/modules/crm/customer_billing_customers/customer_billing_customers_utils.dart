import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class CustomerBillingCustomersUtils {
  const CustomerBillingCustomersUtils._();

  static CustomerBillingCustomerDTOInclude get includeAll =>
      CustomerBillingCustomerDTO.include(
        billingCustomer: CustomerDTO.include(
          contact: ContactDTO.include(),
        ),
        customer: CustomerDTO.include(),
      );

  static Expression<dynamic>? buildExpression(Filter? filter) {
    final transformedFilter = _transformedIdOrNameFilter(filter);

    final expression = buildFilterExpression<CustomerBillingCustomerDTOTable,
        CustomerBillingCustomerField>(
      table: CustomerBillingCustomerDTOTable(),
      filter: transformedFilter,
      enumFromString: (String fieldKey) => CustomerBillingCustomerField.values
          .firstWhereOrNull((e) => e.name == fieldKey),
      getDbField: (table, field) => dbFieldFromEnum(field)(table),
    );

    return expression;
  }

  static Column<dynamic> Function(CustomerBillingCustomerDTOTable) orderBy(
    CustomerBillingCustomerField? sortField,
  ) {
    if (sortField == null) {
      return dbFieldFromEnum(
        CustomerBillingCustomerField.billingCustomerFullName,
      );
    }
    return dbFieldFromEnum(sortField);
  }

  static Filter _transformedIdOrNameFilter(Filter? filter) {
    return Filter(
      filterGroups: filter?.filterGroups.map((group) {
            return FilterGroup(
              filters: group.filters.map((field) {
                if (field.fieldKey ==
                    CustomerBillingCustomerField
                        .filterByBillingCustomerIdOrFullName.name) {
                  final value = field.value;
                  if (RegExp(r'^\d+$').hasMatch(value)) {
                    return FilterField(
                      fieldKey: CustomerBillingCustomerField
                          .billingCustomerCustomId.name,
                      filterOperator: field.filterOperator,
                      type: FilterType.equal,
                      value: value,
                      uuid: const Uuid().v4(),
                      fieldType: FilterFieldType.number,
                    );
                  } else if (RegExp('^[Kk]-').hasMatch(value) &&
                      value.length > 2) {
                    final parts = value.split('-');
                    final customIdPart = parts.length > 1 ? parts[1] : '';
                    final customIdNumber = int.tryParse(customIdPart);

                    if (customIdNumber != null) {
                      return FilterField(
                        fieldKey: CustomerBillingCustomerField
                            .billingCustomerCustomId.name,
                        filterOperator: field.filterOperator,
                        type: FilterType.equal,
                        value: customIdNumber.toString(),
                        uuid: const Uuid().v4(),
                        fieldType: FilterFieldType.number,
                      );
                    }
                  }
                  return FilterField(
                    fieldKey: CustomerBillingCustomerField
                        .billingCustomerFullName.name,
                    filterOperator: field.filterOperator,
                    type: FilterType.iLike,
                    value: value,
                    uuid: const Uuid().v4(),
                    fieldType: FilterFieldType.text,
                  );
                } else if (field.fieldKey ==
                    CustomerBillingCustomerField.billingCustomerCustomId.name) {
                  final value = field.value;
                  if (RegExp('^[Kk]-').hasMatch(value) && value.length > 2) {
                    final parts = value.split('-');
                    final customIdPart = parts.length > 1 ? parts[1] : '';
                    final customIdNumber = int.tryParse(customIdPart);

                    if (customIdNumber != null) {
                      return FilterField(
                        fieldKey: CustomerBillingCustomerField
                            .billingCustomerCustomId.name,
                        filterOperator: field.filterOperator,
                        type: FilterType.equal,
                        value: customIdNumber.toString(),
                        uuid: const Uuid().v4(),
                        fieldType: FilterFieldType.number,
                      );
                    }
                  }
                  return FilterField(
                    fieldKey: CustomerBillingCustomerField
                        .billingCustomerCustomId.name,
                    filterOperator: field.filterOperator,
                    type: FilterType.equal,
                    value: value,
                    uuid: const Uuid().v4(),
                    fieldType: FilterFieldType.number,
                  );
                }
                return field;
              }).toList(),
              nextOperator: group.nextOperator,
            );
          }).toList() ??
          [],
    );
  }

  static Column<dynamic> Function(CustomerBillingCustomerDTOTable)
      dbFieldFromEnum(
    CustomerBillingCustomerField sortFieldEnum,
  ) {
    switch (sortFieldEnum) {
      case CustomerBillingCustomerField.id:
        return (CustomerBillingCustomerDTOTable t) => t.id;
      case CustomerBillingCustomerField.customer:
        return (CustomerBillingCustomerDTOTable t) => t.customerId;
      case CustomerBillingCustomerField.billingCustomer:
        return (CustomerBillingCustomerDTOTable t) => t.billingCustomerId;
      case CustomerBillingCustomerField.isPrimary:
        return (CustomerBillingCustomerDTOTable t) => t.isPrimary;
      case CustomerBillingCustomerField.filterByBillingCustomerIdOrFullName:
        return (CustomerBillingCustomerDTOTable t) => t.id;
      case CustomerBillingCustomerField.billingCustomerCustomId:
        return (CustomerBillingCustomerDTOTable t) =>
            t.billingCustomer.customId;
      case CustomerBillingCustomerField.billingCustomerFullName:
        return (CustomerBillingCustomerDTOTable t) =>
            t.billingCustomer.contact.fullName;
      case CustomerBillingCustomerField.billingCustomerAddress:
        return (CustomerBillingCustomerDTOTable t) =>
            t.billingCustomer.contact.address;
      case CustomerBillingCustomerField.billingCustomerAddress2:
        return (CustomerBillingCustomerDTOTable t) =>
            t.billingCustomer.contact.address2;
      case CustomerBillingCustomerField.billingCustomerPostCode:
        return (CustomerBillingCustomerDTOTable t) =>
            t.billingCustomer.contact.postCode;
      case CustomerBillingCustomerField.billingCustomerCity:
        return (CustomerBillingCustomerDTOTable t) =>
            t.billingCustomer.contact.city;
      case CustomerBillingCustomerField.billingCustomerState:
        return (CustomerBillingCustomerDTOTable t) =>
            t.billingCustomer.contact.state;
      case CustomerBillingCustomerField.billingCustomerPhone:
        return (CustomerBillingCustomerDTOTable t) =>
            t.billingCustomer.contact.phone;
      case CustomerBillingCustomerField.billingCustomerEmail:
        return (CustomerBillingCustomerDTOTable t) =>
            t.billingCustomer.contact.email;
      case CustomerBillingCustomerField.billingCustomerMobile:
        return (CustomerBillingCustomerDTOTable t) =>
            t.billingCustomer.contact.mobile;
      case CustomerBillingCustomerField.billingCustomerCountryCode:
        return (CustomerBillingCustomerDTOTable t) =>
            t.billingCustomer.contact.countryCode.countryRegionName;
      case CustomerBillingCustomerField.billingCustomerLanguageCode:
        return (CustomerBillingCustomerDTOTable t) =>
            t.billingCustomer.contact.languageCode.languageName;
    }
  }
}
