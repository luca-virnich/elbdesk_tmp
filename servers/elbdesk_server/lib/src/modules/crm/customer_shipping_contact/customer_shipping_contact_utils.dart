import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class CustomerShippingContactUtils {
  const CustomerShippingContactUtils._();

  static CustomerShippingContactDTOInclude get includeAll =>
      CustomerShippingContactDTO.include(
        shippingContact: ContactDTO.include(
          countryCode: CountryCodeDTO.include(),
          languageCode: LanguageCodeDTO.include(),
        ),
        customer: CustomerDTO.include(),
      );

  static Expression<dynamic>? buildExpression(Filter? filter) {
    final transformedFilter = _transformedIdOrNameFilter(filter);

    final expression = buildFilterExpression<CustomerShippingContactDTOTable,
        CustomerShippingContactField>(
      table: CustomerShippingContactDTOTable(),
      filter: transformedFilter,
      enumFromString: (String fieldKey) => CustomerShippingContactField.values
          .firstWhereOrNull((e) => e.name == fieldKey),
      getDbField: (table, field) => dbFieldFromEnum(field)(table),
    );

    return expression;
  }

  static Column<dynamic> Function(CustomerShippingContactDTOTable) orderBy(
    CustomerShippingContactField? sortField,
  ) {
    if (sortField == null) {
      return dbFieldFromEnum(
        CustomerShippingContactField.shippingContactFullName,
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
                    CustomerShippingContactField
                        .filterByShippingContactIdOrFullName.name) {
                  final value = field.value;
                  if (RegExp(r'^\d+$').hasMatch(value)) {
                    return FilterField(
                      fieldKey: CustomerShippingContactField
                          .shippingContactCustomId.name,
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
                        fieldKey: CustomerShippingContactField
                            .shippingContactCustomId.name,
                        filterOperator: field.filterOperator,
                        type: FilterType.equal,
                        value: customIdNumber.toString(),
                        uuid: const Uuid().v4(),
                        fieldType: FilterFieldType.number,
                      );
                    }
                  }
                  return FilterField(
                    fieldKey: CustomerShippingContactField
                        .shippingContactFullName.name,
                    filterOperator: field.filterOperator,
                    type: FilterType.iLike,
                    value: value,
                    uuid: const Uuid().v4(),
                    fieldType: FilterFieldType.text,
                  );
                } else if (field.fieldKey ==
                    CustomerShippingContactField.shippingContactCustomId.name) {
                  final value = field.value;
                  if (RegExp('^[Kk]-').hasMatch(value) && value.length > 2) {
                    final parts = value.split('-');
                    final customIdPart = parts.length > 1 ? parts[1] : '';
                    final customIdNumber = int.tryParse(customIdPart);

                    if (customIdNumber != null) {
                      return FilterField(
                        fieldKey: CustomerShippingContactField
                            .shippingContactCustomId.name,
                        filterOperator: field.filterOperator,
                        type: FilterType.equal,
                        value: customIdNumber.toString(),
                        uuid: const Uuid().v4(),
                        fieldType: FilterFieldType.number,
                      );
                    }
                  }
                  return FilterField(
                    fieldKey: CustomerShippingContactField
                        .shippingContactCustomId.name,
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

  static Column<dynamic> Function(CustomerShippingContactDTOTable)
      dbFieldFromEnum(
    CustomerShippingContactField sortFieldEnum,
  ) {
    switch (sortFieldEnum) {
      case CustomerShippingContactField.id:
        return (CustomerShippingContactDTOTable t) => t.id;
      case CustomerShippingContactField.customer:
        return (CustomerShippingContactDTOTable t) => t.customerId;
      case CustomerShippingContactField.shippingContact:
        return (CustomerShippingContactDTOTable t) => t.shippingContactId;
      case CustomerShippingContactField.filterByShippingContactIdOrFullName:
        return (CustomerShippingContactDTOTable t) => t.id;
      case CustomerShippingContactField.shippingContactCustomId:
        return (CustomerShippingContactDTOTable t) =>
            t.shippingContact.customId;
      case CustomerShippingContactField.shippingContactFullName:
        return (CustomerShippingContactDTOTable t) =>
            t.shippingContact.fullName;
      case CustomerShippingContactField.shippingContactAddress:
        return (CustomerShippingContactDTOTable t) => t.shippingContact.address;
      case CustomerShippingContactField.shippingContactAddress2:
        return (CustomerShippingContactDTOTable t) =>
            t.shippingContact.address2;
      case CustomerShippingContactField.shippingContactPostCode:
        return (CustomerShippingContactDTOTable t) =>
            t.shippingContact.postCode;
      case CustomerShippingContactField.shippingContactCity:
        return (CustomerShippingContactDTOTable t) => t.shippingContact.city;
      case CustomerShippingContactField.shippingContactState:
        return (CustomerShippingContactDTOTable t) => t.shippingContact.state;
      case CustomerShippingContactField.shippingContactPhone:
        return (CustomerShippingContactDTOTable t) => t.shippingContact.phone;
      case CustomerShippingContactField.shippingContactEmail:
        return (CustomerShippingContactDTOTable t) => t.shippingContact.email;
      case CustomerShippingContactField.shippingContactMobile:
        return (CustomerShippingContactDTOTable t) => t.shippingContact.mobile;
      case CustomerShippingContactField.shippingContactCountryCode:
        return (CustomerShippingContactDTOTable t) =>
            t.shippingContact.countryCode.countryRegionName;
      case CustomerShippingContactField.shippingContactLanguageCode:
        return (CustomerShippingContactDTOTable t) =>
            t.shippingContact.languageCode.languageName;
    }
  }
}
