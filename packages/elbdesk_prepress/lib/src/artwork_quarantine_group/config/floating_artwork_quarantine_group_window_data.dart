import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

/// Floating window data for Artwork Quarantine Group
@immutable
class FloatingArtworkQuarantineGroupWindowData extends FloatingWindowData {
  /// Creates floating window data for artwork quarantine group
  FloatingArtworkQuarantineGroupWindowData({
    required this.groupId,
    required this.customerId,
    this.initialNoteId,
    this.initialNoteParentId,
  }) : super(
          windowType: FloatingWindowType.artworkQuarantineGroup.name,
          icon: FloatingWindowType.artworkQuarantineGroup.icon,
          minSize: const Size(1300, 800),
          defaultSize: const Size(1300, 800),
        );

  /// The group id
  final int? groupId;

  /// The customer id
  final int? customerId;

  /// Initial note id for navigation
  final int? initialNoteId;

  /// Initial note parent id for navigation
  final int? initialNoteParentId;
}
