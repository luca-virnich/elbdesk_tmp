import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';

/// Extension for providing readable field names, icons, colors, and sorting
/// order for CrmEventStatus
extension CrmEventStatusExt on CrmEventStatus {
  /// Returns the readable name of the status
  String readable(ElbCoreLocalizations l10n) {
    return switch (this) {
      CrmEventStatus.scheduled => l10n.status_scheduled,
      CrmEventStatus.inProgress => l10n.status_ongoing,
      CrmEventStatus.completed => l10n.status_completed,
      CrmEventStatus.cancelled => l10n.status_canceled,
    };
  }

  /// Returns a plain string representation of the status
  String get label {
    return switch (this) {
      CrmEventStatus.scheduled => 'Scheduled'.hc,
      CrmEventStatus.inProgress => 'In Progress'.hc,
      CrmEventStatus.completed => 'Completed'.hc,
      CrmEventStatus.cancelled => 'Cancelled'.hc,
    };
  }

  /// Returns the icon of the status
  IconData get icon {
    return switch (this) {
      CrmEventStatus.scheduled => AppIcons.calendar_today,
      CrmEventStatus.inProgress => AppIcons.play_circle,
      CrmEventStatus.completed => AppIcons.check_circle,
      CrmEventStatus.cancelled => AppIcons.remove_circle_outlined,
    };
  }

  /// Returns the color of the status
  Color color(AppStatusColors statusColors) {
    return switch (this) {
      CrmEventStatus.scheduled => statusColors.info,
      CrmEventStatus.inProgress => statusColors.warning,
      CrmEventStatus.completed => statusColors.success,
      CrmEventStatus.cancelled => statusColors.error,
    };
  }

  /// Returns the sort order of the status
  int get order {
    return switch (this) {
      CrmEventStatus.scheduled => 0,
      CrmEventStatus.inProgress => 1,
      CrmEventStatus.completed => 2,
      CrmEventStatus.cancelled => 3,
    };
  }
}

/// Extension for ordering a list of CrmEventStatus items
extension CrmEventStatusListExt on List<CrmEventStatus> {
  /// Returns the list of statuses ordered by their defined order
  List<CrmEventStatus> get orderedStatus {
    return toList()..sort((a, b) => a.order.compareTo(b.order));
  }
}
