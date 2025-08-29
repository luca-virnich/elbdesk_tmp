import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/material.dart';

/// Extension for providing readable field names, filter types, and validators
/// for SalesOrderItemType
extension EyeCStatusExtension on EyeCStatus {
  /// Returns the readable name of the field
  String readable(ElbCoreLocalizations l10n) {
    return switch (this) {
      EyeCStatus.notNecessary => 'Nicht notwendig',
      EyeCStatus.necessary => 'Notwendig',
      EyeCStatus.done => 'Erledigt',
    };
  }

  Color get color {
    return switch (this) {
      EyeCStatus.notNecessary => Colors.grey,
      EyeCStatus.necessary => Colors.amber,
      EyeCStatus.done => Colors.green.shade600,
    };
  }
}
