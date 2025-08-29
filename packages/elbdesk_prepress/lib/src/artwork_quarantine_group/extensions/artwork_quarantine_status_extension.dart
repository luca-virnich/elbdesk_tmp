import 'package:collection/collection.dart';
import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_prepress/l10n/elb_prepress_localizations.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';

/// Extension for providing readable field names, filter Statuses, and
/// validators for ArtworkQuarantineGroupStatus
extension ArtworkQuarantineGroupStatusExt on ArtworkQuarantineGroupStatus {
  /// Returns the readable name of the field
  String readable(ElbPrepressLocalizations ppL10n) {
    return switch (this) {
      ArtworkQuarantineGroupStatus.open => ppL10n.quarantine_group_status_open,
      ArtworkQuarantineGroupStatus.todo => ppL10n.quarantine_group_status_ae,
      ArtworkQuarantineGroupStatus.done => ppL10n.quarantine_group_status_done,
      ArtworkQuarantineGroupStatus.inUse =>
        ppL10n.quarantine_group_status_in_use,
      ArtworkQuarantineGroupStatus.canceled =>
        ppL10n.quarantine_group_status_canceled,
    };
  }

  /// Returns the icon of the field
  IconData get icon {
    return switch (this) {
      ArtworkQuarantineGroupStatus.open => AppIcons.play_circle,
      ArtworkQuarantineGroupStatus.todo => AppIcons.circle,
      ArtworkQuarantineGroupStatus.inUse => AppIcons.check_circle,
      ArtworkQuarantineGroupStatus.done => AppIcons.verified_outlined,
      ArtworkQuarantineGroupStatus.canceled => AppIcons.remove_circle_outlined,
    };
  }

  /// Returns the color of the status
  Color get color {
    return switch (this) {
      ArtworkQuarantineGroupStatus.open => AppColorPalette.yellow500,
      ArtworkQuarantineGroupStatus.todo => AppColorPalette.blue600,
      ArtworkQuarantineGroupStatus.inUse => AppColorPalette.orange500,
      ArtworkQuarantineGroupStatus.done => AppColorPalette.green600,
      ArtworkQuarantineGroupStatus.canceled => AppColorPalette.gray400,
    };
  }

  int get order {
    return switch (this) {
      ArtworkQuarantineGroupStatus.open => 0,
      ArtworkQuarantineGroupStatus.todo => 1,
      ArtworkQuarantineGroupStatus.done => 2,
      ArtworkQuarantineGroupStatus.inUse => 3,
      ArtworkQuarantineGroupStatus.canceled => 4,
    };
  }
}

extension ArtworkQuarantineGroupStatusListExt
    on List<ArtworkQuarantineGroupStatus> {
  List<ArtworkQuarantineGroupStatus> get orderedStatus {
    return sortedBy<num>((e) => e.order);
  }
}
