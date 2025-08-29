import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

/// Extension for providing readable field names, filter Statuss, and validators
/// for SalesOrderItemStatus
extension SalesOrderItemStatusExt on SalesOrderItemStatus {
  /// Returns the readable name of the field
  String readable(ElbCoreLocalizations l10n) {
    return switch (this) {
      SalesOrderItemStatus.preperation => l10n.status_preparation,
      SalesOrderItemStatus.inProgress => l10n.status_in_progress,
      SalesOrderItemStatus.onHold => l10n.status_on_hold,
      SalesOrderItemStatus.canceled => l10n.status_canceled,
      SalesOrderItemStatus.completed => l10n.status_completed,
      SalesOrderItemStatus.atCustomer => l10n.status_at_customer,
      SalesOrderItemStatus.inClarification => l10n.status_in_clarification,
      SalesOrderItemStatus.waitingForApproval =>
        l10n.status_waiting_for_approval,
      SalesOrderItemStatus.todo => l10n.status_todo,
    };
  }

  /// Returns the icon of the field
  IconData get icon {
    return switch (this) {
      SalesOrderItemStatus.preperation => AppIcons.circle,
      SalesOrderItemStatus.inProgress => AppIcons.play_circle,
      SalesOrderItemStatus.onHold => AppIcons.pause_circle_filled_sharp,
      SalesOrderItemStatus.completed => AppIcons.check_circle,
      SalesOrderItemStatus.canceled => AppIcons.remove_circle_outlined,
      SalesOrderItemStatus.atCustomer => AppIcons.circle,
      SalesOrderItemStatus.inClarification => AppIcons.circle,
      SalesOrderItemStatus.waitingForApproval =>
        AppIcons.pause_circle_filled_sharp,
      SalesOrderItemStatus.todo => AppIcons.circle,
    };
  }

  /// Returns the color of the status
  Color get color {
    return switch (this) {
      SalesOrderItemStatus.preperation => AppColorPalette.blue600,
      SalesOrderItemStatus.inProgress => AppColorPalette.orange500,
      SalesOrderItemStatus.onHold => AppColorPalette.yellow500,
      SalesOrderItemStatus.canceled => AppColorPalette.red600,
      SalesOrderItemStatus.completed => AppColorPalette.green600,
      SalesOrderItemStatus.atCustomer => AppColorPalette.blue600,
      SalesOrderItemStatus.inClarification => AppColorPalette.blue600,
      SalesOrderItemStatus.waitingForApproval => AppColorPalette.yellow500,
      SalesOrderItemStatus.todo => AppColorPalette.blue600,
    };
  }
}

extension SalesOrderItemStatusListExt on List<SalesOrderItemStatus> {
  List<SalesOrderItemStatus> get orderedStatus {
    return [
      SalesOrderItemStatus.preperation,
      SalesOrderItemStatus.inProgress,
      SalesOrderItemStatus.onHold,
      SalesOrderItemStatus.todo,
      SalesOrderItemStatus.waitingForApproval,
      SalesOrderItemStatus.atCustomer,
      SalesOrderItemStatus.inClarification,
      SalesOrderItemStatus.completed,
      SalesOrderItemStatus.canceled,
    ];
  }

  List<SalesOrderItemStatus> get soiPrepareArtwork {
    return [
      SalesOrderItemStatus.preperation,
      SalesOrderItemStatus.todo,
      SalesOrderItemStatus.inProgress,
      SalesOrderItemStatus.waitingForApproval,
      SalesOrderItemStatus.completed,
      SalesOrderItemStatus.canceled,
    ];
  }

  List<SalesOrderItemStatus> get soiRequestArtworkApproval {
    return [
      SalesOrderItemStatus.preperation,
      SalesOrderItemStatus.todo,
      SalesOrderItemStatus.inProgress,
      SalesOrderItemStatus.atCustomer,
      SalesOrderItemStatus.completed,
      SalesOrderItemStatus.canceled,
    ];
  }

  List<SalesOrderItemStatus> get soiConsulting {
    return [
      SalesOrderItemStatus.preperation,
      SalesOrderItemStatus.inProgress,
      SalesOrderItemStatus.inClarification,
      SalesOrderItemStatus.completed,
      SalesOrderItemStatus.canceled,
    ];
  }
}
