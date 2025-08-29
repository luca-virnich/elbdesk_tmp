import 'package:elbdesk_backend_core_client/elbdesk_backend_core_client.dart';

/// This class represents the data for a table field, it contains the
/// readable, the available filterTypes for a field and the validator
class TableFieldData {
  /// TableFieldData constructor
  TableFieldData({
    required this.readable,
    required this.filterTypes,
    required this.fieldType,
    this.validator,
  });

  /// The readable name of the field
  final String readable;

  /// The available filter types for the field
  final List<FilterType> filterTypes;

  /// The validator for the field
  final String? Function(String?)? validator;

  /// The field type of the field
  final FilterFieldType fieldType;

  @override
  String toString() {
    return 'TableFieldData(readable: $readable, '
        'filterTypes: $filterTypes, fieldType: $fieldType)';
  }
}
