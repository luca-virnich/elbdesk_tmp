---
sidebar_position: 1
---

# Entity Class/Model (Server & Client)

When working with entities, we need to go through different steps.

## Server

Every entity used on the server must be defined using **Serverpod**.

### DTO Class (entity.spy.yaml)

- Each entity should be placed in the correct folder corresponding to its feature module.
- The entity name must be suffixed with `DTO`.

**Required Metadata**

Every entity must include all necessary metadata fields.

#### Example

```yaml
class: ContactDTO
table: elb_crm_contact

fields:
  type: String
  firstName: String
  surname: String
  fullName: String
  
  # Metadata fields
  createdAt: DateTime
  createdBy: module:auth:UserInfo?, relation(optional)
  lastModifiedAt: DateTime?
  lastModifiedBy: module:auth:UserInfo?, relation(optional)

  isDraft: bool
  editedBy: module:auth:UserInfo?, relation(optional)
  editedAt: DateTime?
  editSession: String?
  deletedBy: module:auth:UserInfo?, relation(optional)
  deletedAt: DateTime?
```

**Enums in Fields**

If a field is handled with an **Enum**, it must be defined as a `String` in the DTO to support filtering and searching.

### Field Enum (entityField.spy,yaml)

- All relevant fields from a DTO must be defined as an **enum** on the server.
- The enum must also include the `id` field.

#### Naming Convention

- The enum values must match the field names in the corresponding DTO.
- Avoid using `name` as a field in the class to allow accessing the enum values using `.name`.

#### Example

```yaml
enum: ContactField
serialized: byName

values:
  - id
  - type
  - firstName
  - surname 
  - fullName
  
  # Metadata fields
  - createdAt
  - createdBy
  - editedAt
  - editedBy
  - isDraft
```

## Client

### Entity Class

Every entity must be defined as a **`freezed` class** on the client with corresponding `.fromDTO` and `.toDTO` methods.

#### Implementation Requirements

- The class must implement the `HasMetaData` mixin.
- It requires the `DataMeta` object.

#### Example

```dart
@freezed
class LanguageCode with _$LanguageCode, HasMetaData {
  const factory LanguageCode({
    required String code,
    required String name,
    required DataMeta meta,
    int? id,
  }) = _LanguageCode;

  const LanguageCode._();

  /// Converts the DTO to a freezed Object for client-use
  factory LanguageCode.fromDTO(LanguageCodeDTO dto) {
    final dataMeta = DataMeta.fromDTO(dto);
    return LanguageCode(
      meta: dataMeta,
      id: dto.id,
      code: dto.code,
      name: dto.languageName,
    );
  }

  /// Converts the client object to a DTO
  LanguageCodeDTO toDTO() => LanguageCodeDTO(
        code: code,
        languageName: name,
        id: id,
        isDraft: meta.isDraft,
        lastModifiedAt: meta.lastModifiedAt,
        createdAt: meta.createdAt,
        createdBy: meta.createdBy,
        editSession: meta.editSessionId,
      );
}
```

#### Optional .initial() constructor

In some cases we want to create an initial Object on the Client, in this case, add a ```.initial()``` constructor. This can have Arguments if needed.

```dart
  factory LanguageCode.initial() {
    final dataMeta = DataMeta.initial();
    return LanguageCode(
      meta: dataMeta,
      id: 0,
      code: '',
      name: '',
    );
  }
  ```

### Comparable Entity

Every client entity needs a **comparable** to check if an object has updates on the client.

#### Requirements

- The object should define fields that trigger reload information.
- It must implement the `DataComparable` class.

#### Example

```dart
@freezed
class LanguageCodeComparable
    with _$LanguageCodeComparable
    implements DataComparable {
  const factory LanguageCodeComparable({
    required String code,
    required String name,
  }) = _LanguageCodeComparable;

  factory LanguageCodeComparable.fromLanguageCode(LanguageCode languageCode) {
    return LanguageCodeComparable(
      code: languageCode.code,
      name: languageCode.name,
    );
  }
}
```

### Enum Field Extensions

We need an extension on the defined Enum-Field from the Server (see above) to handle client related stuff.

We are using ```extension types``` - see [Extension Types Documentation](https://dart.dev/language/extension-types)

#### Example Extension: `ContactField`

Below is an example extension for `ContactField`. The extension includes:

1. Readable field names for localization.
2. Configuration for table fields.
3. Filter types for filtering data.
4. Validators for validating input fields.

#### Implementation

```dart
/// Wrapper for the ContactField Enum (from the server)
extension type ContactFieldWrapper(ContactField field) {

  /// At some points, the Server-API delivers the fieldKey
  /// (the name of the database column) as String.
  /// To work typesafe in the client, we are mapping this
  /// to the definied field-enum. 
  /// This is why the Field-Enun name must exactly match
  /// the class field name.
  ///
  /// We are mapping and caching the Strings to the fields

  ContactFieldWrapper.fromFieldKey(String fieldKey) : this(_fromKey(fieldKey));

  static final Map<String, ContactField> _fieldKeyCache = {
    for (var field in ContactField.values) field.name: field,
  };

  static ContactField _fromKey(String fieldKey) {
    return _fieldKeyCache[fieldKey] ??
        (throw Exception('Invalid field key: \$fieldKey'));
  }

  /// To be able to show a readable Text for the 
  /// Columns, we have this readable Method
  String readable(AppLocalizations l10n) {
    return switch (this) {
      ContactField.id => l10n.id,
      ContactField.salutationCode => l10n.crm_salutation_code_singular,
      ...
      ...
      
    };
  }

  /// Returns the alignment of the field in a Table.
  Alignment get cellAlignment {
    return switch (this) {
      _ => Alignment.centerLeft,
    };
  }

  /// Returns the field configuration for the table, we 
  /// need this to hold and save the selected width 
  /// (when the user resizes the table colums)
  TableFieldConfig get toTableFieldConfig {
    return TableFieldConfig(
      width: 100,
      fieldKey: field.name,
    );
  }

  /// Returns the filter types available for the field. 
  /// We have defined presets for different types. If a 
  /// field should not be filterable, return an empty 
  /// Array ([])
  List<FilterType> get filterTypes {
    return switch (this) {
      ContactField.id => DefaultFilterTypes.number,
      ContactField.salutationCode => [],
      ContactField.customerId => DefaultFilterTypes.number,
      ContactField.editedAt => DefaultFilterTypes.dateTime,
      ...
      ...
    };
  }

  /// Returns the field type of the field, we need this tp
  /// be able for propper filtering
  FilterFieldType get fieldType {
    return switch (this) {
      ContactField.createdAt => FilterFieldType.date,
      ContactField.editedAt => FilterFieldType.date,
      ContactField.birthDate => FilterFieldType.text,
      _ => FilterFieldType.text,
    };
  }

  /// Returns the validator for the field, if the field 
  String? Function(String?)? validator(AppLocalizations l10n) {
    return switch (this) {
      ContactField.id => (value) {
          if (value == null) return null;
          if (int.tryParse(value) == null) {
            return l10n.validation_invalid_number;
          }
          return null;
        },
      ContactField.firstName => (value) {
          if (value == null) return null;
          if (value.trim().isEmpty) return l10n.validation_name_required;
          return null;
        },
      ...
      ...
      _ => null,
    };
  }
}

/// Extension for providing readable field names, filter types, and validators
extension ContactFieldsExt on List<ContactField> {
  /// Returns a map of filterable fields with labels
  Map<ContactField, TableFieldData> filterableWithLabels(
    AppLocalizations l10n,
  ) {
    final map = <ContactField, TableFieldData>{};
    for (final field in this) {
      final fieldWrapper = ContactFieldWrapper(field);
      // Only add filterable fields with non-empty array
      if (fieldWrapper.filterTypes.isNotEmpty) {
        map[field] = TableFieldData(
          readable: fieldWrapper.readable(l10n),
          filterTypes: fieldWrapper.filterTypes,
          validator: fieldWrapper.validator(l10n),
          fieldType: fieldWrapper.fieldType,
        );
      }
    }

    return map;
  }

  /// Returns a map of table columns with labels
  Map<ContactField, TableColumnData> tableColumnsWithLabels(
    AppLocalizations l10n,
  ) {
    final excludeFields = [
      ContactField.selectContact,
      ContactField.address3,
      ContactField.customer,
      ContactField.isDraft,
    ];
    final map = <ContactField, TableColumnData>{};
    for (final field in this) {
      if (excludeFields.contains(field)) continue;
      final fieldWrapper = ContactFieldWrapper(field);
      map[field] = TableColumnData(
        readable: fieldWrapper.readable(l10n),
        fieldConfig: fieldWrapper.toTableFieldConfig,
      );
    }

    return map;
  }
}
```


### Data Meta Information

#### Creation
- **createdAt**: When the record was created
- **createdBy**: Who created the record

#### Modification
- **lastModifiedAt**: When the record was last saved
- **lastModifiedBy**: Who last saved the record

#### Deletion
- **deletedAt**: When the record was deleted (not used in UI)
- **deletedBy**: Who deleted the record (not used in UI)

#### Active Editing
- **editingSession**: String identifier for the edit session
- **editingBy**: Who is CURRENTLY editing the record (active sessionId)
- **editingSince**: When the editing started
  > These fields are shown in the Stream Widget ("Record is being edited by xxx since xxx"). Set to null when sessionId becomes null (record is not being edited)

#### Draft Status
- **isDraft**: Created record that has not been actively saved yet

#### Edit Session