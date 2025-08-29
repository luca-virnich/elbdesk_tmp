import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/entity_log/entity_log_endpoint.dart';
import 'package:serverpod/serverpod.dart';

class ContactUtils {
  const ContactUtils._();

  static const tableType = TableType.contact;

  // Cache for db field functions
  static final Map<ContactField, Column<dynamic> Function(ContactDTOTable)>
      _dbFieldCache = {};

  static ContactDTOInclude get includeAll => ContactDTO.include(
        customer: CustomerDTO.include(),
        countryCode: CountryCodeDTO.include(),
        languageCode: LanguageCodeDTO.include(),
        salutationCode: SalutationCodeDTO.include(),
      );

  static Expression<dynamic>? buildExpression(Filter? filter) {
    final transformedFilter = _transformedIdOrNameFilter(filter);

    final expression = buildFilterExpression<ContactDTOTable, ContactField>(
      table: ContactDTOTable(),
      filter: transformedFilter,
      enumFromString: (String fieldKey) =>
          ContactField.values.firstWhereOrNull((e) => e.name == fieldKey),
      getDbField: (table, field) => dbFieldFromEnum(field)(table),
    );

    return expression;
  }

  static Column<dynamic> Function(ContactDTOTable) orderBy(
    ContactField? sortField,
  ) {
    if (sortField == null) {
      return dbFieldFromEnum(ContactField.fullName);
    }
    return dbFieldFromEnum(sortField);
  }

  static Filter _transformedIdOrNameFilter(Filter? filter) {
    return Filter(
      filterGroups: filter?.filterGroups.map((group) {
            return FilterGroup(
              filters: group.filters.map((field) {
                if (field.fieldKey == ContactField.filterByIdOrFullName.name) {
                  final value = field.value;
                  if (RegExp(r'^\d+$').hasMatch(value)) {
                    return FilterField(
                      fieldKey: ContactField.customIdString.name,
                      filterOperator: field.filterOperator,
                      type: FilterType.iLike,
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
                        fieldKey: ContactField.customIdString.name,
                        filterOperator: field.filterOperator,
                        type: FilterType.iLike,
                        value: customIdNumber.toString(),
                        uuid: const Uuid().v4(),
                        fieldType: FilterFieldType.number,
                      );
                    }
                  }
                  return FilterField(
                    fieldKey: ContactField.fullName.name,
                    filterOperator: field.filterOperator,
                    type: FilterType.iLike,
                    value: value,
                    uuid: const Uuid().v4(),
                    fieldType: FilterFieldType.text,
                  );
                } else if (field.fieldKey == ContactField.customId.name ||
                    field.fieldKey == ContactField.customIdString.name) {
                  final value = field.value;
                  if (RegExp('^[Kk]-').hasMatch(value) && value.length > 2) {
                    final parts = value.split('-');
                    final customIdPart = parts.length > 1 ? parts[1] : '';
                    final customIdNumber = int.tryParse(customIdPart);

                    if (customIdNumber != null) {
                      return FilterField(
                        fieldKey: ContactField.customIdString.name,
                        filterOperator: field.filterOperator,
                        type: FilterType.iLike,
                        value: customIdNumber.toString(),
                        uuid: const Uuid().v4(),
                        fieldType: FilterFieldType.number,
                      );
                    }
                  }
                  return FilterField(
                    fieldKey: ContactField.customIdString.name,
                    filterOperator: field.filterOperator,
                    type: FilterType.iLike,
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

  static Column<dynamic> Function(ContactDTOTable) dbFieldFromEnum(
    ContactField field,
  ) {
    // Return cached function if available
    return _dbFieldCache[field] ??= _buildDbField(field);
  }

  static Column<dynamic> Function(ContactDTOTable) _buildDbField(
    ContactField field,
  ) {
    return switch (field) {
      // ID fields
      ContactField.id => (t) => t.id,
      ContactField.customId => (t) => t.customId,
      ContactField.customIdString => (t) => t.customIdString,

      // Basic contact fields
      ContactField.firstName => (t) => t.firstName,
      ContactField.lastName => (t) => t.lastName,
      ContactField.fullName => (t) => t.fullName,
      ContactField.birthDate => (t) => t.birthDate,
      ContactField.type => (t) => t.type,
      ContactField.importantNote => (t) => t.importantNote,

      // Communication fields
      ContactField.email => (t) => t.email,
      ContactField.phone => (t) => t.phone,
      ContactField.mobile => (t) => t.mobile,
      ContactField.website => (t) => t.website,

      // Address fields
      ContactField.address => (t) => t.address,
      ContactField.address2 => (t) => t.address2,
      ContactField.address3 => (t) => t.address3,
      ContactField.city => (t) => t.city,
      ContactField.postCode => (t) => t.postCode,
      ContactField.state => (t) => t.state,

      // Related entity fields
      ContactField.countryCode => (t) => t.countryCode.countryRegionName,
      ContactField.languageCode => (t) => t.languageCode.languageName,
      ContactField.salutationCode => (t) => t.salutationCode.id,
      ContactField.customer => (t) => t.customer.id,
      ContactField.customerId => (t) => t.customer.id,
      ContactField.customerCustomId => (t) => t.customer.customIdString,

      // Meta fields
      ContactField.createdAt => (t) => t.createdAt,
      ContactField.createdBy => (t) => t.createdById,
      ContactField.lastModifiedAt => (t) => t.lastModifiedAt,
      ContactField.lastModifiedBy => (t) => t.lastModifiedById,
      ContactField.deletedAt => (t) => t.deletedAt,
      ContactField.isDraft => (t) => t.isDraft,

      // Special cases that map to id
      ContactField.selectContact ||
      ContactField.filterByIdOrFullName ||
      ContactField.actions =>
        (t) => t.id,
    };
  }

  static ContactDTO initialContact({
    required int userId,
    required String sessionId,
    required ContactType type,
    required DateTime now,
    required CountryCodeDTO? countryCode,
    required LanguageCodeDTO? languageCode,
    required SalutationCodeDTO? salutationCode,
  }) {
    return ContactDTO(
      firstName: '',
      lastName: '',
      initials: '',
      customId: null,
      importantNote: '',
      // If the standard type is changed, make sure to change this to
      // Company if a customerId is provided
      type: type.name,
      address: '',
      address2: '',
      postCode: '',
      city: '',
      state: '',
      countryCode: countryCode,
      languageCode: languageCode,
      salutationCode: salutationCode,

      countryCodeId: countryCode?.id,
      languageCodeId: languageCode?.id,
      salutationCodeId: salutationCode?.id,

      phone: '',
      email: '',
      mobile: '',
      website: '',
      address3: '',
      fullName: '',
      birthDate: null,

      lastModifiedAt: null,
      createdAt: now,
      createdById: userId,
      isDraft: true,
    );
  }

  // Cache for log fields
  static List<LogField<ContactDTO>>? _logFieldsCache;

  static List<LogField<ContactDTO>> getLogFields() {
    // Return cached log fields if available
    if (_logFieldsCache != null) return _logFieldsCache!;

    // Define which fields should be logged with their getters
    final logFieldDefinitions = <ContactField, dynamic Function(ContactDTO)>{
      ContactField.id: (entity) => entity.id?.toString() ?? '',
      ContactField.firstName: (entity) => entity.firstName,
      ContactField.lastName: (entity) => entity.lastName,
      ContactField.fullName: (entity) => entity.fullName,
      ContactField.birthDate: (entity) => entity.birthDate?.toString() ?? '',
      ContactField.importantNote: (entity) => entity.importantNote,
      ContactField.email: (entity) => entity.email,
      ContactField.phone: (entity) => entity.phone,
      ContactField.mobile: (entity) => entity.mobile,
      ContactField.address: (entity) => entity.address,
      ContactField.address2: (entity) => entity.address2,
      ContactField.address3: (entity) => entity.address3,
      ContactField.postCode: (entity) => entity.postCode,
      ContactField.city: (entity) => entity.city,
      ContactField.state: (entity) => entity.state,
      ContactField.countryCode: (entity) => entity.countryCode?.code ?? '',
      ContactField.languageCode: (entity) => entity.languageCode?.code ?? '',
      ContactField.salutationCode: (entity) =>
          entity.salutationCode?.description,
      ContactField.type: (entity) => entity.type,
      ContactField.website: (entity) => entity.website,
      ContactField.customer: (entity) => entity.customer?.id.toString() ?? '',
      ContactField.customerId: (entity) => entity.customer?.id.toString() ?? '',
    };

    // Build and cache the log fields
    _logFieldsCache = logFieldDefinitions.entries
        .map(
          (entry) => LogField<ContactDTO>(
            fieldName: entry.key.name,
            getValue: entry.value,
          ),
        )
        .toList();

    return _logFieldsCache!;
  }
}
