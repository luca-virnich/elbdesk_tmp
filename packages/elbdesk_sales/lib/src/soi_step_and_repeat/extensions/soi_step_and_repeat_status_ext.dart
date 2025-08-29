import 'package:collection/collection.dart';
import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/l10n/elb_sales_localizations.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

/// Extension for providing readable field names, filter Statuss, and validators
/// for SalesOrderItemStatus
extension SoiStepAndRepeatStatusExt on SoiStepAndRepeatStatus {
  /// Returns the readable name of the field
  String readable(ElbCoreLocalizations l10n, ElbSalesLocalizations salesL10n) {
    return switch (this) {
      SoiStepAndRepeatStatus.wartenAufArtworks => 'Warten auf Artworks'.hc,
      SoiStepAndRepeatStatus.inArbeit => 'In Arbeit'.hc,
      SoiStepAndRepeatStatus.bereitZurPruefung => 'Bereit zur Prüfung'.hc,
      SoiStepAndRepeatStatus.inPruefung => 'In Prüfung'.hc,
      SoiStepAndRepeatStatus.completed => 'Abgeschlossen'.hc,
      SoiStepAndRepeatStatus.canceled => 'Abgebrochen'.hc,
    };
  }

  /// Returns the color of the status
  Color get color {
    return switch (this) {
      SoiStepAndRepeatStatus.wartenAufArtworks => AppColorPalette.blue600,
      SoiStepAndRepeatStatus.inArbeit => AppColorPalette.orange500,
      SoiStepAndRepeatStatus.bereitZurPruefung => AppColorPalette.yellow500,
      SoiStepAndRepeatStatus.inPruefung => AppColorPalette.red600,
      SoiStepAndRepeatStatus.completed => AppColorPalette.green600,
      SoiStepAndRepeatStatus.canceled => AppColorPalette.red600,
    };
  }

  int get order {
    return switch (this) {
      SoiStepAndRepeatStatus.wartenAufArtworks => 0,
      SoiStepAndRepeatStatus.inArbeit => 1,
      SoiStepAndRepeatStatus.bereitZurPruefung => 2,
      SoiStepAndRepeatStatus.inPruefung => 3,
      SoiStepAndRepeatStatus.completed => 4,
      SoiStepAndRepeatStatus.canceled => 5,
    };
  }
}

extension SoiStepAndRepeatStatusListExt on List<SoiStepAndRepeatStatus> {
  List<SoiStepAndRepeatStatus> get orderedStatus {
    return sortedBy<num>((e) => e.order);
  }
}
