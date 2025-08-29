import 'package:collection/collection.dart';
import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_prepress/l10n/elb_prepress_localizations.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';

/// Extension for providing readable field names, icons, colors, and ordering
/// for ArtworkQuarantineGroupType
extension ArtworkQuarantineGroupTypeExt on ArtworkQuarantineGroupType {
  /// Returns the readable name of the field
  String readable(ElbPrepressLocalizations ppL10n) {
    return switch (this) {
      ArtworkQuarantineGroupType.single => ppL10n.artwork_group_type_single,
      ArtworkQuarantineGroupType.multilayer =>
        ppL10n.artwork_group_type_multilayer,
    };
  }

  /// Returns the icon of the field
  IconData get icon {
    return switch (this) {
      ArtworkQuarantineGroupType.single => AppIcons.file,
      ArtworkQuarantineGroupType.multilayer => AppIcons.list,
    };
  }

  /// Returns the color of the type
  Color color(AppStatusColors statusColors) {
    return switch (this) {
      ArtworkQuarantineGroupType.single => statusColors.info,
      ArtworkQuarantineGroupType.multilayer => statusColors.pending,
    };
  }

  /// Returns the order for sorting
  int get order {
    return switch (this) {
      ArtworkQuarantineGroupType.single => 0,
      ArtworkQuarantineGroupType.multilayer => 1,
    };
  }
}

/// Extension for sorting lists of ArtworkQuarantineGroupType
extension ArtworkQuarantineGroupTypeListExt
    on List<ArtworkQuarantineGroupType> {
  /// Returns the list sorted by order
  List<ArtworkQuarantineGroupType> get orderedTypes {
    return sortedBy<num>((e) => e.order);
  }
}
