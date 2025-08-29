import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

// CustomFilterType enum removed - use items directly for dropdowns
// FieldRenderType enum removed - use factory constructors in UI components
// instead

extension DropdownItemListExt<T> on List<DropdownItem<T>> {
  /// Convert to NextDropdownMenuEntry for dropdowns with nullable support
  List<NextDropdownMenuEntry<T?>> toDropdownMenuEntries() {
    return <NextDropdownMenuEntry<T?>>[
      // Add null option at the beginning for nullable filters
      const NextDropdownMenuEntry<Null>(
        label: '-',
        value: null,
      ),
      ...map(
        (item) => NextDropdownMenuEntry<T?>(
          label: item.label,
          value: item.value,
          leadingIcon: item is _SelectionDropdownItem<T>
              ? Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: item.color,
                    shape: BoxShape.circle,
                  ),
                )
              : null,
        ),
      ),
    ];
  }
}

class DropdownItem<X> {
  /// Factory constructor for text dropdown items (used in filters)
  const factory DropdownItem.text({
    required String label,
    required X value,
  }) = _TextDropdownItem<X>;

  /// Factory constructor for selection dropdown items (used in UI with colors)
  const factory DropdownItem.selection({
    required String label,
    required X value,
    required Color color,
  }) = _SelectionDropdownItem<X>;

  const DropdownItem._({
    required this.label,
    required this.value,
  });

  final String label;
  final X value;
}

class _TextDropdownItem<X> extends DropdownItem<X> {
  const _TextDropdownItem({
    required super.label,
    required super.value,
  }) : super._();
}

class _SelectionDropdownItem<X> extends DropdownItem<X> {
  const _SelectionDropdownItem({
    required super.label,
    required super.value,
    required this.color,
  }) : super._();

  final Color color;
}

/// Interface that all extended fields must implement
/// This ensures type safety - only enums with field extensions can be passed
/// L is the custom localization type (e.g., ElbDeskCrmLocalizations)
abstract class ExtendedField<T extends Enum, L> {
  T get value;
  String readable(ElbCoreLocalizations coreL10n, L customL10n);
  String? hintText(ElbCoreLocalizations coreL10n, L customL10n);
  String? Function(String?)? validator(
    ElbCoreLocalizations coreL10n,
    L customL10n,
  );
  String? Function(DateTime?)? dateValidator(
    ElbCoreLocalizations coreL10n,
    L customL10n,
  );
  TextInputType? get keyboardType;
  int? get maxLines;
  int? get minLines;

  /// For Assigne User, Text Drop downs
  bool? get isMandatory;

  // Table-specific properties
  List<FilterType> get filterTypes;
  FilterFieldType get fieldType;
  Alignment get cellAlignment;
  TableFieldConfig get tableFieldConfig;

  /// Items for dropdown fields (selection, textDropdown, etc.)
  List<DropdownItem<dynamic>> Function(
    ElbCoreLocalizations coreL10n,
    L customL10n,
  )? get items;

  TableFieldData tableFieldData(
    ElbCoreLocalizations coreL10n,
    L customL10n,
  );

  TableColumnData tableColumnData(
    ElbCoreLocalizations coreL10n,
    L customL10n,
  );

  String get fieldKey;

  /// Check if field is filterable (has filter types or items for dropdown)
  bool get isFilterable => filterTypes.isNotEmpty || items != null;

  /// Whether this field should be excluded from tables
  bool get excludeFromTable;
}

/// Complete implementation that makes any enum into an ExtendedField with all
/// features
class ExtendedFieldImpl<T extends Enum, L> implements ExtendedField<T, L> {
  /// Factory constructor for text fields
  const factory ExtendedFieldImpl.text(
    T value, {
    required String Function(ElbCoreLocalizations coreL10n, L customL10n)
        readableFunc,
    required String? Function(String?)? Function(
      ElbCoreLocalizations coreL10n,
      L customL10n,
    ) validatorFunc,
    String? Function(ElbCoreLocalizations coreL10n, L customL10n)? hintTextFunc,
    TextInputType? keyboardType,
    int? maxLines,
    int? minLines,
    bool? isMandatory,
    List<FilterType>? filterTypes,
    Alignment cellAlignment,
    double cellWidth,
    bool excludeFromTable,
  }) = _TextExtendedField<T, L>;

  /// Factory constructor for number fields
  const factory ExtendedFieldImpl.number(
    T value, {
    required String Function(ElbCoreLocalizations coreL10n, L customL10n)
        readableFunc,
    required String? Function(String?)? Function(
      ElbCoreLocalizations coreL10n,
      L customL10n,
    ) validatorFunc,
    required TextInputType keyboardType,
    String? Function(ElbCoreLocalizations coreL10n, L customL10n)? hintTextFunc,
    int? maxLines,
    int? minLines,
    bool? isMandatory,
    List<FilterType>? filterTypes,
    Alignment cellAlignment,
    double cellWidth,
    bool excludeFromTable,
  }) = _NumberExtendedField<T, L>;

  const factory ExtendedFieldImpl.integer(
    T value, {
    required String Function(ElbCoreLocalizations coreL10n, L customL10n)
        readableFunc,
    required String? Function(String?)? Function(
      ElbCoreLocalizations coreL10n,
      L customL10n,
    ) validatorFunc,
    TextInputType? keyboardType,
    String? Function(ElbCoreLocalizations coreL10n, L customL10n)? hintTextFunc,
    int? maxLines,
    int? minLines,
    bool? isMandatory,
    List<FilterType>? filterTypes,
    Alignment cellAlignment,
    double cellWidth,
    bool excludeFromTable,
  }) = _IntegerExtendedField<T, L>;

  const factory ExtendedFieldImpl.double(
    T value, {
    required String Function(ElbCoreLocalizations coreL10n, L customL10n)
        readableFunc,
    required String? Function(String?)? Function(
      ElbCoreLocalizations coreL10n,
      L customL10n,
    ) validatorFunc,
    TextInputType? keyboardType,
    String? Function(ElbCoreLocalizations coreL10n, L customL10n)? hintTextFunc,
    int? maxLines,
    int? minLines,
    bool? isMandatory,
    List<FilterType>? filterTypes,
    Alignment cellAlignment,
    double cellWidth,
    bool excludeFromTable,
  }) = _DoubleExtendedField<T, L>;

  /// Factory constructor for date fields
  const factory ExtendedFieldImpl.date(
    T value, {
    required String Function(ElbCoreLocalizations coreL10n, L customL10n)
        readableFunc,
    required String? Function(DateTime?)? Function(
      ElbCoreLocalizations coreL10n,
      L customL10n,
    ) dateValidatorFunc,
    String? Function(ElbCoreLocalizations coreL10n, L customL10n)? hintTextFunc,
    bool? isMandatory,
    List<FilterType>? filterTypes,
    Alignment cellAlignment,
    double cellWidth,
    bool excludeFromTable,
  }) = _DateExtendedField<T, L>;

  /// Factory constructor for boolean fields
  const factory ExtendedFieldImpl.boolean(
    T value, {
    required String Function(ElbCoreLocalizations coreL10n, L customL10n)
        readableFunc,
    required String? Function(String?)? Function(
      ElbCoreLocalizations coreL10n,
      L customL10n,
    ) validatorFunc,
    bool? isMandatory,
    List<FilterType>? filterTypes,
    Alignment cellAlignment,
    double cellWidth,
    bool excludeFromTable,
  }) = _BooleanExtendedField<T, L>;

  /// Factory constructor for assigned user fields
  const factory ExtendedFieldImpl.assignedUser(
    T value, {
    required String Function(ElbCoreLocalizations coreL10n, L customL10n)
        readableFunc,
    required bool isMandatory,
    String? Function(ElbCoreLocalizations coreL10n, L customL10n)? hintTextFunc,
    List<FilterType>? filterTypes,
    Alignment cellAlignment,
    double cellWidth,
    bool excludeFromTable,
  }) = _AssignedUserExtendedField<T, L>;

  /// Factory constructor for text dropdown fields
  const factory ExtendedFieldImpl.textDropdown(
    T value, {
    required String Function(ElbCoreLocalizations coreL10n, L customL10n)
        readableFunc,
    required bool isMandatory,
    required List<DropdownItem<dynamic>> Function(
      ElbCoreLocalizations coreL10n,
      L customL10n,
    )? items,
    String? Function(ElbCoreLocalizations coreL10n, L customL10n)? hintTextFunc,
    List<FilterType>? filterTypes,
    Alignment cellAlignment,
    double cellWidth,
    bool excludeFromTable,
  }) = _TextDropdownExtendedField<T, L>;

  /// Factory constructor for lazy text dropdown fields
  const factory ExtendedFieldImpl.lazyTextDropdown(
    T value, {
    required String Function(ElbCoreLocalizations coreL10n, L customL10n)
        readableFunc,
    required String? Function(String?)? Function(
      ElbCoreLocalizations coreL10n,
      L customL10n,
    ) validatorFunc,
    required bool isMandatory,
    String? Function(ElbCoreLocalizations coreL10n, L customL10n)? hintTextFunc,
    List<FilterType>? filterTypes,
    Alignment cellAlignment,
    double cellWidth,
    bool excludeFromTable,
  }) = _LazyTextDropdownExtendedField<T, L>;

  /// Factory constructor for selection fields
  const factory ExtendedFieldImpl.selection(
    T value, {
    required String Function(ElbCoreLocalizations coreL10n, L customL10n)
        readableFunc,
    required bool isMandatory,
    required List<DropdownItem<dynamic>> Function(
      ElbCoreLocalizations coreL10n,
      L customL10n,
    )? items,
    String? Function(ElbCoreLocalizations coreL10n, L customL10n)? hintTextFunc,
    List<FilterType>? filterTypes,
    Alignment cellAlignment,
    double cellWidth,
    bool excludeFromTable,
  }) = _SelectionExtendedField<T, L>;

  /// Factory constructor for ID fields
  const factory ExtendedFieldImpl.id(
    T value, {
    Alignment cellAlignment,
    double cellWidth,
    bool excludeFromTable,
  }) = _IdExtendedField<T, L>;

  /// Factory constructor for ID fields
  const factory ExtendedFieldImpl.primaryKey(
    T value, {
    Alignment cellAlignment,
    double cellWidth,
    bool excludeFromTable,
  }) = _PrimaryKeyExtendedField<T, L>;

  /// Factory constructor for fields that should be ignored in tables
  const factory ExtendedFieldImpl.ignore(T value) =
      _IgnorableExtendedField<T, L>;

  const ExtendedFieldImpl._(
    this.value, {
    required this.readableFunc,
    String? fieldKey,
    this.validatorFunc,
    this.hintTextFunc,
    this.dateValidatorFunc,
    this.keyboardType,
    this.maxLines = 1,
    this.minLines = 1,
    this.isMandatory,
    this.items,
    this.filterTypes = DefaultFilterTypes.text, // Default to text filters
    this.fieldType = FilterFieldType.text,
    this.cellAlignment = Alignment.centerLeft,
    this.cellWidth = 150,
    this.excludeFromTable = false,
  }) : _fieldKey = fieldKey;

  final String? _fieldKey;

  @override
  String get fieldKey => _fieldKey ?? value.name;

  @override
  final T value;

  final String Function(ElbCoreLocalizations coreL10n, L customL10n)
      readableFunc;
  final String? Function(ElbCoreLocalizations coreL10n, L customL10n)?
      hintTextFunc;
  final String? Function(String?)? Function(
    ElbCoreLocalizations coreL10n,
    L customL10n,
  )? validatorFunc;
  final String? Function(DateTime?)? Function(
    ElbCoreLocalizations coreL10n,
    L customL10n,
  )? dateValidatorFunc;

  @override
  final TextInputType? keyboardType;

  @override
  final int? maxLines;

  @override
  final int? minLines;

  @override
  final bool? isMandatory;

  @override
  final List<DropdownItem<dynamic>> Function(
    ElbCoreLocalizations coreL10n,
    L customL10n,
  )? items;

  @override
  final List<FilterType> filterTypes;

  @override
  final FilterFieldType fieldType;

  @override
  final Alignment cellAlignment;

  final double cellWidth;

  @override
  final bool excludeFromTable;

  @override
  String readable(ElbCoreLocalizations coreL10n, L customL10n) =>
      readableFunc(coreL10n, customL10n);

  @override
  String? hintText(ElbCoreLocalizations coreL10n, L customL10n) =>
      hintTextFunc?.call(coreL10n, customL10n);

  @override
  String? Function(String?)? validator(
    ElbCoreLocalizations coreL10n,
    L customL10n,
  ) =>
      validatorFunc?.call(coreL10n, customL10n);

  @override
  String? Function(DateTime?)? dateValidator(
    ElbCoreLocalizations coreL10n,
    L customL10n,
  ) =>
      dateValidatorFunc?.call(coreL10n, customL10n);

  @override
  TableFieldConfig get tableFieldConfig => TableFieldConfig(
        width: cellWidth,
        fieldKey: fieldKey,
      );

  @override
  TableFieldData tableFieldData(ElbCoreLocalizations coreL10n, L customL10n) =>
      TableFieldData(
        readable: readable(coreL10n, customL10n),
        filterTypes: filterTypes,
        fieldType: fieldType,
        validator: validator(coreL10n, customL10n),
      );

  @override
  TableColumnData tableColumnData(
    ElbCoreLocalizations coreL10n,
    L customL10n,
  ) =>
      TableColumnData(
        readable: readable(coreL10n, customL10n),
        fieldConfig: tableFieldConfig,
      );

  @override
  bool get isFilterable => filterTypes.isNotEmpty || items != null;
}

/// Text field implementation
class _TextExtendedField<T extends Enum, L> extends ExtendedFieldImpl<T, L> {
  const _TextExtendedField(
    super.value, {
    required super.readableFunc,
    required String? Function(String?)? Function(
      ElbCoreLocalizations coreL10n,
      L customL10n,
    )
        super.validatorFunc,
    super.hintTextFunc,
    TextInputType? keyboardType,
    super.maxLines = null,
    super.minLines = null,
    super.isMandatory,
    List<FilterType>? filterTypes,
    super.cellAlignment,
    super.cellWidth,
    super.excludeFromTable = false,
  }) : super._(
          keyboardType: keyboardType ?? TextInputType.text,
          filterTypes: filterTypes ?? DefaultFilterTypes.text,
          fieldType: FilterFieldType.text,
        );
}

/// Number field implementation
class _NumberExtendedField<T extends Enum, L> extends ExtendedFieldImpl<T, L> {
  const _NumberExtendedField(
    super.value, {
    required super.readableFunc,
    required String? Function(String?)? Function(
      ElbCoreLocalizations coreL10n,
      L customL10n,
    )
        super.validatorFunc,
    super.keyboardType,
    super.hintTextFunc,
    super.maxLines = null,
    super.minLines = null,
    super.isMandatory,
    List<FilterType>? filterTypes,
    super.cellAlignment = Alignment.centerRight,
    super.cellWidth,
    super.excludeFromTable = false,
  }) : super._(
          filterTypes: filterTypes ?? DefaultFilterTypes.number,
          fieldType: FilterFieldType.number,
        );
}

class _IntegerExtendedField<T extends Enum, L> extends ExtendedFieldImpl<T, L> {
  const _IntegerExtendedField(
    super.value, {
    required super.readableFunc,
    required String? Function(String?)? Function(
      ElbCoreLocalizations coreL10n,
      L customL10n,
    )
        super.validatorFunc,
    super.keyboardType = TextInputType.number,
    super.hintTextFunc,
    super.maxLines = null,
    super.minLines = null,
    super.isMandatory,
    List<FilterType>? filterTypes,
    super.cellAlignment = Alignment.centerRight,
    super.cellWidth,
    super.excludeFromTable = false,
  }) : super._(
          filterTypes: filterTypes ?? DefaultFilterTypes.number,
          fieldType: FilterFieldType.number,
        );
}

class _DoubleExtendedField<T extends Enum, L> extends ExtendedFieldImpl<T, L> {
  const _DoubleExtendedField(
    super.value, {
    required super.readableFunc,
    required String? Function(String?)? Function(
      ElbCoreLocalizations coreL10n,
      L customL10n,
    )
        super.validatorFunc,
    super.keyboardType = const TextInputType.numberWithOptions(decimal: true),
    super.hintTextFunc,
    super.maxLines = null,
    super.minLines = null,
    super.isMandatory,
    List<FilterType>? filterTypes,
    super.cellAlignment = Alignment.centerRight,
    super.cellWidth,
    super.excludeFromTable = false,
  }) : super._(
          filterTypes: filterTypes ?? DefaultFilterTypes.number,
          fieldType: FilterFieldType.number,
        );
}

/// Date field implementation
class _DateExtendedField<T extends Enum, L> extends ExtendedFieldImpl<T, L> {
  const _DateExtendedField(
    super.value, {
    required super.readableFunc,
    required String? Function(DateTime?)? Function(
      ElbCoreLocalizations coreL10n,
      L customL10n,
    )
        super.dateValidatorFunc,
    super.hintTextFunc,
    super.isMandatory,
    List<FilterType>? filterTypes,
    super.cellAlignment,
    super.cellWidth,
    super.excludeFromTable = false,
  }) : super._(
          keyboardType: TextInputType.datetime,
          filterTypes: filterTypes ?? DefaultFilterTypes.dateTime,
          fieldType: FilterFieldType.date,
        );
}

/// Boolean field implementation
class _BooleanExtendedField<T extends Enum, L> extends ExtendedFieldImpl<T, L> {
  const _BooleanExtendedField(
    super.value, {
    required super.readableFunc,
    required String? Function(String?)? Function(
      ElbCoreLocalizations coreL10n,
      L customL10n,
    )
        super.validatorFunc,
    super.isMandatory,
    List<FilterType>? filterTypes,
    super.cellAlignment = Alignment.center,
    super.cellWidth,
    super.excludeFromTable = false,
  }) : super._(
          filterTypes: filterTypes ?? DefaultFilterTypes.boolean,
          fieldType: FilterFieldType.boolean,
        );
}

/// Assigned user field implementation
class _AssignedUserExtendedField<T extends Enum, L>
    extends ExtendedFieldImpl<T, L> {
  const _AssignedUserExtendedField(
    super.value, {
    required super.readableFunc,
    required bool super.isMandatory,
    super.validatorFunc,
    super.hintTextFunc,
    List<FilterType>? filterTypes,
    super.cellAlignment,
    super.cellWidth,
    super.excludeFromTable = false,
  }) : super._(
          filterTypes: filterTypes ?? DefaultFilterTypes.assignedUser,
          fieldType: FilterFieldType.assignedUser,
        );
}

/// Text dropdown field implementation
class _TextDropdownExtendedField<T extends Enum, L>
    extends ExtendedFieldImpl<T, L> {
  const _TextDropdownExtendedField(
    super.value, {
    required super.readableFunc,
    required bool super.isMandatory,
    required super.items,
    super.hintTextFunc,
    List<FilterType>? filterTypes,
    super.cellAlignment,
    super.cellWidth,
    super.excludeFromTable = false,
  }) : super._(
          filterTypes: filterTypes ?? DefaultFilterTypes.text,
          fieldType: FilterFieldType.text,
        );
}

/// Lazy text dropdown field implementation
class _LazyTextDropdownExtendedField<T extends Enum, L>
    extends ExtendedFieldImpl<T, L> {
  const _LazyTextDropdownExtendedField(
    super.value, {
    required super.readableFunc,
    required String? Function(String?)? Function(
      ElbCoreLocalizations coreL10n,
      L customL10n,
    )
        super.validatorFunc,
    required bool super.isMandatory,
    super.hintTextFunc,
    List<FilterType>? filterTypes,
    super.cellAlignment,
    super.cellWidth,
    super.excludeFromTable = false,
  }) : super._(
          filterTypes: filterTypes ?? DefaultFilterTypes.text,
          fieldType: FilterFieldType.text,
        );
}

/// Selection field implementation
class _SelectionExtendedField<T extends Enum, L>
    extends ExtendedFieldImpl<T, L> {
  const _SelectionExtendedField(
    super.value, {
    required super.readableFunc,
    required bool super.isMandatory,
    required super.items,
    super.hintTextFunc,
    List<FilterType>? filterTypes,
    super.cellAlignment,
    super.cellWidth,
    super.excludeFromTable = false,
  }) : super._(
          filterTypes: filterTypes ?? DefaultFilterTypes.selection,
          fieldType: FilterFieldType.text, // Selection uses text field type
        );
}

/// ID field implementation - special case that returns 'ID'
class _IdExtendedField<T extends Enum, L> extends ExtendedFieldImpl<T, L> {
  const _IdExtendedField(
    super.value, {
    super.cellAlignment = Alignment.centerRight,
    super.cellWidth = 80,
    super.excludeFromTable = false,
  }) : super._(
          readableFunc: _defaultIdReadable,
          keyboardType: TextInputType.number,
          filterTypes: DefaultFilterTypes.noFilter,
          fieldType: FilterFieldType.number,
        );

  static String _defaultIdReadable<L>(
    ElbCoreLocalizations coreL10n,
    L customL10n,
  ) {
    // Always use coreL10n's gen_id for ID fields
    return coreL10n.gen_id;
  }
}

/// Primary key field implementation - special case that returns 'ID'
class _PrimaryKeyExtendedField<T extends Enum, L>
    extends ExtendedFieldImpl<T, L> {
  const _PrimaryKeyExtendedField(
    super.value, {
    super.cellAlignment = Alignment.centerRight,
    super.cellWidth = 80,
    super.excludeFromTable = false,
  }) : super._(
          readableFunc: _defaultPrimaryKeyReadable,
          keyboardType: TextInputType.number,
          filterTypes: DefaultFilterTypes.noFilter,
          fieldType: FilterFieldType.number,
        );

  static String _defaultPrimaryKeyReadable<L>(
    ElbCoreLocalizations coreL10n,
    L customL10n,
  ) {
    // Always use coreL10n's gen_id for ID fields
    return coreL10n.gen_primary_key;
  }
}

/// Ignorable ID field implementation - special case that returns 'ID'
class _IgnorableExtendedField<T extends Enum, L>
    extends ExtendedFieldImpl<T, L> {
  const _IgnorableExtendedField(
    super.value, {
    super.cellAlignment = Alignment.centerRight,
    super.cellWidth = 0,
    super.excludeFromTable = true,
  }) : super._(
          readableFunc: _defaultIgnorableReadable,
          keyboardType: TextInputType.number,
          filterTypes: DefaultFilterTypes.noFilter,
          fieldType: FilterFieldType.number,
        );

  static String _defaultIgnorableReadable<L>(
    ElbCoreLocalizations coreL10n,
    L customL10n,
  ) {
    return '';
  }
}

/// Cache for field extension lookups
class FieldCache<T extends Enum, L> {
  FieldCache({
    required List<T> values,
    required ExtendedField<T, L> Function(T) createField,
  }) {
    // Build name-to-enum map
    _fieldNameToEnum = Map.unmodifiable({
      for (final field in values) field.name: field,
    });

    // Build field cache
    _fieldCache = Map.unmodifiable({
      for (final field in values) field: createField(field),
    });
  }

  late final Map<String, T> _fieldNameToEnum;
  late final Map<T, ExtendedField<T, L>> _fieldCache;

  /// Get field configuration from enum (O(1) lookup)
  ExtendedField<T, L> fromEnum(T field) => _fieldCache[field]!;

  /// Get field configuration from string key (O(1) lookup)
  ExtendedField<T, L> fromFieldKey(String fieldKey) {
    final field = _fieldNameToEnum[fieldKey];
    if (field == null) {
      throw ArgumentError('Unknown field key: $fieldKey');
    }
    return _fieldCache[field]!;
  }

  /// Get a specific field by enum value (null-safe)
  ExtendedField<T, L>? getField(T field) => _fieldCache[field];

  /// Get all cached fields
  Map<T, ExtendedField<T, L>> get allFields => _fieldCache;

  /// Check if a field key exists
  bool hasFieldKey(String fieldKey) => _fieldNameToEnum.containsKey(fieldKey);

  /// Get dropdown items for a specific field
  List<DropdownItem<dynamic>>? getDropdownItems(
    T field,
    ElbCoreLocalizations l10n,
    L customL10n,
  ) {
    final extField = fromEnum(field);
    return extField.items?.call(l10n, customL10n);
  }

  /// Build dropdown items map for all fields (for UI with colors)
  Map<T, List<DropdownItem<dynamic>>> buildDropdownItemsMap(
    ElbCoreLocalizations l10n,
    L customL10n,
  ) {
    final map = <T, List<DropdownItem<dynamic>>>{};
    for (final field in _fieldCache.keys) {
      final items = getDropdownItems(field, l10n, customL10n);
      if (items != null && items.isNotEmpty) {
        map[field] = items;
      }
    }
    return map;
  }

  /// Build filter dropdown items for all fields with items
  /// Converts selection items to text-only for filter UI
  Map<T, List<DropdownItem<dynamic>>> buildFilterDropdownItems(
    ElbCoreLocalizations l10n,
    L customL10n,
  ) {
    final map = <T, List<DropdownItem<dynamic>>>{};

    // Go through all cached fields
    for (final field in _fieldCache.keys) {
      final extField = _fieldCache[field]!;
      final items = extField.items?.call(l10n, customL10n);

      if (items != null && items.isNotEmpty) {
        // Convert to text-only items for filters (remove colors)
        final filterItems = items.map((item) {
          return DropdownItem.text(
            label: item.label,
            value: item.value,
          );
        }).toList();
        map[field] = filterItems;
      }
    }

    return map;
  }
}

extension ExtendedFieldListExt<T extends Enum, L> on Iterable<T> {
  /// Returns a map of fields for quick search functionality
  /// No exclude checks, no ordering - just the fields in the order passed
  TableFilters<T> buildQuickSearch({
    required ElbCoreLocalizations coreL10n,
    required L customL10n,
    required ExtendedField<T, L> Function(T) fromEnum,
  }) {
    final map = <T, TableFieldData>{};
    for (final field in this) {
      final extField = fromEnum(field);
      if (extField.isFilterable) {
        map[field] = extField.tableFieldData(coreL10n, customL10n);
      }
    }
    return map;
  }

  /// Returns a map of filterable fields with labels
  TableFilters<T> buildFilters({
    required ElbCoreLocalizations coreL10n,
    required L customL10n,
    required ExtendedField<T, L> Function(T) fromEnum,
    Set<T> excludeFields = const {},
    Set<T> includeFields = const {},
    List<T> priorityFields = const [],
  }) {
    // Always order fields - priority fields first, then alphabetically
    final fieldsToProcess = orderedFieldsWithPriority(
      coreL10n: coreL10n,
      customL10n: customL10n,
      fromEnum: fromEnum,
      priorityFields: priorityFields,
    );

    final map = <T, TableFieldData>{};
    for (final field in fieldsToProcess) {
      if (excludeFields.contains(field)) continue;

      final extField = fromEnum(field);
      // Skip if excludeFromTable is true, unless explicitly included or in
      // priority fields. Priority fields override excludeFromTable

      if (extField.excludeFromTable &&
          !includeFields.contains(field) &&
          !priorityFields.contains(field)) {
        continue;
      }
      if (extField.isFilterable) {
        map[field] = extField.tableFieldData(coreL10n, customL10n);
      }
    }
    return map;
  }

  /// Returns a map of table columns with labels
  TableColumns<T> buildColumns({
    required ElbCoreLocalizations coreL10n,
    required L customL10n,
    required ExtendedField<T, L> Function(T) fromEnum,
    Set<T> excludeFields = const {},
    Set<T> includeFields = const {},
    List<T> priorityFields = const [],
  }) {
    // Always order fields - priority fields first, then alphabetically
    final fieldsToProcess = orderedFieldsWithPriority(
      coreL10n: coreL10n,
      customL10n: customL10n,
      fromEnum: fromEnum,
      priorityFields: priorityFields,
    );

    final map = <T, TableColumnData>{};
    for (final field in fieldsToProcess) {
      if (excludeFields.contains(field)) continue;
      final extField = fromEnum(field);
      // Skip if excludeFromTable is true, unless explicitly included or in
      // priority fields. Priority fields override excludeFromTable

      if (extField.excludeFromTable &&
          !includeFields.contains(field) &&
          !priorityFields.contains(field)) {
        continue;
      }
      map[field] = extField.tableColumnData(coreL10n, customL10n);
    }
    return map;
  }

  /// Returns fields ordered with priority fields first, then alphabetically
  ///
  /// Takes a LIST of priority fields (order matters!) that should appear
  /// first, followed by remaining fields sorted alphabetically by their
  /// readable names.
  ///
  /// Note: We use List for priorityFields because ORDER MATTERS,
  /// unlike excludeFields which uses Set since only membership matters.
  ///
  /// Performance optimized version that:
  /// - Uses Sets for O(1) lookups
  /// - Caches readable names before sorting
  /// - Minimizes field extension lookups
  List<T> orderedFieldsWithPriority({
    required ElbCoreLocalizations coreL10n,
    required L customL10n,
    required ExtendedField<T, L> Function(T) fromEnum,
    required List<T> priorityFields, // List: order matters!
  }) {
    final allFields = toList();

    // Convert to Set for O(1) lookup performance
    final priorityFieldsSet = priorityFields.toSet();

    // Separate priority and remaining fields
    final remainingFields =
        allFields.where((f) => !priorityFieldsSet.contains(f)).toList();

    // Cache readable names to avoid repeated lookups during sorting
    final fieldReadableMap = <T, String>{};
    for (final field in remainingFields) {
      final extendedField = fromEnum(field);
      fieldReadableMap[field] = extendedField.readable(coreL10n, customL10n);
    }

    // Sort using cached readable names
    remainingFields.sort((a, b) {
      final aReadable = fieldReadableMap[a]!;
      final bReadable = fieldReadableMap[b]!;
      return aReadable.compareTo(bReadable);
    });

    // Combine priority fields (preserving order) with sorted remaining fields
    final allFieldsSet = allFields.toSet();
    return [
      for (final f in priorityFields) // Iterate in order!
        if (allFieldsSet.contains(f)) f,
      ...remainingFields,
    ];
  }
}

typedef TableFilters<T extends Enum> = Map<T, TableFieldData>;
typedef TableColumns<T extends Enum> = Map<T, TableColumnData>;
