import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

@immutable
class FloatingSoiConsultingWindowData extends FloatingWindowData {
  FloatingSoiConsultingWindowData({
    required this.entityId,
    required this.salesOrderId,
    required this.customerId,
    this.initialNoteId,
    this.initialNoteParentId,
  }) : super(
          windowType: FloatingWindowType.soiConsulting.name,
          icon: FloatingWindowType.soiConsulting.icon,
          minSize: const Size(1200, 500),
          defaultSize: const Size(1250, 800),
        );

  /// The id of the soi prepare artwork
  final int? entityId;

  /// The id of the customer
  final int customerId;

  /// The id of the sales order
  final int salesOrderId;

  final int? initialNoteId;

  final int? initialNoteParentId;
}
