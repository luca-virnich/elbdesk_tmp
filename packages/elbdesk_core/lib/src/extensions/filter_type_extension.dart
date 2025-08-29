import 'package:elbdesk_core/elbdesk_core.dart';

/// Extension for providing readable filter names and signs
extension FilterTypeExt on FilterType {
  /// Returns the readable name or sign of the field
  String readable(ElbCoreLocalizations l10n) {
    return switch (this) {
      FilterType.equal => l10n.filter_equal,
      FilterType.notEqual => l10n.filter_not_equal,
      FilterType.greaterThan => l10n.filter_greater_than,
      FilterType.greaterThanOrEqual => l10n.filter_greater_than_or_equal,
      FilterType.lessThan => l10n.filter_less_than,
      FilterType.lessThanOrEqual => l10n.filter_less_than_or_equal,
      FilterType.between => l10n.filter_between,
      FilterType.like => l10n.filter_like,
      FilterType.inList => l10n.filter_in_list,
      FilterType.notInList => l10n.filter_not_in_list,
      FilterType.inSet => l10n.filter_in_set,
      FilterType.notInSet => l10n.filter_not_in_set,
      FilterType.notBetween => l10n.filter_not_between,
      FilterType.notLike => l10n.filter_not_like,
      FilterType.iLike => l10n.filter_ilike,
      FilterType.notILike => l10n.filter_not_ilike,
    };
  }
}
