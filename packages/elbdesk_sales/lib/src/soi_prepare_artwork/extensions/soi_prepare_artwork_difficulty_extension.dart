import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/material.dart';

/// Extension for providing readable field names, filter types, and validators
/// for SalesOrderItemType
extension SoiPrepareArtworkDifficultyExtension
    on SoiPrepareArtworkDifficultyLevel {
  /// Returns the readable name of the field
  String readable(ElbCoreLocalizations l10n) {
    return switch (this) {
      SoiPrepareArtworkDifficultyLevel.easy => 'Leicht',
      SoiPrepareArtworkDifficultyLevel.medium => 'Mittel',
      SoiPrepareArtworkDifficultyLevel.hard => 'Schwer',
    };
  }

  Color get color {
    return switch (this) {
      SoiPrepareArtworkDifficultyLevel.easy => Colors.green.shade600,
      SoiPrepareArtworkDifficultyLevel.medium => Colors.amber,
      SoiPrepareArtworkDifficultyLevel.hard => Colors.red.shade600,
    };
  }
}
