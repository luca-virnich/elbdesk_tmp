import 'package:elbdesk_backend_core_client/elbdesk_backend_core_client.dart';

/// This class represents the data for a table column, it contains the
/// readable name and the fieldConfig
class TableColumnData {
  /// Creates a new TableColumnData instance
  TableColumnData({
    required this.readable,
    required this.fieldConfig,
  });

  /// The readable name of the column
  final String readable;

  /// The field configuration for the column
  final TableFieldConfig fieldConfig;
}
