import 'package:elbdesk_core/elbdesk_core.dart';

/// Extension for providing readable filter names
extension FilterOperatorExtension on FilterOperator {
  /// Returns the readable name of the field
  String readable(ElbCoreLocalizations l10n) {
    return switch (this) {
      FilterOperator.and => l10n.table_filter_and,
      FilterOperator.or => l10n.table_filter_or,
      FilterOperator.none => l10n.table_filter_none,
    };
  }
}
