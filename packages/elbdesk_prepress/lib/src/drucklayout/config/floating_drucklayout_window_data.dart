import 'dart:ui';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:project_core/project_core.dart';

class FloatingDrucklayoutWindowData extends FloatingWindowData {
  /// Creates floating window data for drucklayout
  FloatingDrucklayoutWindowData({
    required this.entityId,
    required this.preSelectionId,
    required this.selectionId,
    this.customerId,
    this.salesOrderId,
    this.initialNoteId,
    this.initialNoteParentId,
  }) : super(
          windowType: FloatingWindowType.drucklayout.name,
          icon: FloatingWindowType.drucklayout.icon,
          minSize: const Size(1100, 600),
          defaultSize: const Size(1250, 800),
        );

  /// The id of the drucklayout
  final int? entityId;

  /// The customer id
  final int? customerId;

  /// The sales order id
  final int? salesOrderId;

  /// The pre selection id
  final int preSelectionId;

  /// The selection id
  final int selectionId;

  /// Initial note id for navigation
  final int? initialNoteId;

  /// Initial note parent id for navigation
  final int? initialNoteParentId;
}
