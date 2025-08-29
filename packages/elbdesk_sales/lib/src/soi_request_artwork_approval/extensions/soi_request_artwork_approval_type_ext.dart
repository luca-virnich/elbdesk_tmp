import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/l10n/elb_sales_localizations.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

extension SoiRequestArtworkApprovalTypeExt on SoiRequestArtworkApprovalType {
  /// Returns the readable name of the status
  String readable(ElbCoreLocalizations l10n, ElbSalesLocalizations salesL10n) =>
      switch (this) {
        SoiRequestArtworkApprovalType.digital =>
          salesL10n.prepress_artwork_approval_type_digital,
        SoiRequestArtworkApprovalType.proof =>
          salesL10n.prepress_artwork_approval_type_proof,
      };

  Color get color {
    return switch (this) {
      SoiRequestArtworkApprovalType.digital => AppColorPalette.green600,
      SoiRequestArtworkApprovalType.proof => AppColorPalette.amber500,
    };
  }
}
