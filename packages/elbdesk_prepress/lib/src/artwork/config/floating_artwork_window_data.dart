import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

/// @nodoc
@immutable
class FloatingArtworkWindowData extends FloatingWindowData {
  /// @nodoc
  FloatingArtworkWindowData({
    required this.artworkId,
    required this.customerId,
    this.initialNoteId,
    this.initialNoteParentId,
  }) : super(
          windowType: FloatingWindowType.artwork.name,
          icon: FloatingWindowType.artwork.icon,
          minSize: const Size(1350, 550),
          defaultSize: const Size(1650, 850),
        );

  /// The id of the contact
  final int? artworkId;
  final int customerId;
  final int? initialNoteId;
  final int? initialNoteParentId;
}
