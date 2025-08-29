import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

@immutable
class FloatingSoiPrepareArtworkWindowData extends FloatingWindowData {
  FloatingSoiPrepareArtworkWindowData({
    required this.entityId,
    required this.customerId,
    this.initialNoteId,
    this.initialNoteParentId,
  }) : super(
          windowType: FloatingWindowType.soiPrepareArtwork.name,
          icon: FloatingWindowType.soiPrepareArtwork.icon,
          minSize: const Size(1200, 500),
          defaultSize: const Size(1250, 800),
        );

  /// The id of the soi prepare artwork
  final int? entityId;

  /// The id of the customer
  final int customerId;

  final int? initialNoteId;
  final int? initialNoteParentId;
}
