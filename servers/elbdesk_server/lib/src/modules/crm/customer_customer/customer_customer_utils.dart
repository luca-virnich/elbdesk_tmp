import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class CustomerCustomerUtils {
  const CustomerCustomerUtils._();

  static CustomerCustomerDTOInclude get includeAll =>
      CustomerCustomerDTO.include(
        customerCustomerContact: ContactDTO.include(
          countryCode: CountryCodeDTO.include(),
          languageCode: LanguageCodeDTO.include(),
        ),
        customer: CustomerDTO.include(),
      );

  static Expression<dynamic>? buildExpression(Filter? filter) {
    final transformedFilter = _transformedIdOrNameFilter(filter);

    final expression =
        buildFilterExpression<CustomerCustomerDTOTable, CustomerCustomerField>(
      table: CustomerCustomerDTOTable(),
      filter: transformedFilter,
      enumFromString: (String fieldKey) => CustomerCustomerField.values
          .firstWhereOrNull((e) => e.name == fieldKey),
      getDbField: (table, field) => dbFieldFromEnum(field)(table),
    );

    return expression;
  }

  static Column<dynamic> Function(CustomerCustomerDTOTable) orderBy(
    CustomerCustomerField? sortField,
  ) {
    if (sortField == null) {
      return dbFieldFromEnum(
        CustomerCustomerField.customerCustomerContactFullName,
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
                    CustomerCustomerField
                        .filterByCustomerCustomerContactIdOrFullName.name) {
                  final value = field.value;
                  if (RegExp(r'^\d+$').hasMatch(value)) {
                    return FilterField(
                      fieldKey: CustomerCustomerField
                          .customerCustomerContactCustomId.name,
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
                        fieldKey: CustomerCustomerField
                            .customerCustomerContactCustomId.name,
                        filterOperator: field.filterOperator,
                        type: FilterType.equal,
                        value: customIdNumber.toString(),
                        uuid: const Uuid().v4(),
                        fieldType: FilterFieldType.number,
                      );
                    }
                  }
                  return FilterField(
                    fieldKey: CustomerCustomerField
                        .customerCustomerContactFullName.name,
                    filterOperator: field.filterOperator,
                    type: FilterType.iLike,
                    value: value,
                    uuid: const Uuid().v4(),
                    fieldType: FilterFieldType.text,
                  );
                } else if (field.fieldKey ==
                    CustomerCustomerField
                        .customerCustomerContactCustomId.name) {
                  final value = field.value;
                  if (RegExp('^[Kk]-').hasMatch(value) && value.length > 2) {
                    final parts = value.split('-');
                    final customIdPart = parts.length > 1 ? parts[1] : '';
                    final customIdNumber = int.tryParse(customIdPart);

                    if (customIdNumber != null) {
                      return FilterField(
                        fieldKey: CustomerCustomerField
                            .customerCustomerContactCustomId.name,
                        filterOperator: field.filterOperator,
                        type: FilterType.equal,
                        value: customIdNumber.toString(),
                        uuid: const Uuid().v4(),
                        fieldType: FilterFieldType.number,
                      );
                    }
                  }
                  return FilterField(
                    fieldKey: CustomerCustomerField
                        .customerCustomerContactCustomId.name,
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

  static Column<dynamic> Function(CustomerCustomerDTOTable) dbFieldFromEnum(
    CustomerCustomerField sortFieldEnum,
  ) {
    switch (sortFieldEnum) {
      case CustomerCustomerField.id:
        return (CustomerCustomerDTOTable t) => t.id;
      case CustomerCustomerField.customer:
        return (CustomerCustomerDTOTable t) => t.customerId;
      case CustomerCustomerField.customerCustomerContact:
        return (CustomerCustomerDTOTable t) => t.customerCustomerContactId;
      case CustomerCustomerField.filterByCustomerCustomerContactIdOrFullName:
        return (CustomerCustomerDTOTable t) => t.id;
      case CustomerCustomerField.customerCustomerContactCustomId:
        return (CustomerCustomerDTOTable t) =>
            t.customerCustomerContact.customId;
      case CustomerCustomerField.customerCustomerContactFullName:
        return (CustomerCustomerDTOTable t) =>
            t.customerCustomerContact.fullName;
      case CustomerCustomerField.customerCustomerContactAddress:
        return (CustomerCustomerDTOTable t) =>
            t.customerCustomerContact.address;
      case CustomerCustomerField.customerCustomerContactAddress2:
        return (CustomerCustomerDTOTable t) =>
            t.customerCustomerContact.address2;
      case CustomerCustomerField.customerCustomerContactPostCode:
        return (CustomerCustomerDTOTable t) =>
            t.customerCustomerContact.postCode;
      case CustomerCustomerField.customerCustomerContactCity:
        return (CustomerCustomerDTOTable t) => t.customerCustomerContact.city;
      case CustomerCustomerField.customerCustomerContactState:
        return (CustomerCustomerDTOTable t) => t.customerCustomerContact.state;
      case CustomerCustomerField.customerCustomerContactPhone:
        return (CustomerCustomerDTOTable t) => t.customerCustomerContact.phone;
      case CustomerCustomerField.customerCustomerContactEmail:
        return (CustomerCustomerDTOTable t) => t.customerCustomerContact.email;
      case CustomerCustomerField.customerCustomerContactMobile:
        return (CustomerCustomerDTOTable t) => t.customerCustomerContact.mobile;
      case CustomerCustomerField.customerCustomerContactCountryCode:
        return (CustomerCustomerDTOTable t) =>
            t.customerCustomerContact.countryCode.countryRegionName;
      case CustomerCustomerField.customerCustomerContactLanguageCode:
        return (CustomerCustomerDTOTable t) =>
            t.customerCustomerContact.languageCode.languageName;
      case CustomerCustomerField.createdAt:
        return (CustomerCustomerDTOTable t) => t.createdAt;
      case CustomerCustomerField.createdBy:
        return (CustomerCustomerDTOTable t) => t.createdById;
      case CustomerCustomerField.lastModifiedAt:
        return (CustomerCustomerDTOTable t) => t.lastModifiedAt;

      case CustomerCustomerField.lastModifiedBy:
        return (CustomerCustomerDTOTable t) => t.lastModifiedById;
      case CustomerCustomerField.deletedAt:
        return (CustomerCustomerDTOTable t) => t.deletedAt;
      case CustomerCustomerField.isDraft:
        return (CustomerCustomerDTOTable t) => t.isDraft;
    }
  }
}
