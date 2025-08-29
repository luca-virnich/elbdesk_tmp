import 'dart:ui';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:project_core/project_core.dart';

/// Floating window data for Artwork Quarantine Group Table
@immutable
class FloatingArtworkQuarantineGroupTableWindowData extends FloatingWindowData {
  /// Constructor for floating artwork quarantine group table window data
  FloatingArtworkQuarantineGroupTableWindowData()
      : super(
          windowType: FloatingWindowType.artworkQuarantineGroupTable.name,
          icon: AppIcons.artworkQuarantineGroup,
          minSize: const Size(1100, 600),
          defaultSize: const Size(1250, 800),
        );
}
