import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/l10n/elb_sales_localizations.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

/// Extension for providing readable field names, filter types, and validators
/// for SalesOrderItemType
extension SalesOrderItemTypeExt on SalesOrderItemType {
  /// Returns the readable name of the field
  String readable(ElbCoreLocalizations l10n, ElbSalesLocalizations salesL10n) {
    return switch (this) {
      SalesOrderItemType.prepareArtwork => salesL10n.prepress_prepare_artwork,
      SalesOrderItemType.consulting => salesL10n.soi_consulting_singular,
      SalesOrderItemType.requestArtworkApproval =>
        salesL10n.soi_request_artwork_approval_singular,
      SalesOrderItemType.einzelformaufbau =>
        salesL10n.soi_einzelformaufbau_singular,
    };
  }

  /// Returns the readable short name of the field
  String readableShort(
    ElbCoreLocalizations l10n,
    ElbSalesLocalizations salesL10n,
  ) {
    return switch (this) {
      SalesOrderItemType.prepareArtwork =>
        salesL10n.prepress_prepare_artwork_short,
      SalesOrderItemType.requestArtworkApproval =>
        salesL10n.soi_request_artwork_approval_singular_short,
      SalesOrderItemType.einzelformaufbau =>
        salesL10n.soi_einzelformaufbau_singular_short,
      SalesOrderItemType.consulting => salesL10n.soi_consulting_singular,
    };
  }

  int get sortOrder {
    return switch (this) {
      SalesOrderItemType.prepareArtwork => 0,
      SalesOrderItemType.requestArtworkApproval => 1,
      SalesOrderItemType.einzelformaufbau => 2,
      SalesOrderItemType.consulting => 3,
    };
  }

  IconData get icon {
    return switch (this) {
      SalesOrderItemType.prepareArtwork => AppIcons.soiPrepareArtwork,
      SalesOrderItemType.requestArtworkApproval =>
        AppIcons.soiRequestArtworkApproval,
      SalesOrderItemType.einzelformaufbau => AppIcons.soiEinzelformaufbau,
      SalesOrderItemType.consulting => AppIcons.soiConsulting,
    };
  }
}

extension SalesOrderItemTypeListExt on List<SalesOrderItemType> {
  List<SalesOrderItemType> get artworkSoiTypes => [
        SalesOrderItemType.prepareArtwork,
        SalesOrderItemType.requestArtworkApproval,
      ];
}
