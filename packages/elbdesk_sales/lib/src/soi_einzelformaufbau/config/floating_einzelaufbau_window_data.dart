import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

@immutable
class FloatingSoiEinzelformaufbauWindowData extends FloatingWindowData {
  FloatingSoiEinzelformaufbauWindowData({
    required this.entityId,
    required this.customerId,
    this.initialNoteId,
    this.initialNoteParentId,
  }) : super(
          windowType: FloatingWindowType.soiEinzelformaufbau.name,
          icon: FloatingWindowType.soiEinzelformaufbau.icon,
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
