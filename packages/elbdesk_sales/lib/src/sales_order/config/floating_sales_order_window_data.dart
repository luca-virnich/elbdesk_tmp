import 'dart:ui';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/foundation.dart';
import 'package:project_core/project_core.dart';

@immutable
class FloatingSalesOrderWindowData extends FloatingWindowData {
  /// ContactStackWindowData constructor
  FloatingSalesOrderWindowData({
    required this.salesOrderId,
    this.customerId,
    this.initialNoteId,
    this.initialNoteParentId,
  }) : super(
          windowType: FloatingWindowType.salesOrder.name,
          icon: FloatingWindowType.salesOrder.icon,
          minSize: const Size(1150, 500),
          defaultSize: const Size(1250, 800),
        );

  /// The id of the salesOrder
  final int? salesOrderId;

  /// The id of the customer
  final int? customerId;

  final int? initialNoteId;
  final int? initialNoteParentId;
}
