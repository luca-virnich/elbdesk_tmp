import 'package:collection/collection.dart';
import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

/// Extension for providing readable field names, filter Statuss, and validators
/// for SalesOrderItemStatus
extension SalesOrderStatusExt on SalesOrderStatus {
  /// Returns the readable name of the field
  String readable(ElbCoreLocalizations l10n) {
    return switch (this) {
      SalesOrderStatus.preperation => l10n.status_preparation,
      SalesOrderStatus.inProgress => l10n.status_ongoing,
      SalesOrderStatus.onHold => l10n.status_on_hold,
      SalesOrderStatus.canceled => l10n.status_canceled,
      SalesOrderStatus.completed => l10n.status_completed,
    };
  }

  /// Returns the icon of the field
  IconData get icon {
    return switch (this) {
      SalesOrderStatus.preperation => AppIcons.circle,
      SalesOrderStatus.inProgress => AppIcons.play_circle,
      SalesOrderStatus.onHold => AppIcons.pause_circle_filled_sharp,
      SalesOrderStatus.completed => AppIcons.check_circle,
      SalesOrderStatus.canceled => AppIcons.remove_circle_outlined,
    };
  }

  /// Returns the color of the status
  Color get color {
    return switch (this) {
      SalesOrderStatus.preperation => AppColorPalette.blue600,
      SalesOrderStatus.inProgress => AppColorPalette.orange500,
      SalesOrderStatus.onHold => AppColorPalette.yellow500,
      SalesOrderStatus.canceled => AppColorPalette.red600,
      SalesOrderStatus.completed => AppColorPalette.green600,
    };
  }

  int get order {
    return switch (this) {
      SalesOrderStatus.preperation => 0,
      SalesOrderStatus.inProgress => 1,
      SalesOrderStatus.onHold => 2,
      SalesOrderStatus.completed => 3,
      SalesOrderStatus.canceled => 4,
    };
  }
}

extension SalesOrderStatusListExt on List<SalesOrderStatus> {
  List<SalesOrderStatus> get orderedStatus {
    return sortedBy<num>((e) => e.order);
  }
}
